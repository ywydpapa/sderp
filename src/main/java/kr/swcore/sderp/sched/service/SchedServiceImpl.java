package kr.swcore.sderp.sched.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.swcore.sderp.sched.dao.SchedDAO;
import kr.swcore.sderp.sched.dto.SchedDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.util.SessionInfoGet;
@Service
public class SchedServiceImpl implements SchedService {
	
	@Inject
	SchedDAO schedDao;

	@Override
	public List<SchedDTO> listSched() {
		// TODO Auto-generated method stub
		return schedDao.listSched();
	}
	
	@Override
	public List<SchedDTO> listSched(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		return schedDao.listSched(soppdto);
	}

	@Override
	public SchedDTO detailSched(int schedNo) {
		// TODO Auto-generated method stub
		return schedDao.detailSched(schedNo);
	}

	@Override
	public int insertSched(SchedDTO dto) {
		// TODO Auto-generated method stub
		return schedDao.insertSched(dto);
	}
	
	@Override
	public int insertSched(HttpSession session, SchedDTO dto) {
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		String userId = (String) session.getAttribute("userId");
		dto.setCompNo(compNo);
		dto.setUserId(userId);
		
		int schedInsert = 0;
		schedInsert = schedDao.insertSched(dto);
		
		if (schedInsert > 0) schedInsert = 10001;
		else schedInsert = 20001; 
		
		return schedInsert;
	}

	@Override
	public int deleteSched(int schedNo) {
		// TODO Auto-generated method stub
		return schedDao.deleteSched(schedNo);
	}

	@Override
	public int updateSched(SchedDTO dto) {
		// TODO Auto-generated method stub
		return schedDao.updateSched(dto);
	}

	

	

}
