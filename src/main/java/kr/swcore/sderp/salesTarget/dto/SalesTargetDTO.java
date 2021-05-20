package kr.swcore.sderp.salesTarget.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;
import java.util.List;

@Getter
@Setter
@ToString
public class SalesTargetDTO {
	private Integer compNo;
	private Integer deptNo;
	private Integer userNo;
	private String targetYear;
	private String targetType;
	private Integer mm01;
	private Integer mm02;
	private Integer mm03;
	private Integer mm04;
	private Integer mm05;
	private Integer mm06;
	private Integer mm07;
	private Integer mm08;
	private Integer mm09;
	private Integer mm10;
	private Integer mm11;
	private Integer mm12;
	private String attrib;
	
	// 확장
	private Integer orgId;
	private String userName;
	private List<SalesTargetDTO> salesTargetlist;
	private String targetMonth;
	private BigDecimal percent;
	private BigDecimal profitTarget;
	private BigDecimal salesTarget;
	private BigDecimal overTarget;

	// VIEW 전용 변수 확장
	private String monthDate_Group;
	private String salesTarget_Group;
	private String profitTarget_Group;
	private String percent_Group;
	private String overTarget_Group;
	private String cnt01_Group;
	private String cnt01_SUM_Group;
	private String cnt02_Group;
	private String cnt02_SUM_Group;
	private String cnt03_Group;
	private String cnt03_SUM_Group;
	private String cnt04_Group;
	private String cnt04_SUM_Group;
	private String cnt05_Group;
	private String cnt05_SUM_Group;
	private String cnt06_Group;
	private String cnt06_SUM_Group;
	private String org_id_Group;
	private String org_title_Group;

}
