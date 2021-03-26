package kr.swcore.sderp.sopp.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.swcore.sderp.sopp.dao.SoppDAO;
import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.util.SessionInfoGet;

@Service
public class SoppServiceImpl implements SoppService {

	@Inject
	SoppDAO soppDao;
	
	@Override
	public List<SoppDTO> listSopp() {
		// TODO Auto-generated method stub
		return soppDao.listSopp();
	}
	
	@Override
	public List<SoppDTO> listSopp(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		return soppDao.listSopp(soppdto);
	}
	
	@Override
	public List<SoppDTO> listSopp2() {
		// TODO Auto-generated method stub
		return soppDao.listSopp2();
	}

	@Override
	public List<SoppDTO> listSoppcon(SoppDTO dto) {
		// TODO Auto-generated method stub
		return soppDao.listSoppcon(dto);
	}
	
	@Override
	public SoppDTO detailSopp(int soppNo) {
		// TODO Auto-generated method stub
		return soppDao.detailSopp(soppNo);
	}

	@Override
	public int updateSopp(SoppDTO dto) {
		// TODO Auto-generated method stub
		return soppDao.updateSopp(dto);
	}

	@Override
	public int deleteSopp(int soppNo) {
		// TODO Auto-generated method stub
		return soppDao.deleteSopp(soppNo);
	}

	@Override
	public int insertSopp(SoppDTO dto) {
		// TODO Auto-generated method stub
		return soppDao.insertSopp(dto);
	}
	
	@Override
	public int insertSopp(HttpSession session, SoppDTO dto) {
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		dto.setCompNo(compNo);
		
		int schedInsert = 0;
		schedInsert = soppDao.insertSopp(dto);
		
		if (schedInsert > 0) schedInsert = 10001;
		else schedInsert = 20001; 
		
		return schedInsert;
	}

	@Override
	public int insert2Sopp(SoppDTO dto) {
		// TODO Auto-generated method stub
		return soppDao.insert2Sopp(dto);
	}

	

	

}
