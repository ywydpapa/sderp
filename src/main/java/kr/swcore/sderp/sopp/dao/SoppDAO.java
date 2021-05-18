package kr.swcore.sderp.sopp.dao;

import java.util.List;

import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.sopp.dto.SoppFileDataDTO;
import kr.swcore.sderp.techd.dto.TechdDTO;

public interface SoppDAO {
	List<SoppDTO> listSopp();
	List<SoppDTO> listSopp(SoppDTO dto);
	int listSoppCnt(SoppDTO dto);
	List<SoppDTO> listconSopp(SoppDTO dto);
	List<SoppDTO> listSopp2();
	List<SoppDTO> listSopp2(SoppDTO dto);
	int listSoppCnt2(SoppDTO dto);
	List<SoppDTO> listconSopp2(SoppDTO dto);
	List<SoppDTO> listFile(int soppNo);
	SoppDTO detailSopp(int soppNo);
	int updateSopp(SoppDTO dto);
	int deleteSopp(int soppNo);
	int insertSopp(SoppDTO dto);
	int update2Sopp(SoppDTO dto);
	int uploadFile(SoppFileDataDTO dto);
	SoppFileDataDTO downloadFile(SoppFileDataDTO dto);
	
}
