package kr.swcore.sderp.cust.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
@ToString
public class CustdataDTO{
	
	private Integer custdataNo;
	private Integer custNo;
	private Integer catNo;
	private String dataStr;
	private Integer dataNum;
	private MultipartFile dataBlob;
	private Date dataDate;
	private String attrib;

	public CustdataDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

}