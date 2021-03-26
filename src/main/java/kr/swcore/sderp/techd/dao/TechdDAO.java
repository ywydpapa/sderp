package kr.swcore.sderp.techd.dao;

import java.util.List;

import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.techd.dto.TechdDTO;

public interface TechdDAO {
	List<TechdDTO> listTechd();
	List<TechdDTO> listTechd(SoppDTO soppDTO);
	List<TechdDTO> listconTechd(TechdDTO dto);
	TechdDTO detailTechd(int techdNo);
	int updateTechd(TechdDTO dto);
	int deleteTechd(int techdNo);
	int insertTechd(TechdDTO dto);

}
