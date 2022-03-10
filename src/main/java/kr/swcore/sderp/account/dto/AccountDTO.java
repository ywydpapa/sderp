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
    private String vatBuyerName;
    private String vatSellerName;
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
    private String vatTransDate;
    private String vatSerial;
    private String vatIssueType;
    private String vatEmail;
    private BigDecimal vatSum;
    private String custName;
    private int resultCount;

    private Integer bacId;
    private String bankCode;
    private String bacNo;
    private String bacSerial;
    private String bacIssueDate;
    private String lastUpdTime;
    private String bacOwner;
    private String bacType;
    private BigDecimal bacBalance;
    private Integer baclogId;
    private BigDecimal inAmt;
    private BigDecimal outAmt;
    private String baclogTime;
    private String logType;
    private String logRemark;
    private BigDecimal balanceAmt;
    private String branchCode;
    private String linkDoc;
    private BigDecimal bacLimit;
    private String bacMemo;
    private String bacBranch;
    private String bacTypeN;
    private String bankCodeN;
    private String bacStatus;
    
    private String regDatetime;
    private String issueDate;
    private int userNo;
    private String userName;
    private String dataTitle;
    private String dataQuanty;
    private String dataVat;
    private String dataAmt;
    private String dataTotal;
    private String dataRemark;
    private String vatDate;
    private String soppTitle;
    private int getNo;
    private int count;
    private String bacDesc;
    
    private String vatIssueDateFrom;
    private String vatIssueDateTo;
    
    private String listDateFrom;
    private BigDecimal amount;
    private BigDecimal tax;
    
    private int cardNo;
    private String depName;
    private String cardSerial;
    private String cardDivision;
    private String cardBank;
    private String cardStatus;
    private String cardMemo;
    private String cardIssueDate;
    private int cardLogNo;
    private String appContents;
    private String appSerial;
    private String useDivision;
    private String salesType;
    private int instPeriod;
    private BigDecimal appAmount;
    private String appExchange;
    private String appDate;
    private String appTime;
    private BigDecimal vatAmountB;
    private BigDecimal vatAmountS;
    private BigDecimal serialTotalB;
    private BigDecimal serialTotalS;
    private int custNo;
}

