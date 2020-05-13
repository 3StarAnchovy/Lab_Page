package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import user.User;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDAO() { 
		try {
			String dbURL = "jdbc:mysql://localhost:3306/LAB_PAGE";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace(); 
		}
	}

	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) 
					return 1; //로그인 성공
				else
					return 0;//비번 불일치
			}
			return -1; //아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //DB오류
	}
	
	public int Join(User user, String birthday,String userProfileSrc) {
		//?는 VALUE를 나중에 설정할 때 사용.
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {		
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,user.getUserID());
			pstmt.setString(2,user.getUserPassword());
			pstmt.setString(3,user.getUserEmail());
			pstmt.setString(4,user.getUserName());
			pstmt.setString(5,user.getUserPhnum());
			pstmt.setString(6,userProfileSrc);
			pstmt.setString(7,birthday);
			pstmt.setInt(8,0);
			pstmt.setInt(9,1);
			pstmt.setInt(10,getNext());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		//INSERT 실행하면 반드시 0이상 반환 --> -1반환되면 오류
		return -1; //DB오류
	}
	public User getUser(String userID) { //마이페이지 작성을 위해
		String SQL = "SELECT * FROM USER WHERE userID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userID); // ?에 세션에 저장된 userID를 넣어 DB를 불러온다.
			rs=pstmt.executeQuery();
			if(rs.next()) {
				User user = new User();
				user.setUserID(rs.getString(1));
				user.setUserPassword(rs.getString(2));
				user.setUserEmail(rs.getString(3));
				user.setUserName(rs.getString(4));
				user.setUserPhnum(rs.getString(5));
				user.setUserProfileSrc(rs.getString(6));
				user.setUserBirthday(rs.getString(7));
				user.setUserPower(rs.getInt(8));
				user.setUserAvailable(rs.getInt(9));
				user.setUserNumber(rs.getInt(10));
				return user;
			}		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; //데이터베이스 오류
	}
	public int getNext() {
		String SQL = "SELECT userNumber FROM USER ORDER BY userNumber DESC";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //첫번째 게시물인 경우
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
}
