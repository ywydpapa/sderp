package kr.swcore.sderp.notice.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import kr.swcore.sderp.common.dto.PageDTO;
import kr.swcore.sderp.notice.dto.NoticeDTO;

@Repository
public class NoticeServiceImpl implements NoticeService{

	@Override
	public List<NoticeDTO> listNotice() {
		return null;
	}

	@Override
	public List<NoticeDTO> listNotice(HttpSession session, PageDTO pageDTO) {
		return null;
	}

}
