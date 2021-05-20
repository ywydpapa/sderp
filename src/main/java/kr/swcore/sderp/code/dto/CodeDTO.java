package kr.swcore.sderp.code.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CodeDTO {

	private Integer codeNo;
	private Integer compNo;
	private String code01;
	private String code02;
	private String code03;
	private String desc01;
	private String desc02;
	private String desc03;
	private String value01;
	private String value02;
	private String value03;
	private String sortNo;
	private String regDatetime;
	private String modDatetime;
	private String attrib;
	private String compId;
	private String compName;
	private String compType;
	private String saleType;

	public CodeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

}
