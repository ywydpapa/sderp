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

	private int soppNo;
	private int compNo;
	private int userNo;
	private int custNo;
	private int custmemberNo;
	private String soppTitle;
	private int ptncNo;
	private int buyrNo;
	private String soppDesc;
	private BigDecimal soppTargetAmt;
	private String soppTargetDate;
	private String soppStatus;
	private int soppSrate;
	private String soppSource;
	private String userName;
	private String custName;
	private String ptncName;
	private String soppType;
	private String soppTypeN;
	private String soppStatusN;
	private Timestamp regDatetime;
	private String sopp2Desc;
	private Timestamp sopp2regDatetime;
	private String targetDatefrom;
	private String targetDateto;
	private String businessType;

	public SoppDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
