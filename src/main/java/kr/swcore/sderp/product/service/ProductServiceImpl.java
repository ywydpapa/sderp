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
		ProductDTO productDTO = new ProductDTO();
		productDTO.setCompNo(SessionInfoGet.getCompNo(session));
		return productDao.listProduct(productDTO);
	}

	@Override
	public ProductDTO detailProduct(HttpSession session, int productNo) {
		ProductDTO productdto = new ProductDTO();
		productdto.setCompNo(SessionInfoGet.getCompNo(session));
		productdto.setProductNo(productNo);
		return productDao.detailProduct(productdto);
	}

	@Override
	public int updateProduct(HttpSession session, ProductDTO dto) {
		dto.setCompNo(SessionInfoGet.getCompNo(session));
		return productDao.updateProduct(dto);
	}

	@Override
	public int deleteProduct(HttpSession session, int productNo) {
		// TODO Auto-generated method stub
		return productDao.deleteProduct(productNo);
	}

	@Override
	public int insertProduct(HttpSession session, ProductDTO dto) {
		Integer returnValue = null;
		dto.setCompNo(SessionInfoGet.getCompNo(session));
		dto.setUserNo(SessionInfoGet.getUserNo(session));
		Integer result = productDao.insertProduct(dto);
		
		if (result > 0) {
			returnValue = 10001; 
		}
		else {
			returnValue = 20001;
		}

		return returnValue;
	}

	@Override
	public String fileInfo(int productNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductDTO> listProductGoodsCategory(HttpSession session) {
		ProductDTO productDTO = new ProductDTO();
		productDTO.setCompNo(SessionInfoGet.getCompNo(session));
		List<ProductDTO> list = productDao.listProductGoodsCategory(productDTO);
		return list;
	}
}
