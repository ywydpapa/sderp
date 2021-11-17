package kr.swcore.sderp.notice.service;


import java.util.List;

import javax.servlet.http.HttpSession;

import kr.swcore.sderp.common.dto.PageDTO;
import kr.swcore.sderp.notice.dto.NoticeDTO;

public interface NoticeService {
	List<NoticeDTO> listNotice();
	List<NoticeDTO> listNotice(HttpSession session, PageDTO pageDTO);
}
