package kr.swcore.sderp.calendar.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter
@Setter
@ToString
public class CalendarDTO {

	private Integer eventNo;
	private String schedTitle;
	private String schedFrom;
	private String schedTo;
	private String shcedDetail;
	private Integer schedNo;
	private Integer userNo;
	private Integer soppNo;
	private Integer custNo;
	private String userName;
	private String custName;
	private String soppTitle;
	private String title;
	private String start;
	private String end;
	private String allday;
	private Integer id;
	private String schedType;
	private String color;
	private List organizationList;
	private Integer compNo;

	public CalendarDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
