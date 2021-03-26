package kr.swcore.sderp.sopp.dao;

import java.util.List;

import kr.swcore.sderp.sopp.dto.SoppDTO;

public interface SoppDAO {
	List<SoppDTO> listSopp();
	List<SoppDTO> listSopp(SoppDTO dto);
	List<SoppDTO> listconSopp(SoppDTO dto);
	List<SoppDTO> listSopp2();
	List<SoppDTO> listSopp2(SoppDTO dto);
	List<SoppDTO> listconSopp2(SoppDTO dto);
	SoppDTO detailSopp(int soppNo);
	int updateSopp(SoppDTO dto);
	int deleteSopp(int soppNo);
	int insertSopp(SoppDTO dto);
	int insert2Sopp(SoppDTO dto);
	
}
