package kr.swcore.sderp.sched.dto;

import kr.swcore.sderp.common.dto.PageDTO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SchedDTO extends PageDTO {
		
	private Integer schedNo;
	private Integer userNo;
	private Integer compNo;
	private Integer soppNo;
	private Integer contNo;
	private Integer custNo;
	private Integer buyrNo;
	private Integer id;
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
	private String schedTypeN;
	private String schedPlace;
	private Integer custmemberNo;
	private String custmemberName;
	private String schedSdate;
	private String schedEdate;
	private String schedStime;
	private String schedEtime;
	private String schedColor;
	private String schedCat;
	private String schedCatN;
	private String sTime;
	private String eTime;
	private String userId;
	private String cntrctMth;


	// 확장
	private String buyrName;
	private Integer endCustNo;
	private String contName;
	private String regSDate;	// 등록일 시작
	private String regEDate;	// 등록일 끝

	public SchedDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
}
