package com.project.asc.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.asc.dao.TestDAO;
import com.project.asc.vo.TeamMemberVO;
import com.project.asc.vo.TestVO;

@Service("testService")
public class TestService {

	@Autowired
	private TestDAO testDAO;
	
	public ArrayList<TestVO> selectAllTest(int projectSeq){
		ArrayList<TestVO> list = null;
		list = testDAO.selectAllTest(projectSeq);
		
		return list;
	}
	
	public ArrayList<TeamMemberVO> selectUserList(String id){
		ArrayList<TeamMemberVO> list = null;
		list = testDAO.selectUserList(id);
		
		return list;
	}
	
	public ArrayList<TestVO> selectListByUser(int projectSeq, String manager){
		ArrayList<TestVO> list = new ArrayList<TestVO>();
		TestVO vo = new TestVO();
		vo.setProjectSeq(projectSeq);
		vo.setManager(manager);
		
		list = testDAO.selectListByUser(vo);
		
		return list;
	}
	
	public boolean insertTest(int projectSeq, String manager) {
		boolean flag = false;
		
		testDAO.insertTest(projectSeq, manager);
		
		return flag;
	}
	
	public boolean updateHeadTest(TestVO test) {
		boolean flag = false;
		flag = testDAO.updateHeadTest(test);
		
		return flag;
	}
	
	public boolean updateTest(TestVO test) {
		boolean flag = false;
		flag = testDAO.updateTest(test);
		
		return flag;
	}
	
	public boolean deleteTest(String testSeq) {
		boolean flag = false;
		testDAO.deleteTest(testSeq);
		
		return flag;
	}
}
