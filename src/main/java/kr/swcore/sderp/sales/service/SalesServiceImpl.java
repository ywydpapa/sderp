package kr.swcore.sderp.sales.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import kr.swcore.sderp.common.dto.PageDTO;
import org.springframework.stereotype.Service;

import kr.swcore.sderp.code.dao.CodeDAO;
import kr.swcore.sderp.code.dto.CodeDTO;
import kr.swcore.sderp.sales.dao.SalesDAO;
import kr.swcore.sderp.sales.dto.SalesDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.util.SessionInfoGet;

@Service
public class SalesServiceImpl implements SalesService {

	@Inject
	SalesDAO salesDao;
	
	@Inject
	CodeDAO codeDao;
	
	@Override
	public List<SalesDTO> listSales() {
		// TODO Auto-generated method stub
		return salesDao.listSales();
	}
	
	@Override
	public List<SalesDTO> listSales(HttpSession session, PageDTO pageDTO) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);

		if(pageDTO != null) {
			Integer limit = pageDTO.getLimit();
			soppdto.setLimit(limit);
			Integer offset = pageDTO.getOffset();
			soppdto.setOffset(offset);
		}

		return salesDao.listSales(soppdto);
	}
	
	@Override
	public List<SalesDTO> listconSales(HttpSession session, SalesDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		dto.setCompNo(compNo);
		return salesDao.listconSales(dto);
	}

	@Override
	public SalesDTO detailSales(int salesNo) {
		// TODO Auto-generated method stub
		return salesDao.detailSales(salesNo);
	}

	@Override
	public int updateSales(SalesDTO dto) {
		// TODO Auto-generated method stub
		return salesDao.updateSales(dto);
		
	}

	@Override
	public int deleteSales(int salesNo) {
		// TODO Auto-generated method stub
		return salesDao.deleteSales(salesNo);
	}

	@Override
	public int insertSales(SalesDTO dto) {
		// TODO Auto-generated method stub
		return salesDao.insertSales(dto);
	}
	
	@Override
	public int insertSales(HttpSession session, SalesDTO dto) {
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		dto.setCompNo(compNo);
		
		SoppDTO soppdto = new SoppDTO();
		soppdto.setCompNo(compNo);
		List<CodeDTO> codeDto = codeDao.listSchedtype(soppdto);
		
		for(int i = 0; i < codeDto.size(); i++) {
			CodeDTO item = codeDto.get(i);
			if(item.getCode03().equals("SCHED001")) {
				dto.setSchedType(String.valueOf(item.getCodeNo()));
			}
		}
		
		int schedInsert = 0;
		schedInsert = salesDao.insertSales(dto);
		
		if (schedInsert > 0) schedInsert = 10001;
		else schedInsert = 20001; 
		
		return schedInsert;
	}

	@Override
	public List<SalesDTO> listSalesinsopp(HttpSession session, int soppNo) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		soppdto.setSoppNo(soppNo);
		
		return salesDao.listSalesinsopp(soppdto);
	}

	



}
