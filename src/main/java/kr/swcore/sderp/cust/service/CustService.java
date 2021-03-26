package kr.swcore.sderp.cust.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.swcore.sderp.cust.dto.CustDTO;

public interface CustService {

	public List<CustDTO>listCust();
	public List<CustDTO>listCust(HttpSession session);
	public List<CustDTO>listBuyr();
	public List<CustDTO>listBuyr(HttpSession session);
	public List<CustDTO>listPtnc();
	public List<CustDTO>listPtnc(HttpSession session);
	public List<CustDTO>listSupply();
	public List<CustDTO>listSupply(HttpSession session);
	public List<CustDTO>listCustmember(int custNo);
	CustDTO detailCust(int custNo);
	CustDTO detailCust02(int custNo);
	CustDTO detailCust03(int custNo);
	CustDTO detailCust04(int custNo);
	CustDTO detailsCust(int custNo);
	public int updateCust01(CustDTO dto);
	public int updateCust05(CustDTO dto);
	public int deleteCust(int custNo);
	public int insertCust(CustDTO dto);
	String fileInfo(int custNo);
	public int custCheck(CustDTO dto);
	public int insertCust02(CustDTO dto);
	public int insertCust03(CustDTO dto);
	public int insertCust04(CustDTO dto);
}
