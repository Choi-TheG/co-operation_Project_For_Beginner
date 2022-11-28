package com.project.asc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.asc.service.ImplementationService;

@RequestMapping("/implementation")
@Controller("implementationController")
public class ImplementationController {

	@Autowired
	private ImplementationService implementationService;
	
	@RequestMapping(value = "/viewImplementation", method = RequestMethod.GET)
	public ModelAndView viewImplementation(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		String viewName = "/implementation/viewImplementation";
		
		mav.setViewName(viewName);
		return mav;
	}
}
