package kr.swcore.sderp.gw.dao;

import kr.swcore.sderp.gw.dto.GwDTO;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface GwDAO {
    List<GwDTO> listDoc2(HttpSession compNo);
    GwDTO detailDoc(int docNo);
    int insertDoc(GwDTO dto);
    int updateDoc(GwDTO dto);
    int deleteDoc(int docNo);
    int insertEst(GwDTO dto);
    int insertEstitems(GwDTO dto);
}
