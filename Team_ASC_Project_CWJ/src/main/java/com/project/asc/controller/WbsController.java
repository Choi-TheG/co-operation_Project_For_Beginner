package com.project.asc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.asc.service.WbsService;
import com.project.asc.vo.ProjectVO;
import com.project.asc.vo.WbsDetailVO;
import com.project.asc.vo.TaskVO;
import com.project.asc.vo.TeamMemberVO;
import com.project.asc.vo.UserVO;

@RequestMapping("/wbs")
@Controller("wbsController")
public class WbsController {

	@Autowired
	private WbsService wbsService;
	
	@RequestMapping(value = "/manageWbs", method = RequestMethod.GET)
	public ModelAndView manageWbs(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		String viewName = "/wbs/manageWbs";
		
		ProjectVO project = (ProjectVO) request.getSession().getAttribute("project");
		int projectSeq = project.getProjectSeq();
		String teamId = project.getTeamId();
		
		ArrayList<TaskVO> stepList = (ArrayList) wbsService.selectStepList(projectSeq);
		ArrayList<TaskVO> stepMainList = (ArrayList) wbsService.selectStepMainList(projectSeq);
		ArrayList<TaskVO> stepMainSubList = (ArrayList) wbsService.selectStepMainSubList(projectSeq);
		ArrayList<TeamMemberVO> teamMemberList = (ArrayList) wbsService.selectTeamMemberList(teamId);
		
		mav.addObject("stepList",stepList);
		mav.addObject("stepMainList",stepMainList);
		mav.addObject("stepMainSubList",stepMainSubList);
		mav.addObject("teamMemberList",teamMemberList);
		
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value = "/updateWbs", method = RequestMethod.GET)
	public ModelAndView updateWbs(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		String viewName = "redirect:/wbs/manageWbs";
		
		String[] status =  request.getParameterValues("status");
		String[] taskSeq =  request.getParameterValues("taskSeq");
		String[] userSeq =  request.getParameterValues("userSeq");
		String[] startDate =  request.getParameterValues("startDate");
		String[] endDate =  request.getParameterValues("endDate");
		
		for(int i=0;i<status.length;i++) {
			if(status[i].equals("U")) {
				TaskVO task = new TaskVO();
				task.setTaskSeq(Integer.parseInt(taskSeq[i]));
				task.setUserSeq(userSeq[i].equals("") ? 0 : Integer.parseInt(userSeq[i]));
				task.setStartDate(startDate[i].replace("-", ""));
				task.setEndDate(endDate[i].replace("-", ""));
				
				wbsService.updateWbs(task);
			}
		}
		
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value = "/manageWbsDetail", method = RequestMethod.GET)
	public ModelAndView wbsDetail(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		String viewName = "/wbs/manageWbsDetail";
		
		int taskSeq = Integer.parseInt(request.getParameter("taskSeq"));
		System.out.println("wbs1");
		TaskVO task = wbsService.selectStepMainSubOne(taskSeq);
		System.out.println("wbs2");
		ArrayList<WbsDetailVO> wbsDetailList = wbsService.selectWbsDetailList(taskSeq);
		System.out.println("wbs3");
		
		mav.addObject("task", task);
		mav.addObject("wbsDetailList", wbsDetailList);
		
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value = "/updateWbsDetail", method = RequestMethod.GET)
	public ModelAndView createWbsDetail(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		
		UserVO user = (UserVO) request.getSession().getAttribute("member");
		
		int taskSeq = Integer.parseInt(request.getParameter("taskSeq"));
		int userSeq = user.getUserSeq();
		String[] status =  request.getParameterValues("status");
		String[] operation =  request.getParameterValues("operation");
		String[] date =  request.getParameterValues("date");
		String[] startTime =  request.getParameterValues("startTime");
		String[] endTime =  request.getParameterValues("endTime");
		String[] updateReason = request.getParameterValues("updateReason");
		String[] wbsDetailSeq = request.getParameterValues("wbsDetailSeq");
		
		for(int i=0;i<status.length;i++) {
			if(status[i].equals("N")) {
				WbsDetailVO wbsDetail = new WbsDetailVO();
				wbsDetail.setTaskSeq(taskSeq);
				wbsDetail.setUserSeq(userSeq);
				wbsDetail.setOperation(operation[i]);
				wbsDetail.setStartTime(date[i] + " " + startTime[i]);
				wbsDetail.setEndTime(date[i] + " " + endTime[i]);
				
				wbsService.createWbsDetail(wbsDetail);
			} else if(status[i].equals("U")) {
				WbsDetailVO wbsDetail = new WbsDetailVO();
				wbsDetail.setTaskSeq(taskSeq);
				wbsDetail.setUserSeq(userSeq);
				wbsDetail.setOperation(operation[i]);
				wbsDetail.setStartTime(date[i] + " " + startTime[i]);
				wbsDetail.setEndTime(date[i] + " " + endTime[i]);
				wbsDetail.setUpdateReason(updateReason[i]);
				wbsDetail.setWbsDetailSeq(Integer.parseInt(wbsDetailSeq[i]));
				
				wbsService.updateWbsDetail(wbsDetail);
			}
		}
		String viewName = "redirect:/wbs/manageWbsDetail?taskSeq="+taskSeq;
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value = "/finishWbsDetail", method = RequestMethod.GET)
	public ModelAndView finishWbsDetail(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		String taskSeq = request.getParameter("taskSeq");
		String finishYn = request.getParameter("finishYn");
		String wbsDetailSeq = request.getParameter("wbsDetailSeq");
		
		WbsDetailVO wbsDetail = new WbsDetailVO();
		
		wbsDetail.setWbsDetailSeq(Integer.parseInt(wbsDetailSeq));
		wbsDetail.setFinishYn(finishYn);
		wbsDetail.setTaskSeq(Integer.parseInt(taskSeq));
		
		wbsService.finishWbsDetail(wbsDetail);
		
		String viewName = "redirect:/wbs/manageWbsDetail?taskSeq="+taskSeq;
		mav.setViewName(viewName);
		return mav;
	}
}
