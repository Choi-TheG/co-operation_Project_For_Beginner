package com.project.asc.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.asc.dao.BoardDAO;
import com.project.asc.vo.BoardVO;
import com.project.asc.vo.ReplyVO;

@Service("boardService")
public class BoardService {
	
	@Autowired
	private BoardDAO boardDAO;
	
	public boolean insertBoard(BoardVO board) {
		// TODO Auto-generated method stub
		boolean flag = false;
		System.out.println("service");
		try {
			flag = boardDAO.insertBoard(board);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	public ArrayList<BoardVO> selectAllBoard(String projectSeq) {
		// TODO Auto-generated method stub
		System.out.println("1");
		ArrayList<BoardVO> list = null;
		try {
			list = boardDAO.selectAllBoard(projectSeq);
			System.out.println("2");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public BoardVO selectOneBoard(String boardSeq) {
		// TODO Auto-generated method stub
		BoardVO board = null;
		try {
			board = boardDAO.selectOneBoard(boardSeq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return board;
	}

	public boolean updateBoard(BoardVO board) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			flag = boardDAO.updateBoard(board);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	public boolean deleteBoard(String boardSeq) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			flag = boardDAO.deleteBoard(boardSeq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	public List<Object> searchId() {
		// TODO Auto-generated method stub
		List<Object> boardList = null;
		try {
			boardList = boardDAO.searchId();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return boardList;
	}

	public int selectAllCnt(String projectSeq) {
		// TODO Auto-generated method stub
		int listCnt = 0;
		try {
			listCnt = boardDAO.selectAllCnt(projectSeq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listCnt;
	}

	public int totalBoardNum(String projectSeq) {
		// TODO Auto-generated method stub
		int totalBoardNum = 0;
		try {
			totalBoardNum = boardDAO.totalBoardNum(projectSeq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return totalBoardNum;
	}

	public ArrayList<BoardVO> boardListPaging(String projectSeq, int startRowNum, int viewRows) {
		// TODO Auto-generated method stub
		ArrayList<BoardVO> list = boardDAO.boardListPaging(projectSeq,startRowNum,viewRows);
		return list;
	}

	public ArrayList<BoardVO> searchBoard(BoardVO board) {
		// TODO Auto-generated method stub
		ArrayList<BoardVO> searchList = null;
		try {
			searchList = boardDAO.searchBoard(board);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return searchList;
	}

	public int searchBoardNum(BoardVO board) {
		// TODO Auto-generated method stub
		int totalBoardNum = 0;
		try {
			totalBoardNum = boardDAO.searchBoardNum(board);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return totalBoardNum;
	}
	
	public boolean deleteFile(String boardSeq) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
		   flag = boardDAO.deleteFile(boardSeq);
		} catch (SQLException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		}
		return flag;
	}

	public boolean writeReply(ReplyVO reply) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			flag = boardDAO.writeReply(reply);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return flag;
	}

	public ArrayList<ReplyVO> selectReply(String boardSeq) {
		// TODO Auto-generated method stub
		ArrayList<ReplyVO> reply = null;
		try {
			reply = boardDAO.selectReply(boardSeq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reply;
	}

	public boolean deleteReply(String replySeq) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			flag = boardDAO.deleteReply(replySeq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	public boolean updateReply(ReplyVO reply) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			flag = boardDAO.updateReply(reply);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	public String selectReplyCount(ReplyVO reply) {
		// TODO Auto-generated method stub
		String count = "";
		try {
			count = boardDAO.selectReplyCount(reply);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

}
