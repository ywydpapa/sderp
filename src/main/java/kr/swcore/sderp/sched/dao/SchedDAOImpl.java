package kr.swcore.sderp.sched.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.swcore.sderp.sched.dto.SchedDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;

@Repository
public class SchedDAOImpl implements SchedDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<SchedDTO> listSched() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sched.listSched");
	}
	
	@Override
	public List<SchedDTO> listSched(SoppDTO soppdto) {
		return sqlSession.selectList("sched.listSched", soppdto);
	}
	
	@Override
	public List<SchedDTO> listconSched(SchedDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sched.listconSched", dto);
	}

	@Override
	public SchedDTO detailSched(int schedNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sched.detailSched", schedNo);
	}

	@Override
	public int insertSched(SchedDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("sched.insertSched", dto);
	}

	@Override
	public int deleteSched(int schedNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("sched.deleteSched", schedNo);
	}

	@Override
	public int updateSched(SchedDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("sched.updateSched", dto);
	}

	

}
