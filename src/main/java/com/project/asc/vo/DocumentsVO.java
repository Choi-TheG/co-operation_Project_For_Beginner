package com.project.asc.vo;

import org.springframework.web.multipart.MultipartFile;

public class DocumentsVO {
	private int documentsSeq;
	private int projectSeq;
	private String documentsName;
	private String fileName;			// 업로드/다운로드 파일명
	private String realFileName;		// 시스템 업로드 파일명
	private MultipartFile uploadFile;   // 파일 업로드 ??
	private String updateTime;			// 업로드일자
	private String writer;				// 작성자
	private String teamLeader;
	
	
	public DocumentsVO() {
		super();
	}

	public DocumentsVO(int documentsSeq, int projectSeq, String documentsName, String fileName, String realFileName,
			MultipartFile uploadFile, String updateTime, String writer, String teamLeader) {
		super();
		this.documentsSeq = documentsSeq;
		this.projectSeq = projectSeq;
		this.documentsName = documentsName;
		this.fileName = fileName;
		this.realFileName = realFileName;
		this.uploadFile = uploadFile;
		this.updateTime = updateTime;
		this.writer = writer;
		this.teamLeader = teamLeader;
	}



	public int getDocumentsSeq() {
		return documentsSeq;
	}

	public void setDocumentsSeq(int documentsSeq) {
		this.documentsSeq = documentsSeq;
	}

	public int getProjectSeq() {
		return projectSeq;
	}

	public void setProjectSeq(int projectSeq) {
		this.projectSeq = projectSeq;
	}

	public String getDocumentsName() {
		return documentsName;
	}

	public void setDocumentsName(String documentsName) {
		this.documentsName = documentsName;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getRealFileName() {
		return realFileName;
	}

	public void setRealFileName(String realFileName) {
		this.realFileName = realFileName;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTeamLeader() {
		return teamLeader;
	}

	public void setTeamLeader(String teamLeader) {
		this.teamLeader = teamLeader;
	}

	@Override
	public String toString() {
		return "DocumentsVO [documentsSeq=" + documentsSeq + ", projectSeq=" + projectSeq + ", documentsName="
				+ documentsName + ", fileName=" + fileName + ", realFileName=" + realFileName + ", uploadFile="
				+ uploadFile + ", updateTime=" + updateTime + ", writer=" + writer + ", teamLeader=" + teamLeader + "]";
	}

}
