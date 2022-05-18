package kr.swcore.sderp.pps;

import kr.swcore.sderp.pps.dto.PpsDTO;
import kr.swcore.sderp.pps.service.PpsService;

import kr.swcore.sderp.user.service.UserService;
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

    @Inject
    UserService userService;

    @RequestMapping("ppslist.do")
    public ModelAndView ppslist(HttpSession session, ModelAndView mav, @ModelAttribute PpsDTO dto){
        mav.addObject("ppsList", ppsService.listPps(session, dto));
        mav.addObject("userList", userService.userList(session));
        mav.setViewName("pps/ppslist");
        return mav;
    }

    @RequestMapping("ppsStatusList.do")
    public ModelAndView ppsStatusList(HttpSession session, ModelAndView mav, @ModelAttribute PpsDTO dto){
        mav.addObject("ppsList", ppsService.ppsStatusList(session, dto));
        mav.addObject("userList", userService.userList(session));
        mav.setViewName("pps/ppsstatuslist");
        return mav;
    }

    @RequestMapping("mppsStatusList.do")
    public ModelAndView mppsStatusList(HttpSession session, ModelAndView mav, @ModelAttribute PpsDTO dto){
        mav.addObject("ppsList", ppsService.ppsStatusList(session, dto));
        mav.addObject("userList", userService.userList(session));
        mav.setViewName("pps/mppsstatuslist");
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
    public ModelAndView ppsupload(HttpSession session, ModelAndView mav, @ModelAttribute PpsDTO dto){
        mav.addObject("ppsList", ppsService.listPps(session, dto));
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
    
    @RequestMapping("assignUpdate.do")
    public ResponseEntity<Object> assignUpdate(HttpSession session, @ModelAttribute PpsDTO dto){
        Map<String,Object> param = new HashMap<>();
        int ppsIns = ppsService.assignUpdate(dto);
        if(ppsIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("mppsInsert.do")
    public ResponseEntity<Object> mppsInsert(HttpSession session, @ModelAttribute PpsDTO dto){
        Map<String,Object> param = new HashMap<>();
        int ppsIns = ppsService.mppsInsert(dto);
        if(ppsIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("mppsUpdate.do")
    public ResponseEntity<Object> mppsUpdate(HttpSession session, @ModelAttribute PpsDTO dto){
        Map<String,Object> param = new HashMap<>();
        int ppsUp = ppsService.mppsUpdate(dto);
        if(ppsUp > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
}
