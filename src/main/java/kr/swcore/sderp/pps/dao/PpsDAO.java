package kr.swcore.sderp.pps.dao;

import kr.swcore.sderp.pps.dto.PpsDTO;

import java.util.List;

public interface PpsDAO {
    List<PpsDTO> listPps(int compNo);
}
