package com.project.asc.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.asc.dao.ProjectDAO;
import com.project.asc.vo.MessageVO;
import com.project.asc.vo.ProjectVO;
import com.project.asc.vo.ScheduleVO;
import com.project.asc.vo.TeamMemberVO;
import com.project.asc.vo.UserVO;

@Service("projectService")
public class ProjectService {
	
	@Autowired
	private ProjectDAO projectDAO;
	
	/* 프로젝트 프로세스 완성 */
	public boolean projectComplete(int projectSeq) {
		// TODO Auto-generated method stub
		boolean flag = false;
		
		flag = projectDAO.projectComplete(projectSeq);
		
		return flag;
	}
	
///////////////////////////////////////////////////////////////////////////////////////////////////	
	
	public boolean checkProjectName(String projectName) {
		boolean flag = false;
		
		flag = projectDAO.checkProjectName(projectName);
		
		return flag;
	}
	
	public boolean modifyProjectName(String projectName,String projectSeq) {
		boolean flag = false;
		
		flag = projectDAO.modifyProjectName(projectName,projectSeq);
		
		return flag;
	}
	
	public boolean createProject(ProjectVO projectVo,UserVO userVo) {
		boolean flag = false;
		
		flag = projectDAO.createProject(projectVo,userVo);
		
		return flag;
	}
	
	public ArrayList<ProjectVO> selectProjectList(int userSeq){
		ArrayList<ProjectVO> list = null;
		
		list = projectDAO.selectProjectList(userSeq);
		
		return list;
	}
	
	public ProjectVO setProject(String seq) {
		ProjectVO vo = null;
		
		vo = projectDAO.setProject(seq);
		
		return vo;
	}
	
	public ArrayList<TeamMemberVO> selectTeamMemberList(String teamId){
		ArrayList<TeamMemberVO> list = null;
		
		list = projectDAO.selectTeamMemberList(teamId);
		
		return list;
	}
	
	public boolean deleteTeamMember(String userSeq,String teamId) {
		boolean flag = false;
		
		flag = projectDAO.deleteTeamMember(userSeq,teamId);
		
		return flag;
	}
	
	public boolean deleteProject(ProjectVO project) {
		boolean flag = false;
		
		flag = projectDAO.deleteProject(project);
		
		return flag;
	}
	
	public boolean scheduleProject(ScheduleVO schedule) {
		boolean flag = false;
		
		String scheduleCategory = schedule.getScheduleCategory();

		if(scheduleCategory.equals("2")) {//월간
			Calendar cal = Calendar.getInstance();
			
			int year = Integer.parseInt(schedule.getStartDate().substring(0,4));
			int month = Integer.parseInt(schedule.getStartDate().substring(5,7));;
			int day = 1;
			cal.set(year, month-1,day);
			
			schedule.setEndDate(schedule.getStartDate().substring(0,4)+schedule.getStartDate().substring(5,7)+cal.getActualMaximum(Calendar.DAY_OF_MONTH));
			schedule.setStartDate(schedule.getStartDate().substring(0,4)+schedule.getStartDate().substring(5,7)+"01");
			
		} else { //전체,주간,일일
			schedule.setStartDate(schedule.getStartDate().substring(0,4)+schedule.getStartDate().substring(5,7)+schedule.getStartDate().substring(8));
			schedule.setEndDate(schedule.getEndDate().substring(0,4)+schedule.getEndDate().substring(5,7)+schedule.getEndDate().substring(8));
		}
		schedule.setFinishYn("N");
		System.out.println(schedule);
		flag = projectDAO.scheduleProject(schedule);
		
		return flag;
	}
	
	public ArrayList<ScheduleVO> selectScheduleList(int projectSeq){
		ArrayList<ScheduleVO> list = null;
		
		list = projectDAO.selectScheduleList(projectSeq);
		
		return list;
	}
	
	public boolean createDocuments(int userSeq) {
		boolean flag = false;
		
		flag = projectDAO.createDocuments(userSeq);
		
		return flag;
	}
	
	public ArrayList<UserVO> selectInviteUserList (UserVO user,ProjectVO project){
		ArrayList<UserVO> list = null;
		
		list = projectDAO.selectInviteUserList(user,project);
		
		return list;
	}
	
	public boolean inviteUser(MessageVO message) {
		boolean flag = false;
		
		flag = projectDAO.inviteUser(message);
		
		return flag;
	}
	
	public boolean inviteAlreadyYn(int fromUserSeq,int toUserSeq) {
		boolean flag = false;
		
		flag = projectDAO.inviteAlreadyYn(fromUserSeq,toUserSeq);
		
		return flag;
	}
	
	public boolean modifyProjectDate(ProjectVO project) {
		boolean flag = false;
		
		flag = projectDAO.modifyProjectDate(project);
		
		return flag;
	}

}
