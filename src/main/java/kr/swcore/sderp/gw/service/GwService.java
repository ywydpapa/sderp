package kr.swcore.sderp.gw.service;

import kr.swcore.sderp.gw.dto.GwDTO;
import kr.swcore.sderp.gw.dto.GwFileDataDTO;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.IOException;
import java.util.List;

public interface GwService {
    List<GwDTO> listDoc(HttpSession session);
    List<GwDTO> listUserAtt(HttpSession session);
    List<GwDTO> listUserAttbyuser(int userNo);
    List<GwDTO> myList(HttpSession session);
    List<GwDTO> myDocList(HttpSession session);
    List<GwDTO> listEst(HttpSession session);
    List<GwDTO> listEstitems(GwDTO dto);
    GwDTO detailEst(String estId);
    GwDTO detailDoc(int docNo);
    GwDTO detailDocApp(int docNo);
    List<GwDTO> detailDocData(int docNo);
    GwDTO detailUserAtt(int attendId);
    int insertDoc(GwDTO dto);
    int insertDocApp(GwDTO dto);
    int insertDocData(GwDTO dto);
    int insertUserAtt(GwDTO dto);
    int updateDoc(GwDTO dto);
    int updateDocApp(GwDTO dto);
    int updateDocData(GwDTO dto);
    int updateUserAtt(GwDTO dto);
    int updateDocAppLvl(GwDTO dto);
    int Attallow(GwDTO dto);
    int Attreject(GwDTO dto);
    int deleteDoc(int docNo);
    int deleteUserAtt(int attendId);
    int insertEst(GwDTO dto);
    int insertEstitems(GwDTO dto);
    int uploadFile(HttpSession session, int docNo, MultipartHttpServletRequest fileList) throws IOException;
    int uploadFileUpdate(HttpSession session, int docNo, MultipartHttpServletRequest fileList) throws IOException;
    GwFileDataDTO listFile(int docNo);
    GwFileDataDTO downloadFile(GwFileDataDTO dto);
}
