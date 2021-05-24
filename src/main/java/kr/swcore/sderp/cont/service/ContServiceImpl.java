package kr.swcore.sderp.cont.service;

import java.util.*;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.swcore.sderp.code.dao.CodeDAO;
import kr.swcore.sderp.code.dto.CodeDTO;
import kr.swcore.sderp.common.dto.PageDTO;
import kr.swcore.sderp.common.dto.WrapperDTO;
import kr.swcore.sderp.salesTarget.dto.SalesTargetDTO;
import kr.swcore.sderp.techd.dto.TechdDTO;
import org.springframework.stereotype.Service;

import kr.swcore.sderp.cont.dao.ContDAO;
import kr.swcore.sderp.cont.dto.ContDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.util.SessionInfoGet;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

@Service
public class ContServiceImpl implements ContService {

	@Inject
	ContDAO contDao;

	@Inject
	CodeDAO codeDAO;

	@Override
	public List<ContDTO> listCont(HttpSession session, PageDTO pageDTO) {
		Integer compNo = SessionInfoGet.getCompNo(session);
		ContDTO dto = new ContDTO();
		dto.setCompNo(compNo);

		if(pageDTO != null) {
			Integer limit = pageDTO.getLimit();
			dto.setLimit(limit);
			Integer offset = pageDTO.getOffset();
			dto.setOffset(offset);
		}

		dto.setOrderColumn("regDatetime");
		dto.setOrderOption("desc");

		return contDao.listCont(dto);
	}

