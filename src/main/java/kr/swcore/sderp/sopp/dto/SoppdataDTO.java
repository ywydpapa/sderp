package kr.swcore.sderp.sopp.dto;

import java.math.BigDecimal;

public class SoppdataDTO {
		
	private int soppdataNo;
	private int soppNo;
	private int userNo;
	private String soppTitle;
	private int catNo;
	private int productNo;
	private String catTitle;
	private String dataTitle;
	private String dataDesc;
	private String dataType;
	private int dataQuanty;
	private BigDecimal dataAmt;
	private BigDecimal dataNetprice;
	private String dataRemark;
	private String linkType;
	private String linkNo;
	private String attrib;
	public int getSoppdataNo() {
		return soppdataNo;
	}
	public void setSoppdataNo(int soppdataNo) {
		this.soppdataNo = soppdataNo;
	}
	public int getSoppNo() {
		return soppNo;
	}
	public void setSoppNo(int soppNo) {
		this.soppNo = soppNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getSoppTitle() {
		return soppTitle;
	}
	public void setSoppTitle(String soppTitle) {
		this.soppTitle = soppTitle;
	}
	public int getCatNo() {
		return catNo;
	}
	public void setCatNo(int catNo) {
		this.catNo = catNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getCatTitle() {
		return catTitle;
	}
	public void setCatTitle(String catTitle) {
		this.catTitle = catTitle;
	}
	public String getDataTitle() {
		return dataTitle;
	}
	public void setDataTitle(String dataTitle) {
		this.dataTitle = dataTitle;
	}
	public String getDataDesc() {
		return dataDesc;
	}
	public void setDataDesc(String dataDesc) {
		this.dataDesc = dataDesc;
	}
	public String getDataType() {
		return dataType;
	}
	public void setDataType(String dataType) {
		this.dataType = dataType;
	}
	public int getDataQuanty() {
		return dataQuanty;
	}
	public void setDataQuanty(int dataQuanty) {
		this.dataQuanty = dataQuanty;
	}
	public BigDecimal getDataAmt() {
		return dataAmt;
	}
	public void setDataAmt(BigDecimal dataAmt) {
		this.dataAmt = dataAmt;
	}
	public BigDecimal getDataNetprice() {
		return dataNetprice;
	}
	public void setDataNetprice(BigDecimal dataNetprice) {
		this.dataNetprice = dataNetprice;
	}
	public String getDataRemark() {
		return dataRemark;
	}
	public void setDataRemark(String dataRemark) {
		this.dataRemark = dataRemark;
	}
	public String getLinkType() {
		return linkType;
	}
	public void setLinkType(String linkType) {
		this.linkType = linkType;
	}
	public String getLinkNo() {
		return linkNo;
	}
	public void setLinkNo(String linkNo) {
		this.linkNo = linkNo;
	}
	public String getAttrib() {
		return attrib;
	}
	public void setAttrib(String attrib) {
		this.attrib = attrib;
	}

	@Override
	public String toString() {
		return "SoppdataDTO{" +
				"soppdataNo=" + soppdataNo +
				", soppNo=" + soppNo +
				", userNo=" + userNo +
				", soppTitle='" + soppTitle + '\'' +
				", catNo=" + catNo +
				", productNo=" + productNo +
				", catTitle='" + catTitle + '\'' +
				", dataTitle='" + dataTitle + '\'' +
				", dataDesc='" + dataDesc + '\'' +
				", dataType='" + dataType + '\'' +
				", dataQuanty=" + dataQuanty +
				", dataAmt=" + dataAmt +
				", dataNetprice=" + dataNetprice +
				", dataRemark='" + dataRemark + '\'' +
				", linkType='" + linkType + '\'' +
				", linkNo='" + linkNo + '\'' +
				", attrib='" + attrib + '\'' +
				'}';
	}

	public SoppdataDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
}
