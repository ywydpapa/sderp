package kr.swcore.sderp.cont;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import kr.swcore.sderp.salesTarget.dto.SalesTargetDTO;
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
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		mav.setViewName("cont/list");
		mav.addObject("contractType", codeService.listContractType(session));
		mav.addObject("contType", codeService.listContType(session));
		mav.addObject("list", contService.listCont(session, null));
		return mav;
	}
	
	@RequestMapping("listcon.do")
	public ModelAndView listcon(HttpSession session, ModelAndView mav, @ModelAttribute ContDTO dto) {
		mav.setViewName("cont/list");
		mav.addObject("preserveSearchCondition", "Y");
		mav.addObject("list", contService.listconCont(session, dto));
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
