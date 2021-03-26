package kr.swcore.sderp.sales.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.swcore.sderp.sales.dto.SalesDTO;

public interface SalesService {
	
	List<SalesDTO> listSales();
	List<SalesDTO> listSales(HttpSession session);
	List<SalesDTO> listconSales(HttpSession session, SalesDTO dto);
	List<SalesDTO> listSalesinsopp(int soppNo);
	SalesDTO detailSales(int salesNo);
	int updateSales(SalesDTO dto);
	int deleteSales(int salesNo);
	int insertSales(SalesDTO dto);
	int insertSales(HttpSession session, SalesDTO dto);


}
