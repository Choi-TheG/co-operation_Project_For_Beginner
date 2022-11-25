package com.project.asc.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.asc.vo.ProjectVO;
import com.project.asc.vo.UserVO;

@Repository("managerDAO")
public class ManagerDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	/* 검색된 회원 수 */
	public int searchUserCount(UserVO user) {
		int searchUserCount = sqlSession.selectOne("mapper.user.searchUserCount", user);

		return searchUserCount;
	}
	
	/* 검색 */
	public ArrayList<UserVO> searchUserList(String status,String keyword) {
		ArrayList<UserVO> list = null;

		UserVO user = new UserVO();
		
		user.setStatus(status);
		user.setKeyword(keyword);
		
		list = (ArrayList) sqlSession.selectList("mapper.user.searchUser", user);
		
		return list;
	}
	
	
	/* 검색 유저 페이징 리스트 */
	public ArrayList<UserVO> searchUserListPaging(UserVO user) {
		ArrayList<UserVO> list = null;

		list = (ArrayList) sqlSession.selectList("mapper.user.searchUserListPaging", user);

		return list;
	}
	/* 상태(status) 'N'으로 바꾸기 */
	public boolean updateUserStatus(int seq) {
		boolean flag = false;
		
		int affectedCount = sqlSession.update("mapper.user.updateUserStatus", seq);
		if(affectedCount > 0) {
			flag = true;
		}
		
		return flag;
	}
	
	/* 회원정보 수정 */
	public boolean updateUserInfo(UserVO user) {
		boolean flag = false;
		
		int affectedCount = sqlSession.update("mapper.user.updateUserInfo", user);
		if(affectedCount > 0) {
			flag = true;
		}
		
//		System.out.println("updateDAO");
		return flag;
	}
	
	/* 회원 상세정보 페이지 가기 */
	public UserVO selectUserInfo(int seq) {
		UserVO user = null;
		user = sqlSession.selectOne("mapper.user.selectUserInfo", seq);
		
		return user;
	}
	
	/* 회원 목록 페이징 */
	public ArrayList<UserVO> userListPaging(int startRowNum, int viewRows) {
		UserVO user = new UserVO();
		user.setStartRowNum(startRowNum);
		user.setViewRows(viewRows);
		
		ArrayList<UserVO> list = (ArrayList)sqlSession.selectList("mapper.user.userListPaging", user);
		
		return list;
	}
	
	/* 총 회원 수 */
	public int selectUserCount() {
		int totalUserCount = sqlSession.selectOne("mapper.user.totalUserCount");

		return totalUserCount;
	}

	public ArrayList<ProjectVO> projectList() {
		ArrayList<ProjectVO> list = null;
		
		list = (ArrayList) sqlSession.selectList("mapper.project.selectProjectAll");
		
		return list;
	}
	
	public ArrayList<UserVO> selectAllUserList(){
		ArrayList<UserVO> list = null;
		
		list = (ArrayList) sqlSession.selectList("mapper.user.selectAllUserList");
		
		return list;
	}
}
