package kr.swcore.sderp.notice;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.swcore.sderp.notice.service.NoticeService;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	@Inject
	NoticeService noticeService;
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		mav.addObject("list", noticeService.listNotice(session, null));
		mav.setViewName("notice/list");
		return mav;
	}
}
