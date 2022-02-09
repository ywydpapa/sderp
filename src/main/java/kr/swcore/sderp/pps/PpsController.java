package kr.swcore.sderp.pps;

import kr.swcore.sderp.account.dto.AccountDTO;
import kr.swcore.sderp.pps.dto.PpsDTO;
import kr.swcore.sderp.pps.service.PpsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/pps/*")
public class PpsController {
    @Inject
    PpsService ppsService;

    @RequestMapping("ppslist.do")
    public ModelAndView ppslist(HttpSession session, ModelAndView mav){
        mav.addObject("ppsList", ppsService.listPps(session));
        mav.setViewName("pps/ppslist");
        return mav;
    }
    
    @ResponseBody
    @RequestMapping("vatcheck.do")
    public PpsDTO vchk(ModelAndView mav, @ModelAttribute PpsDTO dto)
    {
    	PpsDTO vserial = ppsService.checkPps(dto);
        return vserial;
    }

    @RequestMapping("ppsupload.do")
    public ModelAndView ppsupload(HttpSession session, ModelAndView mav){
        mav.addObject("ppsList", ppsService.listPps(session));
        mav.setViewName("pps/ppsupload");
        return mav;
    }

}
