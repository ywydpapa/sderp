package kr.swcore.sderp.calendar.dto;

public class CalendarDTO {

	private int eventNo;
	private String schedTitle;
	private String schedFrom;
	private String schedTo;
	private String shcedDetail;
	private int schedNo;
	private int userNo;
	private int soppNo;
	private int custNo;
	private String userName;
	private String custName;
	private String soppTitle;
	private String title;
	private String start;
	private String end;
	private String allday;
	private int id;
	private String schedType;
	private String color;
	
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSchedType() {
		return schedType;
	}
	public void setSchedType(String schedType) {
		this.schedType = schedType;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getAllday() {
		return allday;
	}
	public void setAllday(String allday) {
		this.allday = allday;
	}
	public int getEventNo() {
		return eventNo;
	}
	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}
	public String getSchedTitle() {
		return schedTitle;
	}
	public void setSchedTitle(String schedTitle) {
		this.schedTitle = schedTitle;
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
	public String getShcedDetail() {
		return shcedDetail;
	}
	public void setShcedDetail(String shcedDetail) {
		this.shcedDetail = shcedDetail;
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
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getSoppTitle() {
		return soppTitle;
	}
	public void setSoppTitle(String soppTitle) {
		this.soppTitle = soppTitle;
	}
	@Override
	public String toString() {
		return "CalendarDTO [eventNo=" + eventNo + ", schedTitle=" + schedTitle + ", schedFrom=" + schedFrom
				+ ", schedTo=" + schedTo + ", shcedDetail=" + shcedDetail + ", schedNo=" + schedNo + ", userNo="
				+ userNo + ", soppNo=" + soppNo + ", custNo=" + custNo + ", userName=" + userName + ", custName="
				+ custName + ", soppTitle=" + soppTitle + ", title=" + title + ", start=" + start + ", end=" + end
				+ ", allday=" + allday + ", id=" + id + "]";
	}
	public CalendarDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
