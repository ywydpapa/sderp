package kr.swcore.sderp.pps.dao;

import kr.swcore.sderp.pps.dto.PpsDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class PpsDAOImpl implements PpsDAO{

    @Inject
    SqlSession sqlSession;

    @Override
    public List<PpsDTO> listPps(int compNo) {
        return sqlSession.selectList("pps.ppsList", compNo);
    }

    @Override
    public PpsDTO detailPps(int ppsId) {
        return sqlSession.selectOne("pps.ppsDetail", ppsId);
    }

    @Override
    public int insertPps(PpsDTO dto) {
        return sqlSession.insert("pps.ppsInsert", dto);
    }

    @Override
    public int updatePps(PpsDTO dto) {
        return 0;
    }
}