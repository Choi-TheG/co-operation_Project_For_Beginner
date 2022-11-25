package com.project.asc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.asc.service.FunctionService;

@RequestMapping("/function")
@Controller("functionController")
public class FunctionController {

	@Autowired
	private FunctionService functionService;
	
	/* 프로세스 기능 페이지 이동 */
	@RequestMapping(value = "/manageFunction", method = RequestMethod.GET)
	public ModelAndView manageFunction(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		String viewName = "/function/manageFunction";
		
		mav.setViewName(viewName);
		return mav;
	}
}
