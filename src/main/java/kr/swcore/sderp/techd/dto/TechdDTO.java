package kr.swcore.sderp.techd.dto;

public class TechdDTO {

	private int techdNo;
	private int custNo;
	private int compNo;
	private int soppNo;
	private int contNo;
	private int custmemberNo;
	private int userNo;
	private String techdTitle;
	private String techdDesc;
	private String techdItemmodel;
	private String techdItemversion;
	private String techdPlace;
	private String techdFrom;
	private String techdTo;
	private String techdType;
	private String techdSteps;
	private String custName;
	private String userName;
	private String contTitle;
	private String soppTitle;
	private String custmemberName;
	private String regdatetime;
	private String targetDatefrom;
	private String targetDateto;
	
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

	public String getRegdatetime() {
		return regdatetime;
	}

	public void setRegdatetime(String regdatetime) {
		this.regdatetime = regdatetime;
	}

	public int getTechdNo() {
		return techdNo;
	}

	public void setTechdNo(int techdNo) {
		this.techdNo = techdNo;
	}

	public int getCustNo() {
		return custNo;
	}

	public void setCustNo(int custNo) {
		this.custNo = custNo;
	}

	public int getCompNo() {
		return compNo;
	}

	public void setCompNo(int compNo) {
		this.compNo = compNo;
	}

	public int getSoppNo() {
		return soppNo;
	}

	public void setSoppNo(int soppNo) {
		this.soppNo = soppNo;
	}

	public int getContNo() {
		return contNo;
	}

	public void setContNo(int contNo) {
		this.contNo = contNo;
	}

	public int getCustmemberNo() {
		return custmemberNo;
	}

	public void setCustmemberNo(int custmemberNo) {
		this.custmemberNo = custmemberNo;
	}

	public String getTechdTitle() {
		return techdTitle;
	}

	public void setTechdTitle(String techdTitle) {
		this.techdTitle = techdTitle;
	}

	public String getTechdDesc() {
		return techdDesc;
	}

	public void setTechdDesc(String techdDesc) {
		this.techdDesc = techdDesc;
	}

	public String getTechdItemmodel() {
		return techdItemmodel;
	}

	public void setTechdItemmodel(String techdItemmodel) {
		this.techdItemmodel = techdItemmodel;
	}

	public String getTechdItemversion() {
		return techdItemversion;
	}

	public void setTechdItemversion(String techdItemversion) {
		this.techdItemversion = techdItemversion;
	}

	public String getTechdPlace() {
		return techdPlace;
	}

	public void setTechdPlace(String techdPlace) {
		this.techdPlace = techdPlace;
	}

	public String getTechdFrom() {
		return techdFrom;
	}

	public void setTechdFrom(String techdFrom) {
		this.techdFrom = techdFrom;
	}

	public String getTechdTo() {
		return techdTo;
	}

	public void setTechdTo(String techdTo) {
		this.techdTo = techdTo;
	}

	public String getTechdType() {
		return techdType;
	}

	public void setTechdType(String techdType) {
		this.techdType = techdType;
	}

	public String getTechdSteps() {
		return techdSteps;
	}

	public void setTechdSteps(String techdSteps) {
		this.techdSteps = techdSteps;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getContTitle() {
		return contTitle;
	}

	public void setContTitle(String contTitle) {
		this.contTitle = contTitle;
	}

	public String getSoppTitle() {
		return soppTitle;
	}

	public void setSoppTitle(String soppTitle) {
		this.soppTitle = soppTitle;
	}

	public String getCustmemberName() {
		return custmemberName;
	}

	public void setCustmemberName(String custmemberName) {
		this.custmemberName = custmemberName;
	}
	
	public int getUserNo() {
		return userNo;
	}
	
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	@Override
	public String toString() {
		return "TechdDTO [techdNo=" + techdNo + ", custNo=" + custNo + ", compNo=" + compNo + ", soppNo=" + soppNo
				+ ", contNo=" + contNo + ", custmemberNo=" + custmemberNo + ", userNo=" + userNo + ", techdTitle="
				+ techdTitle + ", techdDesc=" + techdDesc + ", techdItemmodel=" + techdItemmodel + ", techdItemversion="
				+ techdItemversion + ", techdPlace=" + techdPlace + ", techdFrom=" + techdFrom + ", techdTo=" + techdTo
				+ ", techdType=" + techdType + ", techdSteps=" + techdSteps + ", custName=" + custName + ", userName="
				+ userName + ", contTitle=" + contTitle + ", soppTitle=" + soppTitle + ", custmemberName="
				+ custmemberName + ", regdatetime=" + regdatetime + "]";
	}
	
	public TechdDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


}
