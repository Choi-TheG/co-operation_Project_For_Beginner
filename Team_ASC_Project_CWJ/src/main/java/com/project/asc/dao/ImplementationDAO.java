package com.project.asc.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.asc.vo.BoardVO;

@Repository("implementationDAO")
public class ImplementationDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public boolean insertImplementation(BoardVO board) throws SQLException {
		// TODO Auto-generated method stub
		boolean flag = false;
		int affectedCount = sqlSession.insert("mapper.impl.insertImplementation", board);
		if (affectedCount>0) {
			flag = true;
		}
		return flag;
	}

	public ArrayList<BoardVO> selectImplementation(String projectSeq) throws SQLException {
		// TODO Auto-generated method stub
		ArrayList<BoardVO> board = (ArrayList)sqlSession.selectList("mapper.impl.selectImplementation", projectSeq);
		return board;
	}

	public boolean deleteFile(String fileName) throws SQLException {
		// TODO Auto-generated method stub
		boolean flag = false;
		int affectedCount = sqlSession.delete("mapper.impl.deleteImplementationFile", fileName);
		if(affectedCount>0) {
			flag = true;
		}
		return flag;
	}

	public boolean deleteImplementation(String boardSeq) throws SQLException {
		// TODO Auto-generated method stub
		boolean flag = false;
		int affectedCount = sqlSession.delete("mapper.impl.deleteImplementation", boardSeq);
		if(affectedCount>0) {
			flag = true;
		}
		return flag;
	}

	public BoardVO selectOneImplementation(String boardSeq) throws SQLException {
		// TODO Auto-generated method stub
		BoardVO board = sqlSession.selectOne("mapper.impl.selectOneImplementation", boardSeq);
		return board;
	}

	public boolean updateImplementation(BoardVO board) throws SQLException {
		// TODO Auto-generated method stub
		boolean flag = false;
		int affectedCount = sqlSession.update("mapper.impl.updateImplementation", board);
		if(affectedCount>0) {
			flag = true;
		}
		return flag;
	}

	public int totalBoardNum(String projectSeq) {
		// TODO Auto-generated method stub
		int totalBoardNum = sqlSession.selectOne("mapper.impl.selectTotalImplementationNum", projectSeq);
		return totalBoardNum;
	}

	public ArrayList<BoardVO> selectImplementationPaging(String projectSeq, int startRowNum, int viewRows) {
		// TODO Auto-generated method stub
		BoardVO vo = new BoardVO();
		vo.setProjectSeq(Integer.parseInt(projectSeq));
		vo.setStartRowNum(startRowNum);
		vo.setViewRows(viewRows);
		ArrayList<BoardVO> board = (ArrayList)sqlSession.selectList("mapper.impl.selectImplementationListPaging", vo);
		return board;
	}

	public ArrayList<BoardVO> selectTeamMember(String projectSeq) throws SQLException {
		// TODO Auto-generated method stub
		ArrayList<BoardVO> vo = (ArrayList)sqlSession.selectList("mapper.impl.selectTeamMember", projectSeq);
		return vo;
	}

	public int searchImplNum(BoardVO board) throws SQLException {
		// TODO Auto-generated method stub
		int searchImplNum = sqlSession.selectOne("mapper.impl.searchImplementationCount", board);
		return searchImplNum;
	}

	public ArrayList<BoardVO> searchImplementation(BoardVO board) throws SQLException {
		// TODO Auto-generated method stub
		ArrayList<BoardVO> searchList = (ArrayList)sqlSession.selectList("mapper.impl.searchImplementation", board);
		return searchList;
	}

	public ArrayList<BoardVO> selectSchedule(String projectSeq, String boardTitle, String userSeq) throws SQLException {
		// TODO Auto-generated method stub
		BoardVO vo = new BoardVO();
		vo.setProjectSeq(Integer.parseInt(projectSeq));
		vo.setBoardTitle(boardTitle);
		vo.setUserSeq(Integer.parseInt(userSeq));
		
		ArrayList<BoardVO> board = (ArrayList)sqlSession.selectList("mapper.impl.searchImplementationSchedule", vo);
		return board;
	}

}
