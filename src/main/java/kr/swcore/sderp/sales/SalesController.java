package kr.swcore.sderp.sales;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.organiz.Service.OrganizService;
import kr.swcore.sderp.organiz.dto.OrganizDTO;
import kr.swcore.sderp.sales.dto.SalesDTO;
import kr.swcore.sderp.sales.service.SalesService;
import kr.swcore.sderp.salesTarget.dto.SalesTargetDTO;
import kr.swcore.sderp.salesTarget.service.SalesTargetService;

@Controller

@RequestMapping("/sales/*")
public class SalesController {

	@Inject
	SalesService salesService;
	
	@Inject
	CodeService codeService;
	
	@Inject
	OrganizService organizService;
	
	@Inject
	SalesTargetService salesTargetService; 
	
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		mav.setViewName("sales/list");
		mav.addObject("list", salesService.listSales(session, null));
		mav.addObject("acttype", codeService.listActtype(session));
		mav.addObject("first","Y");
		return mav;
	}

	@RequestMapping(value = "list/data", produces = "application/json;charset=UTF-8", method = RequestMethod.POST)
	public @ResponseBody
	String listData(HttpSession session, @RequestBody String param, HttpServletRequest request, HttpServletResponse response){
		Gson ojb = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		return ojb.toJson(salesService.listSales(session, param, request, response));
	}

	@RequestMapping("listcon.do")
	public ModelAndView listcon(HttpSession session, ModelAndView mav, @ModelAttribute SalesDTO dto) {
		mav.setViewName("sales/list");
		mav.addObject("list", salesService.listconSales(session, dto));
		mav.addObject("preserveSearchCondition", "Y");
		return mav;
	}
	
	@RequestMapping("setTarget.do")
	public ModelAndView settarget(HttpSession session, ModelAndView mav, @ModelAttribute OrganizDTO organizDto, @ModelAttribute SalesTargetDTO salesTargetDTO) {
		mav.addObject("listDept", organizService.listDept(session));
		mav.addObject("list", salesService.listSales(session, null));
		mav.addObject("tableData", salesTargetService.listSalesTarget(session, organizDto, salesTargetDTO));
		mav.setViewName("sales/setTarget");
		return mav;
	}
	
	@RequestMapping("/detail/{salesNo}")
	public ModelAndView detail(@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss") @PathVariable("salesNo") int salesNo, @RequestParam(value = "simple", required = false) String simple, ModelAndView mav, HttpSession session) {
		mav.setViewName("sales/detail");
		mav.addObject("dto", salesService.detailSales(salesNo));
		mav.addObject("acttype", codeService.listActtype(session));
		if(simple != null){
			mav.addObject("simple","Y");
		}
		return mav;
	}
	
	@RequestMapping("write.do")
	public ModelAndView write(@RequestParam(value = "simple", required = false) String simple, HttpSession session, ModelAndView mav) {
		mav.addObject("salesType", codeService.listActtype(session));
		if(simple != null){
			mav.addObject("simple","Y");
		}
		mav.setViewName("sales/write");
		return mav;
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
