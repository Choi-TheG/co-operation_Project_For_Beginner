package com.project.asc.vo;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	private int boardSeq;
	private int userSeq;
	private int projectSeq;
	private String boardCategory;
	private String boardTitle;
	private String boardContent;
	private String completeYn;
	private String createDate;
	private String downloadPath;
	private String id;
	private int startRowNum;
	private int viewRows;
	private String fileName;
	private String realFileName;
	private MultipartFile uploadFile;
	private String filePath;
	private String keyword;
	private ArrayList<ReplyVO> replyList;

	public BoardVO() {}
	public BoardVO(int boardSeq, int userSeq, int projectSeq, String boardCategory, 
			String boardTitle, String boardContent, String completeYn, String createDate,String downloadPath, String id,int startRowNum,
			int viewRows,String fileName,MultipartFile uploadFile, String filePath,String keyword, String realFileName) {
		this.boardSeq = boardSeq;
		this.userSeq = userSeq;
		this.projectSeq = projectSeq;
		this.boardCategory = boardCategory;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.completeYn = completeYn;
		this.createDate = createDate;
		this.downloadPath = downloadPath;
		this.id = id;
		this.startRowNum = startRowNum;
		this.viewRows = viewRows;
		this.fileName = fileName;
		this.uploadFile = uploadFile;
		this.filePath = filePath;
		this.keyword = keyword;
		this.realFileName = realFileName;
	}
	
	public ArrayList<ReplyVO> getReplyList() {
		return replyList;
	}
	public void setReplyList(ArrayList<ReplyVO> replyList) {
		this.replyList = replyList;
	}
	public String getRealFileName() {
		return realFileName;
	}
	public void setRealFileName(String realFileName) {
		this.realFileName = realFileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public int getProjectSeq() {
		return projectSeq;
	}
	public void setProjectSeq(int projectSeq) {
		this.projectSeq = projectSeq;
	}
	public String getBoardCategory() {
		return boardCategory;
	}
	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getCompleteYn() {
		return completeYn;
	}
	public void setCompleteYn(String completeYn) {
		this.completeYn = completeYn;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	};
	
	public String getDownloadPath() {
		return downloadPath;
	}
	public void setDownloadPath(String downloadPath) {
		this.downloadPath = downloadPath;
	}
	
	public int getStartRowNum() {
		return startRowNum;
	}
	
	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}
	
	public int getViewRows() {
		return viewRows;
	}
	
	public void setViewRows(int viewRows) {
		this.viewRows = viewRows;
	}
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return boardSeq+","+userSeq+","+projectSeq+","+boardCategory+","+boardTitle+","+boardContent+","+completeYn+","+createDate+","+fileName;
	}

}
