package com.project.asc.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.asc.dao.DashboardDAO;
import com.project.asc.vo.BoardVO;
import com.project.asc.vo.DocumentsVO;

@Service("dashboardService")
public class DashboardService {

	@Autowired
	private DashboardDAO dashboardDAO;

	public ArrayList<BoardVO> selectErrorBoard(String projectSeq) {
		ArrayList<BoardVO> list = null;
		try {
			list = dashboardDAO.selectErrorBoard(projectSeq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<DocumentsVO> productList(String projectSeq) {
		ArrayList<DocumentsVO> dash = null;
		dash = dashboardDAO.selectAllDocuments(projectSeq);
		
		return dash;
	}
}
