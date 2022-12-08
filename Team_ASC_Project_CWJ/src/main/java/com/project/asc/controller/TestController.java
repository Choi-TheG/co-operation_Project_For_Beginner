package com.project.asc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.asc.service.TestService;
import com.project.asc.vo.ProjectVO;
import com.project.asc.vo.TeamMemberVO;
import com.project.asc.vo.TestVO;
import com.project.asc.vo.UserVO;

@RequestMapping("/test")
@Controller("testController")
public class TestController {
	
	@Autowired
	private TestService testService;
	
	
	/* unit test main */
	@RequestMapping(value = "/manageTest", method = RequestMethod.GET)
	public ModelAndView manageTest(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		// get projectSeq, teamId in session
		ProjectVO project = (ProjectVO) request.getSession().getAttribute("project");
		int projectSeq = project.getProjectSeq();
		String teamId = project.getTeamId();
		
		// get userName in session
		UserVO member = (UserVO) request.getSession().getAttribute("member");
		String loginUser = member.getName();
		
		// manager 정보 session에서 가져오기
		TestVO vo = new TestVO();
		vo.setManager(loginUser);
		
		// list
		ArrayList<TeamMemberVO> userList = new ArrayList<TeamMemberVO>();
		ArrayList<TestVO> list = new ArrayList<TestVO>();
		userList = testService.selectUserList(teamId);
		list = testService.selectAllTest(projectSeq);
		System.out.println("Test list : "+list);
		mav.addObject("loginUser", loginUser);
		mav.addObject("userList", userList);
		mav.addObject("list", list);
		
		mav.setViewName("/test/manageTest");
		return mav;
	}
	
	/* Unit Test 행추가 */
	@RequestMapping(value="/createTest", method=RequestMethod.GET)
	public ModelAndView createTest(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		// get projectSeq to session
		ProjectVO project = (ProjectVO) request.getSession().getAttribute("project");
		int projectSeq = project.getProjectSeq();
		
		// get member to session
		UserVO member = (UserVO) request.getSession().getAttribute("member");
		String manager = member.getName();
		
 		// insert
		boolean flag = testService.insertTest(projectSeq, manager);
		
		if(flag) {
			System.out.println("insert done");
		}
		
		mav.setViewName("redirect:/test/manageTest");
		return mav;
	}
	
	/* 행 수정 */
	@RequestMapping(value="updateTest", method=RequestMethod.GET)
	public ModelAndView updateTest(@ModelAttribute("info") TestVO test,
			@RequestParam("testSeq") String testSeq,
			HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		boolean flag = testService.updateTest(test);
		
		if(flag) {
			System.out.println("test update done.");
		}else {
			System.out.println("test update fail");
		}
		
		mav.setViewName("redirect:/test/manageTest");
		return mav;
	}
	
	/* 행 삭제 */
	@RequestMapping(value="deleteTest", method=RequestMethod.GET)
	public ModelAndView deleteTest(@RequestParam("testSeq") String testSeq,
			HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		// delete
		boolean flag = testService.deleteTest(testSeq);
		if(flag) {
			System.out.println("delete done");
		}
		
		mav.setViewName("redirect:/test/manageTest");
		return mav;
	}
}
