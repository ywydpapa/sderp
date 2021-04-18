package kr.swcore.sderp.sopp.dto;

import kr.swcore.sderp.common.dto.PageDTO;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class SoppDTO extends PageDTO {

	private int soppNo;
	private int compNo;
	private int userNo;
	private int custNo;
	private int custmemberNo;
	private String soppTitle;
	private int ptncNo;
	private int buyrNo;
	private String soppDesc;
	private BigDecimal soppTargetAmt;
	private String soppTargetDate;
	private String soppStatus;
	private int soppSrate;
	private String soppSource;
	private String userName;
	private String custName;
	private String ptncName;
	private String soppType;
	private String soppTypeN;
	private String soppStatusN;
	private Timestamp regDatetime;
	private String sopp2Desc;
	private Timestamp sopp2regDatetime;
	private String targetDatefrom;
	private String targetDateto;
	private String businessType;

	public int getSoppNo() {
		return soppNo;
	}
	public void setSoppNo(int soppNo) {
		this.soppNo = soppNo;
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
	public int getCustNo() {
		return custNo;
	}
	public void setCustNo(int custNo) {
		this.custNo = custNo;
	}
	public int getCustmemberNo() {
		return custmemberNo;
	}
	public void setCustmemberNo(int custmemberNo) {
		this.custmemberNo = custmemberNo;
	}
	public String getSoppTitle() {
		return soppTitle;
	}
	public void setSoppTitle(String soppTitle) {
		this.soppTitle = soppTitle;
	}
	public int getPtncNo() {
		return ptncNo;
	}
	public void setPtncNo(int ptncNo) {
		this.ptncNo = ptncNo;
	}
	public int getBuyrNo() {
		return buyrNo;
	}
	public void setBuyrNo(int buyrNo) {
		this.buyrNo = buyrNo;
	}
	public String getSoppDesc() {
		return soppDesc;
	}
	public void setSoppDesc(String soppDesc) {
		this.soppDesc = soppDesc;
	}
	public BigDecimal getSoppTargetAmt() {
		return soppTargetAmt;
	}
	public void setSoppTargetAmt(BigDecimal soppTargetAmt) {
		this.soppTargetAmt = soppTargetAmt;
	}
	public String getSoppTargetDate() {
		return soppTargetDate;
	}
	public void setSoppTargetDate(String soppTargetDate) {
		this.soppTargetDate = soppTargetDate;
	}
	public String getSoppStatus() {
		return soppStatus;
	}
	public void setSoppStatus(String soppStatus) {
		this.soppStatus = soppStatus;
	}
	public int getSoppSrate() {
		return soppSrate;
	}
	public void setSoppSrate(int soppSrate) {
		this.soppSrate = soppSrate;
	}
	public String getSoppSource() {
		return soppSource;
	}
	public void setSoppSource(String soppSource) {
		this.soppSource = soppSource;
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
	public String getPtncName() {
		return ptncName;
	}
	public void setPtncName(String ptncName) {
		this.ptncName = ptncName;
	}
	public String getSoppType() {
		return soppType;
	}
	public void setSoppType(String soppType) {
		this.soppType = soppType;
	}
	public String getSoppTypeN() {
		return soppTypeN;
	}
	public void setSoppTypeN(String soppTypeN) {
		this.soppTypeN = soppTypeN;
	}
	public String getSoppStatusN() {
		return soppStatusN;
	}
	public void setSoppStatusN(String soppStatusN) {
		this.soppStatusN = soppStatusN;
	}
	public Timestamp getRegDatetime() {
		return regDatetime;
	}
	public void setRegDatetime(Timestamp regDatetime) {
		this.regDatetime = regDatetime;
	}
	public String getSopp2Desc() {
		return sopp2Desc;
	}
	public void setSopp2Desc(String sopp2Desc) {
		this.sopp2Desc = sopp2Desc;
	}
	public Timestamp getSopp2regDatetime() {
		return sopp2regDatetime;
	}
	public void setSopp2regDatetime(Timestamp sopp2regDatetime) {
		this.sopp2regDatetime = sopp2regDatetime;
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
	public String getBusinessType() {
		return businessType;
	}
	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}

	@Override
	public String toString() {
		return "SoppDTO{" +
				"soppNo=" + soppNo +
				", compNo=" + compNo +
				", userNo=" + userNo +
				", custNo=" + custNo +
				", custmemberNo=" + custmemberNo +
				", soppTitle='" + soppTitle + '\'' +
				", ptncNo=" + ptncNo +
				", buyrNo=" + buyrNo +
				", soppDesc='" + soppDesc + '\'' +
				", soppTargetAmt=" + soppTargetAmt +
				", soppTargetDate='" + soppTargetDate + '\'' +
				", soppStatus='" + soppStatus + '\'' +
				", soppSrate=" + soppSrate +
				", soppSource='" + soppSource + '\'' +
				", userName='" + userName + '\'' +
				", custName='" + custName + '\'' +
				", ptncName='" + ptncName + '\'' +
				", soppType='" + soppType + '\'' +
				", soppTypeN='" + soppTypeN + '\'' +
				", soppStatusN='" + soppStatusN + '\'' +
				", sopp2Desc='" + sopp2Desc + '\'' +
				", sopp2regDatetime=" + sopp2regDatetime +
				", targetDatefrom='" + targetDatefrom + '\'' +
				", targetDateto='" + targetDateto + '\'' +
				", businessType='" + businessType + '\'' +
				'}';
	}

	public SoppDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	
}
