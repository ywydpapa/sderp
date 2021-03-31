package kr.swcore.sderp.sopp;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.sales.service.SalesService;
import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.sopp.dto.SoppdataDTO;
import kr.swcore.sderp.sopp.service.SoppService;
import kr.swcore.sderp.sopp.service.SoppdataService;

@Controller

@RequestMapping("/sopp/*")
public class SoppController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(SoppController.class);
	
	@Inject
	SoppService soppService;
	
	@Inject
	SoppdataService soppdataService;
	
	@Inject
	SalesService salesService;
	
	@Inject 
	CodeService codeService;
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		mav.setViewName("sopp/list");
		mav.addObject("saleslist", codeService.listSalestype(session));
		mav.addObject("sstatuslist", codeService.listSstatus(session));
		mav.addObject("businessType", codeService.listBusinessType(session));
		mav.addObject("list", soppService.listSopp(session));
		return mav;
	}
	
	//검색 버튼 클릭 시
	@RequestMapping("listcon.do")
	public ModelAndView listcon(HttpSession session, ModelAndView mav, SoppDTO dto) {
		mav.setViewName("sopp/list");
		mav.addObject("list", soppService.listconSopp(session, dto));
		mav.addObject("preserveSearchCondition", "Y");
		return mav;
	}

	@RequestMapping("list2.do")
	public ModelAndView list2(HttpSession session, ModelAndView mav) {
		mav.setViewName("sopp/list2");
		mav.addObject("saleslist", codeService.listSalestype(session));
		mav.addObject("sstatuslist", codeService.listSstatus(session));
		mav.addObject("businessType", codeService.listBusinessType(session));
		mav.addObject("list", soppService.listSopp2(session));
		return mav;
	}

	@RequestMapping("list2con.do")
	public ModelAndView list2con(HttpSession session, ModelAndView mav, SoppDTO dto) {
		mav.setViewName("sopp/list2");
		mav.addObject("preserveSearchCondition", "Y");
		mav.addObject("list", soppService.listconSopp2(session, dto));
		return mav;
	}

	@RequestMapping("listdata01.do")
	public ModelAndView listdata01(@RequestParam int soppNo, ModelAndView mav) {
		mav.setViewName("sopp/list");
		mav.addObject("listdata01", soppdataService.listSoppdata01(soppNo));
		return mav;
	}

	@RequestMapping("/detail/{soppNo}")
	public ModelAndView detail(@PathVariable("soppNo") int soppNo, ModelAndView mav, HttpSession session) {
		mav.addObject("dto", soppService.detailSopp(soppNo));
		mav.addObject("dtodata01", soppdataService.listSoppdata01(soppNo));
		mav.addObject("dtodata02", soppdataService.listSoppdata02(soppNo));
		mav.addObject("saleslist", codeService.listSalestype(session));
		mav.addObject("sstatuslist", codeService.listSstatus(session));
		mav.addObject("salesinsopp",salesService.listSalesinsopp(soppNo));
		mav.setViewName("sopp/detail");
		return mav;
	}

	@RequestMapping("/detail2/{soppNo}")
	public ModelAndView detail2(@PathVariable("soppNo") int soppNo, ModelAndView mav, HttpSession session) {
		mav.addObject("dto", soppService.detailSopp(soppNo));
		mav.addObject("dtodata01", soppdataService.listSoppdata01(soppNo));
		mav.addObject("dtodata02", soppdataService.listSoppdata02(soppNo));
		mav.addObject("saleslist", codeService.listSalestype(session));
		mav.addObject("sstatuslist", codeService.listSstatus(session));
		mav.addObject("salesinsopp",salesService.listSalesinsopp(soppNo));
		mav.setViewName("sopp/detail2");
		return mav;
	}

	@RequestMapping("/inoutlist/{soppNo}")
	public ModelAndView inoutlist(@PathVariable("soppNo") int soppNo, ModelAndView mav) {
		mav.addObject("dtodata01", soppdataService.listSoppdata01(soppNo));
		mav.setViewName("sopp/inoutlist");
		return mav;
	}

	@RequestMapping("/qutylist/{soppNo}")
	public ModelAndView qutylist(@PathVariable("soppNo") int soppNo, ModelAndView mav) {
		mav.addObject("dtodata02", soppdataService.listSoppdata02(soppNo));
		mav.setViewName("sopp/qutylist");
		return mav;
	}


	@RequestMapping("write.do")
	public String write() {
		return "sopp/write";
	}

	@RequestMapping("write2.do")
	public String write2() {
		return "sopp/write2";
	}
	
	@RequestMapping("insert.do")
	public ResponseEntity<?> insert(HttpSession session, @ModelAttribute SoppDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int schedInsertResult = soppService.insertSopp(session, dto);
		param.put("code", (String.valueOf(schedInsertResult))); 
		return ResponseEntity.ok(param);
	}

	@RequestMapping("insert2.do")
	public ResponseEntity<?> insert2(@ModelAttribute SoppDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int soppInsert = soppService.insert2Sopp(dto);
		if (soppInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("insertdata01.do")
	public ResponseEntity<?> insert(@ModelAttribute SoppdataDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int soppdataInsert = soppdataService.insertSoppdata01(dto);
		if (soppdataInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	
	@RequestMapping("insertdata02.do")
	public ResponseEntity<?> insert02(@ModelAttribute SoppdataDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int soppdataInsert = soppdataService.insertSoppdata01(dto);
		if (soppdataInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	
	@RequestMapping("update1.do")
	public ResponseEntity<?> update(@RequestParam Map<String, Object> params) {
		logger.info("sopp update1 logger : " + params.toString());
		
		Map<String, Object> param = new HashMap<>();
		//int soppUpdate = soppService.updateSopp(dto);
		int soppUpdate = 1;
		if (soppUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	
	@RequestMapping("update.do")
	public ResponseEntity<?> update(@ModelAttribute SoppDTO dto) {
		logger.info("sopp logger : " + dto.toString());
		
		Map<String, Object> param = new HashMap<>();
		int soppUpdate = soppService.updateSopp(dto);
		//int soppUpdate = 1;
		if (soppUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	
	@RequestMapping("delete.do")
			public ResponseEntity<?> delete(@ModelAttribute SoppDTO dto) {
			Map<String, Object> param = new HashMap<>();
			int soppUpdate = soppService.deleteSopp(dto.getSoppNo());
			if (soppUpdate >0) {
				param.put("code","10001"); 
			}
			else {param.put("code","20001");
			}
			return ResponseEntity.ok(param);
		}
			
	@RequestMapping("deletedata01.do")
	public ResponseEntity<?> delete(@ModelAttribute SoppdataDTO dto) {
	Map<String, Object> param = new HashMap<>();
	int soppdataUpdate = soppdataService.deleteSoppdata01(dto.getSoppdataNo());
	if (soppdataUpdate >0) {
		param.put("code","10001"); 
	}
	else {param.put("code","20001");
	}
	return ResponseEntity.ok(param);
}


	@RequestMapping("deletedata02.do")
	public ResponseEntity<?> delete02(@ModelAttribute SoppdataDTO dto) {
	Map<String, Object> param = new HashMap<>();
	int soppdataUpdate = soppdataService.deleteSoppdata01(dto.getSoppdataNo());
	if (soppdataUpdate >0) {
		param.put("code","10001"); 
	}
	else {param.put("code","20001");
	}
	return ResponseEntity.ok(param);
}


}
