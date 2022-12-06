package com.project.asc.vo;

public class MinutesVO {
	
	private int minutesSeq;
	private int userSeq;
	private int projectSeq;
	private String attendees;
	private String extraPerson;
	private String meetingPlace;
	private String meetingTitle;
	private String meetingContent;
	private String meetingResult;
	private String meetingRemark;
	private String startTime;
	private String endTime;
	private int startRowNum;
	private int viewRows;
	private String searchDate;
	
	public MinutesVO() {}
	
	public MinutesVO(int minutesSeq, int userSeq, int projectSeq, String attendees, String extraPerson, String meetingPlace
			, String meetingTitle, String meetingContent, String meetingResult, String meetingRemark
			, String startTime, String endTime, int startRowNum, int viewRows, String searchDate) {
		this.minutesSeq = minutesSeq;
		this.userSeq = userSeq;
		this.projectSeq = projectSeq;
		this.attendees = attendees;
		this.extraPerson = extraPerson;
		this.meetingPlace = meetingPlace;
		this.meetingTitle = meetingTitle;
		this.meetingContent = meetingContent;
		this.meetingResult = meetingResult;
		this.meetingRemark = meetingRemark;
		this.startTime = startTime;
		this.endTime = endTime;
		this.startRowNum = startRowNum;
		this.viewRows = viewRows;
		this.searchDate = searchDate;
	}

	public int getMinutesSeq() {
		return minutesSeq;
	}

	public void setMinutesSeq(int minutesSeq) {
		this.minutesSeq = minutesSeq;
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

	public String getAttendees() {
		return attendees;
	}

	public void setAttendees(String attendees) {
		this.attendees = attendees;
	}
	
	public String getExtraPerson() {
		return extraPerson;
	}

	public void setExtraPerson(String extraPerson) {
		this.extraPerson = extraPerson;
	}

	public String getMeetingPlace() {
		return meetingPlace;
	}

	public void setMeetingPlace(String meetingPlace) {
		this.meetingPlace = meetingPlace;
	}

	public String getMeetingTitle() {
		return meetingTitle;
	}

	public void setMeetingTitle(String meetingTitle) {
		this.meetingTitle = meetingTitle;
	}

	public String getMeetingContent() {
		return meetingContent;
	}

	public void setMeetingContent(String meetingContent) {
		this.meetingContent = meetingContent;
	}

	public String getMeetingResult() {
		return meetingResult;
	}

	public void setMeetingResult(String meetingResult) {
		this.meetingResult = meetingResult;
	}

	public String getMeetingRemark() {
		return meetingRemark;
	}

	public void setMeetingRemark(String meetingRemark) {
		this.meetingRemark = meetingRemark;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
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

	public String getSearchDate() {
		return searchDate;
	}

	public void setSearchDate(String searchDate) {
		this.searchDate = searchDate;
	}
}
