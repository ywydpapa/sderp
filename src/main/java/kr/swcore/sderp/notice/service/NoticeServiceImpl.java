package kr.swcore.sderp.notice.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import kr.swcore.sderp.common.dto.PageDTO;
import kr.swcore.sderp.common.dto.WrapperDTO;
import kr.swcore.sderp.notice.dao.NoticeDAO;
import kr.swcore.sderp.notice.dto.NoticeDTO;

@Repository
public class NoticeServiceImpl implements NoticeService{
	@Inject
	NoticeDAO noticeDao;
	
	@Override
	public List<NoticeDTO> listNotice() {
		return null;
	}

	@Override
	public List<NoticeDTO> listNotice(HttpSession session, PageDTO pageDTO) {
		NoticeDTO dto = new NoticeDTO();

		if(pageDTO != null) {
			Integer limit = pageDTO.getLimit();
			dto.setLimit(limit);
			Integer offset = pageDTO.getOffset();
			dto.setOffset(offset);
		}

		dto.setOrderColumn("regDatetime");
		dto.setOrderOption("desc");

		return noticeDao.listNotice(dto);
	}

	@Override
	public Object listNotice(HttpSession session, String param, HttpServletRequest request,
			HttpServletResponse response) {
		NoticeDTO dto = new NoticeDTO();
		String userNostr = request.getParameter("userNo");
		Integer userNo = userNostr.equals("") == true ? 0 : Integer.valueOf(userNostr);	// 담당사원
		String notiTitle = request.getParameter("notiTitle") != null ? (String) request.getParameter("notiTitle") : "";
		String notiContents = request.getParameter("notiContents") != null ? (String) request.getParameter("notiContents") : "";
		String regSDate = request.getParameter("regSDate") != null ? (String) request.getParameter("regSDate") : "";					// 등록 시작일
		String regEDate = request.getParameter("regEDate") != null ? (String) request.getParameter("regEDate") : "";					// 등록 마감일
		
		dto.setUserNo(userNo);
		dto.setNotiTitle(notiTitle);
		dto.setNotiContents(notiContents);
		dto.setRegSDate(regSDate);
		dto.setRegEDate(regEDate);
		
		String limitstr = request.getParameter("iDisplayLength");
		Integer limit = limitstr != null ? Integer.valueOf(limitstr) : 20;	// 기본값 20 세팅
		String offsetstr = request.getParameter("iDisplayStart");
		Integer offset = offsetstr != null ? Integer.valueOf(offsetstr) : 0;
		String sSearch = (String) request.getParameter("sSearch");

		String orderColumn = request.getParameter("iSortCol_0");
		String orderOption = request.getParameter("sSortDir_0");

		String column = "";
		switch (orderColumn){
			case "0" : column = "notiNo"; break;		
			case "1" : column = "notiTitle"; break;		
			case "2" : column = "userName"; break;	
			case "3" : column = "regDatetime"; break;	
		}

		String option = "";
		switch (orderOption){
			case "desc" : option = "desc"; break;
			case "asc" : option = "asc"; break;
			default : option = "desc"; break;
		}

		dto.setLimit(limit);
		dto.setOffset(offset);
		dto.setSSearch(sSearch);

		dto.setOrderColumn(column);
		dto.setOrderOption(option);

		WrapperDTO wrapperDTO = new WrapperDTO();
		wrapperDTO.setAaData(noticeDao.listNotice(dto));

		Integer cnt = noticeDao.listNoticeCnt(dto);
		wrapperDTO.setITotalRecords(cnt);
		wrapperDTO.setITotalDisplayRecords(cnt);

		return wrapperDTO;
	}

	@Override
	public int insertNotice(HttpSession session, NoticeDTO dto) {
		int schedInsert = 0;
		schedInsert = noticeDao.insertNotice(dto);
		
		if (schedInsert > 0) schedInsert = 10001;
		else schedInsert = 20001; 
		
		return schedInsert;
	}

	@Override
	public NoticeDTO detailNotice(int notiNo) {
		return noticeDao.detailNotice(notiNo);
	}

	@Override
	public int updateNotice(NoticeDTO dto) {
		return noticeDao.updateNotice(dto);
	}

	@Override
	public int deleteNotice(int notiNo) {
		return noticeDao.deleteNotice(notiNo);
	}

}
