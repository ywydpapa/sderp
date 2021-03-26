package kr.swcore.sderp.product.dto;

import org.springframework.web.multipart.MultipartFile;

public class ProductDTO {

	private int productNo;
	private String compId;
	private int custNo;
	private String productName;
	private int productPrice;
	private String productDesc;
	private MultipartFile productImage;
	private String productAttrib;
	
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getCompId() {
		return compId;
	}
	public void setCompId(String compId) {
		this.compId = compId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductDesc() {
		return productDesc;
	}
	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}
	public MultipartFile getProductImage() {
		return productImage;
	}
	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}
	public int getCustNo() {
		return custNo;
	}
	public void setCustNo(int custNo) {
		this.custNo = custNo;
	}
	public String getProductAttrib() {
		return productAttrib;
	}
	public void setProductAttrib(String productAttrib) {
		this.productAttrib = productAttrib;
	}
	@Override
	public String toString() {
		return "ProductDTO [productNo=" + productNo + ", compId=" + compId + ", productName=" + productName
				+ ", productPrice=" + productPrice + ", productDesc=" + productDesc
				+ ", productImage=" + productImage + ", productAttrib=" + productAttrib + "]";
	}
	public ProductDTO() {
			// TODO Auto-generated constructor stub
	}
	
	
	
}
