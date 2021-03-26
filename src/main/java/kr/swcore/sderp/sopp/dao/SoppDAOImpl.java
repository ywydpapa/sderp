package kr.swcore.sderp.sopp.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.swcore.sderp.sopp.dto.SoppDTO;

@Repository
public class SoppDAOImpl implements SoppDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<SoppDTO> listSopp() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sopp.listSopp");
	}
	
	@Override
	public List<SoppDTO> listSopp(SoppDTO dto) {
		return sqlSession.selectList("sopp.listSopp", dto);
	}
	
	@Override
	public List<SoppDTO> listconSopp(SoppDTO dto) {
		return sqlSession.selectList("sopp.listconSopp", dto);
	}
	
	@Override
	public List<SoppDTO> listSopp2() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sopp.listSopp2");
	}
	
	@Override
	public List<SoppDTO> listSopp2(SoppDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sopp.listSopp2", dto);
	}
	
	@Override
	public List<SoppDTO> listconSopp2(SoppDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sopp.listconSopp2", dto);
	}
	
	@Override
	public SoppDTO detailSopp(int soppNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sopp.detailSopp", soppNo);
	}

	@Override
	public int updateSopp(SoppDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("sopp.updateSopp", dto);
	}

	@Override
	public int deleteSopp(int soppNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("sopp.deleteSopp", soppNo);
	}

	@Override
	public int insertSopp(SoppDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("sopp.insertSopp", dto);
	}

	@Override
	public int insert2Sopp(SoppDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("sopp.update2Sopp", dto);
	}
}
