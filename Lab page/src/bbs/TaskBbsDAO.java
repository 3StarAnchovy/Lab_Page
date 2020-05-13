package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class TaskBbsDAO {

	private Connection conn;
	private ResultSet rs;

	public TaskBbsDAO() { 
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
		String SQL = "SELECT TaskID FROM TASK ORDER BY TaskID DESC";
		
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
	
	public int Write(String TaskTitle, String userID,String userName, String TaskContent, String DoneDate) {
		String SQL = "INSERT INTO TASK VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
	   
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, TaskTitle);
			pstmt.setString(3, TaskContent);
			pstmt.setString(4, getDate());
			pstmt.setString(5, userID);
			pstmt.setString(6, userName );
			pstmt.setString(7, DoneDate);
			pstmt.setInt(8, 1);
			pstmt.setInt(9, 0);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
	
	public ArrayList<TaskBbs> getList(int pageNumber){
        String SQL = "SELECT * FROM TASK WHERE TaskID< ? AND TaskAvailable =1 ORDER BY TaskID DESC LIMIT 10";
        ArrayList<TaskBbs> list = new ArrayList<TaskBbs>(); //������ ���� ����Ʈ
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,getNext() - (pageNumber-1)*10);
			rs=pstmt.executeQuery();
			while(rs.next()) {  //���� ������ list�� NoticeBbs ��ü ����
				TaskBbs task = new TaskBbs();
				task.setTaskID(rs.getInt(1));
				task.setTaskTitle(rs.getString(2));
				task.setTaskContent(rs.getString(3));
				task.setTaskDate(rs.getString(4));
				task.setTaskManager(rs.getString(5));
				task.setTaskManagerName(rs.getString(6));
				task.setTaskDoneDate(rs.getString(7));
				task.setTaskAvailable(rs.getInt(8));
				task.setTaskHit(rs.getInt(9));
				list.add(task);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	
	public boolean nextPage(int pageNumber) { //����¡ ó��
		String SQL = "SELECT * FROM TASK WHERE TaskID< ? AND TaskAvailable =1";
		
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
	
	public TaskBbs getTask(int TaskID) {
		String SQL = "SELECT * FROM TASK WHERE TaskID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,TaskID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				TaskBbs task = new TaskBbs();
				task.setTaskID(rs.getInt(1));
				task.setTaskTitle(rs.getString(2));
				task.setTaskContent(rs.getString(3));
				task.setTaskDate(rs.getString(4));
				task.setTaskManager(rs.getString(5));
				task.setTaskManagerName(rs.getString(6));
				task.setTaskDoneDate(rs.getString(7));
				task.setTaskAvailable(rs.getInt(8));
				task.setTaskHit(rs.getInt(9));
				return task;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; //�����ͺ��̽� ����
	}
    public int hitMaker(int TaskID) //��ȸ�� �߰�
    {
       String SQL = "UPDATE TASK SET TaskHit =TaskHit+ 1 WHERE TaskID = ?";
       try {
          PreparedStatement pstmt = conn.prepareStatement(SQL);

          pstmt.setInt(1, TaskID);

          return pstmt.executeUpdate();

       } catch (Exception e) {
          e.printStackTrace();
       	 }
       return -1; // �����ͺ��̽� ����
    }
}
