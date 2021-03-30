package kr.swcore.sderp.organiz.Service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.swcore.sderp.organiz.dto.OrganizDTO;

public interface OrganizService {
	
	List<OrganizDTO> listDept(HttpSession session);
	List<OrganizDTO> listDeptChainExtend(HttpSession session, OrganizDTO organizDTO);
}
