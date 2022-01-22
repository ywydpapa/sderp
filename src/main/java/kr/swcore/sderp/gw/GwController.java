package kr.swcore.sderp.gw;

import kr.swcore.sderp.gw.dto.GwDTO;
import kr.swcore.sderp.gw.dto.GwFileDataDTO;
import kr.swcore.sderp.gw.service.GwService;
import kr.swcore.sderp.sopp.dto.SoppdataDTO;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;
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

    @RequestMapping("signpad.do")
    public ModelAndView signpad(HttpSession session, ModelAndView mav) {
        mav.setViewName("gware/signPad");
        return mav;
    }

    @RequestMapping("mylist.do")
    public ModelAndView myList(HttpSession session, ModelAndView mav,
    		@RequestParam(value = "custNo", required = false) Integer custNo,
			@RequestParam(value = "userName", required = false) String userName,
			@RequestParam(value = "vatSdate", required = false) String vatSdate,
			@RequestParam(value = "vatEdate", required = false) String vatEdate) 
    {
    	if(custNo != null || userName != null || vatSdate != null || vatEdate != null){
			GwDTO dto = new GwDTO();
    		if(custNo != null) dto.setCustNo(custNo);
    		if(userName != null) dto.setUserName(userName);
    		if(vatSdate != null) dto.setVatSdate(vatSdate);
    		if(vatEdate != null) dto.setVatEdate(vatEdate);
    		mav.addObject("mylist", gwService.myList(session, dto));
    	}else {
    		mav.addObject("mylist", gwService.myList(session));
    	}
    	
        mav.setViewName("gware/mylist");
        return mav;
    }
    
    @RequestMapping("mydoclist.do")
    public ModelAndView myDocList(HttpSession session, ModelAndView mav,
    		@RequestParam(value = "custNo", required = false) Integer custNo,
			@RequestParam(value = "userName", required = false) String userName,
			@RequestParam(value = "vatSdate", required = false) String vatSdate,
			@RequestParam(value = "vatEdate", required = false) String vatEdate) 
    {
    	if(custNo != null || userName != null || vatSdate != null || vatEdate != null){
			GwDTO dto = new GwDTO();
    		if(custNo != null) dto.setCustNo(custNo);
    		if(userName != null) dto.setUserName(userName);
    		if(vatSdate != null) dto.setVatSdate(vatSdate);
    		if(vatEdate != null) dto.setVatEdate(vatEdate);
    		mav.addObject("mydoclist", gwService.myDocList(session, dto));
    	}else {
    		mav.addObject("mydoclist", gwService.myDocList(session));
    	}
        
        mav.setViewName("gware/mydoclist");
        return mav;
    }

    @RequestMapping("write.do")
    public ModelAndView docWrite(HttpSession session, ModelAndView mav) {
        mav.setViewName("gware/write");
        return mav;
    }
    
    @RequestMapping("detail/{docNo}")
    public ModelAndView docDetail(@PathVariable("docNo") int docNo, ModelAndView mav) {
    	mav.addObject("detailList", gwService.detailDoc(docNo));
    	mav.addObject("detailListApp", gwService.detailDocApp(docNo));
    	mav.addObject("detailListData", gwService.detailDocData(docNo));
    	mav.addObject("detailFile", gwService.listFile(docNo));
        mav.setViewName("gware/detail");
        return mav;
    }

    @RequestMapping("attlist.do")
    public ModelAndView hrdocList(HttpSession session, ModelAndView mav) {
        mav.addObject("list",gwService.listUserAtt(session));
        mav.setViewName("hr/attlist");
        return mav;
    }

    @RequestMapping("attdetail/{attendId}")
    public ModelAndView hrdocDetail(@PathVariable("attendId") int attendId, ModelAndView mav) {
        mav.addObject("list", gwService.detailUserAtt(attendId));
        mav.setViewName("hr/attdetail");
        return mav;
    }

    @RequestMapping("attwrite.do")
    public ModelAndView hrdocWrite(HttpSession session, ModelAndView mav) {
        mav.setViewName("hr/attwrite");
        return mav;
    }
    
    @ResponseBody
    @RequestMapping("selectVersion.do")
    public GwDTO selectVersion(HttpSession session, ModelAndView mav, @ModelAttribute GwDTO dto) 
    {
    	GwDTO getVersion = gwService.selectVersion(session, dto);
    	
    	return getVersion;
    }

    @RequestMapping("estlist.do")
    public ModelAndView estList(HttpSession session, ModelAndView mav,
    							@RequestParam(value = "custNo", required = false) Integer custNo,
    							@RequestParam(value = "userName", required = false) String userName) 
    {
    	if(custNo != null || userName != null){
    		GwDTO dto = new GwDTO();
    		if(custNo != null) dto.setCustNo(custNo);
    		if(userName != null) dto.setUserName(userName);
    		mav.addObject("list", gwService.listEst(session, dto));
    	}else {
    		mav.addObject("list", gwService.listEst(session));
    	}
    	
        mav.setViewName("gware/estlist");
        return mav;
    }

    @RequestMapping("estwrite.do")
    public String estwrite(HttpSession session, Model model) {
        return "gware/estwrite";
    }

    @RequestMapping("estdetail/{estId}/{estVer}")
    public ModelAndView estdetail(@PathVariable String estId,@PathVariable int estVer, HttpSession session, ModelAndView mav, GwDTO dto) {
        mav.setViewName("gware/estdetail");
        mav.addObject("detail",gwService.detailEst(dto));
        mav.addObject("list",gwService.listEstitems(dto));
        return mav;
    }
    
    @RequestMapping("estPdf/{estId}/{estVer}")
    public ModelAndView estPdf(HttpSession session, ModelAndView mav, GwDTO dto) {
    	mav.setViewName("form/estPdf");
    	mav.addObject("detail",gwService.detailEst(dto));
        mav.addObject("list",gwService.listEstitems(dto));
        mav.addObject("titleList", gwService.titleGroupBy(dto));
        mav.addObject("comList", gwService.comList(session));
    	return mav;
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
    
   @RequestMapping("updateApp.do")
   public  ResponseEntity<?> updateDocApp(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        int docUpdate = gwService.updateDocApp(dto);
        if (docUpdate >0) {
            param.put("code","10001");
        } else {
            param.put("code","20001");
        }
        return ResponseEntity.ok(param);
   }
   
   @RequestMapping("updateData.do")
   public ResponseEntity<?> updateDocData(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        int docUpdate = gwService.updateDocData(dto);
        if (docUpdate >0) {
            param.put("code","10001");
        } else {
            param.put("code","20001");
        }
        return ResponseEntity.ok(param);
   }


    @RequestMapping("delete/{docNo}")
    public  ResponseEntity<?> delete(@PathVariable("docNo") int docNo) {
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
    
    @RequestMapping("updateEst.do")
    public  ResponseEntity<?> updateEst(@ModelAttribute GwDTO dto) {
         Map<String, Object> param = new HashMap<>();
         int estUpdate = gwService.updateEst(dto);
         if (estUpdate >0) {
             param.put("code","10001");
         } else {
             param.put("code","20001");
         }
         return ResponseEntity.ok(param);
    }
    
    @RequestMapping("deleteEst/{estId}")
    public  ResponseEntity<?> deleteEst(@PathVariable("estId") String estId) {
        Map<String, Object> param = new HashMap<>();
        int docDelete = gwService.deleteEst(estId);
        if (docDelete >0) {
            param.put("code","10001");
        } else {
            param.put("code","20001");
        }
        return ResponseEntity.ok(param);
    }

    @RequestMapping("attallow.do")
    public ResponseEntity<?> attallow(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        int allow = gwService.Attallow(dto);
        if (allow >0) {
            param.put("code","10001");
        }
        else {param.put("code","20001");
        }
        return ResponseEntity.ok(param);
    }

    @RequestMapping("attreject.do")
    public ResponseEntity<?> attreject(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        int allow = gwService.Attreject(dto);
        if (allow >0) {
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
    
    @RequestMapping("/uploadfile/{docNo}")
	public ResponseEntity<?> uploadFile(HttpSession session, @PathVariable("docNo") int docNo,  MultipartHttpServletRequest fileList) throws IOException {
		int uploadFile = gwService.uploadFile(session, docNo, fileList);
		Map<String, Object> param = new HashMap<>();
		if(uploadFile > 0) {
			param.put("code", "10001");
		} else {
			param.put("code", "20001");
		}
		return ResponseEntity.ok(param);
	}
    
    @RequestMapping("/uploadfileUpdate/{docNo}")
	public ResponseEntity<?> uploadfileUpdate(HttpSession session, @PathVariable("docNo") int docNo, MultipartHttpServletRequest fileList) throws IOException {
		int uploadFile = gwService.uploadFileUpdate(session, docNo, fileList);
		Map<String, Object> param = new HashMap<>();
		if(uploadFile > 0) {
			param.put("code", "10001");
		} else {
			param.put("code", "20001");
		}
		return ResponseEntity.ok(param);
	}
    
    @RequestMapping("/downloadfile")
	public ResponseEntity<?> downloadFile(HttpSession session, HttpServletResponse response, @ModelAttribute GwFileDataDTO dto) throws IOException {
    	GwFileDataDTO gwFile = gwService.downloadFile(dto);
		String fileName = gwFile.getFileName();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		headers.add("Content-Disposition", new String(fileName.getBytes("UTF-8"), "ISO-8859-1"));
		ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(gwFile.getFileContent(), headers, HttpStatus.OK);
		
		return entity;
	}
}
