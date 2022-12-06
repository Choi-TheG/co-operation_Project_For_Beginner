package com.project.asc.vo;

public class TaskVO {
	private int taskSeq;
	private int projectSeq;
	private String title;
	private String step;
	private String mainTask;
	private String subTask;
	private int userSeq;
	private String finishYn;
	private int percentage;
	private String startDate;
	private String endDate;
	private String remark1;
	private String remark2;
	
	public TaskVO() {}
	
	public TaskVO(int taskSeq,int projectSeq,String title,String step,String mainTask,String subTask,int userSeq,String finishYn,
			int percentage,String startDate,String endDate,String remark1,String remark2) {
		this.taskSeq = taskSeq;
		this.projectSeq = projectSeq;
		this.title = title;
		this.step = step;
		this.mainTask = mainTask;
		this.subTask = subTask;
		this.userSeq = userSeq;
		this.finishYn = finishYn;
		this.percentage = percentage;
		this.startDate = startDate;
		this.endDate = endDate;
		this.remark1 = remark1;
		this.remark2 = remark2;
	}
	
	public int getTaskSeq() {
		return taskSeq;
	}

	public void setTaskSeq(int taskSeq) {
		this.taskSeq = taskSeq;
	}

	public int getProjectSeq() {
		return projectSeq;
	}

	public void setProjectSeq(int projectSeq) {
		this.projectSeq = projectSeq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStep() {
		return step;
	}

	public void setStep(String step) {
		this.step = step;
	}

	public String getMainTask() {
		return mainTask;
	}

	public void setMainTask(String mainTask) {
		this.mainTask = mainTask;
	}

	public String getSubTask() {
		return subTask;
	}

	public void setSubTask(String subTask) {
		this.subTask = subTask;
	}

	public int getUserSeq() {
		return userSeq;
	}

	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}

	public String getFinishYn() {
		return finishYn;
	}

	public void setFinishYn(String finishYn) {
		this.finishYn = finishYn;
	}

	public int getPercentage() {
		return percentage;
	}

	public void setPercentage(int percentage) {
		this.percentage = percentage;
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

	public String getRemark1() {
		return remark1;
	}

	public void setRemark1(String remark1) {
		this.remark1 = remark1;
	}

	public String getRemark2() {
		return remark2;
	}

	public void setRemark2(String remark2) {
		this.remark2 = remark2;
	}

	@Override
	public String toString() {
		return "taskSeq : " + this.taskSeq + 
			   "/ projectSeq : " + this.projectSeq + 
			   "/ title : " + this.title + 
			   "/ step : " + this.step +
			   "/ mainTask : " + this.mainTask + 
			   "/ subTask : " + this.subTask + 
			   "/ userSeq : " + this.userSeq + 
			   "/ finishYn : " + this.finishYn + 
			   "/ percentage : " + this.percentage + 
			   "/ startDate : " + this.startDate + 
			   "/ endDate : " + this.endDate + 
			   "/ remark1 : " + this.remark1 + 
			   "/ remark2 : " + this.remark2;
	}
}
