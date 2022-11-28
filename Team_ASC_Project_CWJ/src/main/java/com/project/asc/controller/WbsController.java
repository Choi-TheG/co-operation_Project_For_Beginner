package com.project.asc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.asc.service.WbsService;

@RequestMapping("/wbs")
@Controller("wbsController")
public class WbsController {

	@Autowired
	private WbsService wbsService;
	
	@RequestMapping(value = "/manageWbs", method = RequestMethod.GET)
	public ModelAndView manageWbs() {
		ModelAndView mav = new ModelAndView();
		String viewName = "/wbs/manageWbs";
		
		mav.setViewName(viewName);
		return mav;
	}
}
