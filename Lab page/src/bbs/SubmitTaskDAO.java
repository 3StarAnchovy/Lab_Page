package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SubmitTaskDAO {
	private Connection conn;
	private ResultSet rs;

	public SubmitTaskDAO() { 
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
		String SQL = "SELECT SubmitTaskID FROM SUBMITTASK ORDER BY SubmitTaskID DESC";
		
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
	
	public int Write(int taskID,String userID, String userName, String Title, String Content, String file) {
		String SQL = "INSERT INTO SUBMITTASK VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
	   
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setInt(2, taskID);
			pstmt.setInt(3, 0);
			pstmt.setString(4, Title);
			pstmt.setString(5, Content);
			pstmt.setString(6, file);
			pstmt.setString(7, getDate());
			pstmt.setString(8, userID);
			pstmt.setString(9, userName);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public ArrayList<SubmitTask> getList(int pageNumber, int taskID){
        String SQL = "SELECT * FROM SUBMITTASK WHERE SubmitTaskID< ? AND TaskID =? ORDER BY SubmitTaskID DESC LIMIT 10";
        //LIMIT 10 -> 최대 10개까지
        ArrayList<SubmitTask> list = new ArrayList<SubmitTask>(); //데이터 담을 리스트
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,getNext() - (pageNumber-1)*10);
			pstmt.setInt(2,taskID);
			rs=pstmt.executeQuery();
			while(rs.next()) {  //없을 때까지 list에 NoticeBbs 객체 저장
				SubmitTask submittask = new SubmitTask();
				submittask.setSubmitTaskID(rs.getInt(1));
				submittask.setTaskID(rs.getInt(2));
				submittask.setConfirm(rs.getInt(3));
				submittask.setSubmitTaskTitle(rs.getString(4));
				submittask.setSubmitTaskContent(rs.getString(5));
				submittask.setSubmitTaskfile(rs.getString(6));
				submittask.setSubmitTaskDate(rs.getString(7));
				submittask.setSubmitTaskUserID(rs.getString(8));
				submittask.setSubmitTaskUserName(rs.getString(9));
				list.add(submittask);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	
	public boolean nextPage(int pageNumber) { //페이징 처리
		String SQL = "SELECT * FROM SUBMITTASK WHERE SubmitTaskID< ?";
		
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
	
	public SubmitTask getSubmitTask(int SubmitTaskID) {
		String SQL = "SELECT * FROM SUBMITTASK WHERE SubmitTaskID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,SubmitTaskID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				SubmitTask submittask = new SubmitTask();
				submittask.setSubmitTaskID(rs.getInt(1));
				submittask.setTaskID(rs.getInt(2));
				submittask.setConfirm(rs.getInt(3));
				submittask.setSubmitTaskTitle(rs.getString(4));
				submittask.setSubmitTaskContent(rs.getString(5));
				submittask.setSubmitTaskfile(rs.getString(6));
				submittask.setSubmitTaskDate(rs.getString(7));
				submittask.setSubmitTaskUserID(rs.getString(8));
				submittask.setSubmitTaskUserName(rs.getString(9));
				return submittask;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; //데이터베이스 오류
	}
	public void Confirm(int SubmitTaskID) {
		String SQL = "UPDATE SUBMITTASK SET confirm = ? WHERE SubmitTaskID = ?";
		   
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, 1);
			pstmt.setInt(2, SubmitTaskID);
		}catch(Exception e) {
			System.out.println("승인 오류입니다.");
		}
	}
}
