package kr.swcore.sderp.salesTarget.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import kr.swcore.sderp.organiz.dto.OrganizDTO;
import kr.swcore.sderp.salesTarget.dto.SalesTargetDTO;

public interface SalesTargetService {
	List<SalesTargetDTO> listSalesTarget();
	List<Object> listSalesTarget(HttpSession session, OrganizDTO organizDto, SalesTargetDTO salesTargetDTO);
	SalesTargetDTO detailSalesTarget(SalesTargetDTO salesTargetDTO);
	int updateSalesTarget(HttpSession session, SalesTargetDTO salesTargetDTO);
	int deleteSalesTarget(HttpSession session, SalesTargetDTO salesTargetDTO);
	int insertSalesTarget(HttpSession session, SalesTargetDTO salesTargetDTO);
}