	@Override
	public Object listCont(HttpSession session, String param, HttpServletRequest request, HttpServletResponse response) {
		ContDTO dto = new ContDTO();
		Integer compNo = SessionInfoGet.getCompNo(session);						// 로그인 회사 구분 코드
		String userNostr = request.getParameter("userNo");
		Integer userNo = userNostr.equals("") == true ? null : Integer.valueOf(userNostr);					// 담당사원

		String contNostr =  request.getParameter("contNo");
		Integer contNo = contNostr.equals("") == true ? null : Integer.valueOf(contNostr);					// 계약

		String custNostr =  request.getParameter("custNo");
		Integer custNo = custNostr.equals("") == true ? null : Integer.valueOf(custNostr);					// 매출처

		String custMemberNostr = request.getParameter("custMemberNo");
		Integer custMemberNo = custMemberNostr.equals("") == true ? null : Integer.valueOf(custMemberNostr);// 매출처 담당자
		
		String buyrNostr = request.getParameter("buyrNo");
		Integer buyrNo = buyrNostr.equals("") == true ? null : Integer.valueOf(buyrNostr);					// 엔드유저

		String buyrMemberNostr = request.getParameter("buyrMemberNo");
		Integer buyrMemberNo = buyrMemberNostr.equals("") == true ? null : Integer.valueOf(buyrMemberNostr);// 엔드유저 담당자

		String contTitle = request.getParameter("contTitle");

		String contTypestr = request.getParameter("contType");
		Integer contType = contTypestr.equals("") == true ? null : Integer.valueOf(contTypestr);			// 	판매방식

		String cntrctMthstr = request.getParameter("cntrctMth");
		Integer cntrctMth = cntrctMthstr.equals("") == true ? null : Integer.valueOf(cntrctMthstr);			// 등록구분

		String targetDatefrom = request.getParameter("targetDatefrom") != null ? (String) request.getParameter("targetDatefrom") : "";	// 판매일자 시작일
		String targetDateto = request.getParameter("targetDateto") != null ? (String) request.getParameter("targetDateto") : "";		// 판매일자 마감일
		String freemaintSdate = request.getParameter("freemaintSdate") != null ? (String) request.getParameter("freemaintSdate") : "";	// 유지보수 시작일
		String freemaintEdate = request.getParameter("freemaintEdate") != null ? (String) request.getParameter("freemaintEdate") : "";	// 유지보수 마감일
		String regSDate = request.getParameter("regSDate") != null ? (String) request.getParameter("regSDate") : "";					// 등록 시작일
		String regEDate = request.getParameter("regEDate") != null ? (String) request.getParameter("regEDate") : "";					// 등록 마감일

		String maintIncludeCheckstr = request.getParameter("maintIncludeCheck");
		Boolean maintIncludeCheck =  Boolean.valueOf(maintIncludeCheckstr);

		dto.setCompNo(compNo);
		dto.setUserNo(userNo);
		dto.setCustNo(custNo);
		dto.setContNo(contNo);
		dto.setCustMemberNo(custMemberNo);
		dto.setContTitle(contTitle);
		dto.setContType(contTypestr);	// TODO : String to Integer 필요함
		dto.setCntrctMth(cntrctMthstr); // TODO : String to Integer 필요함
		dto.setTargetDatefrom(targetDatefrom);
		dto.setTargetDateto(targetDateto);
		dto.setFreemaintSdate(freemaintSdate);
		dto.setFreemaintEdate(freemaintEdate);
		dto.setPaymaintSdate(freemaintSdate);
		dto.setPaymaintEdate(freemaintEdate);
		dto.setRegSDate(regSDate);
		dto.setRegEDate(regEDate);
		dto.setMaintIncludeCheck(maintIncludeCheck);

		String sEcho = request.getParameter("sEcho");
		String limitstr = request.getParameter("iDisplayLength");
		Integer limit = limitstr != null ? Integer.valueOf(limitstr) : 20;	// 기본값 20 세팅
		String offsetstr = request.getParameter("iDisplayStart");
		Integer offset = offsetstr != null ? Integer.valueOf(offsetstr) : 0;
		String sSearch = (String) request.getParameter("sSearch");

		String orderColumn = request.getParameter("iSortCol_0");
		String orderOption = request.getParameter("sSortDir_0");

		String column = "";
		switch (orderColumn){
			case "0" : column = "regDatetime"; break;	// 등록일
			case "1" : column = "contTypeN"; break;		// 판매방식
			case "2" : column = "cntrctMthN"; break;	// 계약방식
			case "3" : column = "contTitle"; break;		// 계약명
			case "4" : column = "custName"; break;		// 매출처
			case "5" : column = "contAmt"; break;		// 계약금액
			case "6" : column = "net_profit"; break;	// 매출이익
			case "7" : column = "userName"; break;		// 담당사원
			case "8" : column = "techdFrom"; break;		// 기술지원(시작)
			case "9" : column = "techdTo"; break;		// 기술지원(끝)
			case "10": column = "contOrddate"; break;	// 판매일자
			default : column = "regDatetime"; break;
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
		wrapperDTO.setAaData(contDao.listCont(dto));

		Integer cnt = contDao.listContCnt(dto);
		wrapperDTO.setITotalRecords(cnt);
		wrapperDTO.setITotalDisplayRecords(cnt);

		return wrapperDTO;
	}

	@Override
	public ContDTO detailCont(int contNo) {
		// TODO Auto-generated method stub
		return contDao.detailCont(contNo);
	}

	@Override
	public int updateCont(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.updateCont(dto);
		
	}

	@Override
	public int deleteCont(int contNo) {
		// TODO Auto-generated method stub
		return contDao.deleteCont(contNo);
	}

	@Override
	public int insertCont(ContDTO dto) {
		// TODO Auto-generated method stub
		return contDao.insertCont(dto);
	}

	@Override
	public int insertCont(HttpSession session, ContDTO dto) {
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		dto.setCompNo(compNo);
		
		int schedInsert = 0;
		schedInsert = contDao.insertCont(dto);
		
		if (schedInsert > 0) schedInsert = 10001;
		else schedInsert = 20001; 
		
		return schedInsert;
	}

	@Override
	public Map<String, Object> listSalesTargetMonthIndividual(HttpSession session, ContDTO contDTO) {
		Map<String, Object> returnMap = new HashMap<>();
		// CODE 테이블에서 code02 가 SALETYPE 인것만 가져온다.
		SoppDTO soppDTO = new SoppDTO();
		soppDTO.setCompNo(SessionInfoGet.getCompNo(session));
		List<CodeDTO> codeDAOList = codeDAO.listContType(soppDTO);

		if(contDTO == null) contDTO = new ContDTO();

		// 시간구하기
		Calendar cal = Calendar.getInstance();
		String targetYear = contDTO.getTargetYear();
		if(targetYear == null || targetYear.equals("")) {
			targetYear = String.valueOf(cal.get(Calendar.YEAR));
			contDTO.setTargetYear(targetYear);
		}

		String targetMonth = contDTO.getTargetMonth();
		Integer month = 0;
		if(targetMonth == null || targetMonth.equals("")) {
			month = cal.get(Calendar.MONTH)+1;
		} else {
			month = Integer.valueOf(targetMonth);
		}

		if(month < 10) {
			targetMonth = "0"+String.valueOf(month);
		} else {
			targetMonth = ""+String.valueOf(month);
		}
		contDTO.setTargetMonth(targetMonth);

		if(codeDAOList.size() <= 0){
			// CODE 테이블에 SALETYPE 지정되어있지 않다.
			returnMap.put("code", 20001);
			returnMap.put("data", null);
			return returnMap;
		}

		returnMap.put("targetYear", targetYear);
		returnMap.put("targetMonth", targetMonth);

		// 회사구분값 셋팅
		contDTO.setCompNo(SessionInfoGet.getCompNo(session));
		// 유저 셋팅
		contDTO.setUserNo(SessionInfoGet.getUserNo(session));
		List<ContDTO> contDTOList = new ArrayList<>();
		try {
			for(int i=0; i<codeDAOList.size(); i++){
				// 반환시 필요한 코드명 셋팅
				ContDTO insertDto = (ContDTO) contDTO.clone();
				insertDto.setContTypeN(codeDAOList.get(i).getDesc03());
				System.out.println(codeDAOList.get(i).getCodeNo() + "<-/->" + codeDAOList.get(i).getDesc03());
				// 검색할 코드값 셋팅
				insertDto.setContType(String.valueOf( codeDAOList.get(i).getCodeNo() ));
				// 쿼리 조건 : 회사구분코드, contType int 값, 날짜 ex) 2021-04
				ContDTO temp = contDao.listSalesTargetMonthIndividual(insertDto);
				insertDto.setContTypeCount(temp.getContTypeCount());

				contDTOList.add(insertDto);
			}
		} catch (Exception e){
			e.printStackTrace();
			returnMap.put("code", 20001);
			returnMap.put("data", null);
		}

		for(ContDTO t : contDTOList){
			System.out.println(t.getContTypeN() + " / " + t.getContTypeCount());
		}

		returnMap.put("code", 10001);
		returnMap.put("data", contDTOList);

		return returnMap;
	}
}
