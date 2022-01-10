package kr.swcore.sderp.gw.dao;

import kr.swcore.sderp.gw.dto.GwDTO;

import kr.swcore.sderp.gw.dto.GwFileDataDTO;
import java.util.List;

public interface GwDAO {
    List<GwDTO> listDoc(int compNo);
    List<GwDTO> listUserAtt(int compNo);
    List<GwDTO> listUserAttbyuser(int userNo);
    List<GwDTO> myList(int docCrUserNo);
    List<GwDTO> myDocList(int docCrUserNo);
    List<GwDTO> listEst(Integer compNo);
    List<GwDTO> listEstitems(GwDTO dto);
    GwFileDataDTO listFile(int docNo);
    GwDTO detailEst(String estId);
    GwDTO detailUserAtt(int attendId);
    GwDTO detailDoc(int docNo);
    GwDTO detailDocApp(int docNo);
    List<GwDTO> detailDocData(int docNo);
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
    int uploadFile(GwFileDataDTO dto);
    int uploadFileUpdate(GwFileDataDTO dto);
    GwFileDataDTO downloadFile(GwFileDataDTO dto);
}
