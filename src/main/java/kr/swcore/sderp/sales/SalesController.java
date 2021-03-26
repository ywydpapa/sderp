package kr.swcore.sderp.sales;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.organiz.Service.OrganizService;
import kr.swcore.sderp.sales.dto.SalesDTO;
import kr.swcore.sderp.sales.service.SalesService;

@Controller

@RequestMapping("/sales/*")
public class SalesController {

	@Inject
	SalesService salesService;
	
	@Inject
	CodeService codeService;
	
	@Inject
	OrganizService organizService;
	
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		mav.setViewName("sales/list");
		mav.addObject("list", salesService.listSales(session));
		mav.addObject("acttype", codeService.listActtype(session));
		return mav;
	}
	
	@RequestMapping("setTarget.do")		// OrganizController 컨트롤러 list 메소드는 사용안하고 현재 컨트롤러 settarget 메소드로 사용
	public ModelAndView settarget(HttpSession session, ModelAndView mav) {
		mav.addObject("listDept", organizService.listDept(session));
		mav.addObject("list", salesService.listSales(session));
		mav.setViewName("sales/setTarget");
		return mav;
	}
	
	@RequestMapping("/detail/{salesNo}")
	public ModelAndView detail(@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss") @PathVariable("salesNo") int salesNo, ModelAndView mav) {
		mav.setViewName("sales/detail");
		mav.addObject("dto", salesService.detailSales(salesNo));
		mav.addObject("acttype", codeService.listActtype());
		return mav;
	}
	
	@RequestMapping("write.do")
	public String write() {
		return "sales/write";
	}
	
	@RequestMapping("insert.do")
	public ResponseEntity<?> insert(HttpSession session, @ModelAttribute SalesDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int schedInsertResult = salesService.insertSales(session, dto);
		param.put("code", (String.valueOf(schedInsertResult))); 
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("update.do")
	public ResponseEntity<?> update(@ModelAttribute SalesDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int salesUpdate = salesService.updateSales(dto);
		if (salesUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	
	@RequestMapping("delete.do")
		public ResponseEntity<?> delete(@ModelAttribute SalesDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int salesUpdate = salesService.deleteSales(dto.getSalesNo());
		if (salesUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

}
