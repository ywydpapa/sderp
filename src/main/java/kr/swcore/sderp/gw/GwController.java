package kr.swcore.sderp.gw;

import kr.swcore.sderp.cust.dto.CustDTO;
import kr.swcore.sderp.gw.dto.GwDTO;
import kr.swcore.sderp.gw.service.GwService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public String docList(HttpSession session, Model model) {
        List<GwDTO> list=gwService.listDoc2(session);
        model.addAttribute("list",list);
        return "gware/list";
    }

    @RequestMapping("estlist.do")
    public String estList(HttpSession session, Model model) {
        return "gware/estlist";
    }

    @RequestMapping("estwrite.do")
    public String estwrite(HttpSession session, Model model) {
        return "gware/estwrite";
    }

    @RequestMapping("estdetail/{estNo}")
    public String estwrite(@PathVariable int estNo, HttpSession session, Model model) {
        return "gware/estdetail";
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


}
