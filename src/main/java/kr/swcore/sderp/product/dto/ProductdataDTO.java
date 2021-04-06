package kr.swcore.sderp.product.dto;

import java.util.Date;
import java.util.List;

public class ProductdataDTO {
	private int productDataNo;		// 상품 번호
	private int compNo;				// 회사 구분 번호
	private int custNo;				// 거래처 번호
	private int productNo;			// 카테고리 번호
	private String productModel;	// 상품 모델명
	private String productPrice;	// 상품 가격
	private String productType;		// 상품 가격 데이터 타입
	private int regUser;			// 등록/수정 유저
	private Date regDatetime;		// 등록/수정 시간
	private String attrib;			// 속성
	
	// 확장
	private List<ProductdataDTO> productdataDTO;
	private int parrentId;
	private String display;

	public int getProductDataNo() {
		return productDataNo;
	}
	public void setProductDataNo(int productDataNo) {
		this.productDataNo = productDataNo;
	}
	public int getCompNo() {
		return compNo;
	}
	public void setCompNo(int compNo) {
		this.compNo = compNo;
	}
	public int getCustNo() {
		return custNo;
	}
	public void setCustNo(int custNo) {
		this.custNo = custNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getProductModel() {
		return productModel;
	}
	public void setProductModel(String productModel) {
		this.productModel = productModel;
	}
	public String getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductType() {
		return productType;
	}
	public void setProductType(String productType) {
		this.productType = productType;
	}
	public int getRegUser() {
		return regUser;
	}
	public void setRegUser(int regUser) {
		this.regUser = regUser;
	}
	public Date getRegDatetime() {
		return regDatetime;
	}
	public void setRegDatetime(Date regDatetime) {
		this.regDatetime = regDatetime;
	}
	public String getAttrib() {
		return attrib;
	}
	public void setAttrib(String attrib) {
		this.attrib = attrib;
	}
	public List<ProductdataDTO> getProductdataDTO() {
		return productdataDTO;
	}
	public void setProductdataDTO(List<ProductdataDTO> productdataDTO) {
		this.productdataDTO = productdataDTO;
	}
	public int getParrentId() {
		return parrentId;
	}
	public void setParrentId(int parrentId) {
		this.parrentId = parrentId;
	}
	public String getDisplay() {
		return display;
	}
	public void setDisplay(String display) {
		this.display = display;
	}

	@Override
	public String toString() {
		return "ProductdataDTO{" +
				"productDataNo=" + productDataNo +
				", compNo=" + compNo +
				", custNo=" + custNo +
				", productNo=" + productNo +
				", productModel='" + productModel + '\'' +
				", productPrice='" + productPrice + '\'' +
				", productType='" + productType + '\'' +
				", regUser=" + regUser +
				", regDatetime=" + regDatetime +
				", attrib='" + attrib + '\'' +
				", productdataDTO=" + productdataDTO +
				", parrentId=" + parrentId +
				", display='" + display + '\'' +
				'}';
	}

	public ProductdataDTO() {
		super();
	}	
	
}
