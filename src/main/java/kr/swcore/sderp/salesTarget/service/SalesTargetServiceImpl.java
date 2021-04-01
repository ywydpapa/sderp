package kr.swcore.sderp.salesTarget.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.swcore.sderp.organiz.Service.OrganizService;
import kr.swcore.sderp.organiz.dto.OrganizDTO;
import kr.swcore.sderp.salesTarget.dao.SalesTargetDAO;
import kr.swcore.sderp.salesTarget.dto.SalesTargetDTO;
import kr.swcore.sderp.user.dto.UserDTO;
import kr.swcore.sderp.user.service.UserService;

@Service
public class SalesTargetServiceImpl implements SalesTargetService {
	
	@Inject
	SalesTargetDAO salesTargetDAO;
	
	@Inject
	OrganizService organizService;
	
	@Inject
	UserService userService;
	
	private static SalesTargetDTO defaultSetCompNoAnduserNo(HttpSession session, SalesTargetDTO salesTargetDTO) {
		if(salesTargetDTO == null) salesTargetDTO = new SalesTargetDTO();
		
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		salesTargetDTO.setCompNo(compNo);
		
		Integer userNo = Integer.valueOf((String) session.getAttribute("userNo"));
		salesTargetDTO.setUserNo(userNo);
		return salesTargetDTO;
	}
	
	private SalesTargetDTO defaultSetCalendarInfoYearAndMonth(SalesTargetDTO salesTargetDTO) {
		Calendar cal = Calendar.getInstance();
		String targetYear = salesTargetDTO.getTargetYear();
		if(targetYear == null || targetYear.equals("")) {
			targetYear = String.valueOf(cal.get(Calendar.YEAR));
			salesTargetDTO.setTargetYear(targetYear);
		}
		
		String targetMonth = salesTargetDTO.getTargetMonth();
		if(targetMonth == null || targetMonth.equals("")) {
			Integer month = cal.get(Calendar.MONTH)+1;
			if(month < 10) {
				targetMonth = "0"+String.valueOf(month);
			} else {
				targetMonth = ""+String.valueOf(month);
			}
			salesTargetDTO.setTargetMonth(targetMonth);
		}		
		return salesTargetDTO;
	}
	
	private Map<String, Object> searchingAfterDataReturnWithSalesTarget(Map<String, Object> map, String methodName, SalesTargetDTO salesTargetDTO){
		SalesTargetDTO returnDto = new SalesTargetDTO();
		try {
			switch (methodName) {
			case "listSalesTargetMonthIndividual":
				returnDto = salesTargetDAO.listSalesTargetMonthIndividual(salesTargetDTO);
				break;
			case "listSalesTargetYearIndividual":
				returnDto = salesTargetDAO.listSalesTargetYearIndividual(salesTargetDTO);
				break;			
			default:
				throw new Exception("SalesTargetDAO 메소드명 찾을수 없음");
			}			
		} catch (Exception e) {
			e.printStackTrace();
			map.put("code", 20001);
			map.put("data", null);
		}
		
		if (returnDto == null) {
			// 쿼리는 이상없지만 0/0 또는 0/1 또는 1/0 같은경우
			map.put("code", 20001);
			BigDecimal temp = new BigDecimal(0.0);
			returnDto = new SalesTargetDTO();
			returnDto.setPercent(temp);
			map.put("data", returnDto);
		} else {
			map.put("code", 10001);
			map.put("data", returnDto);
		}
		return map;
	}
	
