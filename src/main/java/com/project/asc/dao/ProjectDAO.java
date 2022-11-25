package com.project.asc.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.asc.vo.MessageVO;
import com.project.asc.vo.ProjectVO;
import com.project.asc.vo.ScheduleVO;
import com.project.asc.vo.TeamMemberVO;
import com.project.asc.vo.UserVO;

@Repository("projectDAO")
public class ProjectDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	/* 프로젝트 프로세스 완성 */
	public boolean projectComplete(int projectSeq) {
		// TODO Auto-generated method stub
		boolean flag = false;
		
		int affectedCount = sqlSession.update("mapper.process.projectComplete", projectSeq);
		
		if(affectedCount > 0) {
			flag = true;
		}
		
		return flag;
	}
	
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public boolean checkProjectName(String projectName) {
		boolean flag = false;
		
		int affectedCount = sqlSession.selectOne("mapper.project.checkProjectName",projectName);
		
		if(affectedCount != 1) {
			flag = true;
		}
		
		return flag;
	}
	
	public boolean modifyProjectDate(ProjectVO project) {
		boolean flag = false;
		
		int affectedCount = sqlSession.update("mapper.project.modifyProjectDate",project);
		
		if(affectedCount > 0) {
			flag = true;
		}
		
		return flag;
	}
	
	public boolean modifyProjectName(String projectName,String projectSeq) {
		boolean flag = false;
		
		ProjectVO project = new ProjectVO();
		
		project.setProjectSeq(Integer.parseInt(projectSeq));
		project.setProjectName(projectName);
		
		int affectedCount = sqlSession.update("mapper.project.modifyProjectName",project);
		
		if(affectedCount > 0) {
			flag = true;
		}
		
		return flag;
	}
	
	public boolean createProject(ProjectVO projectVo,UserVO userVo) {
		boolean flag = false;
		
		String pattern = "yyMMdd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

		String today = simpleDateFormat.format(new Date());
		
		TeamMemberVO temp = sqlSession.selectOne("mapper.teamMember.selectMaxTeamId"); // 최신 TeamId 가져오기

		String maxTeamId = null;
		
		if(temp != null) { 
			maxTeamId = temp.getTeamId();
		}
		
		if(maxTeamId == null || maxTeamId == "") {
			System.out.println("null");
			maxTeamId = today + "001"; // 최신 TeamId가 없을 경우 오늘날짜에 001로 시작하는 TeamId 생성
		}else {
			maxTeamId = String.valueOf(Integer.parseInt(maxTeamId) + 1);
		}
		
		TeamMemberVO vo = new TeamMemberVO();
		vo.setTeamId(maxTeamId);
		vo.setUserSeq(userVo.getUserSeq());
		
		System.out.println(vo);
		
		sqlSession.insert("mapper.teamMember.createTeamMember",vo);
		
		projectVo.setTeamId(maxTeamId);
		
		System.out.println(projectVo);
		
		int affectedCount = sqlSession.insert("mapper.project.createProject",projectVo);
		
		if(affectedCount > 0) {
			flag = true;
		}
		
		return flag;
	}
	
	public ArrayList<ProjectVO> selectProjectList(int userSeq){
		ArrayList<ProjectVO> list = null;
		
		list = (ArrayList) sqlSession.selectList("mapper.project.selectProjectList",userSeq);
		
		return list;
	}
	
	public ProjectVO setProject(String seq) {
		ProjectVO vo = null;
		
		int projectSeq = Integer.parseInt(seq);
		
		vo = sqlSession.selectOne("mapper.project.selectProjectOne",projectSeq);
		System.out.println(vo);
		return vo;
	}
	
	public ArrayList<TeamMemberVO> selectTeamMemberList(String teamId){
		ArrayList<TeamMemberVO> list = null;
		
		list = (ArrayList) sqlSession.selectList("mapper.teamMember.selectTeamMemberList",teamId);
		
		return list;
	}
	
	public boolean deleteTeamMember(String userSeq,String teamId) {
		boolean flag = false;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("teamId", teamId);
		map.put("userSeq", userSeq);
		
		int affectedCount = sqlSession.delete("mapper.teamMember.deleteTeamMember",map);
		
		int teamMemberCount = sqlSession.selectOne("mapper.teamMember.countTeamMember",teamId);
		
		if(teamMemberCount > 1) {
			sqlSession.update("mapper.teamMember.updateaTeamCategoryTeam",teamId);
		} else {
			sqlSession.update("mapper.teamMember.updateaTeamCategorySole",teamId);
		}
		
		if(affectedCount > 0) {
			flag = true;
		}
		
		return flag;
	}
	
	public boolean deleteProject(ProjectVO project) {
		boolean flag = false;
		
		int projectSeq = project.getProjectSeq();
		String teamId = project.getTeamId();
		
		int affectedProjectCount = sqlSession.delete("mapper.project.deleteProject",projectSeq);
		/*
		 * int affectedTeamMemberCount = sqlSession.delete("mapper.teamMember.deleteTeam",teamId);
		 */
		
		if(affectedProjectCount > 0) {
			flag = true;
		}
		
		return flag;
	}
	
	public boolean scheduleProject(ScheduleVO schedule) {
		boolean flag = false;
		
		int affectedCount = sqlSession.insert("mapper.schedule.createSchedule",schedule);
		
		if(affectedCount > 0) {
			flag = true;
		}
		
		return flag;
	}
	
	public ArrayList<ScheduleVO> selectScheduleList(int projectSeq){
		ArrayList<ScheduleVO> list = null;
		
		list = (ArrayList) sqlSession.selectList("mapper.schedule.selectSchedule",projectSeq);
		
		return list;
	}
	
	public boolean createDocuments(int userSeq) {
		boolean flag = false;
		
		ProjectVO project = sqlSession.selectOne("mapper.project.selectProjectSeqNoDocuments",userSeq);

		int projectSeq = project.getProjectSeq();

		int affectedCount = sqlSession.insert("mapper.documents.createPlan",projectSeq);
		
		if(affectedCount > 0) {
			flag = true;
		}
		
		return flag;
	}
	
	public ArrayList<UserVO> selectInviteUserList(UserVO user,ProjectVO project){
		ArrayList<UserVO> list = null;

		String userPositionGroup = user.getPositionGroup();
		String userSeq = String.valueOf(user.getUserSeq());
		String projectSeq = String.valueOf(project.getProjectSeq());;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("positionGroup", userPositionGroup);
		map.put("projectSeq", projectSeq);
		
		list = (ArrayList) sqlSession.selectList("mapper.user.selectInviteUserList",map);
		
		return list;
	}
	
	public boolean inviteUser(MessageVO message) {
		boolean flag = false;
		
		int affectedCount = sqlSession.insert("mapper.message.createMessage",message);
		
		if(affectedCount > 0) {
			flag = true;
		}
		
		return flag;
	}
	
	public boolean inviteAlreadyYn(int fromUserSeq,int toUserSeq) {
		boolean flag = false;
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("fromUserSeq", fromUserSeq);
		map.put("toUserSeq", toUserSeq);
		
		int affectedCount = sqlSession.selectOne("mapper.message.inviteAlreadyYn",map);
		
		if(affectedCount > 0) {
			flag = true;
		}
		
		return flag;
	}
}
