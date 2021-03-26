package kr.swcore.sderp.cont.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.swcore.sderp.cont.dao.ContDAO;
import kr.swcore.sderp.cont.dto.ContDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.util.SessionInfoGet;

@Service
public class ContServiceImpl implements ContService {

	@Inject
	ContDAO contDao;
	
	@Override
	public List<ContDTO> listCont() {
		// TODO Auto-generated method stub
		return contDao.listCont();
	}
	
	@Override
	public List<ContDTO> listCont(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		
		return contDao.listCont(soppdto);
	}
	
	@Override
	public List<ContDTO> listconCont(HttpSession session, ContDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		dto.setCompNo(compNo);
		return contDao.listconCont(dto);
	}

	@Override
	public ContDTO detailCont(int contNo) {
		// TODO Auto-generated method stub
		return contDao.detailCont(contNo);
	}

	@Override
	public int updateCont(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.updateCont(dto);
		
	}

	@Override
	public int deleteCont(int contNo) {
		// TODO Auto-generated method stub
		return contDao.deleteCont(contNo);
	}

	@Override
	public int insertCont(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.insertCont(dto);
	}

	@Override
	public int insertCont(HttpSession session, ContDTO dto) {
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		dto.setCompNo(compNo);
		
		int schedInsert = 0;
		schedInsert = contDao.insertCont(dto);
		
		if (schedInsert > 0) schedInsert = 10001;
		else schedInsert = 20001; 
		
		return schedInsert;
	}

	

}
