package kr.swcore.sderp.product.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import kr.swcore.sderp.product.dao.ProductdataDAO;
import kr.swcore.sderp.product.dto.ProductdataDTO;
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

	@Inject
	ProductdataDAO productdataDAO;

	private String isNumber(String str){
		try {
			Double.parseDouble(str);
			try{
				Integer.parseInt(str);
				return "INTEGER";
			} catch (NumberFormatException e){
				return "DOUBLE";
			}
		} catch (NumberFormatException e){
			return "STRING";
		}
	}

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
		productdto = productDao.detailProduct(productdto);

		ProductdataDTO productdataDTO = new ProductdataDTO();
		productdataDTO.setCompNo(SessionInfoGet.getCompNo(session));
		productdataDTO.setProductNo(productNo);
		List<ProductdataDTO> productdataDTOList = productdataDAO.listProductdata(productdataDTO);

		if(productdataDTOList != null && productdataDTOList.size() > 0){
			productdto.setProductdataDTOList(productdataDTOList);
		}

		return productdto;
	}

	@Override
	public int updateProduct(HttpSession session, ProductDTO newDto) {
		Integer returnValue = null;
		Integer result = 0;
		/*
		1. 기존데이터 select / 신규데이터 비교
		 */
		// 상품 번호, 상품 카테고리 번호, 상품 카테고리 명, 상품 명, 상품 기본 가격, 상품 설명, 공급사
		ProductDTO oldDto = new ProductDTO();
		oldDto.setProductNo(newDto.getProductNo());
		oldDto.setCompNo(SessionInfoGet.getCompNo(session));
		oldDto = productDao.oneProduct(oldDto);

		newDto.setCompNo(SessionInfoGet.getCompNo(session));	// 회사 번호
		newDto.setUserNo(SessionInfoGet.getUserNo(session));	// 유저 번호
		// 수정 데이터중 카테고리 번호가 없거나 기존 데이터와 비교하여 상품명이 불일치 한경우 진행
		if(newDto.getProductCategoryNo() == 0 || (oldDto.getProductCategoryName()).equals(newDto.getProductName())){
			/*
			1. productCategoryName 이 존재하면  set 후 업데이트 진행
			2. 존재하지않으면 MAX(productcategoryNo) + 1 업데이트 진행
			 */
			ProductDTO returnDto = new ProductDTO();
			returnDto.setCompNo(SessionInfoGet.getCompNo(session));					// 회사 번호
			returnDto.setProductCategoryName(newDto.getProductCategoryName());		// 상품 카테고리 이름
			returnDto = productDao.searchingWithMaxProductCategoryNo(returnDto);

			if(returnDto.getProductCategoryName() == null){
				// 신규 카테고리 생성해서 update
				newDto.setProductNo(returnDto.getProductNo()+1);
			} else {
				// 기존 카테고리로 update
				newDto.setProductNo(returnDto.getProductNo());
			}
		}
		try {
			result = productDao.updateProduct(newDto);
		} catch (Exception e){
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly(); // 쿼리 에러시 롤백
		}

		// update 에러만 안나면 계속 진행
		ProductdataDTO searchProductataDTO = new ProductdataDTO();
		searchProductataDTO.setCompNo(SessionInfoGet.getCompNo(session));
		searchProductataDTO.setProductNo(oldDto.getProductNo());
		// 기존 DB 데이터 list 검색
		List<ProductdataDTO> oldproductdataDTOList = productdataDAO.listProductdata(searchProductataDTO);

		List<ProductdataDTO> updateProductDTOList = new ArrayList<>();
		List<ProductdataDTO> insertProductDTOList = new ArrayList<>();
		List<ProductdataDTO> deleteProductDTOList = new ArrayList<>();
		// 새 DB 데이터 get
		List<ProductdataDTO> newproductdataDTOList = newDto.getProductdataDTOList();
		// 타입 셋팅
		Integer custsNo = newDto.getCustNo();
		if(newproductdataDTOList != null && newproductdataDTOList.size() > 0){
			for(int i=0; i<newproductdataDTOList.size(); i++){
				String res = newproductdataDTOList.get(i).getProductPrice();
				String rtn = isNumber(res);
				newproductdataDTOList.get(i).setProductType(rtn);
				newproductdataDTOList.get(i).setCustNo(custsNo);
			}
		}

		List<ProductdataDTO> deleteIndex = new ArrayList<>();
		int indexA = 0;
		if(oldproductdataDTOList != null && newproductdataDTOList != null){
			for(ProductdataDTO A : newproductdataDTOList){
				indexA++;
				Boolean search = false;
				int indexB = 0;
				for(ProductdataDTO B : oldproductdataDTOList){
					indexB++;
					if(A.getProductDataNo() == B.getProductDataNo()){
						if(A.getProductModel().equals(B.getProductModel())
							&& A.getProductPrice().equals(B.getProductPrice())
							&& A.getProductType().equals(B.getProductType())
							&& A.getCustNo() == B.getCustNo()
						 ){
							// 모델명, 상품가격, 상품가격타입, 거래처가 동일하면 update와 insert를 할 필요가 없다.
							search = true;
							deleteIndex.add(B);
							break;
						}
						// update
						updateProductDTOList.add(A);
						search = true;
						deleteIndex.add(B);
						break;
					}
				}
				if(!search){
					// insert
					insertProductDTOList.add(A);
				}
			}
		}

		if(newproductdataDTOList == null){
			deleteProductDTOList = oldproductdataDTOList;
		} else {
			for(int i=0; i<deleteIndex.size(); i++){
				oldproductdataDTOList.remove(deleteIndex.get(i));
			}
			deleteProductDTOList = oldproductdataDTOList;
		}

		try{
			if(updateProductDTOList != null && updateProductDTOList.size() > 0){
				for(ProductdataDTO dto : updateProductDTOList){
					System.out.println(dto.toString());
					productdataDAO.deleteProductdata(dto);
					productdataDAO.insertProductdata(dto);
					//productdataDAO.updateProductdata(dto);
				}
			}
			if(insertProductDTOList != null && insertProductDTOList.size() > 0){
				for(ProductdataDTO dto : insertProductDTOList){
					System.out.println(dto.toString());
					productdataDAO.insertProductdata(dto);
				}
			}
			if(deleteProductDTOList != null && deleteProductDTOList.size() > 0){
				for(ProductdataDTO dto : deleteProductDTOList){
					System.out.println(dto.toString());
					productdataDAO.deleteProductdata(dto);
				}
			}
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
