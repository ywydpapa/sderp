package kr.swcore.sderp.cont.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.swcore.sderp.cont.dto.ContDTO;

public interface ContService {
	
	List<ContDTO> listCont();
	List<ContDTO> listCont(HttpSession session);
	List<ContDTO> listconCont(HttpSession session, ContDTO dto);
	ContDTO detailCont(int contNo);
	int updateCont(ContDTO dto);
	int deleteCont(int contNo);
	int insertCont(ContDTO dto);
	int insertCont(HttpSession session, ContDTO dto);

}
