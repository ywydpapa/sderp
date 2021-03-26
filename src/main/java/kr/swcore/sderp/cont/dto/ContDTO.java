package kr.swcore.sderp.cont.dto;

import java.math.BigDecimal;

public class ContDTO {

	private int contNo;
	private String contTitle;
	private int soppNo;
	private int userNo;
	private int compNo;
	private int custNo;
	private String salesType;
	private int custmemberNo;
	private int maintcustNo;
	private int supplyNo;
	private int ptncNo;
	private String contOrddate;
	private String supplyDate;
	private String delivDate;
	private BigDecimal contAmt;
	private String freemaintSdate;
	private String freemaintEdate;
	private String vatYn;
	private String contArea;
	private String contType;
	private String contDesc;
	private String attrib;
	private String soppTitle;
	private String userName;
	private String custName;
	private String supplyName;
	private String custmemberName;
	private String ptncName;
	private String targetDatefrom;
	private String targetDateto;
	private int buyrNo;
	private String buyrName;
	private String businessType;
	private String contTypeN;
	
	public String getContTypeN() {
		return contTypeN;
	}
	public void setContTypeN(String contTypeN) {
		this.contTypeN = contTypeN;
	}
	public String getTargetDatefrom() {
		return targetDatefrom;
	}
	public void setTargetDatefrom(String targetDatefrom) {
		this.targetDatefrom = targetDatefrom;
	}
	public String getTargetDateto() {
		return targetDateto;
	}
	public void setTargetDateto(String targetDateto) {
		this.targetDateto = targetDateto;
	}
	public int getBuyrNo() {
		return buyrNo;
	}
	public void setBuyrNo(int buyrNo) {
		this.buyrNo = buyrNo;
	}
	public String getBuyrName() {
		return buyrName;
	}
	public void setBuyrName(String buyrName) {
		this.buyrName = buyrName;
	}
	public String getBusinessType() {
		return businessType;
	}
	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}
	public int getContNo() {
		return contNo;
	}
	public void setContNo(int contNo) {
		this.contNo = contNo;
	}
	public String getContTitle() {
		return contTitle;
	}
	public void setContTitle(String contTitle) {
		this.contTitle = contTitle;
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
	public String getSalesType() {
		return salesType;
	}
	public void setSalesType(String salesType) {
		this.salesType = salesType;
	}
	public int getCustmemberNo() {
		return custmemberNo;
	}
	public void setCustmemberNo(int custmemberNo) {
		this.custmemberNo = custmemberNo;
	}
	public int getMaintcustNo() {
		return maintcustNo;
	}
	public void setMaintcustNo(int maintcustNo) {
		this.maintcustNo = maintcustNo;
	}
	public int getSupplyNo() {
		return supplyNo;
	}
	public void setSupplyNo(int supplyNo) {
		this.supplyNo = supplyNo;
	}
	public int getPtncNo() {
		return ptncNo;
	}
	public void setPtncNo(int ptncNo) {
		this.ptncNo = ptncNo;
	}
	public String getContOrddate() {
		return contOrddate;
	}
	public void setContOrddate(String contOrddate) {
		this.contOrddate = contOrddate;
	}
	public String getSupplyDate() {
		return supplyDate;
	}
	public void setSupplyDate(String supplyDate) {
		this.supplyDate = supplyDate;
	}
	public String getDelivDate() {
		return delivDate;
	}
	public void setDelivDate(String delivDate) {
		this.delivDate = delivDate;
	}
	public BigDecimal getContAmt() {
		return contAmt;
	}
	public void setContAmt(BigDecimal contAmt) {
		this.contAmt = contAmt;
	}
	public String getFreemaintSdate() {
		return freemaintSdate;
	}
	public void setFreemaintSdate(String freemaintSdate) {
		this.freemaintSdate = freemaintSdate;
	}
	public String getFreemaintEdate() {
		return freemaintEdate;
	}
	public void setFreemaintEdate(String freemaintEdate) {
		this.freemaintEdate = freemaintEdate;
	}
	public String getVatYn() {
		return vatYn;
	}
	public void setVatYn(String vatYn) {
		this.vatYn = vatYn;
	}
	public String getContArea() {
		return contArea;
	}
	public void setContArea(String contArea) {
		this.contArea = contArea;
	}
	public String getContType() {
		return contType;
	}
	public void setContType(String contType) {
		this.contType = contType;
	}
	public String getContDesc() {
		return contDesc;
	}
	public void setContDesc(String contDesc) {
		this.contDesc = contDesc;
	}
	public String getAttrib() {
		return attrib;
	}
	public void setAttrib(String attrib) {
		this.attrib = attrib;
	}
	public String getSoppTitle() {
		return soppTitle;
	}
	public void setSoppTitle(String soppTitle) {
		this.soppTitle = soppTitle;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getSupplyName() {
		return supplyName;
	}
	public void setSupplyName(String supplyName) {
		this.supplyName = supplyName;
	}
	public String getCustmemberName() {
		return custmemberName;
	}
	public void setCustmemberName(String custmemberName) {
		this.custmemberName = custmemberName;
	}
	public String getPtncName() {
		return ptncName;
	}
	public void setPtncName(String ptncName) {
		this.ptncName = ptncName;
	}
	@Override
	public String toString() {
		return "ContDTO [contNo=" + contNo + ", contTitle=" + contTitle + ", soppNo=" + soppNo + ", userNo=" + userNo
				+ ", custNo=" + custNo + ", salesType=" + salesType + ", custmemberNo=" + custmemberNo
				+ ", maintcustNo=" + maintcustNo + ", supplyNo=" + supplyNo + ", ptncNo=" + ptncNo + ", contOrddate="
				+ contOrddate + ", supplyDate=" + supplyDate + ", delivDate=" + delivDate + ", contAmt=" + contAmt
				+ ", freemaintSdate=" + freemaintSdate + ", freemaintEdate=" + freemaintEdate + ", vatYn=" + vatYn
				+ ", contArea=" + contArea + ", contType=" + contType + ", contDesc=" + contDesc + ", attrib=" + attrib
				+ ", soppTitle=" + soppTitle + ", userName=" + userName + ", custName=" + custName + ", supplyName="
				+ supplyName + ", custmemberName=" + custmemberName + ", ptncName=" + ptncName + "]";
	}
	public ContDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
}
