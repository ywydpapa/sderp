package kr.swcore.sderp.gw;

import kr.swcore.sderp.gw.dto.GwDTO;
import kr.swcore.sderp.gw.service.GwService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/gw/*")
public class GwController {

@Inject
    GwService gwService;

    @RequestMapping("list.do")
    public ModelAndView docList(HttpSession session, ModelAndView mav) {
        mav.addObject("docList", gwService.listDoc(session));
        mav.setViewName("gware/list");
        return mav;
    }

    @RequestMapping("mylist.do")
    public ModelAndView myList(HttpSession session, ModelAndView mav) {
        mav.addObject("mylist", gwService.myList(session));
        mav.setViewName("gware/mylist");
        return mav;
    }
    
    @RequestMapping("mydoclist.do")
    public ModelAndView myDocList(HttpSession session, ModelAndView mav) {
        mav.addObject("mydoclist", gwService.myDocList(session));
        mav.setViewName("gware/mydoclist");
        return mav;
    }

    @RequestMapping("write.do")
    public ModelAndView docWrite(HttpSession session, ModelAndView mav) {
        mav.setViewName("gware/write");
        return mav;
    }

    @RequestMapping("attlist.do")
    public ModelAndView hrdocList(HttpSession session, ModelAndView mav) {
        mav.setViewName("hr/attlist");
        return mav;
    }

    @RequestMapping("attdetail.do")
    public ModelAndView hrdocDetail(HttpSession session, ModelAndView mav) {
        mav.setViewName("hr/attdetail");
        return mav;
    }

    @RequestMapping("attwrite.do")
    public ModelAndView hrdocWrite(HttpSession session, ModelAndView mav) {
        mav.setViewName("hr/attwrite");
        return mav;
    }

    @RequestMapping("estlist.do")
    public ModelAndView estList(HttpSession session, ModelAndView mav) {
        mav.setViewName("gware/estlist");
        mav.addObject("list", gwService.listEst(session));
        return mav;
    }

    @RequestMapping("estwrite.do")
    public String estwrite(HttpSession session, Model model) {
        return "gware/estwrite";
    }

    @RequestMapping("estdetail/{estId}/{estVer}")
    public ModelAndView estwrite(@PathVariable String estId,@PathVariable int estVer, HttpSession session, ModelAndView mav, GwDTO dto) {
        mav.setViewName("gware/estdetail");
        mav.addObject("detail",gwService.detailEst(estId));
        mav.addObject("list",gwService.listEstitems(dto));
        return mav;
    }

    @RequestMapping("insert.do")
    public ResponseEntity<?> insert(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        int docInsert = gwService.insertDoc(dto);
        param.put("getId", dto.getGetId());
        if (docInsert >0) {
            param.put("code","10001");
        }
        	else {param.put("code","20001");
        }
        return ResponseEntity.ok(param);
    }

    @RequestMapping("attinsert.do")
    public ResponseEntity<?> attinsert(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        int docInsert = gwService.insertUserAtt(dto);
        if (docInsert >0) {
            param.put("code","10001");
        }
        else {param.put("code","20001");
        }
        return ResponseEntity.ok(param);
    }

    
    @RequestMapping("insertApp.do")
    public ResponseEntity<?> insertApp(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        int docInsert = gwService.insertDocApp(dto);
        if (docInsert >0) {
            param.put("code","10001");
        }
        	else {param.put("code","20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("insertData.do")
    public ResponseEntity<?> insertData(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        int docInsert = gwService.insertDocData(dto);
        if (docInsert >0) {
            param.put("code","10001");
        }
        	else {param.put("code","20001");
        }
        return ResponseEntity.ok(param);
    }
    
   @RequestMapping("update.do")
   public  ResponseEntity<?> update(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        int docUpdate = gwService.updateDoc(dto);
        if (docUpdate >0) {
            param.put("code","10001");
        } else {
            param.put("code","20001");
        }
        return ResponseEntity.ok(param);
   }

    @RequestMapping("updateApp.do")
    public  ResponseEntity<?> updateApp(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        int docUpdate = gwService.updateDocAppLvl(dto);
        if (docUpdate >0) {
            param.put("code","10001");
        } else {
            param.put("code","20001");
        }
        return ResponseEntity.ok(param);
    }

    @RequestMapping("delete.do")
    public  ResponseEntity<?> delete(@ModelAttribute int docNo) {
        Map<String, Object> param = new HashMap<>();
        int docDelete = gwService.deleteDoc(docNo);
        if (docDelete >0) {
            param.put("code","10001");
        } else {
            param.put("code","20001");
        }
        return ResponseEntity.ok(param);
    }

    @RequestMapping("insertEst.do")
    public ResponseEntity<?> insertEst(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        int estInsert = gwService.insertEst(dto);
        if (estInsert >0) {
            param.put("code","10001");
        }
        else {param.put("code","20001");
        }
        return ResponseEntity.ok(param);
    }

    @RequestMapping("insertEstitems.do")
    public ResponseEntity<?> insertEstitems(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        int itemInsert = gwService.insertEstitems(dto);
        if (itemInsert >0) {
            param.put("code","10001");
        }
        else {param.put("code","20001");
        }
        return ResponseEntity.ok(param);
    }

}
