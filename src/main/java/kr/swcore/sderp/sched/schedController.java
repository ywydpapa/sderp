package kr.swcore.sderp.sched;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.swcore.sderp.code.dto.CodeDTO;
import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.sched.dto.SchedDTO;
import kr.swcore.sderp.sched.service.SchedService;
import kr.swcore.sderp.sopp.SoppController;

@Controller
@RequestMapping("/sched/*")
public class schedController {
	
	private static final Logger logger = LoggerFactory.getLogger(SoppController.class);

	@Inject
	SchedService schedService;
	
	@Inject
	CodeService codeService;
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		mav.addObject("list", schedService.listSched(session));
		List<CodeDTO> listCodeDTO = codeService.listSchedtype(session);	// 동일코드 2회 호출 -> 1회 호출
		mav.addObject("schedtype", listCodeDTO);
//		mav.addObject("acttype", codeService.listActtype(session));
		mav.addObject("listschedcat", codeService.listActSprtScheduleDetailType(session));
		mav.addObject("listschedtype", listCodeDTO);
		mav.setViewName("sched/list");
		return mav;
	}
	
	//검색 버튼 클릭 시
	@RequestMapping("listcon.do")
	public ModelAndView listcon(HttpSession session, ModelAndView mav, @ModelAttribute SchedDTO dto) {
		mav.addObject("list", schedService.listconSched(session, dto));
		mav.addObject("preserveSearchCondition", "Y");
		mav.setViewName("sched/list");
		return mav;
	}

	@RequestMapping("/detail/{schedNo}")
	public ModelAndView detail(@PathVariable("schedNo") int schedNo, ModelAndView mav, HttpSession session) {
		mav.addObject("dto", schedService.detailSched(schedNo));
		mav.addObject("schedtype", codeService.listSchedtype(session));
		mav.addObject("acttype", codeService.listActtype(session));
		mav.setViewName("sched/detail");
		return mav;
	}
	
	@RequestMapping("write.do")
	public ModelAndView write(HttpSession session, ModelAndView mav) {
		mav.addObject("schedtype", codeService.listSchedtype(session));
//		mav.addObject("acttype", codeService.listActtype(session));
		mav.addObject("acttype", codeService.listSchedDetailType(session));
		mav.setViewName("sched/write");
		return mav;
	}
		
	@RequestMapping("insert.do")
	public ResponseEntity<?> insert(HttpSession session, @ModelAttribute SchedDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int schedInsertResult = schedService.insertSched(session, dto);
		param.put("code", (String.valueOf(schedInsertResult))); 
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("update.do")
	public ResponseEntity<?> update(@ModelAttribute SchedDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int schedUpdate = schedService.updateSched(dto);
		if (schedUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}


	@RequestMapping("delete.do")
			public ResponseEntity<?> delete(@ModelAttribute SchedDTO dto) {
			Map<String, Object> param = new HashMap<>();
			int schedUpdate = schedService.deleteSched(dto.getSchedNo());
			if (schedUpdate >0) {
				param.put("code","10001"); 
			}
			else {param.put("code","20001");
			}
			return ResponseEntity.ok(param);
		}
	
	
}
