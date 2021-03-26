package kr.swcore.sderp.sopp.service;

import java.util.List;

import kr.swcore.sderp.sopp.dto.SoppdataDTO;

public interface SoppdataService {

	List<SoppdataDTO> listSoppdata01(int soppNo);
	List<SoppdataDTO> listSoppdata02(int soppNo);
	int deleteSoppdata01(int soppdataNo);
	int insertSoppdata01(SoppdataDTO dto);

}
