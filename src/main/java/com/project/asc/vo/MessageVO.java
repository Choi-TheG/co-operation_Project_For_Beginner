package com.project.asc.vo;

public class MessageVO {
	private int messageSeq;
	private int fromUserSeq;
	private String fromUserName;
	private int toUserSeq;
	private String toUserName;
	private String title;
	private String content;
	private String messageType;
	private int readCount;
	private String teamId;
	private String sendTime;
	
	public MessageVO() {}
	
	public MessageVO(int messageSeq,int fromUserSeq,String fromUserName,int toUserSeq,String toUserName,String title,String content,String messageType,
			int readCount,String teamId,String sendTime) {
		this.messageSeq = messageSeq;
		this.fromUserSeq = fromUserSeq;
		this.fromUserName = fromUserName;
		this.toUserSeq = toUserSeq;
		this.toUserName = toUserName;
		this.title = title;
		this.content = content;
		this.messageType = messageType;
		this.readCount = readCount;
		this.teamId = teamId;
		this.sendTime = sendTime;
	}
	
	public int getMessageSeq() {
		return messageSeq;
	}

	public void setMessageSeq(int messageSeq) {
		this.messageSeq = messageSeq;
	}

	public int getFromUserSeq() {
		return fromUserSeq;
	}

	public void setFromUserSeq(int fromUserSeq) {
		this.fromUserSeq = fromUserSeq;
	}

	public String getFromUserName() {
		return fromUserName;
	}

	public void setFromUserName(String fromUserName) {
		this.fromUserName = fromUserName;
	}

	public int getToUserSeq() {
		return toUserSeq;
	}

	public void setToUserSeq(int toUserSeq) {
		this.toUserSeq = toUserSeq;
	}

	public String getToUserName() {
		return toUserName;
	}

	public void setToUserName(String toUserName) {
		this.toUserName = toUserName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMessageType() {
		return messageType;
	}

	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public String getTeamId() {
		return teamId;
	}

	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}

	public String getSendTime() {
		return sendTime;
	}

	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}

	@Override
	public String toString() {
		return "messageSeq = " + messageSeq +
		"| fromUserSeq = " + fromUserSeq +
		"| fromUserName = " + fromUserName +
		"| toUserSeq = " + toUserSeq + 
		"| toUserName = " + toUserName +
		"| content = " + content + 
		"| messageType = " + messageType +
		"| readCount = " + readCount + 
		"| teamId = " + teamId +
		"| sendTime = " + sendTime;
	}
}
