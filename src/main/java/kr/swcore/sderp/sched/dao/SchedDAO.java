package kr.swcore.sderp.sched.dao;

import java.util.List;

import kr.swcore.sderp.sched.dto.SchedDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;

public interface SchedDAO {
	
	List<SchedDTO> listSched();
	List<SchedDTO> listSched(SoppDTO soppdto);
	List<SchedDTO> listconSched(SchedDTO dto);
	SchedDTO detailSched(int schedNo);
	int insertSched(SchedDTO dto);
	int deleteSched(int schedNo);
	int updateSched(SchedDTO dto);

}
