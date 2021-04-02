package kr.swcore.sderp.sopp.service;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.swcore.sderp.sopp.dao.SoppDAO;
import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.sopp.dto.SoppFileDataDTO;
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
	public List<SoppDTO> listconSopp(HttpSession session, SoppDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		dto.setCompNo(compNo);
		return soppDao.listconSopp(dto);
	}
	
	@Override
	public List<SoppDTO> listSopp2() {
		// TODO Auto-generated method stub
		return soppDao.listSopp2();
	}
	
	@Override
	public List<SoppDTO> listSopp2(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		return soppDao.listSopp2(soppdto);
	}
	
	@Override
	public List<SoppDTO> listconSopp2(HttpSession session, SoppDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		dto.setCompNo(compNo);
		return soppDao.listconSopp2(dto);
	}
	
	@Override
	public List<SoppDTO> listFile(int soppNo) {
		return soppDao.listFile(soppNo);
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

	@Override
	public int uploadFile(HttpSession session, int soppNo, MultipartHttpServletRequest fileList) throws IOException {
		MultipartFile file = fileList.getFile("file");
		SoppFileDataDTO soppFile = new SoppFileDataDTO();
		soppFile.setFileId(UUID.randomUUID().toString());
		soppFile.setFileName(file.getOriginalFilename());
		soppFile.setFileContent(file.getBytes());
		soppFile.setFileDesc(fileList.getParameter("fileDesc"));
		soppFile.setSoppNo(soppNo);
		soppFile.setUserNo(Integer.valueOf((String)session.getAttribute("userNo")));
		
		return soppDao.uploadFile(soppFile);
	}

	@Override
	public SoppFileDataDTO downloadFile(SoppFileDataDTO dto) {
		return soppDao.downloadFile(dto);
	}
	

}
