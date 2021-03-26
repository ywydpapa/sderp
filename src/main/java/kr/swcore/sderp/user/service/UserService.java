package kr.swcore.sderp.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.swcore.sderp.user.dto.UserDTO;



public interface UserService {

		public boolean loginCheck(UserDTO dto, HttpSession session);

	    public UserDTO viewUser(UserDTO dto);

    	public void logout(HttpSession session);
	
    	public List<UserDTO> userList();
    	
    	public List<UserDTO> userList(HttpSession session);
    	
    	public int updateUser(UserDTO dto);
    	
    	public int insertUser(UserDTO dto);
    	
    	public int insertUserdata(UserDTO dto);

    	public int userCheck(UserDTO dto);
    	
    	public List<UserDTO> userListWithOrgId(UserDTO dto);
}
