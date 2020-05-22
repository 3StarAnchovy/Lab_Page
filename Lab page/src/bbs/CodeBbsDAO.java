package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import bbs.CodeBbs;

public class CodeBbsDAO {
	private Connection conn;
	private ResultSet rs;
	
	public CodeBbsDAO() { 
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
		String SQL = "SELECT CodeID FROM CODE ORDER BY CodeID DESC";
		
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
	
	public int Write(String CodeTitle, String CodeContent, String userID, String userName, String CodeType) {
		String SQL = "INSERT INTO CODE VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
	   
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, CodeTitle);
			pstmt.setString(3, CodeContent);
			pstmt.setString(4, getDate());
			pstmt.setString(5, userID);
			pstmt.setString(6, userName);
			pstmt.setInt(7, 0);
			pstmt.setString(8,CodeType);
			pstmt.setInt(9, 1);
			
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public ArrayList<CodeBbs> getList(int pageNumber){
        String SQL = "SELECT * FROM CODE WHERE CodeID< ? AND CodeAvailable=1 ORDER BY CodeID DESC LIMIT 10";
        ArrayList<CodeBbs> list = new ArrayList<CodeBbs>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,getNext() - (pageNumber-1)*10);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				CodeBbs code = new CodeBbs();
				code.setCodeID(rs.getInt(1));
				code.setCodeTitle(rs.getString(2));
				code.setCodeContent(rs.getString(3));
				code.setCodeDate(rs.getString(4));
				code.setCodeManager(rs.getString(5));
				code.setCodeManagerName(rs.getString(6));
				code.setCodeLike(rs.getInt(7));
				code.setCodeType(rs.getString(8));
				code.setCodeAvailable(rs.getInt(9));
				list.add(code);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; //데이터베이스 오류
	}
	public ArrayList<CodeBbs> getTypeList(int pageNumber, String codetype){
        String SQL = "SELECT * FROM CODE WHERE CodeID< ? AND CodeAvailable=1 AND CodeType=? ORDER BY CodeID DESC LIMIT 10";
      
        ArrayList<CodeBbs> list = new ArrayList<CodeBbs>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,getNext() - (pageNumber-1)*10);
			pstmt.setString(2,codetype);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				CodeBbs code = new CodeBbs();
				code.setCodeID(rs.getInt(1));
				code.setCodeTitle(rs.getString(2));
				code.setCodeContent(rs.getString(3));
				code.setCodeDate(rs.getString(4));
				code.setCodeManager(rs.getString(5));
				code.setCodeManagerName(rs.getString(6));
				code.setCodeLike(rs.getInt(7));
				code.setCodeType(rs.getString(8));
				code.setCodeAvailable(rs.getInt(9));
				list.add(code);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; //데이터베이스 오류
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM CODE WHERE CodeID< ?";

		
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
	
	public CodeBbs getCode(int CodeID) {
		String SQL = "SELECT * FROM CODE WHERE CodeID = ?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,CodeID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				CodeBbs code = new CodeBbs();
				code.setCodeID(rs.getInt(1));
				code.setCodeTitle(rs.getString(2));
				code.setCodeContent(rs.getString(3));
				code.setCodeDate(rs.getString(4));
				code.setCodeManager(rs.getString(5));
				code.setCodeManagerName(rs.getString(6));
				code.setCodeLike(rs.getInt(7));
				code.setCodeType(rs.getString(8));
				code.setCodeAvailable(rs.getInt(9));
				return code;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; //비디오 없을때
	}
	
	public int update(int CodeID, String CodeTitle, String CodeContent) {
		String SQL = "UPDATE VIDEO SET CodeTitle = ?, CodeContent=? WHERE CodeID = ?";
		   
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, CodeTitle);
			pstmt.setString(2, CodeContent);
			pstmt.setInt(3, CodeID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	public int delete(int video_ID) {
		//글 삭제해도 글의 정보 남아있도록 available만 0으로 설정
		String SQL = "UPDATE CODE SET CodeAvailable=0 WHERE CodeID = ?";
		   
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, video_ID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	public int like(int CodeID) { //따봉
		PreparedStatement pstmt = null;
	        try {
			String SQL = "UPDATE CODE SET CodeLike = CodeLike + 1 WHERE CodeID = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,CodeID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
			
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}

}

