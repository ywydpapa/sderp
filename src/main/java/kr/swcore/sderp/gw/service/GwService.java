package kr.swcore.sderp.gw.service;

import kr.swcore.sderp.gw.dto.GwDTO;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface GwService {
    List<GwDTO> listDoc2(HttpSession compNo);
    List<GwDTO> listEst(HttpSession compNo);
    List<GwDTO> listEstitems(GwDTO dto);
    GwDTO detailEst(String estId);
    GwDTO detailDoc(int docNo);
    int insertDoc(GwDTO dto);
    int updateDoc(GwDTO dto);
    int deleteDoc(int docNo);
    int insertEst(GwDTO dto);
    int insertEstitems(GwDTO dto);
}
