package kr.swcore.sderp.product.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.swcore.sderp.product.dao.ProductDAO;
import kr.swcore.sderp.product.dto.ProductDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.util.SessionInfoGet;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Inject
	ProductDAO productDao;

	@Override
	public ProductDTO oneProduct(HttpSession session, ProductDTO dto) {
		ProductDTO productDTO = new ProductDTO();
		productDTO.setProductNo(dto.getProductNo());
		productDTO.setCompNo(SessionInfoGet.getCompNo(session));
		return null;
	}

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
	public int updateProduct(HttpSession session, ProductDTO newDto) {
		Integer returnValue = null;
		Integer result = 0;
		/*
		1. 기존데이터 select / 신규데이터 비교
		 */
		/*
		ProductDTO oldDto = new ProductDTO();
		oldDto.setProductNo(newDto.getProductNo());
		oldDto.setCompNo(SessionInfoGet.getCompNo(session));
		oldDto = productDao.oneProduct(oldDto);
		*/
		newDto.setCompNo(SessionInfoGet.getCompNo(session));
		newDto.setCompNo(SessionInfoGet.getUserNo(session));
		if(newDto.getProductCategoryNo() == 0){
			/*
			1. productCategoryName 이 존재하면  set 후 업데이트 진행
			2. 존재하지않으면 MAX(productcategoryNo) + 1 업데이트 진행
			 */
			ProductDTO returnDto = new ProductDTO();
			returnDto.setCompNo(SessionInfoGet.getCompNo(session));
			returnDto.setProductCategoryName(newDto.getProductCategoryName());
			returnDto = productDao.searchingWithMaxProductCategoryNo(returnDto);

			if(returnDto.getProductCategoryName() == null){
				// 신규 카테고리 생성해서 update

			} else {
				// 기존 카테고리로 update
			}
		}

		ProductDTO insertDto = new ProductDTO();
		try{
			productDao.updateProduct(newDto);
			result = 1;
		} catch (Exception e){
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly(); // 쿼리 에러시 롤백
		}

		if (result > 0) {
			returnValue = 10001;
		}
		else {
			returnValue = 20001;
		}
		return returnValue;
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
