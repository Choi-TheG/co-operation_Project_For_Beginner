package com.project.asc.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.asc.dao.ImplementationDAO;
import com.project.asc.vo.BoardVO;

@Service("implementationService")
public class ImplementationService {

	@Autowired
	private ImplementationDAO implementationDAO;

	public boolean insertImplementation(BoardVO board) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			flag = implementationDAO.insertImplementation(board);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	public ArrayList<BoardVO> selectImplementation(String projectSeq) {
		// TODO Auto-generated method stub
		ArrayList<BoardVO> board = null;
		try {
			board = implementationDAO.selectImplementation(projectSeq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return board;
	}

	public boolean deleteFile(String fileName) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			flag = implementationDAO.deleteFile(fileName);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	public boolean deleteImplementation(String boardSeq) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			flag = implementationDAO.deleteImplementation(boardSeq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	public BoardVO selectOneImplementation(String boardSeq) {
		// TODO Auto-generated method stub
		BoardVO board = null;
		try {
			board = implementationDAO.selectOneImplementation(boardSeq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return board;
	}

	public boolean updateImplementation(BoardVO board) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			flag = implementationDAO.updateImplementation(board);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	public int totalBoardNum(String projectSeq) {
		// TODO Auto-generated method stub
		int totalBoardNum = implementationDAO.totalBoardNum(projectSeq);
		return totalBoardNum;
	}

	public ArrayList<BoardVO> selectImplementationPaging(String projectSeq, int startRowNum, int viewRows) {
		// TODO Auto-generated method stub
		ArrayList<BoardVO> board = implementationDAO.selectImplementationPaging(projectSeq,startRowNum,viewRows);
		return board;
	}

	public ArrayList<BoardVO> selectTeamMember(String projectSeq) {
		// TODO Auto-generated method stub
		ArrayList<BoardVO> teamMemberList = null;
		try {
			teamMemberList = implementationDAO.selectTeamMember(projectSeq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return teamMemberList;
	}

	public int searchImplNum(BoardVO board) {
		// TODO Auto-generated method stub
		int searchImplNum = 0;
		try {
			searchImplNum = implementationDAO.searchImplNum(board);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return searchImplNum;
	}

	public ArrayList<BoardVO> searchImplementation(BoardVO board) {
		// TODO Auto-generated method stub
		ArrayList<BoardVO> searchList = null;
		try {
			searchList = implementationDAO.searchImplementation(board);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return searchList;
	}

	public ArrayList<BoardVO> selectSchedule(String projectSeq, String boardTitle, String userSeq) {
		// TODO Auto-generated method stub
		ArrayList<BoardVO> board = null;
		try {
			board = implementationDAO.selectSchedule(projectSeq, boardTitle, userSeq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return board;
	}
}
