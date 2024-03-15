package kr.swcore.sderp.util.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.swcore.sderp.util.dto.ImageDTO;

@Repository
public class ImageDAOImpl implements ImageDAO {

	@Inject
	SqlSession sqlSession;

	@Override
	public int insertImage(ImageDTO dto) {
		return sqlSession.insert("image.insertImage", dto);
	}

	@Override
	public String getBase64(String uuid) {
		return sqlSession.selectOne("image.base64", uuid);
	}

}
