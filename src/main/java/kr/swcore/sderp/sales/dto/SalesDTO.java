package kr.swcore.sderp.sales.dto;

import kr.swcore.sderp.common.dto.PageDTO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SalesDTO extends PageDTO {
	
	private Integer salesNo;
	private Integer soppNo;
	private Integer userNo;
	private Integer compNo;
	private Integer custNo;
	private Integer ptncNo;
	private String salesFrdatetime;
	private String salesTodatetime;
	private String salesPlace;
	private String salesType;
	private String regDatetime;
	private String modDatetime;
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
	private String schedType;

	// 확장
	private String regSDate;	// 등록일 시작
	private String regEDate;	// 등록일 끝
	private Integer buyrNo;
	private String buyrName;

	public SalesDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

}
