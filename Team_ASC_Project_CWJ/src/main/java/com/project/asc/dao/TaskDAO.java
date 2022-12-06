package com.project.asc.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.asc.vo.TaskVO;

@Repository("taskDAO")
public class TaskDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public ArrayList<TaskVO> selectTaskList(int projectSeq){
		ArrayList<TaskVO> list = null;
		
		list = (ArrayList) sqlSession.selectList("mapper.task.selectTaskList",projectSeq);
		
		return list;
	}
	
	public boolean createTask(TaskVO task) {
		boolean flag = false;
		
		int affectedCount = sqlSession.insert("mapper.task.createTask",task);
		
		if(affectedCount > 0) {
			flag = true;
		}
		
		return flag;
	}
	
	public boolean updateTask(TaskVO task) {
		boolean flag = false;
		
		int affectedCount = sqlSession.insert("mapper.task.updateTask",task);
		
		if(affectedCount > 0) {
			flag = true;
		}
		
		return flag;
	}
	
	public boolean deleteTask(int taskSeq) {
		boolean flag = false;
		
		int affectedCount = sqlSession.insert("mapper.task.deleteTask",taskSeq);
		
		if(affectedCount > 0) {
			flag = true;
		}
		
		return flag;
	}
}
