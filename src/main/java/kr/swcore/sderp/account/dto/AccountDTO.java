package kr.swcore.sderp.account.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;

@Getter
@Setter
@ToString
public class AccountDTO {
    private Integer vatId;
    private Integer compNo;
    private Integer vatBuyerCustNo;
    private Integer vatSellerCustNo;
    private String vatStatus;
    private String vatNo;
    private String vatIssueDate;
    private String vatTradeDate;
    private String vatType;
    private BigDecimal vatTax;
    private BigDecimal vatAmount;
    private String vatRemark;
    private String regDate;
    private String modDate;
    private String attrib;
    private Integer vatdataId;
    private String tradeDate;
    private Integer itemNo;
    private String itemTitle;
    private String itemUnit;
    private BigDecimal itemNetprice;
    private Integer itemQuty;
    private BigDecimal itemAmount;
    private BigDecimal itemVat;
    private BigDecimal itemRemark;
    private Integer linkedDocNo;
}
