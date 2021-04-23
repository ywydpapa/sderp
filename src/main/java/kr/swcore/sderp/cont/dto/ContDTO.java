package kr.swcore.sderp.cont.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;

@Getter
@Setter
@ToString
public class ContDTO implements Cloneable{

	private int contNo;
	private String contTitle;
	private int soppNo;
	private int exContNo;
	private int userNo;
	private int compNo;
	private int custNo;
	private String salesType;
	private int custmemberNo;
	private int maintcustNo;
	private int supplyNo;
	private int ptncNo;
	private String contOrddate;
	private String supplyDate;
	private String delivDate;
	private BigDecimal contAmt;
	private String freemaintSdate;
	private String freemaintEdate;
	private String vatYn;
	private String contArea;
	private String contType;
	private String contDesc;
	private String attrib;
	private String soppTitle;
	private String userName;
	private String custName;
	private String supplyName;
	private String custmemberName;
	private String ptncName;
	private String targetDatefrom;
	private String targetDateto;
	private int buyrNo;
	private String buyrName;
	private String businessType;
	private String contTypeN;
	private String cntrctMth;
	private String net_profit;

	// 확장
	private String exContName;
	private String targetType;
	private String targetYear;
	private String targetMonth;
	private Integer contTypeCount;

	public ContDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public Object clone() throws CloneNotSupportedException {
		return super.clone();
	}
}
