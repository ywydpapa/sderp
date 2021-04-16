package kr.swcore.sderp.techd;

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
import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.techd.dto.TechdDTO;
import kr.swcore.sderp.techd.service.TechdService;

@Controller

@RequestMapping("/techd/*")
public class TechdController {
	
	private static final Logger logger = LoggerFactory.getLogger(TechdController.class);
	
	@Inject
	TechdService techdService;
	
	@Inject
	CodeService codeService;
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		mav.setViewName("techd/list");
		mav.addObject("techdSteps", codeService.listTechdSteps(session));
		mav.addObject("list", techdService.listTechd(session, null));
		return mav;
	}
	
	@RequestMapping("listcon.do")
	public ModelAndView listcon(HttpSession session, ModelAndView mav, TechdDTO dto) {
		mav.setViewName("techd/list");
		mav.addObject("preserveSearchCondition", "Y");
		mav.addObject("list", techdService.listconTechd(session, dto));
		return mav;
	}

	@RequestMapping("/detail/{techdNo}")
	public ModelAndView detail(@PathVariable("techdNo") int techdNo, ModelAndView mav, HttpSession session) {
		mav.setViewName("techd/detail");
		mav.addObject("dto", techdService.detailTechd(techdNo));
		mav.addObject("sprttype", codeService.listSprttype(session));
		mav.addObject("sprtstat", codeService.listSprtstat(session));
		return mav;
	}

	@RequestMapping("write.do")
	public ModelAndView write(HttpSession session, ModelAndView mav) {
		mav.addObject("sprttype", codeService.listSprttype(session));
		mav.addObject("sprtstat", codeService.listSprtstat(session));
		mav.setViewName("techd/write");
		return mav;
	}

	@RequestMapping("insert.do")
	public ResponseEntity<?> insert(HttpSession session, @ModelAttribute TechdDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int schedInsertResult = techdService.insertTechd(session, dto);
		param.put("code", (String.valueOf(schedInsertResult))); 
		return ResponseEntity.ok(param);
	}

	@RequestMapping("update.do")
	public ResponseEntity<?> update(@ModelAttribute TechdDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int techdUpdate = techdService.updateTechd(dto);
		if (techdUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}


	@RequestMapping("delete.do")
			public ResponseEntity<?> delete(@ModelAttribute TechdDTO dto) {
			Map<String, Object> param = new HashMap<>();
			int techdUpdate = techdService.deleteTechd(dto.getTechdNo());
			if (techdUpdate >0) {
				param.put("code","10001"); 
			}
			else {param.put("code","20001");
			}
			return ResponseEntity.ok(param);
		}


}
