package kr.swcore.sderp.organiz.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrganizDTO {

	private Integer org_id;
	private Integer compNo;
	private String org_code;
	private String org_title;
	private String org_level;
	private String org_parentLv;
	private String org_mcode;
	private String org_regdatetime;
	private String org_moddatetime;
	private String org_desc;
	private String org_rolemap;
	private String attrib;
	private String org_color;

	public OrganizDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
