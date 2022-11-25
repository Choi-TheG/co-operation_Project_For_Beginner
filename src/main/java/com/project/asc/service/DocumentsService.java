package com.project.asc.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.asc.dao.DocumentsDAO;
import com.project.asc.vo.DocumentsVO;

@Service("documentsService")
public class DocumentsService {
	@Autowired
	private DocumentsDAO documentsDAO;
	
	// 문서관리 페이지 조회
	public ArrayList<DocumentsVO> readDocuments(String projectSeq) {
		ArrayList<DocumentsVO> list = null;
		list = documentsDAO.selectAllDocuments(projectSeq);
		
		return list;
	}
	
	// 문서관리 셀 추가
	public boolean insertDocument(String projectSeq) {
		boolean flag = false;
		flag = documentsDAO.insertDocument(projectSeq);
		
		return flag;
	}
	
	// 문서관리 수정페이지
	public DocumentsVO selectOneDocument(String documents) {
		DocumentsVO vo = null;
		vo = documentsDAO.selectOneDocument(documents);
		
		return vo;
	}
	
	// 문서관리 수정
	public boolean updateDocument(DocumentsVO vo) {
		boolean flag = false;
		flag = documentsDAO.updateDocument(vo);
		
		return flag;
	}
	
	//파일 업로드
	public boolean uploadFile(DocumentsVO vo) {
		boolean flag = false;
		flag = documentsDAO.uploadFile(vo);
		
		return flag;
	}
	
	// 문서관리 셀 삭제
		public boolean deleteDocument(String documentsSeq) {
			boolean flag = false;
			flag = documentsDAO.deleteDocument(documentsSeq);
			
			return flag;
		}
	
	/*
	public DocumentsVO readPlan(String projectSeq) {
		DocumentsVO doc = null;
		doc = documentsDAO.selectDocuments(projectSeq);
		
		return doc;
	}
	
	public DocumentsVO viewUpdatePlan(String documentsSeq) {
		DocumentsVO documents = null;
		documents = documentsDAO.viewUpdateDocuments(documentsSeq);
		
		return documents;
	}
	
	public boolean updatePlan(DocumentsVO documents) {
		boolean flag = false;
		documentsDAO.updateDocuments(documents);
		if(documentsDAO.updateDocuments(documents)) {
			flag = true;
		}
		return flag;
	}
	
	public boolean deletePlan(DocumentsVO documents) {
		boolean flag = false;
		documentsDAO.deleteDocuments(documents);
		if(documentsDAO.deleteDocuments(documents)) {
			flag = true;
		}
		
		return flag;
	}
	*/
}
