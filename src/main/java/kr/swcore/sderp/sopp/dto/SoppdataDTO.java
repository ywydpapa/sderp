package kr.swcore.sderp.sopp.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;

@Getter
@Setter
@ToString
public class SoppdataDTO {
		
	private Integer soppdataNo;
	private Integer soppNo;
	private Integer userNo;
	private String soppTitle;
	private Integer catNo;
	private Integer productNo;
	private Integer salesCustNo;
	private String catTitle;
	private String dataTitle;
	private String dataDesc;
	private String dataType;
	private Integer dataQuanty;
	private BigDecimal dataAmt;
	private BigDecimal dataNetprice;
	private String dataRemark;
	private String linkType;
	private String linkNo;
	private String attrib;
	private String regDatetime;

	// 확장
	private String salesCustNoN;
	private Integer productDataNo;

	public SoppdataDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

}
