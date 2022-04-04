package kr.swcore.sderp.mis;

import kr.swcore.sderp.mis.service.MisService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/mis/*")
public class MisController {

    @Inject
    MisService misService;

    @RequestMapping("/hrdutylist.do")
    public ModelAndView hrdutylist(HttpSession session, ModelAndView mav) {
        mav.addObject("dutyList", misService.listHRduty(session));
        mav.setViewName("mis/hrdutylist");
        return mav;
    }
}
