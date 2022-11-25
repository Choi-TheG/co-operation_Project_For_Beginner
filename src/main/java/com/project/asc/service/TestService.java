package com.project.asc.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.asc.dao.TestDAO;
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
	
//	public ArrayList<TestVO> selectTestByUser(int projectSeq, String user){
//		ArrayList<TestVO> list = null;
//		list = testDAO.selectUserTest(projectSeq, user);
//		
//		return list;
//	}
	
	public boolean insertTest(int projectSeq) {
		boolean flag = false;
		testDAO.insertTest(projectSeq);
		
		return flag;
	}
	
	public boolean updateHeadTest(TestVO test) {
		boolean flag = false;
		testDAO.updateHeadTest(test);
		
		return flag;
	}
	
	public boolean updateTest(TestVO test) {
		boolean flag = false;
		testDAO.updateTest(test);
		
		return flag;
	}
	
	public boolean deleteTest(String testSeq) {
		boolean flag = false;
		testDAO.deleteTest(testSeq);
		
		return flag;
	}
}
