package bbs;

public class bbs {

	private int bbsID;

	private String bbsTitle;

	private String userID;

	private String bbsDate;

	private String bbsContent;

	private int bbsAvailable;
	private int hit, ref; // 조회수,추천수 추가

	private String fileName, fileRealname, fileSrc; // 파일 관련 추가
	private String thumbnailName, thumbnailRealname; // 썸네일 관련 추가

	public int getBbsID() {

		return bbsID;

	}

	public void setBbsID(int bbsID) {

		this.bbsID = bbsID;

	}

	public String getBbsTitle() {

		return bbsTitle;

	}

	public void setBbsTitle(String bbsTitle) {

		this.bbsTitle = bbsTitle;

	}

	public String getUserID() {

		return userID;

	}

	public void setUserID(String userID) {

		this.userID = userID;

	}

	public String getBbsDate() {

		return bbsDate;

	}

	public void setBbsDate(String bbsDate) {

		this.bbsDate = bbsDate;

	}

	public String getBbsContent() {

		return bbsContent;

	}

	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}

	public int getBbsAvailable() {
		return bbsAvailable;
	}

	public void setBbsAvailable(int bbsAvailable) {
		this.bbsAvailable = bbsAvailable;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileRealName() {
		return fileRealname;
	}

	public void setFileRealName(String fileRealName) {
		this.fileRealname = fileRealName;
	}

	public String getFileSrc() {
		return fileSrc;
	}

	public void setFileSrc(String fileSrc) {
		this.fileSrc = fileSrc;
	}

	public String getThumbnailName() {
		return thumbnailName;
	}

	public void setThumbnailName(String thumbnailName) {
		this.thumbnailName = thumbnailName;
	}

	public String getThumbnailRealName() {
		return thumbnailRealname;
	}

	public void setThumbnailRealName(String thumbnailRealname) {
		this.thumbnailRealname = thumbnailRealname;
	}
}
