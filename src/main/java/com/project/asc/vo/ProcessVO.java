package com.project.asc.vo;

public class ProcessVO {

	private int processSeq;
	private int projectSeq;
	private String projectFinish;
	private String documentFinish;
	private String functionFinish;
	private String wbsFinish;
	private String implementationFinish;
	private String testFinish;
	private String complete;
	
	public ProcessVO() {}
	
	public ProcessVO(int processSeq, int projectSeq, String projectFinish, String documentFinish, String functionFinish, String wbsFinish
			, String implementationFinish, String testFinish, String complete) {
		this.processSeq = processSeq;
		this.projectSeq = projectSeq;
		this.projectFinish = projectFinish;
		this.documentFinish = documentFinish;
		this.functionFinish = functionFinish;
		this.wbsFinish = wbsFinish;
		this.implementationFinish = implementationFinish;
		this.testFinish = testFinish;
		this.complete = complete;
	}

	public int getProcessSeq() {
		return processSeq;
	}

	public void setProcessSeq(int processSeq) {
		this.processSeq = processSeq;
	}

	public int getProjectSeq() {
		return projectSeq;
	}

	public void setProjectSeq(int projectSeq) {
		this.projectSeq = projectSeq;
	}

	public String getProjectFinish() {
		return projectFinish;
	}

	public void setProjectFinish(String projectFinish) {
		this.projectFinish = projectFinish;
	}

	public String getDocumentFinish() {
		return documentFinish;
	}

	public void setDocumentFinish(String documentFinish) {
		this.documentFinish = documentFinish;
	}

	public String getFunctionFinish() {
		return functionFinish;
	}

	public void setFunctionFinish(String functionFinish) {
		this.functionFinish = functionFinish;
	}

	public String getWbsFinish() {
		return wbsFinish;
	}

	public void setWbsFinish(String wbsFinish) {
		this.wbsFinish = wbsFinish;
	}

	public String getImplementationFinish() {
		return implementationFinish;
	}

	public void setImplementationFinish(String implementationFinish) {
		this.implementationFinish = implementationFinish;
	}

	public String getTestFinish() {
		return testFinish;
	}

	public void setTestFinish(String testFinish) {
		this.testFinish = testFinish;
	}

	public String getComplete() {
		return complete;
	}

	public void setComplete(String complete) {
		this.complete = complete;
	}

}
