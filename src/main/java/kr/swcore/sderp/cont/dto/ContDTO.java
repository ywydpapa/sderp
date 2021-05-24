package kr.swcore.sderp.cont.dto;

import kr.swcore.sderp.common.dto.PageDTO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;
import java.sql.Timestamp;

@Getter
@Setter
@ToString
public class ContDTO extends PageDTO implements Cloneable {

	private Integer contNo;
	private Integer compNo;
	private Integer soppNo;
	private String cntrctMth;
	private String contType;
	private Integer exContNo;
	private Integer userNo;
	private Integer custNo;
	private Integer custMemberNo;
	private String contTitle;
	private String contDesc;
	private Integer buyrNo;
	private Integer buyrMemberNo;
	private Integer ptncNo;
	private Integer ptncMemberNo;
	private Integer supplyNo;
	private Integer supplyMemberNo;
	private String contOrddate;
	private String supplyDate;
	private String delivDate;
	private BigDecimal contAmt;
	private String vatYn;
	private Integer net_profit;
	private String freemaintSdate;
	private String freemaintEdate;
	private String paymaintSdate;
	private String paymaintEdate;
	private String contArea;
	private String businessType;
	private String regDatetime;
	private String modDatetime;
	private String attrib;

	// 확장
	private int maintcustNo;
	private String soppTitle;
	private String userName;
	private String custName;
	private String supplyName;
	private String ptncName;
	private String targetDatefrom;
	private String targetDateto;
	private String buyrName;
	private String contTypeN;
	private String salesType;
	private String exContName;
	private String targetType;
	private String targetYear;
	private String targetMonth;
	private Integer contTypeCount;
	private Integer endCustmemberNo;
	private String endCustmemberName;
	private String regSDate;	// 등록일 시작
	private String regEDate;	// 등록일 끝
	private String soppDesc;
	private BigDecimal soppTargetAmt;
	private String soppTargetDate;
	private Integer soppType;
	private String soppStatus;	// TODO : 추후 DB에서 varchar -> int로 변경예정
	private Double soppSrate;
	private String soppSource;	// TODO : 출처 -> 삭제예정
	private String sopp2Desc;
	private Timestamp sopp2regDatetime;
	private String op_priority;
	private String soppTypeN;
	private String soppStatusN;
	private String cntrctMthN;
	private String custMemberName;
	private String buyrMemberName;
	// sopp 복사 끝

	private boolean maintIncludeCheck;	// 유지보수기간 기간포함 여부(기본값 true)
	
	public ContDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public Object clone() throws CloneNotSupportedException {
		return super.clone();
	}
}
