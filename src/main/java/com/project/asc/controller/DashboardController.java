package com.project.asc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.asc.service.DashboardService;
import com.project.asc.vo.BoardVO;
import com.project.asc.vo.DocumentsVO;


@Controller("dashboardController")
@RequestMapping("/dashboard")
public class DashboardController {
	@Autowired
	private DashboardService dashboardService;
	
	/* 대시보드 페이지로 이동 및 조회 */
	@RequestMapping(value="/viewDashboard", method=RequestMethod.GET)
	public ModelAndView dashboard(@RequestParam("projectSeq") String projectSeq, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = "/viewDashboard";
		
		ArrayList<BoardVO> errorList = dashboardService.selectErrorBoard(projectSeq);
		mav.addObject("errorList", errorList);
		
		mav.setViewName(viewName);
		return mav;
	}
}
