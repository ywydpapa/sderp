package kr.swcore.sderp.product.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.swcore.sderp.product.dao.ProductDAO;
import kr.swcore.sderp.product.dto.ProductDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.util.SessionInfoGet;

@Service
public class ProductServiceImpl implements ProductService {

	
	@Inject
	ProductDAO productDao;
	
	@Override
	public List<ProductDTO> listProduct() {
		// TODO Auto-generated method stub
		return productDao.listProduct();
	}
	
	@Override
	public List<ProductDTO> listProduct(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		return productDao.listProduct(soppdto);
	}

	@Override
	public ProductDTO detailProduct(int productNo) {
		// TODO Auto-generated method stub
		return productDao.detailProduct(productNo);
	}

	@Override
	public int updateProduct(ProductDTO dto) {
		// TODO Auto-generated method stub
		return productDao.updateProduct(dto);
	}

	@Override
	public int deleteProduct(int productNo) {
		// TODO Auto-generated method stub
	return productDao.deleteProduct(productNo);
	}

	@Override
	public int insertProduct(ProductDTO dto) {
		// TODO Auto-generated method stub
		return productDao.insertProduct(dto);
	}

	@Override
	public String fileInfo(int productNo) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
