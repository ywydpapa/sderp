package kr.swcore.sderp.organiz.Service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import kr.swcore.sderp.user.dao.UserDAO;
import kr.swcore.sderp.user.dto.UserDTO;
import org.springframework.stereotype.Service;

import kr.swcore.sderp.organiz.dao.OrganizDAO;
import kr.swcore.sderp.organiz.dto.OrganizDTO;

@Service
public class OrganizServiceImpl implements OrganizService {

	@Inject
	OrganizDAO organizDao;

	@Inject
	UserDAO userDAO;
	
	@Override
	public List<OrganizDTO> listDept(HttpSession session) {
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		return organizDao.listDept(compNo);
	}

	private JsonArray listDeptForCalendarCreate(List<OrganizDTO> rtn, Integer orgId, Boolean loop){
		JsonArray jsonArray = new JsonArray();

		return jsonArray;
	}

	@Override
	public JsonArray listDeptForCalendar(HttpSession session) {
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		JsonArray returnArray = new JsonArray();
		List<OrganizDTO> rtn = organizDao.listDept(compNo);
		if(rtn != null) {
			JsonObject first = new JsonObject();
			first.addProperty("title", rtn.get(0).getParentTitle());
			first.addProperty("expanded", true);
			first.addProperty("folder", true);
			JsonArray children = new JsonArray();
			for(OrganizDTO dto : rtn){
				JsonObject jsonObject = new JsonObject();
				jsonObject.addProperty("title", dto.getOrg_title());
				jsonObject.addProperty("expanded", true);
				jsonObject.addProperty("folder", true);

				List<UserDTO> userList = userDAO.userListWithOrgId(dto.getOrg_id());
				JsonArray arr = new JsonArray();
				for(int i=0; i<userList.size(); i++){
					JsonObject obj = new JsonObject();
					obj.addProperty("title", userList.get(i).getUserName());
					obj.addProperty("userName", userList.get(i).getUserName());
					obj.addProperty("userNo", userList.get(i).getUserNo());
					obj.addProperty("userRole", userList.get(i).getUserRole());
					arr.add(obj);
				}
				jsonObject.addProperty("children",arr.toString());
				children.add(jsonObject.toString());
			}
			first.addProperty("children", children.toString());
			returnArray.add(first);
		}
		System.out.println(returnArray.toString());
		return returnArray;
	}

	@Override
	public List<OrganizDTO> listDeptChainExtend(HttpSession session, OrganizDTO organizDTO) {
		return null;
	}

}
