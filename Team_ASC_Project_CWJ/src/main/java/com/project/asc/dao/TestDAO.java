package com.project.asc.dao;

import java.util.ArrayList;

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
	public boolean insertTest(int projectSeq) {
		boolean flag = false;
		int affectedCount = sqlSession.insert("mapper.test.insertTest", projectSeq);
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
