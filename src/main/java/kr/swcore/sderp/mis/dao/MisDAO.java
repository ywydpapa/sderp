package kr.swcore.sderp.mis.dao;

import kr.swcore.sderp.mis.dto.MisDTO;

import java.util.List;

public interface MisDAO {
    List<MisDTO> listHRduty(MisDTO dto);
    List<MisDTO> listHRcost(MisDTO dto);
    List<MisDTO> listSopp(MisDTO dto);
    List<MisDTO> listSoppcost(MisDTO dto);
    List<MisDTO> listSoppmargin(MisDTO dto);
    List<MisDTO> listBacinout(MisDTO dto);
    List<MisDTO> listBacstatus(MisDTO dto);
}
