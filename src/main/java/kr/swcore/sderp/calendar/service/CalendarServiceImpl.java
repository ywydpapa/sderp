package kr.swcore.sderp.calendar.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.swcore.sderp.calendar.dao.CalendarDAO;
import kr.swcore.sderp.calendar.dto.CalendarDTO;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Inject
	CalendarDAO calendarDao;
	
	@Override
	public List<CalendarDTO> listEvent() {
		// TODO Auto-generated method stub
		return calendarDao.listEvent();
	}

	@Override
	public CalendarDTO detailEvent(int eventNo) {
		// TODO Auto-generated method stub
		return calendarDao.detailEvent(eventNo);
	}

	@Override
	public int deleteEvent(int eventNo) {
		// TODO Auto-generated method stub
		return calendarDao.deleteEvent(eventNo);
	}

}
