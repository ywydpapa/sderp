package kr.swcore.sderp.gw.dao;

import kr.swcore.sderp.gw.dto.GwDTO;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface GwDAO {
    List<GwDTO> listDoc(int compNo);
    List<GwDTO> listUserAtt(HttpSession compNo);
    List<GwDTO> listUserAttbyuser(int userNo);
    List<GwDTO> myList(int docCrUserNo);
    List<GwDTO> myDocList(int docCrUserNo);
    List<GwDTO> listEst(Integer compNo);
    List<GwDTO> listEstitems(GwDTO dto);
    GwDTO detailEst(String estId);
    GwDTO detailUserAtt(int attendId);
    GwDTO detailDoc(int docNo);
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
