package com.project.asc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.project.asc.service.UserService;
import com.project.asc.vo.UserVO;
@ResponseBody
@RequestMapping("/user")
@RestController("userController")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	//user
	/* 회원 가입 페이지 */
	@RequestMapping(value="/viewJoin",method=RequestMethod.GET)
	public ModelAndView viewJoin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String viewName = "/user/viewJoin";
		ArrayList<String> list = new ArrayList<String>();
		ArrayList<UserVO> positionGroup = userService.selectPositionGroup();

		for(UserVO vo : positionGroup) {
			list.add(vo.getPositionGroup());
		}
		
		mav.addObject("list", list);
		
		mav.setViewName(viewName);
		
		return mav;
	}
	/* 회원 가입 */
	@RequestMapping(value="/createUser",method=RequestMethod.POST)
	public ModelAndView createUser(@ModelAttribute("info") UserVO user, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		boolean flag = false;
		flag = userService.createUser(user);
		String viewName = "error";
		if(flag) {
			viewName = "redirect:/main";
		} 
		mav.setViewName(viewName);
		
		return mav;
	}
	
	/* rest 회원가입 아이디 중복 체크 */
	@RequestMapping(value="/checkId",method=RequestMethod.GET)
	public boolean checkId(@RequestParam("userId") String userId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		boolean flag = false;
		flag = userService.checkId(userId);
		return flag;
	}
	
	/* rest 회원가입 이메일 중복 체크 */
	@RequestMapping(value="/checkEmail",method=RequestMethod.GET)
	public boolean checkEmail(@RequestParam("userEmail") String userEmail, HttpServletRequest request, HttpServletResponse response) throws Exception {
		boolean flag = false;
		flag = userService.checkEmail(userEmail);
		return flag;
	}	
	
	/* rest 회원가입 연락처 중복 체크 */
	@RequestMapping(value="/checkPhoneNum",method=RequestMethod.GET)
	public boolean checkPhoneNum(@RequestParam("userPhoneNum") String userPhoneNum, HttpServletRequest request, HttpServletResponse response) throws Exception {
		boolean flag = false;
		flag = userService.checkPhoneNum(userPhoneNum);
		return flag;
	}	
	
	/* 로그인 페이지 */
	@RequestMapping(value = "/viewLogin", method = RequestMethod.GET)
	public ModelAndView viewLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = "/user/viewLogin";
		mav.setViewName(viewName);
		return mav;
	}
	
	/* rest 아이디 찾기 이름,이메일 체크 */
	@RequestMapping(value="/checkNameEmail",method=RequestMethod.GET)
	public boolean checkNameEmail(@RequestParam("userName") String userName,@RequestParam("userEmail") String userEmail, HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		boolean flag = false;
		flag = userService.checkNameEmail(userName,userEmail);
		return flag;
	}	
	
	/* 로그인 하지않고 프로젝트 작성 클릭시 처리 */
	@RequestMapping(value = "/viewLoginBeforeProject", method = RequestMethod.GET)
	public ModelAndView viewLogionBeforeProject(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = "/user/viewLogin";
		mav.addObject("projectYN","Y");
		mav.setViewName(viewName);
		return mav;
	}
	
	/* rest 로그인 체크 */
	@RequestMapping(value="/checkIdPwd",method=RequestMethod.GET)
	public boolean checkUserIdPwd(@RequestParam("userId") String userId,@RequestParam("userPwd") String userPwd, HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		boolean flag = false;
		flag = userService.checkId(userId,userPwd);
		return flag;
	}	
	
	/* 로그인 */ 
	@RequestMapping(value = "/login", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView login(@RequestParam("id") String id, @RequestParam("pwd") String pwd,@RequestParam("projectYN") String projectYN, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = "redirect:/main";

		UserVO user = userService.selectUser(id,pwd);
		
		// 안 읽은 메세지 유무 확인
		if(userService.unReadingMessage(user.getUserSeq())) {
			user.setUnReadingMessageYn("Y");
		} else {
			user.setUnReadingMessageYn("N");
		}

		boolean isLogon = false;
		if (user != null) {
			request.getSession().setAttribute("member", user);
			isLogon = true;
			
			if(projectYN.equals("Y")) {
				viewName = "redirect:/project/viewCreateProject";
			}
		}  else {
			viewName = "/user/viewLogin";
		}
		
		request.getSession().setAttribute("isLogon", isLogon);

		mav.setViewName(viewName);
		return mav;
	}
	
	/* 로그아웃 */
	@RequestMapping(value="/logout", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = "redirect:/main";
		request.getSession().invalidate();
		mav.setViewName(viewName);
		return mav;
	}
	
	/* 아이디 찾기 페이지 */
	@RequestMapping(value = "/viewFindInfoId", method = RequestMethod.GET)
	public ModelAndView viewFindInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = "/viewFindInfoId";
		mav.setViewName(viewName);
		return mav;
	}		
			
	/* 아이디 찾기 */
	@RequestMapping(value = "/findInfoId", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView findInfoId(@RequestParam("name") String name, @RequestParam("email") String email, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = "redirect:/user/viewFindInfoId";
		UserVO user = new UserVO();
		user.setName(name);
		user.setEmail(email);
		
		String id = userService.findId(user);
		
		if (id != null) {
			request.getSession().setAttribute("id", id);
			viewName = "/successFindId";
		} 
		request.getSession().setAttribute("id", id);
		mav.setViewName(viewName);
		return mav;
	}				
			
	/* 비번 찾기 페이지 */
	@RequestMapping(value = "/viewFindInfoPwd", method = RequestMethod.GET)
	public ModelAndView viewFindInfoPwd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = "/viewFindInfoPwd";
		mav.setViewName(viewName);
		return mav;
	}				
			
	/* 비번찾기 찾기 */
	@RequestMapping(value = "/findInfoPwd", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView findInfoPwd(@RequestParam("id") String id, @RequestParam("name") String name, @RequestParam("email") String email, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = "/viewFindInfoPwd";
		UserVO user = new UserVO();
		user.setId(id);
		user.setName(name);
		user.setEmail(email);
		
		String pwd = userService.findPwd(user);
		
		if (pwd != null) {
			request.getSession().setAttribute("user", user);
			viewName = "/updatePwd";
		} 
		mav.setViewName(viewName);
		return mav;
	}			
		
	/* 비밀번호 새로 설정 */
	@RequestMapping(value="/updatePwd", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView updatePwd(@RequestParam("id") String id, @RequestParam("newPwd") String newPwd, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = "/main";
		UserVO user = new UserVO();
		user.setPwd(newPwd);
		user.setId(id);
		boolean flag = userService.updatePwd(user);
		if(flag) {
			viewName="/successUpdatePwd";
		}
		mav.setViewName(viewName);
		return mav;
	}
	
	
	
	/* 마이페이지 보기 */
	@RequestMapping(value="/viewMyPage", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView viewMyPage(@RequestParam(required = false) String id, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		System.out.println("controller seq = " + id);
		UserVO user = userService.selectMyInfo(id);
	
		mav.addObject("member",user);
		mav.setViewName("/viewMyPage");
		return mav;
	}
	
	/* 마이페이지 수정 버튼 클릭 시 비밀번호 체크 페이지 */
	@RequestMapping(value="/viewUpdatePwdCheck", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView viewUpdatePwdCheck(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/updateCheck");
		return mav;
	}
	
	/* 마이페이지 수정 비밀번호 체크 */
	@RequestMapping(value="/updatePwdCheck", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updatePwdCheck(@RequestParam("id") String id,@RequestParam("pwd") String pwd, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		UserVO user = userService.selectUserPwd(id,pwd);
		String viewName = "/updateMyPage";
		
		boolean ckPwd = false;
		if (user != null) {
			request.getSession().setAttribute(pwd, user);
			ckPwd = true;
		} else {
			viewName = "/updateCheck";
		}
		
		System.out.println(ckPwd);
		request.getSession().setAttribute("ckPwd", ckPwd);
		mav.setViewName(viewName);
		return mav;
	}
	
	/* myPage */
	/* 개인정보 수정 */
	@RequestMapping(value="/updateMyInfo", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updateMyInfo(@ModelAttribute("info") UserVO user, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		boolean flag = false;
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pwd = request.getParameter("newPw2");
		String pwdOld = request.getParameter("pwd");
		String email = request.getParameter("email");
		String phoneNum = request.getParameter("phoneNum");
		
		if(pwd == "") {
			user.setName(name);
			user.setEmail(email);
			user.setPhoneNum(phoneNum);
			user.setPwd(pwdOld);
			System.out.println(user);
		} else {
			user.setName(name);
			user.setPwd(pwd);
			user.setEmail(email);
			user.setPhoneNum(phoneNum);
			System.out.println("pwd2");
		}
		
		flag = userService.updateMyInfo(user); 
		
		if(flag) {
			request.getSession().setAttribute("member", user);
			System.out.println("수정 완료");
		}
		
		System.out.println(user);
		mav.setViewName("redirect:/user/viewMyPage?id=" + id);
		return mav;
	}
	
	/* 회원 탈퇴 시 비밀번호 체크 페이지 */
	@RequestMapping(value="/viewRemovePwdCheck", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView viewRemovePwdCheck(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/removeCheck");
		return mav;
	}
	
	/* 회원 탈퇴 시 비밀번호 체크 */
	@RequestMapping(value="/removePwdCheck", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView removePwdCheck(@RequestParam("id") String id,@RequestParam("pwd") String pwd, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		System.out.println("id = " + id);
		System.out.println("pwd = " + pwd);
		UserVO user = userService.selectUserPwd(id,pwd);
		System.out.println(user);
		
		String viewName = "/removeCheck";
		if(user != null) {
			viewName = "redirect:./removeUser";
		}
		
		request.getSession().setAttribute("user", user);
		mav.setViewName(viewName);
		return mav;
	}
	
	/* 상태(status) 'N'으로 바꾸기 -> 회원 탈퇴 */
	@RequestMapping(value = "/removeUser", method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView removeUser(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		boolean flag = false;
		UserVO user = (UserVO) request.getSession().getAttribute("member");
		System.out.println(user);
		int userSeq = user.getUserSeq();
		flag = userService.removeUser(userSeq);
		if(flag) {
			System.out.println("delete success");
		}
		
		mav.setViewName("redirect:./logout");
		return mav;
	}
}
