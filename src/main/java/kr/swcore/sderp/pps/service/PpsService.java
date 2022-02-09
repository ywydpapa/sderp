package kr.swcore.sderp.pps.service;

import kr.swcore.sderp.pps.dto.PpsDTO;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface PpsService {
    List<PpsDTO> listPps(HttpSession session);
    PpsDTO detailPps(int ppsId);
    int insertPps(PpsDTO dto);
    int updatePps(PpsDTO dto);
    PpsDTO checkPps(PpsDTO dto);
}