	// salesDto, profitDto, overDto 순서로 입출력 구성할것.
	private List<SalesTargetDTO> overCurrencyCal(List<SalesTargetDTO> dtoList) {
		List<SalesTargetDTO> newDtoList = new ArrayList<SalesTargetDTO>();
		SalesTargetDTO salesDto = dtoList.get(0);
		SalesTargetDTO profitDto = dtoList.get(1);
		SalesTargetDTO overDto = dtoList.get(2);
		if(salesDto.getMm01() > profitDto.getMm01()) {
			overDto.setMm01(salesDto.getMm01()-profitDto.getMm01());
			salesDto.setMm01(profitDto.getMm01());
		}
		if(salesDto.getMm02() > profitDto.getMm02()) {
			overDto.setMm02(salesDto.getMm02()-profitDto.getMm02());
			salesDto.setMm02(profitDto.getMm02());
		}
		if(salesDto.getMm03() > profitDto.getMm03()) {
			overDto.setMm03(salesDto.getMm03()-profitDto.getMm03());
			salesDto.setMm03(profitDto.getMm03());
		}
		if(salesDto.getMm04() > profitDto.getMm04()) {
			overDto.setMm04(salesDto.getMm04()-profitDto.getMm04());
			salesDto.setMm04(profitDto.getMm04());
		}
		if(salesDto.getMm05() > profitDto.getMm05()) {
			overDto.setMm05(salesDto.getMm05()-profitDto.getMm05());
			salesDto.setMm05(profitDto.getMm05());
		}
		if(salesDto.getMm06() > profitDto.getMm06()) {
			overDto.setMm06(salesDto.getMm06()-profitDto.getMm06());
			salesDto.setMm06(profitDto.getMm06());
		}
		if(salesDto.getMm07() > profitDto.getMm07()) {
			overDto.setMm07(salesDto.getMm07()-profitDto.getMm07());
			salesDto.setMm07(profitDto.getMm07());
		}
		if(salesDto.getMm08() > profitDto.getMm08()) {
			overDto.setMm08(salesDto.getMm08()-profitDto.getMm08());
			salesDto.setMm08(profitDto.getMm08());
		}
		if(salesDto.getMm09() > profitDto.getMm09()) {
			overDto.setMm09(salesDto.getMm09()-profitDto.getMm09());
			salesDto.setMm09(profitDto.getMm09());
		}
		if(salesDto.getMm10() > profitDto.getMm10()) {
			overDto.setMm10(salesDto.getMm10()-profitDto.getMm10());
			salesDto.setMm10(profitDto.getMm10());
		}
		if(salesDto.getMm11() > profitDto.getMm11()) {
			overDto.setMm11(salesDto.getMm11()-profitDto.getMm11());
			salesDto.setMm11(profitDto.getMm11());
		}
		if(salesDto.getMm12() > profitDto.getMm12()) {
			overDto.setMm12(salesDto.getMm12()-profitDto.getMm12());
			salesDto.setMm12(profitDto.getMm12());
		}
		
		newDtoList.add(salesDto);
		newDtoList.add(profitDto);
		newDtoList.add(overDto);
		return newDtoList;
	}
	
	private SalesTargetDTO currencyAppreciation(SalesTargetDTO salesTargetDTO) {
		Integer n1 = 10000000;	// 천만원
		salesTargetDTO.setMm01(salesTargetDTO.getMm01()/n1);
		salesTargetDTO.setMm02(salesTargetDTO.getMm02()/n1);
		salesTargetDTO.setMm03(salesTargetDTO.getMm03()/n1);
		salesTargetDTO.setMm04(salesTargetDTO.getMm04()/n1);
		salesTargetDTO.setMm05(salesTargetDTO.getMm05()/n1);
		salesTargetDTO.setMm06(salesTargetDTO.getMm06()/n1);
		salesTargetDTO.setMm07(salesTargetDTO.getMm07()/n1);
		salesTargetDTO.setMm08(salesTargetDTO.getMm08()/n1);
		salesTargetDTO.setMm09(salesTargetDTO.getMm09()/n1);
		salesTargetDTO.setMm10(salesTargetDTO.getMm10()/n1);
		salesTargetDTO.setMm11(salesTargetDTO.getMm11()/n1);
		salesTargetDTO.setMm12(salesTargetDTO.getMm12()/n1);
		return salesTargetDTO;
	}

