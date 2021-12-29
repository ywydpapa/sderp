package kr.swcore.sderp.gw.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;

@Getter
@Setter
@ToString
public class GwDTO {
    private Integer userNo;
    private Integer docNo;
    private Integer compNo;
    private String docTitle;
    private Integer estItemNo;
    private Integer docCrUserNo;
    private Integer docType;
    private Integer docStatus;
    private Integer linkMasterdocNo;
    private String docDesc;
    private Integer docFormNo;
    private Integer estNo;
    private String estType;
    private String estTitle;
    private String estDesc;
    private BigDecimal estAmt;
    private BigDecimal estVat;
    private BigDecimal estTotal;
    private float estDiscount;
    private Integer custNo;
    private Integer soppNo;
    private Integer productNo;
    private String productName;
    private String productSpec;
    private Integer productQty;
    private BigDecimal productNetprice;
    private BigDecimal productVat;
    private BigDecimal productAmount;
    private String productRemark;
    private String regDate;
    private String modDate;
    private String attrib;

    public GwDTO(Integer userNo) {
        super();
    }
}
