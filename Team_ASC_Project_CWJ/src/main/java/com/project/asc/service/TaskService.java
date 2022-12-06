package com.project.asc.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.asc.dao.TaskDAO;
import com.project.asc.vo.TaskVO;

@Service("taskService")
public class TaskService {
	
	@Autowired
	private TaskDAO taskDAO;

	public ArrayList<TaskVO> selectTaskList(int projectSeq){
		ArrayList<TaskVO> list = null;
		
		list = taskDAO.selectTaskList(projectSeq);
		
		return list;
	}
	
	public boolean createTask(TaskVO task) {
		boolean flag = false;
		
		flag = taskDAO.createTask(task);
		
		return flag;
	}
	
	public boolean updateTask(TaskVO task) {
		boolean flag = false;
		
		flag = taskDAO.updateTask(task);
		
		return flag;
	}
	
	public boolean deleteTask(int taskSeq) {
		boolean flag = false;
		
		flag = taskDAO.deleteTask(taskSeq);
		
		return flag;
	}
}
