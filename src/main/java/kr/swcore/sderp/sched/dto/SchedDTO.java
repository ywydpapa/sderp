package kr.swcore.sderp.sched.dto;

public class SchedDTO {
		
	private int schedNo;
	private int userNo;
	private int compNo;
	private int soppNo;
	private int custNo;
	private int contNo;
	private int id;
	private String schedName;
	private String schedFrom;
	private String schedTo;
	private String schedTitle;
	private String schedDesc;
	private String subschedNo;
	private String schedActive;
	private String schedAllday;
	private String regDatetime;
	private String remindflag;
	private String modDatetime;
	private String attrib;
	private String userName;
	private String soppTitle;
	private String custName;
	private String schedType;
	private String schedPlace;
	private int custmemberNo;
	private String custmemberName;
	private String schedSdate;
	private String schedEdate;
	private String schedStime;
	private String schedEtime;
	private String schedColor;
	private String schedCat;
	private String schedCatN;
	private String schedTypeN;
	private String sTime;
	private String eTime;
	private String userId;
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSchedTypeN() {
		return schedTypeN;
	}
	public String getsTime() {
		return sTime;
	}
	public void setsTime(String sTime) {
		this.sTime = sTime;
	}
	public String geteTime() {
		return eTime;
	}
	public void seteTime(String eTime) {
		this.eTime = eTime;
	}
	public void setSchedTypeN(String schedTypeN) {
		this.schedTypeN = schedTypeN;
	}
	public String getSchedCatN() {
		return schedCatN;
	}
	public void setSchedCatN(String schedCatN) {
		this.schedCatN = schedCatN;
	}
	public int getSchedNo() {
		return schedNo;
	}
	public void setSchedNo(int schedNo) {
		this.schedNo = schedNo;
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
	public int getSoppNo() {
		return soppNo;
	}
	public void setSoppNo(int soppNo) {
		this.soppNo = soppNo;
	}
	public int getCustNo() {
		return custNo;
	}
	public void setCustNo(int custNo) {
		this.custNo = custNo;
	}
	public String getSchedName() {
		return schedName;
	}
	public void setSchedName(String schedName) {
		this.schedName = schedName;
	}
	public String getSchedFrom() {
		return schedFrom;
	}
	public void setSchedFrom(String schedFrom) {
		this.schedFrom = schedFrom;
	}
	public String getSchedTo() {
		return schedTo;
	}
	public void setSchedTo(String schedTo) {
		this.schedTo = schedTo;
	}
	public String getSchedTitle() {
		return schedTitle;
	}
	public void setSchedTitle(String schedTitle) {
		this.schedTitle = schedTitle;
	}
	public String getSchedDesc() {
		return schedDesc;
	}
	public void setSchedDesc(String schedDesc) {
		this.schedDesc = schedDesc;
	}
	public String getSubschedNo() {
		return subschedNo;
	}
	public void setSubschedNo(String subschedNo) {
		this.subschedNo = subschedNo;
	}
	public String getSchedActive() {
		return schedActive;
	}
	public void setSchedActive(String schedActive) {
		this.schedActive = schedActive;
	}
	public String getSchedAllday() {
		return schedAllday;
	}
	public void setSchedAllday(String schedAllday) {
		this.schedAllday = schedAllday;
	}
	public String getRegDatetime() {
		return regDatetime;
	}
	public void setRegDatetime(String regDatetime) {
		this.regDatetime = regDatetime;
	}
	public String getRemindflag() {
		return remindflag;
	}
	public void setRemindflag(String remindflag) {
		this.remindflag = remindflag;
	}
	public String getModDatetime() {
		return modDatetime;
	}
	public void setModDatetime(String modDatetime) {
		this.modDatetime = modDatetime;
	}
	public String getAttrib() {
		return attrib;
	}
	public void setAttrib(String attrib) {
		this.attrib = attrib;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getSoppTitle() {
		return soppTitle;
	}
	public void setSoppTitle(String soppTitle) {
		this.soppTitle = soppTitle;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	
	public String getSchedPlace() {
		return schedPlace;
	}
	public void setSchedPlace(String schedPlace) {
		this.schedPlace = schedPlace;
	}
	public String getSchedType() {
		return schedType;
	}
	public void setSchedType(String schedType) {
		this.schedType = schedType;
	}
	
	public int getCustmemberNo() {
		return custmemberNo;
	}
	public void setCustmemberNo(int custmemberNo) {
		this.custmemberNo = custmemberNo;
	}
	public String getCustmemberName() {
		return custmemberName;
	}
	public void setCustmemberName(String custmemberName) {
		this.custmemberName = custmemberName;
	}
	
	public String getSchedSdate() {
		return schedSdate;
	}
	public void setSchedSdate(String schedSdate) {
		this.schedSdate = schedSdate;
	}
	public String getSchedEdate() {
		return schedEdate;
	}
	public void setSchedEdate(String schedEdate) {
		this.schedEdate = schedEdate;
	}
	public String getSchedStime() {
		return schedStime;
	}
	public void setSchedStime(String schedStime) {
		this.schedStime = schedStime;
	}
	public String getSchedEtime() {
		return schedEtime;
	}
	public void setSchedEtime(String schedEtime) {
		this.schedEtime = schedEtime;
	}
	
	public String getSchedColor() {
		return schedColor;
	}
	public void setSchedColor(String schedColor) {
		this.schedColor = schedColor;
	}
	
	public String getSchedCat() {
		return schedCat;
	}
	public void setSchedCat(String schedCat) {
		this.schedCat = schedCat;
	}
	
	public int getContNo() {
		return contNo;
	}
	public void setContNo(int contNo) {
		this.contNo = contNo;
	}
	@Override
	public String toString() {
		return "SchedDTO [schedNo=" + schedNo + ", userNo=" + userNo + ", compNo=" + compNo + ", soppNo=" + soppNo
				+ ", custNo=" + custNo + ", contNo=" + contNo + ", id=" + id + ", schedName=" + schedName
				+ ", schedFrom=" + schedFrom + ", schedTo=" + schedTo + ", schedTitle=" + schedTitle + ", schedDesc="
				+ schedDesc + ", subschedNo=" + subschedNo + ", schedActive=" + schedActive + ", schedAllday="
				+ schedAllday + ", regDatetime=" + regDatetime + ", remindflag=" + remindflag + ", modDatetime="
				+ modDatetime + ", attrib=" + attrib + ", userName=" + userName + ", soppTitle=" + soppTitle
				+ ", custName=" + custName + ", schedType=" + schedType + ", schedPlace=" + schedPlace
				+ ", custmemberNo=" + custmemberNo + ", custmemberName=" + custmemberName + ", schedSdate=" + schedSdate
				+ ", schedEdate=" + schedEdate + ", schedStime=" + schedStime + ", schedEtime=" + schedEtime
				+ ", schedColor=" + schedColor + ", schedCat=" + schedCat + ", schedCatN=" + schedCatN + ", schedTypeN="
				+ schedTypeN + ", sTime=" + sTime + ", eTime=" + eTime + ", userId=" + userId + "]";
	}
	public SchedDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
