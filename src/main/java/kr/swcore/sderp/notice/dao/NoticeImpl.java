package kr.swcore.sderp.notice.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.swcore.sderp.notice.dto.NoticeDTO;

@Repository
public class NoticeImpl implements NoticeDAO{
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<NoticeDTO> listNotice() {
		return sqlSession.selectList("notice.listNotice");
	}

}
