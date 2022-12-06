package com.project.asc.vo;

public class WbsDetailVO {
	private int WbsDetailSeq;
	private int taskSeq;
	private int userSeq;
	private String operation;
	private String date;
	private String startTime;
	private String endTime;
	private String leadTime;
	private int updateCount;
	private String updateReason;
	private String finishYn;
	
	public WbsDetailVO(){}
	
	public WbsDetailVO(int WbsDetailSeq,int taskSeq,int userSeq,String operation,String date,
			String startTime,String endTime,String leadTime,int updateCount,String updateReason,String finishYn) {
		this.WbsDetailSeq = WbsDetailSeq;
		this.taskSeq = taskSeq;
		this.userSeq = userSeq;
		this.operation = operation;
		this.date = date;
		this.startTime = startTime;
		this.endTime = endTime;
		this.leadTime = leadTime;
		this.updateCount = updateCount;
		this.updateReason = updateReason;
		this.finishYn = finishYn;
	}

	public int getWbsDetailSeq() {
		return WbsDetailSeq;
	}

	public void setWbsDetailSeq(int wbsDetailSeq) {
		WbsDetailSeq = wbsDetailSeq;
	}

	public int getTaskSeq() {
		return taskSeq;
	}

	public void setTaskSeq(int taskSeq) {
		this.taskSeq = taskSeq;
	}

	public int getUserSeq() {
		return userSeq;
	}

	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}

	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
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

	public String getLeadTime() {
		return leadTime;
	}

	public void setLeadTime(String leadTime) {
		this.leadTime = leadTime;
	}

	public int getUpdateCount() {
		return updateCount;
	}

	public void setUpdateCount(int updateCount) {
		this.updateCount = updateCount;
	}

	public String getUpdateReason() {
		return updateReason;
	}

	public void setUpdateReason(String updateReason) {
		this.updateReason = updateReason;
	}

	public String getFinishYn() {
		return finishYn;
	}

	public void setFinishYn(String finishYn) {
		this.finishYn = finishYn;
	}

	@Override
	public String toString() {
		return "WbsDeatil - WbsDetailSeq : " + this.WbsDetailSeq +
		    " / taskSeq : " + this.taskSeq +
		    " / userSeq : " + this.userSeq +
		    " / operation : " + this.operation +
		    " / date : " + this.date +
		    " / startTime : " + this.startTime +
		    " / endTime : " + this.endTime +
		    " / leadTime : " + this.leadTime +
		    " / updateCount : " + this.updateCount +
		    " / updateReason : " + this.updateReason +
		    " / finishYn : " + this.finishYn;
	}
}