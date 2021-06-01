package kr.swcore.sderp.organiz.Service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.google.gson.JsonArray;
import kr.swcore.sderp.organiz.dto.OrganizDTO;

public interface OrganizService {
	
	List<OrganizDTO> listDept(HttpSession session);
	JsonArray listDeptForCalendar(HttpSession session);
	List<OrganizDTO> listDeptChainExtend(HttpSession session, OrganizDTO organizDTO);
}
