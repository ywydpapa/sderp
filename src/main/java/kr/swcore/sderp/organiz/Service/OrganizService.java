package kr.swcore.sderp.organiz.Service;

import com.google.gson.JsonArray;
import kr.swcore.sderp.organiz.dto.OrganizDTO;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface OrganizService {
	
	List<OrganizDTO> listDept(HttpSession session);
	JsonArray listDeptForCalendar(HttpSession session);
	List<OrganizDTO> listDeptChainExtend(HttpSession session, OrganizDTO organizDTO);
}
