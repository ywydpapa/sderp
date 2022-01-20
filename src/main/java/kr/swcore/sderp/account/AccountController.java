package kr.swcore.sderp.account;

import kr.swcore.sderp.account.service.AccountService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/acc/*")
public class AccountController {

    @Inject
    AccountService accountService;

    @RequestMapping("vatlist.do")
    public ModelAndView docList(HttpSession session, ModelAndView mav) {
        mav.addObject("vatList", accountService.listvat(session));
        mav.setViewName("settle/vatlist");
        return mav;
    }

}
