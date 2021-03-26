package kr.swcore.sderp.product.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.swcore.sderp.product.dto.ProductDTO;

public interface ProductService {

	List<ProductDTO> listProduct();
	List<ProductDTO> listProduct(HttpSession session);
	ProductDTO detailProduct(int productNo);
	int updateProduct(ProductDTO dto);
	int deleteProduct(int productNo);
	int insertProduct(ProductDTO dto);
	String fileInfo(int productNo);
		
}
