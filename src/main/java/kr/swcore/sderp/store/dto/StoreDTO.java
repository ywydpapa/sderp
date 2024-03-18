package kr.swcore.sderp.store.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;

@Getter
@Setter
@ToString
public class StoreDTO {
    private int storeNo;
    private int compNo;
    private int contNo;
    private String contTitle;
    private int userNo;
    private String storeType;
    private int productNo;
    private String storeUnit;
    private int storeQty;
    private String locationNo;
    private String regDate;
    private String modDate;
    private String attrib;
    private String comment;
    private BigDecimal storeAmount;
    private String serialNo;
    /* 23-02-09 �߰��� */  
    private String productName;
    private int custNo;
    private String custName;
    private String productCategoryNo; 
    private String productCategoryName;
    private int soppNo;
    private String locationName;
    private String storeDate;
    private String releaseDate;
    private String orderDate;
    private String bklnDate;
    private String firstDetail;
    private String inventoryQty;
    private BigDecimal purchaseNet;
    private String serial;
    private String authCode;
    private String options;
    private String secondDetail;

    public StoreDTO(){
        super();
    }
    
}
