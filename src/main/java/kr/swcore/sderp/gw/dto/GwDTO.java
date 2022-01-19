package kr.swcore.sderp.gw.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;

@Getter
@Setter
@ToString
public class GwDTO {
	private Integer estNo;
	private String estId;
	private Integer estVer;
	private String estType;
	private String estTitle;
	private String estDesc;
	private Integer custNo;
    private String custName;
	private Integer soppNo;
	private String soppTitle;
	private Integer compNo;
    private Integer userNo;
    private String userName;
    private BigDecimal estAmt;
    private BigDecimal estAmount;
    private BigDecimal estVat;
    private float estDiscount;
    private BigDecimal estTotal;
    private String estDate;
    private Integer estItemNo;
    private String itemKinds;
    private String itemTitle;
    private Integer productNo;
    private String productName;
    private String productSpec;
    private Integer productQty;
    private Integer productNetprice;
    private Integer productVat;
    private Integer productAmount;
    private float productDis;
    private Integer productTotal;
    private String productRemark;
    private String regDate;
    private String modDate;
    private String attrib;
    private Integer docNo;
    private Integer docCrUserNo;
    private String docAppLvl;
    private String docType;
    private String docTitle;
    private Integer docStatus;
    private Integer linkCustNo;
    private Integer linkSoppNo;
    private Integer linkMasterdocNo;
    private String docDesc;
    private String docDate;
    private String docFormNo;
    private Integer docAmount;
    private Integer appLine;
    private Integer userNoCR;
    private Integer userNoIS;
    private Integer userNoAPP;
    private String appStatus;
    private String issueDate;
    private String appDate;
    private String appComment;
    private Integer attendId;
    private Integer attType;
    private String attStart;
    private String attEnd;
    private String attTitle;
    private String attDesc;
    private Integer attStatus;
    private Integer appId;
    private Integer getId;
    private String userIsName;
    
    private String vatSdate;
    private String vatEdate;
    private int getVersion;
    private int titleTotal;
    
    public GwDTO() {
        super();
    }
}
