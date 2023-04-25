package kr.swcore.sderp.gw.dao;

import kr.swcore.sderp.gw.dto.GwDTO;

import kr.swcore.sderp.gw.dto.GwFileDataDTO;
import java.util.List;

public interface GwDAO {
    List<GwDTO> listDoc(int compNo);
    List<GwDTO> listUserAtt(int compNo);
    List<GwDTO> listUserAttbyuser(int userNo);
    List<GwDTO> myList(int docCrUserNo);
    List<GwDTO> myList(GwDTO dto);
    List<GwDTO> myDocList(int compNo);
    List<GwDTO> myDocList(GwDTO dto);
    List<GwDTO> listEst(Integer compNo);
    List<GwDTO> listEst(GwDTO dto);
    List<GwDTO> listEstitems(GwDTO dto);
    List<GwDTO> titleGroupBy(GwDTO dto);
    GwFileDataDTO listFile(int docNo);
    GwDTO detailEst(GwDTO dto);
    GwDTO infoGetItem(GwDTO dto);
    GwDTO detailUserAtt(int attendId);
    GwDTO detailDoc(int docNo);
    GwDTO detailDocApp(int docNo);
    List<GwDTO> detailDocData(int docNo);
    int insertDoc(GwDTO dto);
    int myDocCopyInsert(GwDTO dto); 
    int myDocCopyInsertApp(GwDTO dto); 
    int myDocCopyInsertData(GwDTO dto); 
    int insertDocApp(GwDTO dto);
    int insertDocData(GwDTO dto);
    int insertUserAtt(GwDTO dto);
    int updateDoc(GwDTO dto);
    int myDocListUpdate(GwDTO dto);
    int updateDocApp(GwDTO dto);
    int updateDocData(GwDTO dto);
    int updateUserAtt(GwDTO dto);
    int updateDocAppLvl(GwDTO dto);
    int Attallow(GwDTO dto);
    int Attreject(GwDTO dto);
    int deleteDoc(int docNo);
    int deleteUserAtt(int attendId);
    int insertEst(GwDTO dto);
    int estInfoInsert(GwDTO dto);
    int insertEstUpdate(GwDTO dto);
    int updateEst(GwDTO dto);
    int estInfoUpdate(GwDTO dto);
    int deleteEst(String estId);
    int insertEstitems(GwDTO dto);
    int uploadFile(GwFileDataDTO dto);
    int uploadFileUpdate(GwFileDataDTO dto);
    GwFileDataDTO downloadFile(GwFileDataDTO dto);
    List<GwDTO> getEstSopp(GwDTO dto);
    GwDTO selectVersion(GwDTO dto);
    GwDTO selectVersionEst(GwDTO dto);
    GwDTO comList(int compNo);
    List<GwDTO> allComList();
    GwDTO allComList(int comInfoNo);
    int updateFile(GwFileDataDTO dto);
	void deletefile(int docNo);
	void uploadFile2(GwFileDataDTO dto);
	int docDrawUpdate(GwDTO dto);
	int docDrawDelete(GwDTO dto);
	
	int hrListApp(GwDTO dto);
	int hrListCom(GwDTO dto);
	List<GwDTO> userEmail(GwDTO dto);
	void update_estitems_Data(GwDTO dto);
	void update_estitems_Data_x(GwDTO dto);
	void update_save_data(GwDTO dto);
	void update_amount(GwDTO dto);
	
	List<GwDTO> purList(int compNo);
    List<GwDTO> purList(GwDTO dto);
    int attDelete(GwDTO dto);
}
