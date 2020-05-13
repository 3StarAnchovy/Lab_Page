package user;

public class User {
	private String userID;
	private String userPassword;
	private String userEmail; 
	private String userName;
	private String userPhnum; 
	private String userProfileSrc;  //프로필 사진
	private String userBirthday;
	private int userPower; //관리자 권한 0=사용자 1=매니저 2는 관리자
	private int userAvailable; //회원권한 -> 관리자 OR 매니저가 승인 ,회원 가입 시 1, 탈퇴 시 0
	private int userNumber;
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhnum() {
		return userPhnum;
	}
	public void setUserPhnum(String userPhnum) {
		this.userPhnum = userPhnum;
	}
	public String getUserProfileSrc() {
		return userProfileSrc;
	}
	public void setUserProfileSrc(String userProfileSrc) {
		this.userProfileSrc = userProfileSrc;
	}
	public int getUserPower() {
		return userPower;
	}
	public void setUserPower(int userPower) {
		this.userPower = userPower;
	}
	public int getUserAvailable() {
		return userAvailable;
	}
	public void setUserAvailable(int userAvailable) {
		this.userAvailable = userAvailable;
	}
	public String getUserBirthday() {
		return userBirthday;
	}
	public void setUserBirthday(String userBirthday) {
		this.userBirthday = userBirthday;
	}
	public int getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(int userNumber) {
		this.userNumber = userNumber;
	}
}
