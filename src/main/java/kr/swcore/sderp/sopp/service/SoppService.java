package kr.swcore.sderp.sopp.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.swcore.sderp.sopp.dto.SoppDTO;

public interface SoppService {
	
		List<SoppDTO> listSopp();
		List<SoppDTO> listSopp(HttpSession session);
		List<SoppDTO> listSopp2();
		List<SoppDTO> listSoppcon(SoppDTO dto);
		SoppDTO detailSopp(int soppNo);
		int updateSopp(SoppDTO dto);
		int deleteSopp(int soppNo);
		int insertSopp(SoppDTO dto);
		int insertSopp(HttpSession session, SoppDTO dto);
		int insert2Sopp(SoppDTO dto);

}
