package kr.swcore.sderp.mis;

import kr.swcore.sderp.mis.dto.MisDTO;
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
    public ModelAndView hrdutylist(HttpSession session, MisDTO dto, ModelAndView mav) {
        mav.addObject("dutyList", misService.listHRduty(session,dto));
        mav.setViewName("mis/hrdutylist");
        return mav;
    }

    @RequestMapping("/hrcostlist.do")
    public ModelAndView hrcostlist(HttpSession session,MisDTO dto,  ModelAndView mav) {
        mav.addObject("costList", misService.listHRcost(session, dto));
        mav.setViewName("mis/hrcostlist");
        return mav;
    }

    @RequestMapping("/soppstatuslist.do")
    public ModelAndView soppstatuslist(HttpSession session, MisDTO dto, ModelAndView mav) {
        mav.addObject("soppList", misService.listSopp(session, dto));
        mav.setViewName("mis/soppstatuslist");
        return mav;
    }

    @RequestMapping("/soppcostlist.do")
    public ModelAndView soppcostlist(HttpSession session, MisDTO dto, ModelAndView mav) {
        mav.addObject("costList", misService.listSoppcost(session, dto));
        mav.setViewName("mis/soppcostlist");
        return mav;
    }
    @RequestMapping("/soppmarginlist.do")
    public ModelAndView soppmarginlist(HttpSession session,MisDTO dto, ModelAndView mav) {
        mav.addObject("marginList", misService.listSoppmargin(session, dto));
        mav.setViewName("mis/soppmarginlist");
        return mav;
    }

    @RequestMapping("/bacinoutlist.do")
    public ModelAndView bacinoutlist(HttpSession session, MisDTO dto, ModelAndView mav) {
        mav.addObject("inoutList", misService.listBacinout(session,dto));
        mav.setViewName("mis/bacinoutlist");
        return mav;
    }
    @RequestMapping("/bacstatuslist.do")
    public ModelAndView bacstatuslist(HttpSession session, MisDTO dto,  ModelAndView mav) {
        mav.addObject("statusList", misService.listBacstatus(session,dto));
        mav.setViewName("mis/bacstatuslist");
        return mav;
    }
/*
    @RequestMapping("/saleslist.do")
    public ModelAndView saleslist(HttpSession session, ModelAndView mav) {
        mav.addObject("salesList", misService.listHRduty(session));
        mav.setViewName("mis/saleslist");
        return mav;
    }
    @RequestMapping("/ledgerlist.do")
    public ModelAndView ledgerlist(HttpSession session, ModelAndView mav) {
        mav.addObject("ledgerList", misService.listHRduty(session));
        mav.setViewName("mis/ledgerlist");
        return mav;
    }*/

}
