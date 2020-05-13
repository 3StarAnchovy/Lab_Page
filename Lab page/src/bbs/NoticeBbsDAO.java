package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class NoticeBbsDAO {

	private Connection conn;
	private ResultSet rs;

	public NoticeBbsDAO() { 
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
		return ""; //�����ͺ��̽� ����
	}
	
	public int getNext() {
		String SQL = "SELECT NoticeID FROM NOTICE ORDER BY NoticeID DESC";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //ù��° �Խù��� ���
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
	
	public int Write(String NoticeTitle, String userID,String userName, String NoticeContent, String filesrc) {
		String SQL = "INSERT INTO NOTICE VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
	   
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, NoticeTitle);
			pstmt.setString(3, NoticeContent);
			pstmt.setString(4, getDate());
			pstmt.setString(5, userID);
			pstmt.setString(6, userName );
			pstmt.setString(7, filesrc);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 1);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
	
	public ArrayList<NoticeBbs> getList(int pageNumber){
        String SQL = "SELECT * FROM NOTICE WHERE NoticeID< ? AND NoticeAvailable =1 ORDER BY NoticeID DESC LIMIT 10";
        //LIMIT 10 -> �ִ� 10������
        ArrayList<NoticeBbs> list = new ArrayList<NoticeBbs>(); //������ ���� ����Ʈ
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,getNext() - (pageNumber-1)*10);
			rs=pstmt.executeQuery();
			while(rs.next()) {  //���� ������ list�� NoticeBbs ��ü ����
				NoticeBbs notice = new NoticeBbs();
				notice.setNoticeID(rs.getInt(1));
				notice.setNoticeTitle(rs.getString(2));
				notice.setNoticeContent(rs.getString(3));
				notice.setNoticeDate(rs.getString(4));
				notice.setNoticeManager(rs.getString(5));
				notice.setNoticeManagerName(rs.getString(6));
				notice.setNoticefilesrc(rs.getString(7));
				notice.setNoticehit(rs.getInt(8));
				notice.setNoticeAvailable(rs.getInt(9));
				list.add(notice);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	
	public boolean nextPage(int pageNumber) { //����¡ ó��
		String SQL = "SELECT * FROM NOTICE WHERE NoticeID< ? AND NoticeAvailable =1";
		
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
		return false; //�����ͺ��̽� ����
	}
	
	public NoticeBbs getNotice(int NoticeID) {
		String SQL = "SELECT * FROM NOTICE WHERE NoticeID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,NoticeID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				NoticeBbs notice = new NoticeBbs();
				notice.setNoticeID(rs.getInt(1));
				notice.setNoticeTitle(rs.getString(2));
				notice.setNoticeContent(rs.getString(3));
				notice.setNoticeDate(rs.getString(4));
				notice.setNoticeManager(rs.getString(5));
				notice.setNoticeManagerName(rs.getString(6));
				notice.setNoticefilesrc(rs.getString(7));
				notice.setNoticehit(rs.getInt(8));
				notice.setNoticeAvailable(rs.getInt(9));
				return notice;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; //�����ͺ��̽� ����
	}
    public int hitMaker(int NoticeID) //��ȸ�� �߰�
    {
       String SQL = "UPDATE NOTICE SET Noticehit = Hit +1 WHERE NoticeID = ?";
       try {
          PreparedStatement pstmt = conn.prepareStatement(SQL);

          pstmt.setInt(1, NoticeID);

          return pstmt.executeUpdate();

       } catch (Exception e) {
          e.printStackTrace();
       	 }
       return -1; // �����ͺ��̽� ����
    }
}

