package kr.swcore.sderp.user.dto;

public class UserDTO {
	private int userNo;
	private String userId;
	private String compId;
	private String userName;
	private String userPasswd;
	private String userRole;
	private String userKey;
	private String userOtp;
	private String compNo;
	private String userRank;
	private String userDept;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCompId() {
		return compId;
	}
	public void setCompId(String compId) {
		this.compId = compId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPasswd() {
		return userPasswd;
	}
	public void setUserPasswd(String userPasswd) {
		this.userPasswd = userPasswd;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
	public String getUserKey() {
		return userKey;
	}
	public void setUserKey(String userKey) {
		this.userKey = userKey;
	}
	public String getUserOtp() {
		return userOtp;
	}
	public void setUserOtp(String userOtp) {
		this.userOtp = userOtp;
	}
		
	public String getCompNo() {
		return compNo;
	}
	public void setCompNo(String compNo) {
		this.compNo = compNo;
	}
	public String getUserRank() {
		return userRank;
	}
	public void setUserRank(String userRank) {
		this.userRank = userRank;
	}
	public String getUserDept() {
		return userDept;
	}
	public void setUserDept(String userDept) {
		this.userDept = userDept;
	}
	@Override
	public String toString() {
		return "UserDTO [userNo=" + userNo + ", userId=" + userId + ", compId=" + compId + ", userName=" + userName
				+ ", userPasswd=" + userPasswd + ", userRole=" + userRole + ", userKey=" + userKey + ", userOtp="
				+ userOtp + ", compNo=" + compNo + ", userRank=" + userRank + ", userDept=" + userDept + "]";
	}
	public UserDTO() {
		
		// TODO Auto-generated constructor stub
	}

	

}
