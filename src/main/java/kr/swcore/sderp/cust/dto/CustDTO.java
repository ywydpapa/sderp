package kr.swcore.sderp.cust.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
@ToString
public class CustDTO {
	
	private Integer custNo;
	private Integer compNo;
	private String custName;
	private String custVatno;
	private String custEmail;
	private String custVatemail;
	private String custBossname;
	private Integer custdataNo;
	private Integer catNo;
	private String dataStr;
	private Integer dataNum;
	private MultipartFile dataBlob;
	private String attrib;
	private Integer buyrNo;
	private String buyrName;
	private Integer ptncNo;
	private String ptncName;
	private String custYn;
	private String buyrYn;
	private String ptncYn;
	private String suppYn;
	private Integer supplyNo;
	private String supplyName;
	private String custVattype;
	private String custVatbiz;
	private String custVatmemo;
	private String custMname;
	private String custMrank;
	private String custMmobile;
	private String custMtel;
	private String custMemail;
	private String custMmemo;
	private String custPostno;
	private String custAddr;
	private String custAddr2;
	private String custTel;
	private String custFax;
	private String custMemo;
	private String compType;
	private String saleType;
	private Integer custData02no;
	private Integer custData03no;
	private Integer custData04no;

	public CustDTO() {
		super();
		// TODO Auto-generated constructor stub
	} 

}
