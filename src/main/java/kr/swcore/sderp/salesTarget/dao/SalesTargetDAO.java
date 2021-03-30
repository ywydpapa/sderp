package kr.swcore.sderp.salesTarget.dao;

import java.util.List;

import kr.swcore.sderp.sales.dto.SalesDTO;
import kr.swcore.sderp.salesTarget.dto.SalesTargetDTO;
import kr.swcore.sderp.user.dto.UserDTO;

public interface SalesTargetDAO {
	List<SalesTargetDTO> listSalesTarget();
	List<SalesTargetDTO> listSalesTarget(int compNo, String targetYear, String targetType, List<UserDTO> userDtoList);
	SalesDTO detailSalesTarget(SalesTargetDTO salesTargetDTO);
	int updateSalesTarget(SalesTargetDTO salesTargetDTO);
	int deleteSalesTarget(SalesTargetDTO salesTargetDTO);
	int insertSalesTarget(SalesTargetDTO salesTargetDTO);
}
