package com.project.asc.vo;

public class ReplyVO {
	private int replySeq;
	private int userSeq;
	private int boardSeq;
	private int projectSeq;
	private String replyContent;
	private String createDate;
	private String id;
	
	public ReplyVO() {}
	public ReplyVO(int replySeq, int userSeq, int boardSeq, int projectSeq, String replyContent, String createDate, String id) {
		this.replySeq = replySeq;
		this.userSeq = userSeq;
		this.boardSeq = boardSeq;
		this.projectSeq = projectSeq;
		this.replyContent = replyContent;
		this.createDate = createDate;
		this.id = id;
	}
	
	public int getReplySeq() {
		return replySeq;
	}
	public void setReplySeq(int replySeq) {
		this.replySeq = replySeq;
	}
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public int getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}
	public int getProjectSeq() {
		return projectSeq;
	}
	public void setProjectSeq(int projectSeq) {
		this.projectSeq = projectSeq;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
@Override
public String toString() {
	// TODO Auto-generated method stub
	return replySeq +","+ boardSeq;
}
}
