package kr.swcore.sderp.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.swcore.sderp.code.dto.CodeDTO;
import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.user.dto.UserDTO;
import kr.swcore.sderp.user.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Inject
	UserService userService;
	
	@Inject
	CodeService codeService;
	
	@RequestMapping("login.do")
	public String login() {
		return "user/login";
	}
	
	@RequestMapping("write.do")
	public ModelAndView write(@ModelAttribute CodeDTO dto) {
		ModelAndView mav = new ModelAndView();
		List<CodeDTO> listcomp = codeService.listComp();
		List<CodeDTO> listdept = codeService.listDept();
		List<CodeDTO> listrank = codeService.listRank();
		mav.addObject("listComp",listcomp);
		mav.addObject("listDept",listdept);
		mav.addObject("listRank",listrank);
		mav.setViewName("user/write");
		return mav;
	}
	
	@RequestMapping("view.do")
	public ModelAndView userView(@ModelAttribute UserDTO dto) {
		ModelAndView mav = new ModelAndView();
		UserDTO userInfo = userService.viewUser(dto);
		mav.addObject("userInfo", userInfo);
		mav.setViewName("user/view");
		return mav;
	}
	
	@RequestMapping("list.do")
	public String userList(Model model) {
		List<UserDTO> list=userService.userList();
		model.addAttribute("list",list);
		return "user/list";
	}
	
	@RequestMapping("update.do")
	public ResponseEntity<?> userUpdate(@ModelAttribute UserDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int userUpdate =userService.updateUser(dto);
		if(userUpdate > 0) {
       	param.put("code","10001");
      }
       else {
        	param.put("code","20001");
        }
        return ResponseEntity.ok(param);
	}

	@RequestMapping("insert.do")
	public ResponseEntity<?> userInsert(@ModelAttribute UserDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int userInsert =userService.insertUser(dto);
		int userdataInsert =userService.insertUserdata(dto);
		if(userInsert > 0) {
       	param.put("code","10001");
      }
       else {
        	param.put("code","20001");
        }
        return ResponseEntity.ok(param);
	} 

	
	
	@RequestMapping(value="/login_check.do")
	public ModelAndView loginCheck(@ModelAttribute UserDTO dto, HttpSession session) {
		boolean result = userService.loginCheck(dto, session);
		ModelAndView mav = new ModelAndView();
		if (result == true) {
			UserDTO userInfo = userService.viewUser(dto);
			mav.setViewName("main");
			mav.addObject("msg", "Success");
			mav.addObject("userName", userInfo.getUserName());
			session.setAttribute("userId", userInfo.getUserId());
			session.setAttribute("userName", userInfo.getUserName());
			session.setAttribute("userRole", userInfo.getUserRole()); // 권한코드
			session.setAttribute("userOtp", userInfo.getUserOtp()); // OTP - 1회성
			session.setAttribute("compNo", userInfo.getCompNo()); // 회사코드
			session.setAttribute("userNo", Integer.toString(userInfo.getUserNo())); // 유저 일련번호
			session.setAttribute("orgId", userInfo.getOrg_id()); // 부서 번호
		}else{
			mav.setViewName("user/login");
			mav.addObject("msg", "Fail");
		}
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="userCheck.do", method = RequestMethod.POST)
	public int userCheck(UserDTO dto) {
		int result = userService.userCheck(dto);
		return result;
	}
	
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session) {
		userService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/login");
		return mav;
	}

}