	@Override
	public List<SalesTargetDTO> listSalesTarget() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object> listSalesTarget(HttpSession session, OrganizDTO organizDto, SalesTargetDTO salesTargetDTO) {
		if(salesTargetDTO == null) salesTargetDTO = new SalesTargetDTO();
		
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		String targetYear = salesTargetDTO.getTargetYear();
		String targetType = salesTargetDTO.getTargetType();
		
		if(targetYear == null || targetYear.equals("")) {
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			targetYear = String.valueOf(year);
		}
		
		if(targetType == null || targetType.equals("")) {
			targetType = "PROFIT";
		} else {
			targetType = targetType.toUpperCase();
		}
		
		// 세션을 통해 부서 리스트 검색
		List<OrganizDTO> deptList = null;
		Integer orgId = null;
		if(salesTargetDTO.getOrgId() == 0) {
			// 부서선택을 전부 선택한경우
			deptList = organizService.listDeptChainExtend(session, null);
		} else {
			organizDto.setOrg_id(salesTargetDTO.getOrgId());
			orgId = salesTargetDTO.getOrgId();
			deptList = organizService.listDeptChainExtend(session, organizDto);
		}
		
		List<Object> returnData = new ArrayList<Object>();
		HashMap<String, Object> selectedData = new HashMap<>();
		selectedData.put("targetYear", targetYear);
		selectedData.put("targetType", targetType);
		selectedData.put("orgId", orgId);
		returnData.add(selectedData);
		
		HashMap<String, Object> deptData = null;
		List<UserDTO> userList = null;
		
		for(OrganizDTO organizDTO : deptList) {	
			deptData = new HashMap<String, Object>();
			deptData.put("deptData", organizDTO);	// 부서명 저장
			
			UserDTO userDTO = new UserDTO();
			int orgIdTemp = organizDTO.getOrg_id();
			userDTO.setOrgId(orgIdTemp);
			// 부서 코드에 맞는 swc_user 테이블을 접근하여 유저리스트를 반환한다.
			userList = userService.userListWithOrgId(userDTO);
			
			//HashMap<String, Object> salesTargetDataMap = new HashMap<String, Object>();
			if (userList.size() > 0) {
				// 유저 리스트 기준으로 salesTarget 테이블을 접근합니다.
				List<SalesTargetDTO> temp = salesTargetDAO.listSalesTarget(compNo, targetYear, targetType, userList);
				if (temp.size() > 0 && temp != null) {
					deptData.put("salesTargetData", temp);
				}
			}			
			returnData.add(deptData);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String json = "";
		try {
			json = mapper.writeValueAsString(returnData);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		System.out.println(json);
		
		return returnData;
	}

	@Override
	public SalesTargetDTO detailSalesTarget(SalesTargetDTO salesTargetDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateSalesTarget(HttpSession session, SalesTargetDTO salesTargetDTO) {
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		int schedInsert = 0;
		
		List<SalesTargetDTO> list = salesTargetDTO.getSalesTargetlist();
		for(SalesTargetDTO dto : list) {
			dto.setCompNo(compNo);
			try {
				schedInsert = salesTargetDAO.updateSalesTarget(dto);
			} catch (Exception e) {
				schedInsert = 0;
				e.printStackTrace();
				// TODO: handle exception
			}
		}
		
		if (schedInsert > 0) schedInsert = 10001;
		else schedInsert = 20001; 

		return schedInsert;
	}

	@Override
	public int deleteSalesTarget(HttpSession session, SalesTargetDTO salesTargetDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSalesTarget(HttpSession session, SalesTargetDTO salesTargetDTO) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	// 연간 계획대비 실적
	// Q. 단위는 사업장마다 다른데 동적인 단위가 필요한가? 아니면 기준 리스트[ex) 1억원, 100만원, 1만원] 중에 선택하게 두는가?
	@Override
	public Map<String, Object> listSalesTargetYearTotalSalesIndividual(HttpSession session, SalesTargetDTO salesTargetDTO) {
		Map<String, Object> returnMap = new HashMap<>();
		salesTargetDTO = defaultSetCompNoAnduserNo(session, salesTargetDTO);
		salesTargetDTO = defaultSetCalendarInfoYearAndMonth(salesTargetDTO);
		returnMap.put("targetYear", salesTargetDTO.getTargetYear());
		returnMap.put("targetMonth", salesTargetDTO.getTargetMonth());
		
		SalesTargetDTO salesDto = new SalesTargetDTO();
		SalesTargetDTO profitDto = new SalesTargetDTO();
		SalesTargetDTO overDto = new SalesTargetDTO();
		
		Boolean result = false;
		try {
			salesDto = salesTargetDAO.listSalesTargetYearTotalSalesIndividual(salesTargetDTO);
			profitDto = salesTargetDAO.listSalesTargetYearTotalProfitIndividual(salesTargetDTO);
			List<SalesTargetDTO> dtoList = new ArrayList<SalesTargetDTO>();
			dtoList.add(salesDto);
			dtoList.add(profitDto);
			dtoList.add(overDto);
			dtoList = overCurrencyCal(dtoList);
			salesDto = currencyAppreciation(dtoList.get(0));
			profitDto = currencyAppreciation(dtoList.get(1));
			overDto = currencyAppreciation(dtoList.get(2));
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
			returnMap.put("code", 20001);
			returnMap.put("data", null);
		}
		
		returnMap.put("salesDto",salesDto);
		returnMap.put("profitDto",profitDto);
		returnMap.put("overDto",overDto);
		
		System.out.println(salesDto.toString());
		System.out.println(profitDto.toString());
		System.out.println(overDto.toString());
		
		if(result) {
			returnMap.put("code", 10001);
			returnMap.put("salesDto",salesDto);
			returnMap.put("profitDto",profitDto);
			returnMap.put("overDto",overDto);
		} else {
			returnMap.put("code", 20001);
		}
		return returnMap;
	}

	@Override
	public Map<String, Object> listSalesTargetYearTotalProfitIndividual(HttpSession session, SalesTargetDTO salesTargetDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	// 월 계획대비 실적
	@Override
	public Map<String, Object> listSalesTargetMonthIndividual(HttpSession session, SalesTargetDTO salesTargetDTO) {
		Map<String, Object> returnMap = new HashMap<>();
		salesTargetDTO = defaultSetCompNoAnduserNo(session, salesTargetDTO);
		salesTargetDTO = defaultSetCalendarInfoYearAndMonth(salesTargetDTO);
		returnMap.put("targetYear", salesTargetDTO.getTargetYear());
		returnMap.put("targetMonth", salesTargetDTO.getTargetMonth());
		returnMap = searchingAfterDataReturnWithSalesTarget(returnMap, "listSalesTargetMonthIndividual", salesTargetDTO);
		return returnMap;
	}
	
	// 누적 계획대비 실적
	@Override
	public Map<String, Object> listSalesTargetYearIndividual(HttpSession session, SalesTargetDTO salesTargetDTO) {
		Map<String, Object> returnMap = new HashMap<>();
		salesTargetDTO = defaultSetCompNoAnduserNo(session, salesTargetDTO);
		salesTargetDTO = defaultSetCalendarInfoYearAndMonth(salesTargetDTO);
		returnMap.put("targetYear", salesTargetDTO.getTargetYear());
		returnMap.put("targetMonth", salesTargetDTO.getTargetMonth());		
		returnMap = searchingAfterDataReturnWithSalesTarget(returnMap, "listSalesTargetYearIndividual", salesTargetDTO);
		return returnMap;
	}

	@Override
	public Map<String, Object> listSalesTargetMonthdept(HttpSession session, SalesTargetDTO salesTargetDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> listSalesTargetYeardept(HttpSession session, SalesTargetDTO salesTargetDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> listSalesTargetYearTotalSalesdept(HttpSession session, SalesTargetDTO salesTargetDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> listSalesTargetYearTotalProfitdept(HttpSession session, SalesTargetDTO salesTargetDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> listSalesTargetMonthCompany(HttpSession session, SalesTargetDTO salesTargetDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> listSalesTargetYearCompany(HttpSession session, SalesTargetDTO salesTargetDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> listSalesTargetYearTotalSalesCompany(HttpSession session,
			SalesTargetDTO salesTargetDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> listSalesTargetYearTotalProfitCompany(HttpSession session,
			SalesTargetDTO salesTargetDTO) {
		// TODO Auto-generated method stub
		return null;
	}
}
