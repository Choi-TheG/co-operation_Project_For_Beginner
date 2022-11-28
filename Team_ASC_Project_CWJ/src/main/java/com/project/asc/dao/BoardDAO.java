package com.project.asc.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.asc.vo.BoardVO;
import com.project.asc.vo.ReplyVO;

@Repository("boardDAO")
public class BoardDAO {

	@Autowired
	private SqlSession sqlSession;

	public boolean insertBoard(BoardVO board) throws SQLException {
		// TODO Auto-generated method stub
		boolean flag = false;
		int affectedCount = sqlSession.insert("mapper.board.insertBoard", board);
		if (affectedCount>0) {
			System.out.println(board);
			flag = true;
		}
		return flag;
	}

	public ArrayList<BoardVO> selectAllBoard(String projectSeq) throws SQLException {
		// TODO Auto-generated method stub
		ArrayList<BoardVO> list = (ArrayList)sqlSession.selectList("mapper.board.selectBoardByProjectSeq", projectSeq);
		return list;
	}

	public BoardVO selectOneBoard(String boardSeq) throws SQLException {
		// TODO Auto-generated method stub
		BoardVO board = sqlSession.selectOne("mapper.board.selectBoardByboardSeq", boardSeq);
		return board;
	}

	public boolean updateBoard(BoardVO board) throws SQLException {
		// TODO Auto-generated method stub
		boolean flag = false;
		int affectedCount = sqlSession.update("mapper.board.updateBoard", board);
		if(affectedCount>0) {
			flag = true;
		}
		return flag;
	}

	public boolean deleteBoard(String boardSeq) throws SQLException {
		// TODO Auto-generated method stub
		boolean flag = false;
		int affectedCount = sqlSession.delete("mapper.board.deleteBoard",boardSeq);
		if(affectedCount>0) {
			flag = true;
		}
		return flag;
	}

	public List<Object> searchId() throws SQLException {
		// TODO Auto-generated method stub
		List<Object> writerList = sqlSession.selectList("mapper.board.selectIdByUserSeq");
		return writerList;
	}

	public int selectAllCnt(String projectSeq) throws SQLException {
		// TODO Auto-generated method stub
		int listCnt = sqlSession.selectOne("mapper.board.boardCnt", projectSeq);
		return listCnt;
	}

	public int totalBoardNum(String projectSeq) throws SQLException {
		// TODO Auto-generated method stub
		int totalBoardNum = sqlSession.selectOne("mapper.board.selectTotalBoardNum", projectSeq);
		return totalBoardNum;
	}

	public ArrayList<BoardVO> boardListPaging(String projectSeq, int startRowNum, int viewRows) {
		// TODO Auto-generated method stub
		BoardVO board = new BoardVO();
		board.setProjectSeq(Integer.parseInt(projectSeq));
		board.setStartRowNum(startRowNum);
		board.setViewRows(viewRows);
		
		ArrayList<BoardVO> list = (ArrayList)sqlSession.selectList("mapper.board.selectBoardListPaging", board);
		

		return list;
	}

	public ArrayList<BoardVO> searchBoard(BoardVO board) throws SQLException {
		// TODO Auto-generated method stub
		
		ArrayList<BoardVO> searchList = (ArrayList)sqlSession.selectList("mapper.board.searchBoard", board);
		return searchList;
	}

	public int searchBoardNum(BoardVO board) throws SQLException {
		// TODO Auto-generated method stub
		int searchBoardNum = sqlSession.selectOne("mapper.board.searchBoardCount", board);
		return searchBoardNum;
	}
	public boolean deleteFile(String boardSeq) throws SQLException {
	    // TODO Auto-generated method stub
	    boolean flag = false;
	    int affectedCount = sqlSession.update("mapper.board.deleteFile", boardSeq);
	    if(affectedCount > 0) {
	       flag = true;
	    }
	    return flag;
	}

	public boolean writeReply(ReplyVO reply) throws SQLException {
		// TODO Auto-generated method stub
		boolean flag = false;
		int affectedCount = sqlSession.insert("mapper.board.insertReply", reply);
		if(affectedCount>0) {
			flag = true;
		}
		return flag;
	}

	public ArrayList<ReplyVO> selectReply(String boardSeq) throws SQLException {
		// TODO Auto-generated method stub
		ArrayList<ReplyVO> reply = (ArrayList)sqlSession.selectList("mapper.board.selectReplyByboardSeq", boardSeq);
		return reply;
	}

	public boolean deleteReply(String replySeq) throws SQLException {
		// TODO Auto-generated method stub
		boolean flag = false;
		int affectedCount = sqlSession.delete("mapper.board.deleteReply", replySeq);
		if(affectedCount>0) {
			flag = true;
		}
		return flag;
	}

	public boolean updateReply(ReplyVO reply) throws SQLException {
		// TODO Auto-generated method stub
		boolean flag = false;
		int affectedCount = sqlSession.update("mapper.board.updateReply", reply);
		if(affectedCount>0) {
			flag = true;
		}
		return flag;
	}

	public String selectReplyCount(ReplyVO reply)throws SQLException {
		// TODO Auto-generated method stub
		System.out.println(reply.getBoardSeq());
		System.out.println(reply.getReplySeq());
		System.out.println(reply);
		String selectReplyCount = sqlSession.selectOne("mapper.board.countReply", reply);
		System.out.println("count = "+selectReplyCount);
		return selectReplyCount;
	}
}
