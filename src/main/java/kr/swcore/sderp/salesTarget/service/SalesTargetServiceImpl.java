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

	@Override
	public Map<String, Object> listSalesTargetMonthIndividual(HttpSession session, SalesTargetDTO salesTargetDTO) {
		Map<String, Object> returnMap = new HashMap<>();
		if(salesTargetDTO == null) salesTargetDTO = new SalesTargetDTO();
		
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		salesTargetDTO.setCompNo(compNo);
		
		Integer userNo = Integer.valueOf((String) session.getAttribute("userNo"));
		salesTargetDTO.setUserNo(userNo);
		
		Calendar cal = Calendar.getInstance();
		String targetYear = salesTargetDTO.getTargetYear();
		if(targetYear == null || targetYear.equals("")) {
			targetYear = String.valueOf(cal.get(Calendar.YEAR));
			salesTargetDTO.setTargetYear(targetYear);
		}
		returnMap.put("targetYear", targetYear);
		
		String targetMonth = salesTargetDTO.getTargetMonth();
		if(targetMonth == null || targetMonth.equals("")) {
			Integer month = cal.get(Calendar.MONTH)+1;
			returnMap.put("targetMonth", String.valueOf(month));
			if(month < 10) {
				targetMonth = "mm0"+String.valueOf(month);
			} else {
				targetMonth = "mm"+String.valueOf(month);
			}
			salesTargetDTO.setTargetMonth(targetMonth);
		}
		
		SalesTargetDTO returnDto = new SalesTargetDTO();
		try {
			returnDto = salesTargetDAO.listSalesTargetMonthIndividual(salesTargetDTO);
		} catch (Exception e) {
			e.printStackTrace();
			returnMap.put("code", 20001);
			returnMap.put("data", null);
		}
		
		if (returnDto == null) {
			// 쿼리는 이상없지만 0/0 또는 0/1 또는 1/0 같은경우
			returnMap.put("code", 20001);
			BigDecimal temp = new BigDecimal(0.0);
			returnDto = new SalesTargetDTO();
			returnDto.setPercent(temp);
			returnMap.put("data", returnDto);
		} else {
			returnMap.put("code", 10001);
			returnMap.put("data", returnDto);
		}
		return returnMap;
	}

	@Override
	public Map<String, Object> listSalesTargetYearIndividual(HttpSession session, SalesTargetDTO salesTargetDTO) {
		Map<String, Object> returnMap = new HashMap<>();
		if(salesTargetDTO == null) salesTargetDTO = new SalesTargetDTO();
		
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		salesTargetDTO.setCompNo(compNo);
		
		Integer userNo = Integer.valueOf((String) session.getAttribute("userNo"));
		salesTargetDTO.setUserNo(userNo);
		
		Calendar cal = Calendar.getInstance();
		String targetYear = salesTargetDTO.getTargetYear();
		if(targetYear == null || targetYear.equals("")) {
			targetYear = String.valueOf(cal.get(Calendar.YEAR));
			salesTargetDTO.setTargetYear(targetYear);
		}
		
		// 쓰지는 않지만 데이터 일관성을 가지기위해 임시로 targetMonth 데이터값 넣어둠
		String targetMonth = salesTargetDTO.getTargetMonth();
		if(targetMonth == null || targetMonth.equals("")) {
			targetMonth = String.valueOf(cal.get(Calendar.MONTH)+1);
		}
		returnMap.put("targetMonth", targetMonth);
		
		SalesTargetDTO returnDto = new SalesTargetDTO();
		try {
			returnDto = salesTargetDAO.listSalesTargetYearIndividual(salesTargetDTO);
		} catch (Exception e) {
			e.printStackTrace();
			returnMap.put("code", 20001);
			returnMap.put("data", null);
		}
		
		if (returnDto == null) {
			// 쿼리는 이상없지만 0/0 또는 0/1 또는 1/0 같은경우
			returnMap.put("code", 20001);
			BigDecimal temp = new BigDecimal(0.0);
			returnDto = new SalesTargetDTO();
			returnDto.setPercent(temp);
			returnMap.put("data", returnDto);
		} else {
			returnMap.put("code", 10001);
			returnMap.put("data", returnDto);
		}
		return returnMap;
	}
}
