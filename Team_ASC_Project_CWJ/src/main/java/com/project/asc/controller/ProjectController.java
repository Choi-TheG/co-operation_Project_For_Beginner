package com.project.asc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.asc.service.ProjectService;
import com.project.asc.vo.MessageVO;
import com.project.asc.vo.MinutesVO;
import com.project.asc.vo.PageVO;
import com.project.asc.vo.ProjectVO;
import com.project.asc.vo.ScheduleVO;
import com.project.asc.vo.TeamMemberVO;
import com.project.asc.vo.UserVO;
@ResponseBody
@RequestMapping("/project")
@Controller("projectController")
public class ProjectController {

	@Autowired
	private ProjectService projectService;
	
	/* 회의록 검색 */
	@RequestMapping(value = "/searchMinutes", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView searchMinutes(@ModelAttribute("info") MinutesVO minutes, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		int projecSeq = Integer.parseInt(request.getParameter("projectSeq"));
		String searchDate = request.getParameter("searchDate");
		
		minutes.setProjectSeq(projecSeq);
		minutes.setSearchDate(searchDate);
		
		String viewName = "/project/minutesList";
		
		// 한번에 보여줄 게시글 수
		int viewRows = 5;
		
		// 현재 페이지 번호
		String nowPageNum = request.getParameter("pageNum");
		
		int pageNum = 1;
		if (nowPageNum != null) {
			pageNum = Integer.parseInt(nowPageNum);
			viewName = "/project/minutesList";
		}
		
		// 해당 페이지의 첫 번째 게시글 순서
		int startRowNum = (pageNum - 1) * viewRows;
		
		minutes.setStartRowNum(startRowNum);
		minutes.setViewRows(viewRows);
		String boardNum = request.getParameter("totalBoardNum");
		
		// 전체 게시글 수
		int totalBoardNum = projectService.searchMinutesNum(minutes);
		if (totalBoardNum == 0) {
			String nowTotalBoardNum = request.getParameter("totalBoardNum");
			if (nowTotalBoardNum != null) {
				totalBoardNum = Integer.parseInt(nowTotalBoardNum);
			}
		}
		
		// 전체 페이지 수
		int totalPageNum = 0;
		if(totalBoardNum % viewRows == 0) {
			totalPageNum = (int)Math.ceil(totalBoardNum/viewRows);
		} else {
			totalPageNum = (int)Math.ceil(totalBoardNum/viewRows) + 1;
		}
		
		// 페이징 관련 정보 page에 저장
		PageVO page = new PageVO();
		
		page.setPageNum(pageNum);
		page.setStartRowNum(startRowNum);
		page.setTotalBoardNum(totalBoardNum);
		page.setTotalPageNum(totalPageNum);
		
		mav.addObject("page", page);
		
		request.getSession().setAttribute("boardNum", totalBoardNum);
		
		int[] pageRange = new int[totalPageNum];
		
		for(int i=0; i>totalPageNum; i++) {
			pageRange[i] = i + 1;
		}
		mav.addObject("pageRange", pageRange);
		
		// 페이징 적용된 리스트
		ArrayList<MinutesVO> list = projectService.searchMinutes(minutes);
		
		System.out.println("searchDate = " + searchDate);
		
		mav.addObject("minutes", minutes);
		mav.addObject("list", list);
		mav.setViewName(viewName);
		
		return mav;
	}
	
	/* 회의록 수정(수정 후 해당 회의록 읽기 화면) */
	@RequestMapping(value = "/updateMinutes", method = RequestMethod.POST)
	public ModelAndView updateMinutes(@ModelAttribute("info") MinutesVO minutes, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		int minutesSeq = Integer.parseInt(request.getParameter("minutesSeq"));
		boolean flag = projectService.updateMinutes(minutes);
		
		mav.addObject("minutes", minutes);
		mav.setViewName("redirect:/project/readMinutes?minutesSeq=" + minutesSeq);
		return mav;
	}
	
	/* 회의록 수정 페이지 */
	@RequestMapping(value = "/viewUpdateMinutes", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView viewUpdateMinutes(@RequestParam("minutesSeq") int minutesSeq, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		ProjectVO project = (ProjectVO) request.getSession().getAttribute("project");
		
		String teamId = project.getTeamId();
		
		ArrayList<TeamMemberVO> list = projectService.selectTeamMemberCheckbox(teamId);
		
		System.out.println("att");
		
		MinutesVO minutes = projectService.readMinutes(minutesSeq);
		String[] attendees = minutes.getAttendees().split(",");
		
		System.out.println("attendees = " + attendees.toString());
		
		mav.addObject("attendees", attendees);
		mav.addObject("list", list);
		mav.addObject("minutes", minutes);
		mav.setViewName("/project/viewUpdateMinutes");
		return mav;
	}
	
	/* 회의록 상세 보기 */
	@RequestMapping(value = "/readMinutes", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView readMinutes(@RequestParam("minutesSeq") int minutesSeq, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		MinutesVO minutes = projectService.readMinutes(minutesSeq);
		
		mav.addObject("minutes", minutes);
		mav.setViewName("/project/readMinutes");
		return mav;
	}
	
	/* 회의록 작성 */
	@RequestMapping(value = "/writeMinutes", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView writeMinutes(@ModelAttribute("info") MinutesVO minutes, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		boolean flag = false;
		
		flag = projectService.insertMinutes(minutes);
		
		mav.addObject("minutes", minutes);
		mav.setViewName("redirect:/project/minutesList?projectSeq=" + minutes.getProjectSeq() + "&pageNum=1");
		return mav;
	}
	
	/* 회의록 작성 페이지 */
	@RequestMapping(value = "/viewWriteMinutes", method = RequestMethod.GET)
	public ModelAndView viewWriteMinutes(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		ProjectVO project = (ProjectVO) request.getSession().getAttribute("project");
		
		String teamId = project.getTeamId();
		
		ArrayList<TeamMemberVO> list = projectService.selectTeamMemberCheckbox(teamId);
		
		String viewName = "/project/viewWriteMinutes";
		
		mav.addObject("list", list);
		mav.setViewName(viewName);
		return mav;
	}
	
	/* 회의록 목록 + 페이징 */
	@RequestMapping(value = "/minutesList", method = RequestMethod.GET)
	public ModelAndView minutesList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		String viewName = "/project/minutesList";
		
		ProjectVO project = (ProjectVO)request.getSession().getAttribute("project");
		UserVO user = (UserVO)request.getSession().getAttribute("member");
		
		int projectSeq = project.getProjectSeq();
		String name = user.getName();
		
		// 한번에 보여줄 게시글 수
		int viewRows = 5;
		
		// 현재 페이지 번호
		String nowPageNum = request.getParameter("pageNum");
		System.out.println("nowPageNum = " + nowPageNum);
		int pageNum = Integer.parseInt(nowPageNum);
		
		// 해당 페이지의 첫 번째 게시글 순서
		int startRowNum = (pageNum-1) * viewRows;
		
		// 전체 게시글 수
		int totalBoardNum = projectService.totalMinutesNum(projectSeq);
		
		// 전체 페이지 수
		int totalPageNum = 0;
		if(totalBoardNum % viewRows == 0) {
			totalPageNum = (int)Math.ceil(totalBoardNum/viewRows);
		} else {
			totalPageNum = (int)Math.ceil(totalBoardNum/viewRows) + 1;
		}
		
		// 페이징 관련 정보 page에 저장
		PageVO page = new PageVO();
		
		page.setPageNum(pageNum);
		page.setStartRowNum(startRowNum);
		page.setTotalBoardNum(totalBoardNum);
		page.setTotalPageNum(totalPageNum);
		
		mav.addObject("page", page);
		
		int[] pageRange = new int[totalPageNum];
		
		for(int i=0; i>totalPageNum; i++) {
			pageRange[i] = i + 1;
		}
		mav.addObject("pageRange", pageRange);
		
		// 페이징 적용된 리스트
		ArrayList<MinutesVO> list = projectService.selectMinutes(projectSeq, startRowNum, viewRows);
		
		mav.addObject("list", list);
		mav.setViewName(viewName);
		return mav;
	}
	
	/* 프로젝트 완성 페이지 */
	@RequestMapping(value = "/viewComplete", method = RequestMethod.GET)
	public ModelAndView viewComplete(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		String viewName = "/project/viewComplete";
		
		mav.setViewName(viewName);
		return mav;
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	/* 프로젝트 선택 */
	@RequestMapping(value="/readProject",method=RequestMethod.GET)
	public ModelAndView readProject(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		String projectSeq = request.getParameter("seq");
		
		ProjectVO project = projectService.setProject(projectSeq);
		
		request.getSession().setAttribute("project", project);
		
		String viewName = "redirect:/dashboard/viewDashboard?projectSeq="+projectSeq;
		mav.setViewName(viewName);
		
		return mav;
	}
	
	/* 프로젝트 변경 */
	@RequestMapping(value="/changeProject",method=RequestMethod.GET)
	public ModelAndView changeProject(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		request.getSession().setAttribute("project", null);
		
		String viewName = "redirect:/main";
		
		mav.setViewName(viewName);
		
		return mav;
	}
	
	/* 프로젝트 생성 페이지 */
	@RequestMapping(value="/viewCreateProject",method=RequestMethod.GET)
	public ModelAndView viewCreateProject(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName ="/project/viewCreateProject";
		
		mav.setViewName(viewName);
		return mav;
	}
	
	/* 프로젝트 생성 */
	@RequestMapping(value="/createProject",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView createProject(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		boolean flag = false;
		
		String projectName = request.getParameter("projectName");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		UserVO userVo = (UserVO) request.getSession().getAttribute("member"); 
		
		ProjectVO projectVo = new ProjectVO();
		projectVo.setProjectName(projectName);
		projectVo.setStartDate(startDate.replace("-", ""));
		projectVo.setEndDate(endDate.replace("-", ""));
		
		flag = projectService.createProject(projectVo,userVo);
		String viewName = "error";
		if(flag) {
			viewName = "redirect:/main";
			if(request.getSession().getAttribute("project") != null) {
				viewName = "/project/manageProject";
			}
		} 
		
		mav.setViewName(viewName);
		return mav;
	}
	
	/* rest 팀명 중복 체크 */
	@RequestMapping(value="/checkProjectName",method=RequestMethod.GET)
	public boolean checkProjectName(@RequestParam("projectName") String projectName, HttpServletRequest request,HttpServletResponse response) throws Exception {
		boolean flag = false;
		flag = projectService.checkProjectName(projectName);
		return flag;
	}
	
	/* 프로젝트 관리 */
	@RequestMapping(value="/manageProject",method=RequestMethod.GET)
	public ModelAndView manageProject(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		ProjectVO vo = (ProjectVO) request.getSession().getAttribute("project");

		String teamId = vo.getTeamId();
		
		ArrayList<TeamMemberVO> list = projectService.selectTeamMemberList(teamId);
		
		String viewName = "/project/manageProject";
		
		mav.addObject("list",list);
		
		mav.setViewName(viewName);
		
		return mav;
	}
	
	/* 프로젝트 일정 변경 */
	   @RequestMapping(value="/modifyProjectDate",method=RequestMethod.GET)
	   public boolean modifyProjectDate(@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("projectSeq") String projectSeq,
			   HttpServletRequest request,HttpServletResponse response) throws Exception {
	      boolean flag = false;
	      
	      startDate = startDate.replace("-", ""); 
	      endDate = endDate.replace("-", ""); 
	      
	      ProjectVO project = new ProjectVO();
	      project.setStartDate(startDate);
	      project.setEndDate(endDate);
	      project.setProjectSeq(Integer.parseInt(projectSeq));
	      
	      flag = projectService.modifyProjectDate(project);
	      
	      if(flag) {
	    	  ProjectVO newProject = projectService.setProject(projectSeq);
		      request.getSession().setAttribute("project", newProject);
	      }
	      
	      return flag;
	   }
	/* 프로젝트명 변경 */
	   @RequestMapping(value="/modifyProjectName",method=RequestMethod.GET)
	   public boolean modifyProjectName(@RequestParam("projectName") String projectName,@RequestParam("projectSeq") String projectSeq, HttpServletRequest request,HttpServletResponse response) throws Exception {
	      boolean flag = false;
	      flag = projectService.modifyProjectName(projectName,projectSeq);
	      
	      if(flag) {
	         ProjectVO project = projectService.setProject(projectSeq);
	         request.getSession().setAttribute("project", project);
	      }
	      
	      return flag;
	   }
	
	/* 팀원 제외 */
	@RequestMapping(value="/deleteTeamMember",method=RequestMethod.GET)
	public ModelAndView deleteTeamMember(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		String viewName = "redirect:/main";
		
		String userSeq = request.getParameter("userSeq");
		String teamId = request.getParameter("teamId");
		
		boolean flag = projectService.deleteTeamMember(userSeq,teamId);
		
		if(flag) {
			viewName = "redirect:/project/manageProject";
		}
		mav.setViewName(viewName);
		
		return mav;
	}
	
	/* 프로젝트 삭제 */
	@RequestMapping(value="/deleteProject",method=RequestMethod.GET)
	public ModelAndView deleteProject(@ModelAttribute("info") ProjectVO project,HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		String viewName = "redirect:/project/manageProject";
		
		boolean flag = projectService.deleteProject(project);
		
		request.getSession().setAttribute("project", null);
		
		if(flag) {
			viewName = "redirect:/main";
		}
		
		mav.setViewName(viewName);
		
		return mav;
	}
	
	/* 프로젝트 스케줄 페이지로 이동 */
	@RequestMapping(value="/viewScheduleProject",method=RequestMethod.GET)
	public ModelAndView scheduleProjectPage(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String viewName ="/project/viewScheduleProject";
		
		ProjectVO project = (ProjectVO) request.getSession().getAttribute("project");

		int projectSeq = project.getProjectSeq();
		
		ArrayList<ScheduleVO> list = projectService.selectScheduleList(projectSeq);
		
		mav.addObject("list",list);
		
		mav.setViewName(viewName);
		
		return mav;
	}
	
	/* 프로젝트 스케줄 생성 */
	@RequestMapping(value="/scheduleProject",method=RequestMethod.GET)
	public ModelAndView scheduleProject(@ModelAttribute("info") ScheduleVO schedule,HttpServletRequest request,HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		System.out.println(schedule);
		
		String viewName ="redirect:/project/viewScheduleProject";
		
		boolean flag = projectService.scheduleProject(schedule);
		
		mav.setViewName(viewName);
		
		return mav;
	}
	
	/* 팀원 초대 페이지 */
	@RequestMapping(value="/viewInviteProject",method=RequestMethod.GET)
	public ModelAndView viewInviteProject(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		UserVO user = (UserVO) request.getSession().getAttribute("member");
		
		ProjectVO project = (ProjectVO) request.getSession().getAttribute("project");
		
		ArrayList<UserVO> list = projectService.selectInviteUserList(user,project);
		
		String viewName ="/project/viewInviteProject";
		
		mav.addObject("userList", list);
		
		mav.setViewName(viewName);
		
		return mav;
	}
	
	/* 팀원 초대 */
	@RequestMapping(value="/inviteProject",method=RequestMethod.GET)
	public ModelAndView inviteProject(@RequestParam("userSeq") String user_Seq,HttpServletRequest request,HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		ProjectVO project = (ProjectVO) request.getSession().getAttribute("project");
		UserVO fromUser = (UserVO) request.getSession().getAttribute("member");
		
		int userSeq = Integer.parseInt(user_Seq);
		String teamId = project.getTeamId();
		
		MessageVO message = new MessageVO();
		
		message.setFromUserSeq(fromUser.getUserSeq());
		message.setToUserSeq(userSeq);
		message.setTeamId(teamId);
		message.setTitle(fromUser.getName()+"님의 프로젝트 초대 메세지");
		message.setContent(fromUser.getName() + "님이 프로젝트 : " + project.getProjectName() + "(으)로 초대 했습니다\n\n수락을 원하시면 확인 버튼을 눌러주세요");
		message.setMessageType("inviteProject");
		
		projectService.inviteUser(message);
		
		String viewName = "redirect:/project/manageProject";
		
		mav.setViewName(viewName);
		
		return mav;
	}
	
	/* 초대 메세지 유무*/
	@RequestMapping(value="/inviteAlreadyYn",method=RequestMethod.GET)
	public boolean inviteAlreadyYn(@RequestParam("toUserSeq") String toUserSeq, HttpServletRequest request,HttpServletResponse response) throws Exception {
		boolean flag = true;
	     
		UserVO user = (UserVO) request.getSession().getAttribute("member");
	    
	    flag = projectService.inviteAlreadyYn(user.getUserSeq(), Integer.parseInt(toUserSeq));
	      
	    return flag;  
	}
}
