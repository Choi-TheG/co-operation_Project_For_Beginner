package com.project.asc.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.asc.vo.ProjectVO;
import com.project.asc.vo.TeamMemberVO;
import com.project.asc.vo.TestVO;

@Repository("testDAO")
public class TestDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public ArrayList<TestVO> selectAllTest(int projectSeq){
		ArrayList<TestVO> list = null;
		
		list = (ArrayList) sqlSession.selectList("mapper.test.selectAllTest", projectSeq);
		
		return list;
	}
	
	public ArrayList<TeamMemberVO> selectUserList(String id){
		ArrayList<TeamMemberVO> list = null;
		
		list = (ArrayList) sqlSession.selectList("mapper.teamMember.selectTeamMemberList", id);
		
		return list;
	}
	
	public ArrayList<TestVO> selectListByUser(TestVO vo){
		ArrayList<TestVO> list = null;
		
		list = (ArrayList) sqlSession.selectList("mapper.test.selectListByUser", vo);
		
		return list;
	}
	
	public boolean insertTest(int projectSeq, String manager) {
		boolean flag = false;

		TestVO test = new TestVO();
		test.setInsertRow(projectSeq, manager);
		System.out.println("DAO test : "+test);
		int affectedCount = sqlSession.insert("mapper.test.insertTest", test);
		
		if(affectedCount>0) {
			flag = true;
		}
		
		return flag;
	}
	
	public boolean updateHeadTest(TestVO test) {
		boolean flag = false;
		int affectedCount = sqlSession.update("mapper.test.updateHeadTest", test);
		
		if(affectedCount>0) {
			flag = true;
			System.out.println("DAO update done");
		} else {
			System.out.println("DAO fail");
		}
		
		return flag;
	}
	
	public boolean updateTest(TestVO test) {
		boolean flag = false;
		int affectedCount = sqlSession.update("mapper.test.updateTest", test);
		
		if(affectedCount>0) {
			flag = true;
			System.out.println("DAO update done");
		} else {
			System.out.println("DAO update fail");
		}
		
		return flag;
	}
	
	
	public boolean deleteTest(String testSeq) {
		boolean flag = false;
		int affectedCount = sqlSession.delete("mapper.test.deleteTest", Integer.parseInt(testSeq));
		if(affectedCount>0) {
			flag = true;
		}
		
		return flag;
	}
}
