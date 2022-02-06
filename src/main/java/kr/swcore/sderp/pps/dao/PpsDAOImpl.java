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
        return sqlSession.selectList("pps.listPps", compNo);
    }
}
