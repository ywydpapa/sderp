package kr.swcore.sderp.organiz.Service;

import kr.swcore.sderp.organiz.dao.OrganizDAO;
import kr.swcore.sderp.organiz.dto.OrganizDTO;
import kr.swcore.sderp.user.dao.UserDAO;
import kr.swcore.sderp.user.dto.UserDTO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

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

	@Override
	public String listDeptForCalendar(HttpSession session) {
		String result = "";
		//Gson gson = new GsonBuilder().setPrettyPrinting().create();
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		JSONArray returnArray = new JSONArray();
		List<OrganizDTO> rtn = organizDao.listDept(compNo);
		if(rtn != null) {
			JSONObject first = new JSONObject();
			first.put("title", rtn.get(0).getParentTitle());
			first.put("expanded", true);
			first.put("folder", true);
			JSONArray arr = new JSONArray();
			for(OrganizDTO dto : rtn){
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("title", dto.getOrg_title());
				jsonObject.put("expanded", true);
				jsonObject.put("folder", true);

				List<UserDTO> userList = userDAO.userListWithOrgId(dto.getOrg_id());
				JSONArray array = new JSONArray();
				for(UserDTO userDTO : userList){
					HashMap<String, Object> obj = new HashMap<String, Object>();
					obj.put("title", userDTO.getUserName());
					obj.put("userNo", userDTO.getUserNo());

					JSONObject object = new JSONObject(obj);
					array.add(object);
				}
				jsonObject.put("children", array);
				arr.add(jsonObject);
			}
			first.put("children", arr);
			returnArray.add(first);
		}
		return returnArray.toJSONString();
	}

    @Override
    public List<OrganizDTO> listDeptChainExtend(HttpSession session, OrganizDTO organizDTO) {
        Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
        if(organizDTO == null) organizDTO = new OrganizDTO();
        organizDTO.setCompNo(compNo);

        return organizDao.listDeptChainExtend(organizDTO);
    }

}
