package kr.swcore.sderp.sales.dao;

import java.util.List;

import kr.swcore.sderp.sales.dto.SalesDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;

public interface SalesDAO {

	List<SalesDTO> listSales();
	List<SalesDTO> listSales(SoppDTO soppDto);
	List<SalesDTO> listSalesinsopp(int soppNo);
	SalesDTO detailSales(int salesNo);
	int updateSales(SalesDTO dto);
	int deleteSales(int salesNo);
	int insertSales(SalesDTO dto);

}
