package kr.swcore.sderp.product.dao;

import java.util.List;

import kr.swcore.sderp.product.dto.ProductDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;

public interface ProductDAO {
	
	List<ProductDTO> listProduct();
	List<ProductDTO> listProduct(SoppDTO soppdto);
	ProductDTO detailProduct(int productNo);
	int updateProduct(ProductDTO dto);
	int deleteProduct(int productNo);
	int insertProduct(ProductDTO dto);
	String fileInfo(int productNo);
	
}
