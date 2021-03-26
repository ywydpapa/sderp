package kr.swcore.sderp.organiz.dto;

public class OrganizDTO {

	private int org_id;
	private int compNo;
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
	public int getOrg_id() {
		return org_id;
	}
	public void setOrg_id(int org_id) {
		this.org_id = org_id;
	}
	public int getCompNo() {
		return compNo;
	}
	public void setCompNo(int compNo) {
		this.compNo = compNo;
	}
	public String getOrg_code() {
		return org_code;
	}
	public void setOrg_code(String org_code) {
		this.org_code = org_code;
	}
	public String getOrg_title() {
		return org_title;
	}
	public void setOrg_title(String org_title) {
		this.org_title = org_title;
	}
	public String getOrg_level() {
		return org_level;
	}
	public void setOrg_level(String org_level) {
		this.org_level = org_level;
	}	
	public String getOrg_parentLv() {
		return org_parentLv;
	}
	public void setOrg_parentLv(String org_parentLv) {
		this.org_parentLv = org_parentLv;
	}
	public String getOrg_mcode() {
		return org_mcode;
	}
	public void setOrg_mcode(String org_mcode) {
		this.org_mcode = org_mcode;
	}
	public String getOrg_regdatetime() {
		return org_regdatetime;
	}
	public void setOrg_regdatetime(String org_regdatetime) {
		this.org_regdatetime = org_regdatetime;
	}
	public String getOrg_moddatetime() {
		return org_moddatetime;
	}
	public void setOrg_moddatetime(String org_moddatetime) {
		this.org_moddatetime = org_moddatetime;
	}
	public String getOrg_desc() {
		return org_desc;
	}
	public void setOrg_desc(String org_desc) {
		this.org_desc = org_desc;
	}
	public String getOrg_rolemap() {
		return org_rolemap;
	}
	public void setOrg_rolemap(String org_rolemap) {
		this.org_rolemap = org_rolemap;
	}
	public String getAttrib() {
		return attrib;
	}
	public void setAttrib(String attrib) {
		this.attrib = attrib;
	}
	@Override
	public String toString() {
		return "OrganizDTO [org_id=" + org_id + ", compNo=" + compNo + ", org_code=" + org_code + ", org_title="
				+ org_title + ", org_level=" + org_level + ", org_parentLv=" + org_parentLv + ", org_mcode=" + org_mcode
				+ ", org_regdatetime=" + org_regdatetime + ", org_moddatetime=" + org_moddatetime + ", org_desc="
				+ org_desc + ", org_rolemap=" + org_rolemap + ", attrib=" + attrib + "]";
	}
	public OrganizDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
