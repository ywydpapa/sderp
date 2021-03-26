package kr.swcore.sderp.cust.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.swcore.sderp.cust.dao.CustDAO;
import kr.swcore.sderp.cust.dto.CustDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.util.SessionInfoGet;
@Service
public class CustServiceImpl implements CustService {

	@Inject
	CustDAO custDao;
	
	@Override
	public List<CustDTO> listCust() {
		// TODO Auto-generated method stub
		return custDao.listCust();
	}
	
	@Override
	public List<CustDTO> listCust(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		return custDao.listCust(soppdto);
	}

	@Override
	public CustDTO detailCust(int custNo) {
		// TODO Auto-generated method stub
		return custDao.detailCust(custNo);
	}

	@Override
	public int updateCust01(CustDTO dto) {
		// TODO Auto-generated method stub
		return custDao.updateCust01(dto);
	}

	@Override
	public int deleteCust(int custNo) {
		// TODO Auto-generated method stub
		return custDao.deleteCust(custNo);
	}

	@Override
	public int insertCust(CustDTO dto) {
		// TODO Auto-generated method stub
		return custDao.insertCust(dto);
	}

	@Override
	public String fileInfo(int custNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CustDTO detailsCust(int custNo) {
		// TODO Auto-generated method stub
		return (CustDTO) custDao.detailsCust(custNo);
	}

	@Override
	public List<CustDTO> listBuyr() {
		// TODO Auto-generated method stub
		return custDao.listBuyr();
	}
	
	@Override
	public List<CustDTO> listBuyr(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);

		return custDao.listBuyr(soppdto);
	}

	@Override
	public List<CustDTO> listPtnc() {
		// TODO Auto-generated method stub
		return custDao.listPtnc();
	}
	
	@Override
	public List<CustDTO> listPtnc(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		
		return custDao.listPtnc(soppdto);
	}

	@Override
	public List<CustDTO> listSupply() {
		// TODO Auto-generated method stub
		return custDao.listSupply();
	}
	
	@Override
	public List<CustDTO> listSupply(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		
		return custDao.listSupply(soppdto);
	}

	@Override
	public int custCheck(CustDTO dto) {
		// TODO Auto-generated method stub
		int result =  custDao.custCheck(dto);
		return result;
	}

	@Override
	public int insertCust02(CustDTO dto) {
		// TODO Auto-generated method stub
		return custDao.insertCust02(dto);
	}

	@Override
	public int insertCust03(CustDTO dto) {
		// TODO Auto-generated method stub
		return custDao.insertCust03(dto);
	}

	@Override
	public int insertCust04(CustDTO dto) {
		// TODO Auto-generated method stub
		return custDao.insertCust04(dto);
	}

	@Override
	public CustDTO detailCust02(int custNo) {
		// TODO Auto-generated method stub
		return custDao.detailCust02(custNo);
	}

	@Override
	public CustDTO detailCust03(int custNo) {
		// TODO Auto-generated method stub
		return custDao.detailCust03(custNo);
	}

	@Override
	public CustDTO detailCust04(int custNo) {
		// TODO Auto-generated method stub
		return custDao.detailCust04(custNo);
	}

	@Override
	public int updateCust05(CustDTO dto) {
		// TODO Auto-generated method stub
		return custDao.updateCust05(dto);
	}

	@Override
	public List<CustDTO> listCustmember(int custNo) {
		// TODO Auto-generated method stub
		return custDao.listCustmember(custNo);
	}
}
