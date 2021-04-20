package kr.swcore.sderp.techd.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.swcore.sderp.common.dto.PageDTO;
import kr.swcore.sderp.common.dto.WrapperDTO;
import kr.swcore.sderp.sched.dto.SchedDTO;
import org.springframework.stereotype.Service;

import kr.swcore.sderp.code.dao.CodeDAO;
import kr.swcore.sderp.code.dto.CodeDTO;
import kr.swcore.sderp.sales.dto.SalesDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.techd.dao.TechdDAO;
import kr.swcore.sderp.techd.dto.TechdDTO;
import kr.swcore.sderp.util.SessionInfoGet;

@Service
public class TechdServiceImpl implements TechdService {

	@Inject
	TechdDAO techdDao;
	
	@Inject
	CodeDAO codeDao;
	
	@Override
	public List<TechdDTO> listTechd() {
		// TODO Auto-generated method stub
		return techdDao.listTechd();
	}
	
	@Override
	public List<TechdDTO> listTechd(HttpSession session, PageDTO pageDTO) {
		Integer compNo = SessionInfoGet.getCompNo(session);
		TechdDTO dto = new TechdDTO();
		dto.setCompNo(compNo);

		if(pageDTO != null) {
			Integer limit = pageDTO.getLimit();
			dto.setLimit(limit);
			Integer offset = pageDTO.getOffset();
			dto.setOffset(offset);
		}

		dto.setOrderColumn("techdFrom");
		dto.setOrderOption("desc");

		return techdDao.listTechd(dto);
	}

	@Override
	public Object listTechd(HttpSession session, String param, HttpServletRequest request, HttpServletResponse response) {
		TechdDTO dto = new TechdDTO();
		Integer compNo = SessionInfoGet.getCompNo(session);						// 로그인 회사 구분 코드
		Integer userNo = request.getAttribute("userNo") != null ? (Integer) request.getAttribute("userNo") : 0;						// 담당사원
		Integer custNo = request.getAttribute("custNo") != null ? (Integer) request.getAttribute("custNo") : 0;						// 엔드유저
		Integer custmemberNo = request.getAttribute("custmemberNo") != null ? (Integer) request.getAttribute("custmemberNo") : 0;	// 엔드유저 담당자
		String techdSteps = request.getAttribute("TechdSteps") != null ? (String) request.getAttribute("TechdSteps") : "";			// 활동형태
		String schedFrom = request.getAttribute("schedFrom") != null ? (String) request.getAttribute("schedFrom") : "";				// 시작일
		String schedTo = request.getAttribute("schedTo") != null ? (String) request.getAttribute("schedTo") : "";					// 마감일
		String techdDesc = request.getAttribute("techdDesc") != null ? (String) request.getAttribute("techdDesc") : "";				// 설명

		dto.setCompNo(compNo);
		dto.setUserNo(userNo);
		dto.setCustNo(custNo);
		dto.setCustmemberNo(custmemberNo);
		dto.setTechdSteps(techdSteps);
		dto.setTechdFrom(schedFrom);
		dto.setTechdTo(schedTo);
		dto.setTechdDesc(techdDesc);

		String sEchostr = request.getParameter("sEcho");
		Integer sEcho = sEchostr != null ? Integer.valueOf(sEchostr) : 1;
		String limitstr = request.getParameter("iDisplayLength");
		Integer limit = limitstr != null ? Integer.valueOf(limitstr) : 20;	// 기본값 20 세팅
		String offsetstr = request.getParameter("iDisplayStart");
		Integer offset = offsetstr != null ? Integer.valueOf(offsetstr) : 0;
		String sSearch = (String) request.getParameter("sSearch");

		String orderColumn = request.getParameter("iSortCol_0");
		String orderOption = request.getParameter("sSortDir_0");

		String column = "";
		switch (orderColumn){
			case "0" : column = "techdTypeN"; break;	// 등록구분
			case "1" : column = "techdTitle"; break;	// 요청명
			case "2" : column = "techdDesc"; break;		// 설명
			case "3" : column = "custName"; break;		// 거래처
			case "4" : column = "techdStepsN"; break;	// 접수단계
			case "5" : column = "userName"; break;		// 담당사원
			case "6" : column = "techdFrom"; break;		// 기술지원(시작)
			case "7" : column = "techdTo"; break;		// 기술지원(끝)
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
		wrapperDTO.setAaData(techdDao.listTechd(dto));

		Integer cnt = techdDao.listTechdCnt(dto);
		wrapperDTO.setITotalRecords(cnt);
		wrapperDTO.setITotalDisplayRecords(cnt);
		wrapperDTO.setSEcho(sSearch);

		return wrapperDTO;
	}

	@Override
	public List<TechdDTO> listconTechd(HttpSession session, TechdDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		dto.setCompNo(compNo);
		return techdDao.listconTechd(dto);
	}
	
	@Override
	public List<SalesDTO> listTechdinsopp(HttpSession session, int soppNo) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		soppdto.setSoppNo(soppNo);
		
		return techdDao.listTechdinsopp(soppdto);
	}

	@Override
	public TechdDTO detailTechd(int techdNo) {
		// TODO Auto-generated method stub
		return techdDao.detailTechd(techdNo);
	}

	@Override
	public int updateTechd(TechdDTO dto) {
		// TODO Auto-generated method stub
		return techdDao.updateTechd(dto);
	}

	@Override
	public int deleteTechd(int techdNo) {
		// TODO Auto-generated method stub
		return techdDao.deleteTechd(techdNo);
	}

	@Override
	public int insertTechd(TechdDTO dto) {
		
		return techdDao.insertTechd(dto);
	}

	@Override
	public int insertTechd(HttpSession session, TechdDTO dto) {
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		dto.setCompNo(compNo);
		
		SoppDTO soppdto = new SoppDTO();
		soppdto.setCompNo(compNo);
		List<CodeDTO> codeDto = codeDao.listSchedtype(soppdto);
		
		for(int i = 0; i < codeDto.size(); i++) {
			CodeDTO item = codeDto.get(i);
			if(item.getCode03().equals("SCHED003")) {
				dto.setSchedType(String.valueOf(item.getCodeNo()));
			}
		}
		
		int schedInsert = 0;
		schedInsert = techdDao.insertTechd(dto);
		
		if (schedInsert > 0) schedInsert = 10001;
		else schedInsert = 20001; 
		
		return schedInsert;
	}
}
