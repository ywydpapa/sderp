package kr.swcore.sderp.sopp.dto;

import kr.swcore.sderp.common.dto.PageDTO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;
import java.sql.Timestamp;

@Getter
@Setter
@ToString
public class SoppDTO extends PageDTO {

	private Integer soppNo;
	private Integer compNo;
	private Integer userNo;
	private Integer custNo;
	private Integer custMemberNo;
	private Integer ptncNo;
	private Integer ptncMemberNo;
	private Integer buyrNo;
	private Integer buyrMemberNo;
	private String soppTitle;
	private String soppDesc;
	private BigDecimal soppTargetAmt;
	private String soppTargetDate;
	private Integer soppType;
	private String soppStatus;	// TODO : 추후 DB에서 varchar -> int로 변경예정
	private Double soppSrate;
	private String soppSource;	// TODO : 출처 -> 삭제예정
	private String attrib;
	private String regDatetime;
	private String modDatetime;
	private String sopp2Desc;
	private Timestamp sopp2regDatetime;
	private String op_priority;
	private Integer cntrctMth;
	private Integer custmemberNo;
	
	// 확장
	private Integer contNo;
	private Integer techdNo;
	private String userName;
	private String custName;
	private String buyrName;
	private String ptncName;
	private String custMemberName;
	private String soppTypeN;
	private String soppStatusN;
	private String cntrctMthN;
	private String targetDatefrom;
	private String targetDateto;
	private String targetDatefrom2;
	private String targetDateto2;

	private String businessType;	// TODO : 영업타입 -> 삭제예정

	public SoppDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
