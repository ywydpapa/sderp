package kr.swcore.sderp.sopp.dao;

import java.util.List;

import kr.swcore.sderp.sopp.dto.SoppdataDTO;

public interface SoppdataDAO {

	List<SoppdataDTO> listSoppdata01(int soppNo);
	List<SoppdataDTO> listSoppdata02(int soppNo);
	List<SoppdataDTO> listIOsum();
	List<SoppdataDTO> listIO();
	int deleteSoppdata01(int soppdataNo);
	int insertSoppdata01(SoppdataDTO dto);

}
