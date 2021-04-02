package kr.swcore.sderp.techd.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.swcore.sderp.sales.dto.SalesDTO;
import kr.swcore.sderp.techd.dto.TechdDTO;

public interface TechdService {

	List<TechdDTO> listTechd();
	List<TechdDTO> listTechd(HttpSession session);
	List<TechdDTO> listconTechd(HttpSession session, TechdDTO dto);
	List<SalesDTO> listTechdinsopp(HttpSession session, int soppNo);
	TechdDTO detailTechd(int techdNo);
	int updateTechd(TechdDTO dto);
	int deleteTechd(int techdNo);
	int insertTechd(TechdDTO dto);
	int insertTechd(HttpSession session, TechdDTO dto);

}
