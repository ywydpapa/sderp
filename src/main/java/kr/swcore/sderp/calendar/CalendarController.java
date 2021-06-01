package kr.swcore.sderp.calendar;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import kr.swcore.sderp.calendar.dto.CalendarDTO;
import kr.swcore.sderp.calendar.service.CalendarService;
import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.organiz.Service.OrganizService;
import kr.swcore.sderp.organiz.dto.OrganizDTO;

@Controller
@RequestMapping("/calendar/*")
public class CalendarController {

	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	@Inject
	CalendarService calendarService;
	
	@Inject
	OrganizService organizService;
	
	@Inject
	CodeService codeService;
	
	@ResponseBody
	@RequestMapping(value = "listEvent.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	public String list(ModelAndView mav, HttpSession session, CalendarDTO dto) {
//		mav.addObject("list", calendarService.listEvent(session, dto));
//		mav.setViewName("calendar/listEvent");
		return new Gson().toJson(calendarService.listEvent(session, dto));
	}
	
	@RequestMapping("organization.do")
	@ResponseBody
	public Map<String, Object> organizationList(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("organizationList", organizService.listDept(session));
		map.put("companyList", codeService.listComp());
		return map;
	}
	
	/*
	 * @RequestMapping("loadEvent.do") public ModelAndView listEvent(ModelAndView
	 * mav) { mav.setViewName("calendar/listEvent"); mav.addObject("list",
	 * calendarService.listEvent()); return mav; }
	 */	
	@RequestMapping("/detail/{eventNo}")
	public ModelAndView detail(@PathVariable("eventNo") int eventNo, ModelAndView mav) {
		mav.setViewName("calendar/detailEvent");
		mav.addObject("dto", calendarService.detailEvent(eventNo));
		return mav;
	}
	
	@RequestMapping("calmain.do")
	public String list() {
		return "fullcalendar4/calmain3";
	}
	
	@RequestMapping("delete.do")
	public ResponseEntity<?> delete(@ModelAttribute CalendarDTO dto) {
	Map<String, Object> param = new HashMap<>();
	int calendarUpdate = calendarService.deleteEvent(dto.getEventNo());
	if (calendarUpdate >0) {
		param.put("code","10001"); 
	}
	else {param.put("code","20001");
	}
	return ResponseEntity.ok(param);
}

	
}
