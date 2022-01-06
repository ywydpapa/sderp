package kr.swcore.sderp.gw.service;

import kr.swcore.sderp.gw.dto.GwDTO;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface GwService {
    List<GwDTO> listDoc2(HttpSession session);
    List<GwDTO> listUserAtt(HttpSession session);
    List<GwDTO> listUserAttbyuser(int userNo);
    List<GwDTO> listMyDoc(HttpSession session);
    List<GwDTO> listEst(HttpSession session);
    List<GwDTO> listEstitems(GwDTO dto);
    GwDTO detailEst(String estId);
    GwDTO detailDoc(int docNo);
    GwDTO detailUserAttend(int attendId);
    int insertDoc(GwDTO dto);
    int insertDocApp(GwDTO dto);
    int insertDocData(GwDTO dto);
    int insertUserAtt(GwDTO dto);
    int updateDoc(GwDTO dto);
    int updateUserAtt(GwDTO dto);
    int updateDocAppLvl(GwDTO dto);
    int deleteDoc(int docNo);
    int deleteUserAtt(int attendId);
    int insertEst(GwDTO dto);
    int insertEstitems(GwDTO dto);
}
