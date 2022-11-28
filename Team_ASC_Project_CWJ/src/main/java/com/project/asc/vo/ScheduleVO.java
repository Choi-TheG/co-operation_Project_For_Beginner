package com.project.asc.vo;

public class ScheduleVO {
	
	private int scheduleSeq;
	private int projectSeq;
	private String scheduleCategory;
	private String startDate;
	private String endDate;
	private String content;
	private String finishYn;
	
	public ScheduleVO() {}
	
	public ScheduleVO(int scheduleSeq,int projectSeq,String scheduleCategory,String startDate,String endDate,String content,String finishYn) {
		this.scheduleSeq = scheduleSeq;
		this.projectSeq = projectSeq;
		this.scheduleCategory = scheduleCategory;
		this.startDate = startDate;
		this.endDate = endDate;
		this.content = content;
		this.finishYn = finishYn;
	}
	
	public int getScheduleSeq() {
		return scheduleSeq;
	}

	public void setScheduleSeq(int scheduleSeq) {
		this.scheduleSeq = scheduleSeq;
	}

	public int getProjectSeq() {
		return projectSeq;
	}

	public void setProjectSeq(int projectSeq) {
		this.projectSeq = projectSeq;
	}

	public String getScheduleCategory() {
		return scheduleCategory;
	}

	public void setScheduleCategory(String scheduleCategory) {
		this.scheduleCategory = scheduleCategory;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFinishYn() {
		return finishYn;
	}

	public void setFinishYn(String finishYn) {
		this.finishYn = finishYn;
	}

	@Override
	public String toString() {
		return "scheduleSeq : " + this.scheduleSeq + "/ projectSeq : " + this.projectSeq + "/ scheduleCategory : " + this.scheduleCategory +
			   "/ startDate : " + this.startDate + "/ endDate : " + this.endDate + "/ content : " + this.content + "/ finishYn : " + finishYn;
	}
}
