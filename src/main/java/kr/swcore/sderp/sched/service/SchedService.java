package kr.swcore.sderp.sched.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.swcore.sderp.sched.dto.SchedDTO;

public interface SchedService {
	
	List<SchedDTO> listSched();
	List<SchedDTO> listSched(HttpSession session, String param, HttpServletRequest request, HttpServletResponse response);
	List<SchedDTO> listconSched(HttpSession session, SchedDTO dto);
	SchedDTO detailSched(int schedNo);
	int insertSched(SchedDTO dto);
	int insertSched(HttpSession session, SchedDTO dto);
	int deleteSched(int schedNo);
	int updateSched(SchedDTO dto);


}
