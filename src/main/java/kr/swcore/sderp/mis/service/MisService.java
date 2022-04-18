package kr.swcore.sderp.mis.service;

import kr.swcore.sderp.mis.dto.MisDTO;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface MisService {
    List<MisDTO> listHRduty(HttpSession session,MisDTO dto);
    List<MisDTO> listHRcost(HttpSession session, MisDTO dto);
    List<MisDTO> listSopp(HttpSession session, MisDTO dto);
    List<MisDTO> listSoppcost(HttpSession session, MisDTO dto);
    List<MisDTO> listSoppmargin(HttpSession session, MisDTO dto);
    List<MisDTO> listBacinout(HttpSession session, MisDTO dto);
    List<MisDTO> listBacstatus(HttpSession session, MisDTO dto);
}
