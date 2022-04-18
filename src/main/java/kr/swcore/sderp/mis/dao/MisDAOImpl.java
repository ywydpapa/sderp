package kr.swcore.sderp.mis.dao;

import kr.swcore.sderp.mis.dto.MisDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class MisDAOImpl implements MisDAO {

    @Inject
    SqlSession sqlSession;

    @Override
    public List<MisDTO> listHRduty(MisDTO dto) {
        return sqlSession.selectList("mis.hrdutylist",dto);
    }

    @Override
    public List<MisDTO> listHRcost(MisDTO dto) {
        return sqlSession.selectList("mis.hrcostlist",dto);
    }

    @Override
    public List<MisDTO> listSopp(MisDTO dto) {
        return sqlSession.selectList("mis.soppList", dto);
    }

    @Override
    public List<MisDTO> listSoppcost(MisDTO dto) {
        return sqlSession.selectList("mis.soppCost", dto);
    }

    @Override
    public List<MisDTO> listSoppmargin(MisDTO dto) {
        return sqlSession.selectList("mis.soppMargin", dto);
    }

    @Override
    public List<MisDTO> listBacinout(MisDTO dto) {
        return sqlSession.selectList("mis.bacinout" ,dto);
    }

    @Override
    public List<MisDTO> listBacstatus(MisDTO dto) {
        return sqlSession.selectList("mis.bacstatus",dto);
    }
}
