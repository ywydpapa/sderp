package kr.swcore.sderp.gw.dao;

import kr.swcore.sderp.gw.dto.GwDTO;
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
    public List<GwDTO> listDoc2(HttpSession compNo) {
        return sqlSession.selectList("gw.listdoc", compNo);
    }

    @Override
    public GwDTO detailDoc(int docNo) {

        return sqlSession.selectOne("gw.detaildoc", docNo);
    }

    @Override
    public int insertDoc(GwDTO dto) {

        return sqlSession.insert("gw.insertdoc",dto);
    }

    @Override
    public int updateDoc(GwDTO dto) {

        return sqlSession.update("gw.updatedoc",dto);
    }

    @Override
    public int deleteDoc(int docNo) {

        return sqlSession.update("gw.deletedoc",docNo);
    }
}
