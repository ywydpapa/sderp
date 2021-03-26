package kr.swcore.sderp.salesTarget.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.swcore.sderp.salesTarget.dto.SalesTargetDTO;

public interface SalesTargetService {
	List<SalesTargetDTO> listSalesTarget();
	List<SalesTargetDTO> listSales(HttpSession session, SalesTargetDTO salesTargetDTO);
	SalesTargetDTO detailSalesTarget(SalesTargetDTO salesTargetDTO);
	int updateSalesTarget(HttpSession session, SalesTargetDTO salesTargetDTO);
	int deleteSalesTarget(HttpSession session, SalesTargetDTO salesTargetDTO);
	int insertSalesTarget(HttpSession session, SalesTargetDTO salesTargetDTO);
}
