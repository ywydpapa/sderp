package kr.swcore.sderp.mis.dao;

import kr.swcore.sderp.mis.dto.MisDTO;

import java.util.List;

public interface MisDAO {
    List<MisDTO> listHRduty(int compNo);
}
