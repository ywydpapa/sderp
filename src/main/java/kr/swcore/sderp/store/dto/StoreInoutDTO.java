package kr.swcore.sderp.store.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;

@Getter
@Setter
@ToString
public class StoreInoutDTO {
    private int inoutNo;
    private String inoutType;
    private int inoutQty;
    private int storeNo;
    private String locationNo;
    private String comment;
    private String regDate;
    private String modDate;
    private String attrib;
    private int compNo;
    
    
    /* 23-02-14 �߰� */ 
    private int productNo;
    private String productName;
    private String serialNo;
    private BigDecimal inoutAmount;
    private BigDecimal inoutVat;
    private BigDecimal inoutNet;
    private BigDecimal inoutTotal;
    private String from;
    private String to;
    private int contNo;
    private String contTitle;
    private int getNo;
    private int soppNo;
    private int userNo;
    private BigDecimal productDefaultPrice;

  
    public StoreInoutDTO(){
        super();
    }
    
}
