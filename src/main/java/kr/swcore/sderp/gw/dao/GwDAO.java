package kr.swcore.sderp.gw.dao;

import kr.swcore.sderp.gw.dto.GwDTO;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface GwDAO {
    List<GwDTO> listDoc2(HttpSession compNo);
    List<GwDTO> listUserAtt(HttpSession compNo);
    List<GwDTO> listUserAttbyuser(int userNo);
    List<GwDTO> listMyDoc(HttpSession userNo);
    List<GwDTO> listEst(Integer compNo);
    List<GwDTO> listEstitems(GwDTO dto);
    GwDTO detailEst(String estId);
    GwDTO detailUserAtt(int attendId);
    GwDTO detailDoc(int docNo);
    int insertDoc(GwDTO dto);
    int insertUserAtt(GwDTO dto);
    int updateDoc(GwDTO dto);
    int updateUserAtt(GwDTO dto);
    int updateDocAppLvl(GwDTO dto);
    int deleteDoc(int docNo);
    int deleteUserAtt(int attendId);
    int insertEst(GwDTO dto);
    int insertEstitems(GwDTO dto);
}
