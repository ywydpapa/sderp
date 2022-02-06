package kr.swcore.sderp.pps.dto;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;

@Getter
@Setter
@ToString
public class PpsDTO {

    private Integer ppsId;
    private Integer compNo;
    private String buyerCode;
    private String buyerName;
    private String buyerArea;
    private String buyerAreacode;
    private Integer reqNo;
    private String reqItemcode;
    private String reqItem;
    private BigDecimal itemNetprice;
    private Integer itemQty;
    private String itemUnit;
    private BigDecimal itemAmount;
    private String contractTitle;
    private Integer modQty;
    private BigDecimal modAmount;
    private String contractDate;
    private String deliveryDate;
    private String deliveryPlace;
    private String regDate;
    private String modDate;
    private String attrib;
}
