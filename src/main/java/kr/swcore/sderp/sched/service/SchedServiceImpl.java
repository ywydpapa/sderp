package kr.swcore.sderp.sched.service;

import java.sql.Wrapper;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.swcore.sderp.common.dto.WrapperDTO;
import org.springframework.stereotype.Service;

import kr.swcore.sderp.code.dao.CodeDAO;
import kr.swcore.sderp.code.dto.CodeDTO;
import kr.swcore.sderp.sched.dao.SchedDAO;
import kr.swcore.sderp.sched.dto.SchedDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.util.SessionInfoGet;
@Service
public class SchedServiceImpl implements SchedService {
	
	@Inject
	SchedDAO schedDao;
	
	@Inject
	CodeDAO codeDao;

	@Override
	public List<SchedDTO> listSched() {
		// TODO Auto-generated method stub
		return schedDao.listSched();
	}
	
	@Override
	public Object listSched(HttpSession session, String param, HttpServletRequest request, HttpServletResponse response) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);

		SchedDTO dto = new SchedDTO();
		Integer compNo = SessionInfoGet.getCompNo(session);						// 로그인 회사 구분 코드
		Integer userNo = request.getAttribute("userNo") != null ? (Integer) request.getAttribute("userNo") : 0;			// 담당사원
		Integer soppNo = request.getAttribute("soppNo") != null ? (Integer) request.getAttribute("soppNo") : 0;			// 영업기회
		Integer contNo = request.getAttribute("contNo") != null ? (Integer) request.getAttribute("contNo") : 0;			// 계약
		Integer custNo = request.getAttribute("custNo") != null ? (Integer) request.getAttribute("custNo") : 0;			// 거래처
		Integer endCustNo = request.getAttribute("endCustNo") != null ? (Integer) request.getAttribute("endCustNo") : 0;// 엔드유저
		String schedCat = request.getAttribute("schedCat") != null ? (String) request.getAttribute("schedCat") : "";	// 활동형태
		String schedFrom = request.getAttribute("schedFrom") != null ? (String) request.getAttribute("schedFrom") : "";	// 시작일
		String schedTo = request.getAttribute("schedTo") != null ? (String) request.getAttribute("schedTo") : "";		// 마감일

		dto.setCompNo(compNo);
		dto.setUserNo(userNo);
		dto.setSoppNo(soppNo);
		dto.setContNo(contNo);
		dto.setCustNo(custNo);
		dto.setEndCustNo(endCustNo);
		dto.setSchedCat(schedCat);
		dto.setSchedFrom(schedFrom);
		dto.setSchedTo(schedTo);

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
			case "0" : column = "schedTypeN"; break;
			case "1" : column = "schedTitle"; break;
			case "2" : column = "schedFrom"; break;
			case "3" : column = "custName"; break;
			case "4" : column = "userName"; break;
			case "5" : column = "schedPlace"; break;
			case "6" : column = "schedCatN"; break;
			case "7" : column = "schedDesc"; break;
			default : column = "schedFrom"; break;
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
		wrapperDTO.setAaData(schedDao.listSched(dto));



		Integer cnt = schedDao.listSchedCnt(dto);
		wrapperDTO.setITotalRecords(cnt);
		wrapperDTO.setITotalDisplayRecords(cnt);
		wrapperDTO.setSEcho(sSearch);

		return wrapperDTO;
	}
	
	@Override
	public List<SchedDTO> listconSched(HttpSession session, SchedDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		dto.setCompNo(compNo);
		return schedDao.listconSched(dto);
	}

	@Override
	public SchedDTO detailSched(int schedNo) {
		// TODO Auto-generated method stub
		return schedDao.detailSched(schedNo);
	}

	@Override
	public int insertSched(SchedDTO dto) {
		// TODO Auto-generated method stub
		return schedDao.insertSched(dto);
	}
	
	@Override
	public int insertSched(HttpSession session, SchedDTO dto) {
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		String userId = (String) session.getAttribute("userId");
		dto.setCompNo(compNo);
		dto.setUserId(userId);
		
		SoppDTO soppdto = new SoppDTO();
		soppdto.setCompNo(compNo);
		List<CodeDTO> codeDto = codeDao.listSchedtype(soppdto);
		
		for(int i = 0; i < codeDto.size(); i++) {
			CodeDTO item = codeDto.get(i);
			if(item.getCode03().equals("SCHED004")) {
				dto.setSchedType(String.valueOf(item.getCodeNo()));
			}
		}
		
		int schedInsert = 0;
		schedInsert = schedDao.insertSched(dto);
		
		if (schedInsert > 0) schedInsert = 10001;
		else schedInsert = 20001; 
		
		return schedInsert;
	}

	@Override
	public int deleteSched(int schedNo) {
		// TODO Auto-generated method stub
		return schedDao.deleteSched(schedNo);
	}

	@Override
	public int updateSched(SchedDTO dto) {
		// TODO Auto-generated method stub
		return schedDao.updateSched(dto);
	}

	

	

}
