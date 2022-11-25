package com.project.asc.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.asc.dao.ManagerDAO;
import com.project.asc.vo.ProjectVO;
import com.project.asc.vo.UserVO;

@Service("managerService")
public class ManagerService {

	@Autowired
	private ManagerDAO managerDAO;
	
	/* 검색 */
	public ArrayList<UserVO> searchUserList(String status,String keyword) {
		ArrayList<UserVO> list = new ArrayList<UserVO>();

		list = managerDAO.searchUserList(status,keyword);

		if (list == null) {
			System.out.println("list = null");
		}
		return list;
	}
	
	/* 상태(status) 'N'으로 바꾸기 */
	public boolean updateUserStatus(int seq) {
		boolean flag = false;
		
		flag = managerDAO.updateUserStatus(seq);
		
		return flag;
	}
	
	/* 회원정보 수정 */
	public boolean updateUserInfo(UserVO user) {
		boolean flag = false;
		
		flag = managerDAO.updateUserInfo(user);
		
//		System.out.println("updateService");
		return flag;
	}
	
	/* 회원 상세정보 페이지 가기 */
	public UserVO selectUserInfo(int seq) {
		UserVO user = null;
		user = managerDAO.selectUserInfo(seq);
		
		return user;
	}
	
	/* 회원 목록 페이징 */
	public ArrayList<UserVO> userListPaging(int startRowNum, int viewRows) {
		ArrayList<UserVO> list = managerDAO.userListPaging(startRowNum, viewRows);
		
		return list;
	}
	
	/* 총 회원 수 */
	public int selectUserCount() {
		int totalUserCount = 0;

		totalUserCount = managerDAO.selectUserCount();

		return totalUserCount;
	}

	/* 검색된 회원 수 */
	public int searchUserCount(UserVO user) {
		int searchUserCount = 0;

		searchUserCount = managerDAO.searchUserCount(user);
		
		return searchUserCount;
	}
	
	/* 회원 목록 페이징 */
	public ArrayList<UserVO> searchUserListPaging(UserVO user) {
		ArrayList<UserVO> list = managerDAO.searchUserListPaging(user);
		
		return list;
	}
	
	
	public ArrayList<ProjectVO> projectList(){
		ArrayList<ProjectVO> list = null;
		
		list = managerDAO.projectList();
		
		return list;
	}
	
	public ArrayList<UserVO> selectAllUserList(){
		ArrayList<UserVO> list = null;
		
		list = managerDAO.selectAllUserList();
		
		return list;
	}
}
