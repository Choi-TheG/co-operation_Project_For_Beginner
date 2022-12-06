package com.project.asc.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.asc.vo.TaskVO;
import com.project.asc.vo.TeamMemberVO;
import com.project.asc.vo.WbsDetailVO;

@Repository("wbsDAO")
public class WbsDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public ArrayList<TaskVO> selectStepList(int projectSeq){
		ArrayList<TaskVO> list = null;
		
		list = (ArrayList) sqlSession.selectList("mapper.task.selectStepList",projectSeq);
		
		return list;
	}
	
	public ArrayList<TaskVO> selectStepMainList(int projectSeq){
		ArrayList<TaskVO> list = null;
		
		list = (ArrayList) sqlSession.selectList("mapper.task.selectStepMainList",projectSeq);
		
		return list;
	}
	
	public ArrayList<TaskVO> selectStepMainSubList(int projectSeq){
		ArrayList<TaskVO> list = null;
		
		list = (ArrayList) sqlSession.selectList("mapper.task.selectStepMainSubList",projectSeq);

		return list;
	}
	
	public ArrayList<TeamMemberVO> selectTeamMemberList(String teamId){
		ArrayList<TeamMemberVO> list = null;
		
		list = (ArrayList) sqlSession.selectList("mapper.teamMember.selectTeamMemberList",teamId);
		
		return list;
	}
	
	public boolean updateWbs(TaskVO task) {
		boolean flag = false;
		
		int affectedCount = sqlSession.update("mapper.task.updateWbs",task);
		
		if(affectedCount > 0) {
			flag = true;
		}
		
		return flag;
	}
	
	public TaskVO selectStepMainSubOne(int taskSeq){
		TaskVO task = null;
		
		task = sqlSession.selectOne("mapper.task.selectStepMainSubOne",taskSeq);

		return task;
	}
	
	public ArrayList<WbsDetailVO> selectWbsDetailList(int taskSeq) {
		ArrayList<WbsDetailVO> list = null;

		list = (ArrayList) sqlSession.selectList("mapper.wbsDetail.selectWbsDetailList",taskSeq);
		
		return list;
	}
	
	public boolean createWbsDetail(WbsDetailVO wbsDetail) {
		boolean flag = false;
		
		int affectedCount = sqlSession.insert("mapper.wbsDetail.createWbsDetail",wbsDetail);
		
		if(affectedCount > 0) {
			flag = true;
		}
		
		return flag;
	}
	
	public boolean updateWbsDetail(WbsDetailVO wbsDetail) {
		boolean flag = false;

		int affectedCount = sqlSession.update("mapper.wbsDetail.updateWbsDetail",wbsDetail);
		
		if(affectedCount > 0) {
			flag = true;
		}
		
		return flag;
	}
	
	public boolean finishWbsDetail(WbsDetailVO wbsDetail) {
		boolean flag = false;
		
		int affectedCount = sqlSession.update("mapper.wbsDetail.finishWbsDetail",wbsDetail);//wbs 상세 완료 업데이트
		
		int percentage = sqlSession.selectOne("mapper.wbsDetail.selectTaskPercentage",wbsDetail.getTaskSeq()); // wbs 진척률 값 
		
		TaskVO task = new TaskVO();
		task.setTaskSeq(wbsDetail.getTaskSeq());
		task.setPercentage(percentage);
		task.setFinishYn(percentage == 100 ? "Y" : "N");
		
		int taskAffectedCount = sqlSession.update("mapper.task.updateTaskPercentage",task); // wbs 진척률,완료 여부 업데이트
		
		if(affectedCount > 0 && taskAffectedCount > 0) {
			flag = true;
		}
		
		return flag;
	}
}
