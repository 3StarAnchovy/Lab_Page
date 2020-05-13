package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class QuestionBbsDAO {
	private Connection conn;
	private ResultSet rs;

	public QuestionBbsDAO() { 
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
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터베이스 오류
	}
	
	public int getNext() {
		String SQL = "SELECT QuestionID FROM QUESTION ORDER BY QuestionID DESC";
		
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
	
	public int Write(String QuestionTitle, String QuestionContent, String QuestionManager, String userName, String type) {
		String SQL = "INSERT INTO QUESTION VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	   
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, QuestionTitle);
			pstmt.setString(3, QuestionContent);
			pstmt.setString(4, getDate());
			pstmt.setString(5, "null");
			pstmt.setString(6, QuestionManager);
			pstmt.setString(7, userName );
			pstmt.setString(8, "null");
			pstmt.setString(9, type);
			pstmt.setInt(10, 0);
			pstmt.setInt(11, 1);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public ArrayList<QuestionBbs> getList(int pageNumber){
        String SQL = "SELECT * FROM QUESTION WHERE QuestionID< ? AND QuestionAvailable =1 ORDER BY QuestionID DESC LIMIT 10";
        //LIMIT 10 -> 최대 10개까지
        ArrayList<QuestionBbs> list = new ArrayList<QuestionBbs>(); //데이터 담을 리스트
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,getNext() - (pageNumber-1)*10);
			rs=pstmt.executeQuery();
			while(rs.next()) {  //없을 때까지 list에 NoticeBbs 객체 저장
				QuestionBbs question = new QuestionBbs();
				question.setQuestionID(rs.getInt(1));
				question.setQuestionTitle(rs.getString(2));
				question.setQuestionContent(rs.getString(3));
				question.setQuestionDate(rs.getString(4));
				question.setQuestionCode(rs.getString(5));
				question.setQuestionManager(rs.getString(6));
				question.setQuestionManagerName(rs.getString(7));
				question.setQuestionfilesrc(rs.getString(8));
				question.setQuestionType(rs.getString(9));
				question.setQuestionhit(rs.getInt(10));
				question.setQuestionAvailable(rs.getInt(11));
				list.add(question);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	
	public boolean nextPage(int pageNumber) { //페이징 처리
		String SQL = "SELECT * FROM QUESTION WHERE QuestionID< ? AND QuestionAvailable =1";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,getNext() - (pageNumber-1)*10);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false; //데이터베이스 오류
	}
	
	public QuestionBbs getQuestion(int QuestionID) {
		String SQL = "SELECT * FROM QUESTION WHERE QuestionID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,QuestionID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				QuestionBbs question = new QuestionBbs();
				question.setQuestionID(rs.getInt(1));
				question.setQuestionTitle(rs.getString(2));
				question.setQuestionContent(rs.getString(3));
				question.setQuestionDate(rs.getString(4));
				question.setQuestionCode(rs.getString(5));
				question.setQuestionManager(rs.getString(6));
				question.setQuestionManagerName(rs.getString(7));
				question.setQuestionfilesrc(rs.getString(8));
				question.setQuestionType(rs.getString(9));
				question.setQuestionhit(rs.getInt(10));
				question.setQuestionAvailable(rs.getInt(11));
				return question;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; //데이터베이스 오류
	}
    public int hitMaker(int QuestionID) //조회수 추가
    {
       String SQL = "UPDATE QUESTION SET Questionhit = Hit +1 WHERE QuestionID = ?";
       try {
          PreparedStatement pstmt = conn.prepareStatement(SQL);

          pstmt.setInt(1, QuestionID);

          return pstmt.executeUpdate();

       } catch (Exception e) {
          e.printStackTrace();
       	 }
       return -1; // 데이터베이스 오류
    }
	public int CodeUpdate(int QuestionID, String QuestionCode, String Questionfilesrc) {
		String SQL = "UPDATE QUESTION SET QuestionCode = ?, Questionfilesrc=? WHERE QuestionID = ?";
		   
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, QuestionCode);
			pstmt.setString(2, Questionfilesrc);
			pstmt.setInt(3, QuestionID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
}
