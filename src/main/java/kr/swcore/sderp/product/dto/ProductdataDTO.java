package kr.swcore.sderp.product.dto;

import java.util.Date;
import java.util.List;

public class ProductdataDTO {
	private int productDataNo;
	private int compNo;
	private int custNo;
	private int productNo;
	private String productModel;
	private String productPrice;
	private String productType;
	private int regUser;
	private Date regDatetime;
	private String attrib;
	
	// 확장
	private List<ProductdataDTO> productdataDTO;
	
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
	
	@Override
	public String toString() {
		return "ProductdataDTO [productDataNo=" + productDataNo + ", compNo=" + compNo + ", custNo=" + custNo
				+ ", productNo=" + productNo + ", productModel=" + productModel + ", productPrice=" + productPrice
				+ ", productType=" + productType + ", regUser=" + regUser + ", regDatetime=" + regDatetime + ", attrib="
				+ attrib + ", productdataDTO=" + productdataDTO + "]";
	}
	public ProductdataDTO() {
		super();
	}	
	
}
