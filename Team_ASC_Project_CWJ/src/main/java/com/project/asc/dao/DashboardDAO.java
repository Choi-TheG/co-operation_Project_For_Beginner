package com.project.asc.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.asc.vo.BoardVO;
import com.project.asc.vo.DocumentsVO;

@Repository("dashboardDAO")
public class DashboardDAO {

	@Autowired
	private SqlSession sqlSession;

	public ArrayList<BoardVO> selectErrorBoard(String projectSeq) throws SQLException {
		// TODO Auto-generated method stub

		ArrayList<BoardVO> list = (ArrayList)sqlSession.selectList("mapper.board.selectBoardByProjectSeqForDashboard", projectSeq);
		return list;
	}

	public ArrayList<DocumentsVO> selectAllDocuments(String projectSeq) {
		ArrayList<DocumentsVO> dash = null;
		dash = (ArrayList)sqlSession.selectList("mapper.documents.selectDashboardList",projectSeq);
		for(DocumentsVO vo : dash) {
			System.out.println(vo);
		}
		return dash;
	}
}
