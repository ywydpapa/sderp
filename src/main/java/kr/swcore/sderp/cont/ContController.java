package kr.swcore.sderp.cont;

import java.util.HashMap;
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

import kr.swcore.sderp.cont.dto.ContDTO;
import kr.swcore.sderp.cont.service.ContService;

@Controller
@RequestMapping("/cont/*")

public class ContController {
	
	private static final Logger logger = LoggerFactory.getLogger(ContController.class);
	
	@Inject
	ContService contService;
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		mav.setViewName("cont/list");
		mav.addObject("list", contService.listCont(session));
		return mav;
	}

	@RequestMapping("/detail/{contNo}")
	public ModelAndView detail(@PathVariable("contNo") int contNo, ModelAndView mav) {
		mav.setViewName("cont/detail");
		mav.addObject("dto", contService.detailCont(contNo));
		return mav;
	}

	@RequestMapping("write.do")
	public String write() {
		return "cont/write";
	}

	@RequestMapping("insert.do")
	public ResponseEntity<?> insert(HttpSession session, @ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int schedInsertResult = contService.insertCont(session, dto);
		param.put("code", (String.valueOf(schedInsertResult)));
		return ResponseEntity.ok(param);
	}

	@RequestMapping("update.do")
	public ResponseEntity<?> update(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int contUpdate = contService.updateCont(dto);
		if (contUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}


	@RequestMapping("delete.do")
			public ResponseEntity<?> delete(@ModelAttribute ContDTO dto) {
			Map<String, Object> param = new HashMap<>();
			int contUpdate = contService.deleteCont(dto.getContNo());
			if (contUpdate >0) {
				param.put("code","10001"); 
			}
			else {param.put("code","20001");
			}
			return ResponseEntity.ok(param);
		}

	
	
	
	
}
