package kr.swcore.sderp.salesTarget.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.swcore.sderp.sales.dto.SalesDTO;
import kr.swcore.sderp.salesTarget.dto.SalesTargetDTO;
import kr.swcore.sderp.user.dto.UserDTO;

@Repository
public class SalesTargetDAOImpl implements SalesTargetDAO{
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<SalesTargetDTO> listSalesTarget() {
		return null;
	}

	@Override
	public List<SalesTargetDTO> listSalesTarget(int compNo, String targetYear, String targetType, List<UserDTO> userDtoList) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("compNo", compNo);
		map.put("targetYear", targetYear);
		map.put("targetType", targetType);
		map.put("userDtoList", userDtoList);
		return sqlSession.selectList("salesTarget.listSalesTarget", map);
	}

	@Override
	public SalesDTO detailSalesTarget(SalesTargetDTO salesTargetDTO) {
		return sqlSession.selectOne("salesTarget.detailSalesTarget", salesTargetDTO);
	}

	@Override
	public int updateSalesTarget(SalesTargetDTO salesTargetDTO) {
		return sqlSession.update("salesTarget.updateSalesTarget", salesTargetDTO);
	}

	@Override
	public int deleteSalesTarget(SalesTargetDTO salesTargetDTO) {
		return sqlSession.delete("salesTarget.deleteSalesTarget", salesTargetDTO);
	}

	@Override
	public int insertSalesTarget(SalesTargetDTO salesTargetDTO) {
		return sqlSession.insert("salesTarget.insertSalesTarget", salesTargetDTO);
	}
	
}
