package kr.swcore.sderp.pps;

import kr.swcore.sderp.pps.dto.PpsDTO;
import kr.swcore.sderp.pps.service.PpsService;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

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
    @RequestMapping("ppscheck.do")
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
    
    @RequestMapping("insertpps.do")
    public ResponseEntity<Object> insertpps(HttpSession session, @ModelAttribute PpsDTO dto){
        Map<String,Object> param = new HashMap<>();
        int ppsIns = ppsService.insertPps(dto);
        if(ppsIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }

}
