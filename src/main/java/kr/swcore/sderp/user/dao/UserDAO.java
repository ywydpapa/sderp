package kr.swcore.sderp.user.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.user.dto.UserDTO;

public interface UserDAO {
	
	List<UserDTO> userList();
	List<UserDTO> userList(SoppDTO soppdto);
	public boolean loginCheck(UserDTO dto);
	public UserDTO viewUser(UserDTO dto);
	public void logout(HttpSession session);
	public int updateUser(UserDTO dto);
	public int insertUser(UserDTO dto);
	public int insertUserdata(UserDTO dto);
	public int userCheck(UserDTO dto);
	public List<UserDTO> userListWithOrgId(UserDTO userDTO);
	
}
