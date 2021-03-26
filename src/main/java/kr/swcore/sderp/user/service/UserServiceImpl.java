package kr.swcore.sderp.user.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.user.dao.UserDAO;
import kr.swcore.sderp.user.dto.UserDTO;
import kr.swcore.sderp.util.SessionInfoGet;


@Service
public class UserServiceImpl implements UserService {

	@Inject
	UserDAO userDao;
	
	@Override
	public boolean loginCheck(UserDTO dto, HttpSession session) {
		// TODO Auto-generated method stub
		boolean result = userDao.loginCheck(dto);
		if (result) {
			UserDTO dto2 = viewUser(dto);
			session.setAttribute("userId",dto2.getUserId());
			session.setAttribute("userName", dto2.getUserPasswd());
		}
		return result;
	}

	@Override
	public UserDTO viewUser(UserDTO dto) {
		// TODO Auto-generated method stub
		return userDao.viewUser(dto);
	}

	@Override
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub
		session.invalidate();
	}

	@Override
	public List<UserDTO> userList() {
		// TODO Auto-generated method stub
		return userDao.userList();
	}
	
	@Override
	public List<UserDTO> userList(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		return userDao.userList(soppdto);
	}

	@Override
	public int updateUser(UserDTO dto) {
		// TODO Auto-generated method stub
		return userDao.updateUser(dto);
	}

	@Override
	public int insertUser(UserDTO dto) {
		// TODO Auto-generated method stub
		return userDao.insertUser(dto);
	}

	@Override
	public int userCheck(UserDTO dto) {
		// TODO Auto-generated method stub
		int result = userDao.userCheck(dto);
		return result;
	}

	@Override
	public int insertUserdata(UserDTO dto) {
		// TODO Auto-generated method stub
		return userDao.insertUserdata(dto);
	}

	@Override
	public List<UserDTO> userListWithOrgId(UserDTO dto) {
		return userDao.userListWithOrgId(dto);
	}


	

}
