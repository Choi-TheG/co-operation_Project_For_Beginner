package com.project.asc.vo;

import java.util.ArrayList;

public class DashboardVO {
	private ArrayList<DocumentsVO> documentsList;
	
	public ArrayList<DocumentsVO> getDocumentsList(){
		return documentsList;
	}
	
	public void setDocList(ArrayList<DocumentsVO> documentsList) {
		this.documentsList = documentsList;
	}
}
