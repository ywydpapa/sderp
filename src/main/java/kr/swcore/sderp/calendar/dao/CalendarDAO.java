package kr.swcore.sderp.calendar.dao;

import java.util.List;

import kr.swcore.sderp.calendar.dto.CalendarDTO;

public interface CalendarDAO {
	
		List<CalendarDTO> listEvent();
		CalendarDTO detailEvent(int eventNo);
		int deleteEvent(int eventNo);
}
