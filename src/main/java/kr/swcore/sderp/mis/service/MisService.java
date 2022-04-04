package kr.swcore.sderp.mis.service;

import kr.swcore.sderp.mis.dto.MisDTO;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface MisService {
    List<MisDTO> listHRduty(HttpSession session);
}
