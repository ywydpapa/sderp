package kr.swcore.sderp.notice.dao;

import java.util.List;

import kr.swcore.sderp.notice.dto.NoticeDTO;

public interface NoticeDAO {
	public List<NoticeDTO> listNotice();
	List<NoticeDTO> listNotice(NoticeDTO dto);
	int listNoticeCnt(NoticeDTO dto);
	int insertNotice(NoticeDTO dto);
	NoticeDTO detailNotice(int notiNo);
	int updateNotice(NoticeDTO dto);
	int deleteNotice(int notiNo);
}
