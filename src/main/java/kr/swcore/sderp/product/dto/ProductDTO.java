package kr.swcore.sderp.product.dto;

import org.springframework.web.multipart.MultipartFile;

public class ProductDTO {

	private int productNo;				// 상품 번호(AUTO)
	private int productCategoryNo;		// 상품 카테고리 번호
	private String productCategoryName;	// 상품 카테고리 이름
	private int compNo;					// 회사 구분 코드(외래키)
	private int userNo;					// 유저 번호
	private String productName;			// 상풍 명
	private int productDefaultPrice;	// 상품 기본 가격
	private String productDesc;			// 상품 설명
	private int productImageNo;			// 상품 이미지 번호 
	private int custNo;					// 공급사(외래키)
	private String attrib;				// 속성
	
	// 확장
	private MultipartFile productImage;	// 상품 새 이미지
	private String custName;			// 공급사 명
	
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}	
	public int getProductCategoryNo() {
		return productCategoryNo;
	}
	public void setProductCategoryNo(int productCategoryNo) {
		this.productCategoryNo = productCategoryNo;
	}
	public String getProductCategoryName() {
		return productCategoryName;
	}
	public void setProductCategoryName(String productCategoryName) {
		this.productCategoryName = productCategoryName;
	}
	public int getCompNo() {
		return compNo;
	}
	public void setCompNo(int compNo) {
		this.compNo = compNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductDefaultPrice() {
		return productDefaultPrice;
	}
	public void setProductDefaultPrice(int productDefaultPrice) {
		this.productDefaultPrice = productDefaultPrice;
	}
	public String getProductDesc() {
		return productDesc;
	}
	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}
	public int getProductImageNo() {
		return productImageNo;
	}
	public void setProductImageNo(int productImageNo) {
		this.productImageNo = productImageNo;
	}
	public int getCustNo() {
		return custNo;
	}
	public void setCustNo(int custNo) {
		this.custNo = custNo;
	}
	public String getAttrib() {
		return attrib;
	}
	public void setAttrib(String attrib) {
		this.attrib = attrib;
	}
	public MultipartFile getProductImage() {
		return productImage;
	}
	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}	
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
		
	@Override
	public String toString() {
		return "ProductDTO [productNo=" + productNo + ", productCategoryNo=" + productCategoryNo
				+ ", productCategoryName=" + productCategoryName + ", compNo=" + compNo + ", userNo=" + userNo
				+ ", productName=" + productName + ", productDefaultPrice=" + productDefaultPrice + ", productDesc="
				+ productDesc + ", productImageNo=" + productImageNo + ", custNo=" + custNo + ", attrib=" + attrib
				+ ", productImage=" + productImage + ", custName=" + custName + "]";
	}
	public ProductDTO() {
			// TODO Auto-generated constructor stub
	}
}
