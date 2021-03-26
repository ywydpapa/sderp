package kr.swcore.sderp.sched.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.swcore.sderp.sched.dto.SchedDTO;

public interface SchedService {
	
	List<SchedDTO> listSched();
	List<SchedDTO> listSched(HttpSession session);
	SchedDTO detailSched(int schedNo);
	int insertSched(SchedDTO dto);
	int insertSched(HttpSession session, SchedDTO dto);
	int deleteSched(int schedNo);
	int updateSched(SchedDTO dto);


}
