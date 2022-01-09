package kr.swcore.sderp.gw.dao;

import kr.swcore.sderp.cont.dto.ContFileDataDTO;
import kr.swcore.sderp.gw.dto.GwDTO;
import kr.swcore.sderp.gw.dto.GwFileDataDTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.List;

@Repository
public class GwDAOImpl implements GwDAO{

    @Inject
    SqlSession sqlSession;

    @Override
    public List<GwDTO> listDoc(int compNo) {
        return sqlSession.selectList("gw.listDoc", compNo);
    }

    @Override
    public List<GwDTO> listUserAtt(int compNo) {
        return sqlSession.selectList("gw.listUserAtt", compNo);
    }

    @Override
    public List<GwDTO> listUserAttbyuser(int userNo) {
        return sqlSession.selectList("gw.listUserAttbyuser", userNo);
    }

    @Override
    public List<GwDTO> myList(int docCrUserNo) {
        return sqlSession.selectList("gw.myList", docCrUserNo);
    }
    
    @Override
    public List<GwDTO> myDocList(int docCrUserNo) {
        return sqlSession.selectList("gw.myDocList", docCrUserNo);
    }

    @Override
    public List<GwDTO> listEst(Integer compNo) {
        return sqlSession.selectList("gw.listest", compNo);
    }

    @Override
    public List<GwDTO> listEstitems(GwDTO dto) {
        return sqlSession.selectList("gw.listestitems", dto);
    }

    @Override
    public GwDTO detailEst(String estId) {
        return sqlSession.selectOne("gw.detailest", estId);
    }

    @Override
    public GwDTO detailUserAtt(int attendId) {
        return sqlSession.selectOne("gw.detailUserAtt", attendId);
    }

    @Override
    public GwDTO detailDoc(int docNo) {
        return sqlSession.selectOne("gw.detailDoc", docNo);
    }
    
    @Override
    public GwDTO detailDocApp(int docNo) {
        return sqlSession.selectOne("gw.detailDocApp", docNo);
    }
    
    @Override
    public List<GwDTO> detailDocData(int docNo) {
        return sqlSession.selectList("gw.detailDocData", docNo);
    }

    @Override
    public int insertDoc(GwDTO dto) {
        return sqlSession.insert("gw.insertDoc",dto);
    }
    
    @Override
    public int insertDocApp(GwDTO dto) {
        return sqlSession.insert("gw.insertDocApp",dto);
    }
    
    @Override
    public int insertDocData(GwDTO dto) {
        return sqlSession.insert("gw.insertDocData",dto);
    }

    @Override
    public int insertUserAtt(GwDTO dto) {
        return sqlSession.insert("gw.insertUserAtt",dto);
    }

    @Override
    public int updateDoc(GwDTO dto) {
        return sqlSession.update("gw.updateDoc",dto);
    }

    @Override
    public int updateDocApp(GwDTO dto) {
        return sqlSession.update("gw.updateDocApp",dto);
    }
    
    @Override
    public int updateDocData(GwDTO dto) {
        return sqlSession.update("gw.updateDocData",dto);
    }
    
    @Override
    public int updateUserAtt(GwDTO dto) {
        return sqlSession.update("gw.updateUserAtt", dto);
    }

    @Override
    public int updateDocAppLvl(GwDTO dto) {
        return sqlSession.update("gw.updateDocAppLvl", dto);
    }

    @Override
    public int Attallow(GwDTO dto) {
        return sqlSession.update("gw.Attallow", dto);
    }

    @Override
    public int Attreject(GwDTO dto) {
        return  sqlSession.update("gw.Attreject", dto);
    }

    @Override
    public int deleteDoc(int docNo) {
        return sqlSession.update("gw.deleteDoc",docNo);
    }

    @Override
    public int deleteUserAtt(int attendId) {
        return sqlSession.update("gw.deleteUserAtt", attendId);
    }

    @Override
    public int insertEst(GwDTO dto) {
        return sqlSession.insert("gw.insertest",dto);
    }

    @Override
    public int insertEstitems(GwDTO dto) {
        return sqlSession.insert("gw.insertestitems",dto);
    }
    
    @Override
	public int uploadFile(GwFileDataDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("gw.uploadFile", dto);
	}

    @Override
	public GwFileDataDTO listFile(int docNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("gw.listFile", docNo);
	}
    
    @Override
	public GwFileDataDTO downloadFile(GwFileDataDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("gw.downloadFile", dto);
	}
}
