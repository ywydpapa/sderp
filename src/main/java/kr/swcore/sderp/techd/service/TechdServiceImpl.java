package kr.swcore.sderp.techd.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.techd.dao.TechdDAO;
import kr.swcore.sderp.techd.dto.TechdDTO;
import kr.swcore.sderp.util.SessionInfoGet;

@Service
public class TechdServiceImpl implements TechdService {

	@Inject
	TechdDAO techdDao;
	
	@Override
	public List<TechdDTO> listTechd() {
		// TODO Auto-generated method stub
		return techdDao.listTechd();
	}
	
	@Override
	public List<TechdDTO> listTechd(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		return techdDao.listTechd(soppdto);
	}

	@Override
	public TechdDTO detailTechd(int techdNo) {
		// TODO Auto-generated method stub
		return techdDao.detailTechd(techdNo);
	}

	@Override
	public int updateTechd(TechdDTO dto) {
		// TODO Auto-generated method stub
		return techdDao.updateTechd(dto);
	}

	@Override
	public int deleteTechd(int techdNo) {
		// TODO Auto-generated method stub
		return techdDao.deleteTechd(techdNo);
	}

	@Override
	public int insertTechd(TechdDTO dto) {
		
		return techdDao.insertTechd(dto);
	}

	@Override
	public int insertTechd(HttpSession session, TechdDTO dto) {
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		Integer userId  = Integer.valueOf((String) session.getAttribute("userNo"));
		dto.setCompNo(compNo);
		dto.setUserNo(userId);
		
		int schedInsert = 0;
		schedInsert = techdDao.insertTechd(dto);
		
		if (schedInsert > 0) schedInsert = 10001;
		else schedInsert = 20001; 
		
		return schedInsert;
	}
}
