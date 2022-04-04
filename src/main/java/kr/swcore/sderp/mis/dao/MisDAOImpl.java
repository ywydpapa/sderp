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
    public List<MisDTO> listHRduty(int compNo) {
        return null;
    }
}
