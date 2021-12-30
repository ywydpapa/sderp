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
        List<GwDTO> list=gwService.listDoc2(session);
        mav.setViewName("gware/list");
        return mav;
    }

    @RequestMapping("estlist.do")
    public ModelAndView estList(HttpSession compNo, ModelAndView mav) {
        mav.setViewName("gware/estlist");
        mav.addObject("list", gwService.listEst(compNo));
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
