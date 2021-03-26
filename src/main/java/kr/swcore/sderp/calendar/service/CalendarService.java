package kr.swcore.sderp.calendar.service;

import java.util.List;

import kr.swcore.sderp.calendar.dto.CalendarDTO;

public interface CalendarService {

	List<CalendarDTO> listEvent();
	CalendarDTO detailEvent(int eventNo);
	int deleteEvent(int eventNo);
	
}
