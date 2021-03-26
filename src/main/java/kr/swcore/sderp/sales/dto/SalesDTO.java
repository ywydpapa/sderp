package kr.swcore.sderp.sales.dto;

public class SalesDTO {
	
	private int salesNo;
	private int soppNo;
	private int userNo;
	private int compNo;
	private int custNo;
	private int ptncNo;
	private String salesFrdatetime;
	private String salesTodatetime;
	private String salesPlace;
	private String salesType;
	private String regDatetime;
	private String salesTitle;
	private String salesDesc;
	private String attrib;
	private String soppTitle;
	private String userName;
	private String compName;
	private String custName;
	private String ptncName;
	private String salesSdate;
	private String salesEdate;
	private String salesStime;
	private String salesEtime;
	private String salesTypeN;
	
	
	
	public String getSalesTypeN() {
		return salesTypeN;
	}
	public void setSalesTypeN(String salesTypeN) {
		this.salesTypeN = salesTypeN;
	}
	public int getSalesNo() {
		return salesNo;
	}
	public void setSalesNo(int salesNo) {
		this.salesNo = salesNo;
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
	public String getSalesFrdatetime() {
		return salesFrdatetime;
	}
	public void setSalesFrdatetime(String salesFrdatetime) {
		this.salesFrdatetime = salesFrdatetime;
	}
	public String getSalesTodatetime() {
		return salesTodatetime;
	}
	public void setSalesTodatetime(String salesTodatetime) {
		this.salesTodatetime = salesTodatetime;
	}
	public String getSalesPlace() {
		return salesPlace;
	}
	public void setSalesPlace(String salesPlace) {
		this.salesPlace = salesPlace;
	}
	public String getSalesType() {
		return salesType;
	}
	public void setSalesType(String salesType) {
		this.salesType = salesType;
	}
	public String getRegDatetime() {
		return regDatetime;
	}
	public void setRegDatetime(String regDatetime) {
		this.regDatetime = regDatetime;
	}
	public String getSalesDesc() {
		return salesDesc;
	}
	public void setSalesDesc(String salesDesc) {
		this.salesDesc = salesDesc;
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
	public String getCompName() {
		return compName;
	}
	public void setCompName(String compName) {
		this.compName = compName;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	
	public int getPtncNo() {
		return ptncNo;
	}
	public void setPtncNo(int ptncNo) {
		this.ptncNo = ptncNo;
	}
	public String getSalesTitle() {
		return salesTitle;
	}
	public void setSalesTitle(String salesTitle) {
		this.salesTitle = salesTitle;
	}
	
	public String getPtncName() {
		return ptncName;
	}
	public void setPtncName(String ptncName) {
		this.ptncName = ptncName;
	}
	
	
	public String getSalesSdate() {
		return salesSdate;
	}
	public void setSalesSdate(String salesSdate) {
		this.salesSdate = salesSdate;
	}
	public String getSalesEdate() {
		return salesEdate;
	}
	public void setSalesEdate(String salesEdate) {
		this.salesEdate = salesEdate;
	}
	public String getSalesStime() {
		return salesStime;
	}
	public void setSalesStime(String salesStime) {
		this.salesStime = salesStime;
	}
	public String getSalesEtime() {
		return salesEtime;
	}
	public void setSalesEtime(String salesEtime) {
		this.salesEtime = salesEtime;
	}
	@Override
	public String toString() {
		return "SalesDTO [salesNo=" + salesNo + ", soppNo=" + soppNo + ", userNo=" + userNo + ", compNo=" + compNo
				+ ", custNo=" + custNo + ", ptncNo=" + ptncNo + ", salesFrdatetime=" + salesFrdatetime
				+ ", salesTodatetime=" + salesTodatetime + ", salesPlace=" + salesPlace + ", salesType=" + salesType
				+ ", regDatetime=" + regDatetime + ", salesTitle=" + salesTitle + ", salesDesc=" + salesDesc
				+ ", attrib=" + attrib + ", soppTitle=" + soppTitle + ", userName=" + userName + ", compName="
				+ compName + ", custName=" + custName + ", ptncName=" + ptncName + ", salesSdate=" + salesSdate
				+ ", salesEdate=" + salesEdate + ", salesStime=" + salesStime + ", salesEtime=" + salesEtime
				+ ", salesTypeN=" + salesTypeN + "]";
	}
	public SalesDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	

}
