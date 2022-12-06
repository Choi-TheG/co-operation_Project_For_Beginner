package com.project.asc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.asc.service.TaskService;
import com.project.asc.vo.ProjectVO;
import com.project.asc.vo.TaskVO;

@RequestMapping("/task")
@Controller("taskController")
public class TaskController {

	@Autowired
	private TaskService taskService;
	
	/* 프로세스 기능 페이지 이동 */
	@RequestMapping(value = "/manageTask", method = RequestMethod.GET)
	public ModelAndView manageTask(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		String viewName = "/task/manageTask";
		
		ProjectVO project = (ProjectVO) request.getSession().getAttribute("project");
		int projectSeq = project.getProjectSeq();
		
		ArrayList<TaskVO> list = taskService.selectTaskList(projectSeq);
		
		mav.addObject("list",list);
		mav.setViewName(viewName);
		return mav;
	}
	
	/* 프로세스 기능 페이지 이동 */
	@RequestMapping(value = "/manageTaskList", method = RequestMethod.GET)
	public ModelAndView manageTaskList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		String viewName = "redirect:/task/manageTask";
		
		ProjectVO project = (ProjectVO) request.getSession().getAttribute("project");
		int projectSeq = project.getProjectSeq();
		
		String[] status =  request.getParameterValues("status");
		String[] taskSeq =  request.getParameterValues("taskSeq");
		String[] title =  request.getParameterValues("title");
		String[] step =  request.getParameterValues("step");
		String[] mainTask =  request.getParameterValues("mainTask");
		String[] subTask =  request.getParameterValues("subTask");
		String[] remark1 =  request.getParameterValues("remark1");
		String[] remark2 =  request.getParameterValues("remark2");
		
		int count = status.length;
		String forStatus = "";
		for(int i=0;i < count; i++) {
			forStatus = status[i];
			TaskVO task = new TaskVO();
			task.setTaskSeq(Integer.parseInt(taskSeq[i]));
			task.setProjectSeq(projectSeq);
			task.setTitle(title[i]);
			task.setStep(step[i]);
			task.setMainTask(mainTask[i]);
			task.setSubTask(subTask[i]);
			task.setRemark1(remark1[i]);
			task.setRemark2(remark2[i]);
			
			if(forStatus.equals("N")) {
				if(taskService.createTask(task)) {
					System.out.println("삽입"+i);
				}
			} else if(forStatus.equals("U")) {
				if(taskService.updateTask(task)) {
					System.out.println("수정"+i);
				}
			} else if(forStatus.equals("D")){
				if(taskService.deleteTask(task.getTaskSeq())) {
					System.out.println("삭제"+i);
				}
			}
		}
		
		mav.setViewName(viewName);
		return mav;
	}
}
