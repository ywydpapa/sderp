package kr.swcore.sderp.account;

import kr.swcore.sderp.account.dto.AccountDTO;
import kr.swcore.sderp.account.service.AccountService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/acc/*")
public class AccountController {

    @Inject
    AccountService accountService;

    @RequestMapping("vatlist.do")
    public ModelAndView vatList(HttpSession session, ModelAndView mav) {
        mav.addObject("vatList", accountService.listvat(session));
        mav.setViewName("settle/vatlist");
        return mav;
    }

    @ResponseBody
    @RequestMapping("vatcheck.do")
    public AccountDTO vchk(ModelAndView mav, @ModelAttribute AccountDTO dto)
    {
        AccountDTO vserial = accountService.checkVat(dto);
       return vserial;
    }

    @RequestMapping("vatupload.do")
    public ModelAndView vatUpload(HttpSession session, ModelAndView mav) {
        mav.addObject("vatList", accountService.listvat(session));
        mav.setViewName("settle/vatupload");
        return mav;
    }

    @RequestMapping("vatdetail/{vatId}")
    public ModelAndView vatDetail(@PathVariable("vatId") int vatId, ModelAndView mav) {
        mav.addObject("vatdetail", accountService.detailvat(vatId));
        mav.setViewName("settle/vatdetail");
        return mav;
    }

    @RequestMapping("insertvat.do")
    public ResponseEntity<Object> insertvat(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int vatIns = accountService.insertVat(dto);
        if(vatIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }

}
