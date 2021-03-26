package kr.swcore.sderp.sales.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.swcore.sderp.sales.dao.SalesDAO;
import kr.swcore.sderp.sales.dto.SalesDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.util.SessionInfoGet;

@Service
public class SalesServiceImpl implements SalesService {

	@Inject
	SalesDAO salesDao;
	
	@Override
	public List<SalesDTO> listSales() {
		// TODO Auto-generated method stub
		return salesDao.listSales();
	}
	
	@Override
	public List<SalesDTO> listSales(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		return salesDao.listSales(soppdto);
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
		
		int schedInsert = 0;
		schedInsert = salesDao.insertSales(dto);
		
		if (schedInsert > 0) schedInsert = 10001;
		else schedInsert = 20001; 
		
		return schedInsert;
	}

	@Override
	public List<SalesDTO> listSalesinsopp(int soppNo) {
		// TODO Auto-generated method stub
		return salesDao.listSalesinsopp(soppNo);
	}

	



}
