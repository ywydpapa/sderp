package kr.swcore.sderp.calendar;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.swcore.sderp.calendar.dto.CalendarDTO;
import kr.swcore.sderp.calendar.service.CalendarService;
import kr.swcore.sderp.organiz.Service.OrganizService;

@Controller
@RequestMapping("/calendar/*")
public class CalendarController {

	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	@Inject
	CalendarService calendarService;
	
	@ResponseBody
	@RequestMapping("listEvent.do")
	public ModelAndView list(ModelAndView mav, HttpSession session) {
		mav.addObject("list", calendarService.listEvent(session));
		mav.setViewName("calendar/listEvent");
		return mav;
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
