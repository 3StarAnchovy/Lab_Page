package user;

public class User {
	private String userID;
	private String userPassword;
	private String userEmail; 
	private String userName;
	private String userPhnum; 
	private String userProfileSrc;  //������ ����
	private String userBirthday;
	private int userPower; //������ ���� 0=����� 1=�Ŵ��� 2�� ������
	private int userAvailable; //ȸ������ -> ������ OR �Ŵ����� ���� ,ȸ�� ���� �� 1, Ż�� �� 0
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
