package kr.swcore.sderp.sopp.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.swcore.sderp.sopp.dto.SoppDTO;

public interface SoppService {
	
		List<SoppDTO> listSopp();
		List<SoppDTO> listSopp(HttpSession session);
		List<SoppDTO> listconSopp(HttpSession session, SoppDTO dto);
		List<SoppDTO> listSopp2();
		List<SoppDTO> listSopp2(HttpSession session);
		List<SoppDTO> listconSopp2(HttpSession session, SoppDTO dto);
		SoppDTO detailSopp(int soppNo);
		int updateSopp(SoppDTO dto);
		int deleteSopp(int soppNo);
		int insertSopp(SoppDTO dto);
		int insertSopp(HttpSession session, SoppDTO dto);
		int insert2Sopp(SoppDTO dto);

}
