package com.project.asc.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.asc.dao.WbsDAO;
import com.project.asc.vo.TaskVO;
import com.project.asc.vo.TeamMemberVO;
import com.project.asc.vo.WbsDetailVO;

@Service("wbsService")
public class WbsService {

	@Autowired
	private WbsDAO wbsDAO;
	
	public ArrayList<TaskVO> selectStepList(int projectSeq){
		ArrayList<TaskVO> list = null;
		
		list = wbsDAO.selectStepList(projectSeq);
		
		return list;
	}
	
	public ArrayList<TaskVO> selectStepMainList(int projectSeq){
		ArrayList<TaskVO> list = null;
		
		list = wbsDAO.selectStepMainList(projectSeq);
		
		return list;
	}
	
	public ArrayList<TaskVO> selectStepMainSubList(int projectSeq){
		ArrayList<TaskVO> list = null;
		
		list = wbsDAO.selectStepMainSubList(projectSeq);
		
		return list;
	}
	
	public ArrayList<TeamMemberVO> selectTeamMemberList(String teamId){
		ArrayList<TeamMemberVO> list = null;
		
		list = wbsDAO.selectTeamMemberList(teamId);
		
		return list;
	}
	
	public boolean updateWbs(TaskVO task) {
		boolean flag = false;
		
		flag = wbsDAO.updateWbs(task);
		
		return flag;
	}
	
	public TaskVO selectStepMainSubOne(int taskSeq){
		TaskVO task = null;
		
		task = wbsDAO.selectStepMainSubOne(taskSeq);

		return task;
	}
	
	public ArrayList<WbsDetailVO> selectWbsDetailList(int taskSeq) {
		ArrayList<WbsDetailVO> list = null;
		
		list = wbsDAO.selectWbsDetailList(taskSeq);
		
		return list;
	}
	
	public boolean createWbsDetail(WbsDetailVO wbsDetail) {
		boolean flag = false;
		
		flag = wbsDAO.createWbsDetail(wbsDetail);
		
		return flag;
	}
	
	public boolean updateWbsDetail(WbsDetailVO wbsDetail) {
		boolean flag = false;
		
		flag = wbsDAO.updateWbsDetail(wbsDetail);
		
		return flag;
	}
	
	public boolean finishWbsDetail(WbsDetailVO wbsDetail) {
		boolean flag = false;

		flag = wbsDAO.finishWbsDetail(wbsDetail);
		
		return flag;
	}
}
