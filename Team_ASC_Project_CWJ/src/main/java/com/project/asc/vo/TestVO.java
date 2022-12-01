package com.project.asc.vo;

public class TestVO {
	private int testSeq;
	private int projectSeq;
	private String customer;
	private String manager;
	private int scenarioNo;
	private String scenarioData;
	private String expected;
	private String result;
	private String remark;
	private String insertRow;
	
	public TestVO() {
		super();
	}
	
	public TestVO(int testSeq, int projectSeq, String customer, String manager, int scenarioNo,
			String scenarioData, String expected, String result, String remark) {
		super();
		this.testSeq = testSeq;
		this.projectSeq = projectSeq;
		this.customer = customer;
		this.manager = manager;
		this.scenarioNo = scenarioNo;
		this.scenarioData = scenarioData;
		this.expected = expected;
		this.result = result;
		this.remark = remark;
	}
	
	public String getInsertRow() {
		return insertRow;
	}
	
	public void setInsertRow(int projectSeq, String manager) {
		this.projectSeq = projectSeq;
		this.manager = manager;
	}
	
	public int getTestSeq() {
		return testSeq;
	}
	
	public void setTestSeq(int testSeq) {
		this.testSeq = testSeq;
	}
	
	public int getProjectSeq() {
		return projectSeq;
	}
	
	public void setProjectSeq(int projectSeq) {
		this.projectSeq = projectSeq;
	}
	
	public String getCustomer() {
		return customer;
	}
	
	public void setCustomer(String customer) {
		this.customer = customer;
	}
	
	public String getManager() {
		return manager;
	}
	
	public void setManager(String manager) {
		this.manager = manager;
	}
	
	public int getScenarioNo() {
		return scenarioNo;
	}
	
	public void setScenarioNo(int scenarioNo) {
		this.scenarioNo = scenarioNo;
	}
	
	public String getScenarioData() {
		return scenarioData;
	}
	
	public void setScenarioData(String scenarioData) {
		this.scenarioData = scenarioData;
	}
	
	public String getExpected() {
		return expected;
	}
	
	public void setExpected(String expected) {
		this.expected = expected;
	}
	
	public String getResult() {
		return result;
	}
	
	public void setResult(String result) {
		this.result = result;
	}
	
	public String getRemark() {
		return remark;
	}
	
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	@Override
	public String toString() {
		return "TestVO [testSeq=" + testSeq + ", projectSeq=" + projectSeq + ", customer="
				+ customer + ", manager=" + manager + ", scenarioNo=" + scenarioNo + ", scenarioData=" + scenarioData
				+ ", expected=" + expected + ", result=" + result + ", remark=" + remark + "]";
	}
	
}
