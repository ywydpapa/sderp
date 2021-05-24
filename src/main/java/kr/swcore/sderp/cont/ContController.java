package kr.swcore.sderp.cont;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import kr.swcore.sderp.sales.service.SalesService;
import kr.swcore.sderp.salesTarget.dto.SalesTargetDTO;
import kr.swcore.sderp.sopp.service.SoppService;
import kr.swcore.sderp.sopp.service.SoppdataService;
import kr.swcore.sderp.techd.service.TechdService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.cont.dto.ContDTO;
import kr.swcore.sderp.cont.service.ContService;

@Controller
@RequestMapping("/cont/*")

public class ContController {
	
	private static final Logger logger = LoggerFactory.getLogger(ContController.class);
	
	@Inject
	ContService contService;
	
	@Inject
	CodeService codeService;

	@Inject
	SoppService soppService;

	@Inject
	SoppdataService soppdataService;

	@Inject
	SalesService salesService;

	@Inject
	TechdService techdService;
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		mav.setViewName("cont/list");
		mav.addObject("contractType", codeService.listContractType(session));
		mav.addObject("contType", codeService.listContType(session));
		mav.addObject("list", contService.listCont(session, null));
		return mav;
	}

	@RequestMapping(value = "list/data", produces = "application/json;charset=UTF-8", method = RequestMethod.POST)
	public @ResponseBody
	String listData(HttpSession session, @RequestBody String param, HttpServletRequest request, HttpServletResponse response){
		Gson ojb = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		return ojb.toJson(contService.listCont(session, param, request, response));
	}

	@RequestMapping("/detail/{contNo}")
	public ModelAndView detail(HttpSession session, @PathVariable("contNo") int contNo, ModelAndView mav) {
		mav.setViewName("cont/detail");
		ContDTO contDTO = new ContDTO();
		contDTO = contService.detailCont(contNo);
		int soppNo = contDTO.getSoppNo();
		mav.addObject("contDto", contDTO);
		mav.addObject("dto", soppService.detailSopp(soppNo));
		mav.addObject("dtodata01", soppdataService.listSoppdata01(soppNo));
		mav.addObject("dtodata02", soppdataService.listSoppdata02(soppNo));
		mav.addObject("saleslist", codeService.listSalestype(session));
		mav.addObject("sstatuslist", codeService.listSstatus(session));
		mav.addObject("salesinsopp",salesService.listSalesinsopp(session, soppNo));
		mav.addObject("techdinsopp",techdService.listTechdinsopp(session, soppNo));
		mav.addObject("soppFiles",soppService.listFile(soppNo));
		mav.addObject("contractType", codeService.listContractType(session));
		mav.addObject("contType", codeService.listContType(session));
		mav.addObject("areaType", codeService.listAreaType(session));
		return mav;
	}

	@RequestMapping("write.do")
	public ModelAndView write(HttpSession session, ModelAndView mav) {
		mav.setViewName("cont/write");
		mav.addObject("contractType", codeService.listContractType(session));
		mav.addObject("contType", codeService.listContType(session));
		mav.addObject("areaType", codeService.listAreaType(session));
		mav.addObject("mode","write");
		return mav;
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

	@RequestMapping(value = "graph4", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String listAjaxGraph4(HttpSession session, @RequestBody String param) throws JsonProcessingException {
		Map<String, Object> rtn = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		ContDTO contDTO = mapper.readValue(param, ContDTO.class);
		rtn = contService.listSalesTargetMonthIndividual(session, contDTO);
		return new Gson().toJson(rtn);
	}
}
