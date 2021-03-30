package kr.swcore.sderp.salesTarget;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.swcore.sderp.salesTarget.dto.SalesTargetDTO;
import kr.swcore.sderp.salesTarget.service.SalesTargetService;

@Controller
@RequestMapping("/salesTarget/*")
public class SalesTargetController {
	@Inject
	SalesTargetService salesTargetService; 
	
	@RequestMapping(value = "update.do", method=RequestMethod.POST)
	public ResponseEntity<?> insert(HttpSession session, @RequestBody SalesTargetDTO dto) {
 		Map<String, Object> param = new HashMap<>();
		int schedInsertResult = salesTargetService.updateSalesTarget(session, dto);
		param.put("code", (String.valueOf(schedInsertResult))); 
		return ResponseEntity.ok(param);
	}
}
