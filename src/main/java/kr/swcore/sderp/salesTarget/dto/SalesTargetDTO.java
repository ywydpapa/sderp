package kr.swcore.sderp.salesTarget.dto;

import java.util.List;

public class SalesTargetDTO {
	private int compNo;
	private int deptNo;
	private int userNo;
	private String targetYear;
	private String targetType;
	private int mm01;
	private int mm02;
	private int mm03;
	private int mm04;
	private int mm05;
	private int mm06;
	private int mm07;
	private int mm08;
	private int mm09;
	private int mm10;
	private int mm11;
	private int mm12;
	private String attrib;
	
	// 확장
	private int orgId;
	private String userName;
	private List<SalesTargetDTO> salesTargetlist;
	
	public int getCompNo() {
		return compNo;
	}
	public void setCompNo(int compNo) {
		this.compNo = compNo;
	}
	public int getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}	
	public String getTargetYear() {
		return targetYear;
	}
	public void setTargetYear(String targetYear) {
		this.targetYear = targetYear;
	}
	public String getTargetType() {
		return targetType;
	}
	public void setTargetType(String targetType) {
		this.targetType = targetType;
	}
	public int getMm01() {
		return mm01;
	}
	public void setMm01(int mm01) {
		this.mm01 = mm01;
	}
	public int getMm02() {
		return mm02;
	}
	public void setMm02(int mm02) {
		this.mm02 = mm02;
	}
	public int getMm03() {
		return mm03;
	}
	public void setMm03(int mm03) {
		this.mm03 = mm03;
	}
	public int getMm04() {
		return mm04;
	}
	public void setMm04(int mm04) {
		this.mm04 = mm04;
	}
	public int getMm05() {
		return mm05;
	}
	public void setMm05(int mm05) {
		this.mm05 = mm05;
	}
	public int getMm06() {
		return mm06;
	}
	public void setMm06(int mm06) {
		this.mm06 = mm06;
	}
	public int getMm07() {
		return mm07;
	}
	public void setMm07(int mm07) {
		this.mm07 = mm07;
	}
	public int getMm08() {
		return mm08;
	}
	public void setMm08(int mm08) {
		this.mm08 = mm08;
	}
	public int getMm09() {
		return mm09;
	}
	public void setMm09(int mm09) {
		this.mm09 = mm09;
	}
	public int getMm10() {
		return mm10;
	}
	public void setMm10(int mm10) {
		this.mm10 = mm10;
	}
	public int getMm11() {
		return mm11;
	}
	public void setMm11(int mm11) {
		this.mm11 = mm11;
	}
	public int getMm12() {
		return mm12;
	}
	public void setMm12(int mm12) {
		this.mm12 = mm12;
	}
	public String getAttrib() {
		return attrib;
	}
	public void setAttrib(String attrib) {
		this.attrib = attrib;
	}
	
	// 확장		
	public int getOrgId() {
		return orgId;
	}
	public void setOrgId(int orgId) {
		this.orgId = orgId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public List<SalesTargetDTO> getSalesTargetlist() {
		return salesTargetlist;
	}
	public void setSalesTargetlist(List<SalesTargetDTO> salesTargetlist) {
		this.salesTargetlist = salesTargetlist;
	}
	
	public SalesTargetDTO() {
		super();
	}
	@Override
	public String toString() {
		return "SalesTargetDTO [compNo=" + compNo + ", deptNo=" + deptNo + ", userNo=" + userNo + ", targetYear="
				+ targetYear + ", targetType=" + targetType + ", mm01=" + mm01 + ", mm02=" + mm02 + ", mm03=" + mm03
				+ ", mm04=" + mm04 + ", mm05=" + mm05 + ", mm06=" + mm06 + ", mm07=" + mm07 + ", mm08=" + mm08
				+ ", mm09=" + mm09 + ", mm10=" + mm10 + ", mm11=" + mm11 + ", mm12=" + mm12 + ", attrib=" + attrib
				+ ", orgId=" + orgId + ", userName=" + userName + ", salesTargetlist=" + salesTargetlist + "]";
	}
		
	
}
