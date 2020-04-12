package bbs;

import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BbsDAO {
	// dao : 데이터베이스 접근 객체의 약자
	private Connection conn; // connection:db에접근하게 해주는 객체
	// private PreparedStatement pstmt;
	private ResultSet rs;
	// mysql 처리부분
	public BbsDAO() {
		// 생성자를 만들어준다.
		try {
			String dbURL = "jdbc:mysql://localhost:3306/labpage?serverTimezone=UTC&useSSL=false";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.cj.jdbc.Driver");

			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {

			e.printStackTrace();

		}

	}

	// 현재의 시간을 가져오는 함수

	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // 데이터베이스 오류
	}

	// bbsID 게시글 번호 가져오는 함수

	public int getNext() {

		String SQL = "SELECT bbsID FROM bbs ORDER BY bbsID DESC";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				return rs.getInt(1) + 1;

			}

			return 1;// 첫 번째 게시물인 경우

		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; // 데이터베이스 오류

	}

	// 실제로 글을 작성하는 함수

	public int write(String bbsTitle, String userID, String bbsContent, int hit, int ref, String fileName,
			String fileRealname, String fileSrc, String thumbnailName, String thumbnailRealName) {

		String SQL = "INSERT INTO BBS VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, getNext());

			pstmt.setString(2, bbsTitle);

			pstmt.setString(3, userID);

			pstmt.setString(4, getDate());

			pstmt.setString(5, bbsContent);

			pstmt.setInt(6, 1);

			pstmt.setInt(7, hit);
			pstmt.setInt(8, ref);

			pstmt.setString(9, fileName);
			pstmt.setString(10, fileRealname);
			pstmt.setString(11, fileSrc);
			pstmt.setString(12, thumbnailName);
			pstmt.setString(13, thumbnailRealName);

			// hit~filesrc 추가

			return pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; // 데이터베이스 오류

	}

	public ArrayList<bbs> getList(int pageNumber) {

		String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";

		ArrayList<bbs> list = new ArrayList<bbs>();

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				bbs bbs = new bbs();

				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				bbs.setHit(rs.getInt(7));
				bbs.setRef(rs.getInt(8));
				bbs.setFileName(rs.getString(9));
				bbs.setFileRealName(rs.getString(10));
				bbs.setFileSrc(rs.getString(11)); // 썸네일 어디갔누 추가해야됨
				bbs.setThumbnailName(rs.getString(12));
				bbs.setThumbnailRealName(rs.getString(13));

				list.add(bbs);

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return list;

	}

	public ArrayList<bbs> getSearch(String search) { // 검색

		String SQL = "select * from bbs where bbsTitle LIKE ?";
		// 특정 단어 들어간거 싹 다 select
		ArrayList<bbs> list = new ArrayList<bbs>();

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, search);
			rs = pstmt.executeQuery();

			while (rs.next()) { // select 된거 빈즈에 셋팅
				bbs bbs = new bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				bbs.setHit(rs.getInt(7));
				bbs.setRef(rs.getInt(8));
				bbs.setFileName(rs.getString(9));
				bbs.setFileRealName(rs.getString(10));
				bbs.setFileSrc(rs.getString(11));
				bbs.setThumbnailName(rs.getString(12));
				bbs.setThumbnailRealName(rs.getString(13));
				System.out.println(bbs.getBbsTitle()); // db에서 가져온거 체크
				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean nextPage(int pageNumber) {

		String SQL = "SELECT * FROM bbs WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";

		ArrayList<bbs> list = new ArrayList<bbs>();

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				return true;

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return false;

	}

	public bbs getBbs(int bbsID) {

		String SQL = "SELECT * FROM BBS WHERE bbsID = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, bbsID);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				bbs bbs = new bbs();

				bbs.setBbsID(rs.getInt(1));

				bbs.setBbsTitle(rs.getString(2));

				bbs.setUserID(rs.getString(3));

				bbs.setBbsDate(rs.getString(4));

				bbs.setBbsContent(rs.getString(5));

				bbs.setBbsAvailable(rs.getInt(6));

				bbs.setBbsAvailable(rs.getInt(6));
				bbs.setHit(rs.getInt(7));
				bbs.setRef(rs.getInt(8));
				bbs.setFileName(rs.getString(9));
				bbs.setFileRealName(rs.getString(10));
				bbs.setFileSrc(rs.getString(11));
				bbs.setThumbnailName(rs.getString(12));
				bbs.setThumbnailRealName(rs.getString(13)); // 추가

				return bbs;

			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return null;
	}

	public int update(int bbsID, String bbsTitle, String bbsContent) {

		String SQL = "UPDATE BBS SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, bbsTitle);

			pstmt.setString(2, bbsContent);

			pstmt.setInt(3, bbsID);

			return pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; // 데이터베이스 오류

	}

	public int hitMaker(int bbsID) // 조회수 추가
	{
		String SQL = "UPDATE BBS SET HIT = HIT +1 WHERE bbsID = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, bbsID);

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	public int delete(int bbsID) {

		String SQL = "UPDATE BBS SET bbsAvailable = 0 WHERE bbsID = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, bbsID);

			return pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; // 데이터베이스 오류

	}

	public int like(String bbsTitle) { // 따봉

		PreparedStatement pstmt = null;

		try {

			String SQL = "UPDATE bbs SET ref = ref + 1 WHERE bbsTitle = ?";

			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, bbsTitle);

			return pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

			try {

				if (pstmt != null)
					pstmt.close();

				if (conn != null)
					conn.close();

			} catch (Exception e) {

				e.printStackTrace();

			}

		}

		return -1;

	}
}