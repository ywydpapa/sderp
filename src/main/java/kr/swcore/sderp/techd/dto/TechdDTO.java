package kr.swcore.sderp.techd.dto;

import kr.swcore.sderp.common.dto.PageDTO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TechdDTO extends PageDTO {

	private Integer techdNo;
	private Integer custNo;
	private Integer compNo;
	private Integer soppNo;
	private Integer contNo;
	private Integer custMemberNo;
	private Integer userNo;
	private String techdTitle;
	private String techdDesc;
	private String techdItemmodel;
	private String techdItemversion;
	private String techdPlace;
	private String techdFrom;
	private String techdTo;
	private String techdType;
	private String techdTypeN;
	private String techdSteps;
	private String techdStepsN;
	private String custName;
	private String userName;
	private String contTitle;
	private String soppTitle;
	private String regdatetime;
	private String modDatetime;
	private String targetDatefrom;
	private String targetDateto;
	private String schedType;
	private String cntrctMth;

	// 확장
	private String regSDate;	// 등록일 시작
	private String regEDate;	// 등록일 끝
	private String custMemberName;
	
	public TechdDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


}
