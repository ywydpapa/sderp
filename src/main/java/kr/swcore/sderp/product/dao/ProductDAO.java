package kr.swcore.sderp.product.dao;

import java.util.List;

import kr.swcore.sderp.product.dto.ProductDTO;

public interface ProductDAO {
	
	List<ProductDTO> listProduct();
	List<ProductDTO> listProduct(ProductDTO roductDTO);
	List<ProductDTO> listProductGoodsCategory(ProductDTO productdto);
	ProductDTO detailProduct(ProductDTO productdto);
	int updateProduct(ProductDTO productdto);
	int deleteProduct(int productNo);
	int insertProduct(ProductDTO dto);
	String fileInfo(int productNo);
	
}
