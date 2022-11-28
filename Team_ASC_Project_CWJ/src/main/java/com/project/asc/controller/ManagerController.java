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
import org.springframework.web.servlet.ModelAndView;

import com.project.asc.service.ManagerService;
import com.project.asc.vo.PageVO;
import com.project.asc.vo.ProjectVO;
import com.project.asc.vo.UserVO;

@RequestMapping("/manager")
@Controller("managerController")
public class ManagerController {

   @Autowired
   private ManagerService managerService;

   /* 관리자 페이지 */
   @RequestMapping(value = "/viewManagerPage", method = RequestMethod.GET)
   public ModelAndView viewManagerPage(HttpServletRequest request, HttpServletResponse response) {
      ModelAndView mav = new ModelAndView();
      String viewName = "redirect:/manager/userList";

      mav.setViewName(viewName);
      return mav;
   }

   /* 프로젝트 전체 목록 불러오기 */
   @RequestMapping(value = "/projectList", method = RequestMethod.GET)
   public ModelAndView viewProjectPage(HttpServletRequest request, HttpServletResponse response) {
      ModelAndView mav = new ModelAndView();
      String viewName = "/projectList";
      ArrayList<ProjectVO> list = managerService.projectList();

      mav.addObject("list", list);
      mav.setViewName(viewName);
      return mav;
   }

   /* 회원 목록 페이징 */
   @RequestMapping(value = "/userListPaging", method = { RequestMethod.GET, RequestMethod.POST })
   public ModelAndView userListPaging(HttpServletRequest request, HttpServletResponse response) {
      ModelAndView mav = new ModelAndView();
      String viewName = "/userListPaging";
      // 한 페이지에 출력할 회원 수
      int viewRows = 3;

      // 현재 페이지 번호
      String nowPageNum = request.getParameter("pageNum");
      System.out.println("nowPageNum = " + nowPageNum);
      int pageNum = Integer.parseInt(nowPageNum);

      // 해당 페이지의 첫번째 순서
      int startRowNum = (pageNum - 1) * viewRows;

      // 전체 회원 수
      int totalUserCount = managerService.selectUserCount();
      System.out.println("totalUserCount = " + totalUserCount);

      // 전체 페이지 수
      int totalPageNum = 0;
      if (totalUserCount % viewRows == 0) {
         totalPageNum = (int) Math.ceil(totalUserCount / viewRows);
      } else {
         totalPageNum = (int) Math.ceil(totalUserCount / viewRows) + 1;
      }

      // 페이징 관련 정보 page에 저장
      PageVO page = new PageVO();
      page.setPageNum(pageNum);
      page.setStartRowNum(startRowNum);
      page.setTotalUserCount(totalUserCount);
      page.setTotalPageNum(totalPageNum);

      mav.addObject("page", page);

      int[] pageRange = new int[totalPageNum];
      for (int i = 0; i > totalPageNum; i++) {
         pageRange[i] = i + 1;
      }
      mav.addObject("pageRange", pageRange);

      // 페이징 적용된 리스트 출력
      ArrayList<UserVO> userListPaging = managerService.userListPaging(startRowNum, viewRows);
      mav.addObject("userListPaging", userListPaging);
      mav.setViewName(viewName);
      return mav;
   }

   /*
    * 검색
    * 
    * @RequestMapping(value = "/searchUser", method = RequestMethod.POST) public
    * ModelAndView searchUser(HttpServletRequest request,HttpServletResponse
    * response) { ModelAndView mav = new ModelAndView(); String keyword =
    * request.getParameter("keyword") != null ? request.getParameter("keyword") :
    * ""; String status = request.getParameter("status") != null ?
    * request.getParameter("status") : ""; String nowPageNum =
    * request.getParameter("pageNum");
    * 
    * UserVO user = new UserVO(); user.setKeyword(keyword); user.setStatus(status);
    * 
    * String viewName = "/userListPaging"; // 한 페이지에 출력할 회원 수 int viewRows = 3;
    * 
    * // 현재 페이지 번호 int pageNum = Integer.parseInt(nowPageNum);
    * 
    * // 해당 페이지의 첫번째 순서 int startRowNum = (pageNum - 1) * viewRows;
    * 
    * // 전체 회원 수 int totalUserCount = managerService.searchUserCount(user);
    * System.out.println("totalUserCount = " + totalUserCount);
    * 
    * // 전체 페이지 수 int totalPageNum = 0; if (totalUserCount % viewRows == 0) {
    * totalPageNum = (int) Math.ceil(totalUserCount / viewRows); } else {
    * totalPageNum = (int) Math.ceil(totalUserCount / viewRows) + 1; }
    * 
    * // 페이징 관련 정보 page에 저장 PageVO page = new PageVO(); page.setPageNum(pageNum);
    * page.setStartRowNum(startRowNum); page.setTotalUserCount(totalUserCount);
    * page.setTotalPageNum(totalPageNum);
    * 
    * mav.addObject("page", page);
    * 
    * int[] pageRange = new int[totalPageNum]; for (int i = 0; i > totalPageNum;
    * i++) { pageRange[i] = i + 1; } mav.addObject("pageRange", pageRange);
    * 
    * user.setStartRowNum(startRowNum); user.setViewRows(viewRows);
    * 
    * // 페이징 적용된 리스트 출력 ArrayList<UserVO> userListPaging =
    * managerService.searchUserListPaging(user); mav.addObject("userListPaging",
    * userListPaging); mav.setViewName(viewName); return mav;
    * 
    * 
    * System.out.println(status+"-"+keyword);
    * 
    * UserVO user = new UserVO();
    * 
    * user.setStatus(status); user.setKeyword(keyword);
    * 
    * String viewName = "/userListPaging";
    * 
    * int viewRows = 3; String nowPageNum = request.getParameter("pageNum");
    * 
    * int pageNum = 1; if(nowPageNum != null) { pageNum =
    * Integer.parseInt(nowPageNum); viewName = "/userListPaging"; } int startRowNum
    * = (pageNum - 1) * viewRows;
    * 
    * user.setStartRowNum(startRowNum); user.setViewRows(viewRows); String
    * userCount = request.getParameter("searchUserCount");
    * 
    * int searchUserCount = managerService.searchUserCount(user); if
    * (searchUserCount == 0) { } int totalPageNum = 0; if(searchUserCount %
    * viewRows == 0) { totalPageNum = (int)Math.ceil(searchUserCount / viewRows); }
    * else { totalPageNum = (int)Math.ceil(searchUserCount / viewRows) + 1; }
    * 
    * PageVO page = new PageVO(); page.setPageNum(pageNum);
    * page.setStartRowNum(startRowNum); page.setSearchUserCount(searchUserCount);
    * page.setTotalPageNum(totalPageNum);
    * 
    * mav.addObject("page", page); request.getSession().setAttribute("userCount",
    * searchUserCount);
    * 
    * int[] pageRange = new int[totalPageNum]; for (int i = 0; i > totalPageNum;
    * i++) { pageRange[i] = i + 1; } mav.addObject("pageRange", pageRange);
    * 
    * // 페이징 적용된 리스트 출력 ArrayList<UserVO> userListPaging = new ArrayList<UserVO>();
    * userListPaging = managerService.searchUserList(user);
    * mav.addObject("userListPaging", userListPaging); mav.setViewName(viewName);
    * return mav;
    * 
    * }
    */
   /* 검색 */
      @RequestMapping(value = "/searchUser", method = RequestMethod.POST)
      public ModelAndView searchUser(HttpServletRequest request, HttpServletResponse response) {
         ModelAndView mav = new ModelAndView();
         String status = request.getParameter("status");
         String keyword = request.getParameter("keyword");

         ArrayList<UserVO> list = new ArrayList<UserVO>();
         list = managerService.searchUserList(status,keyword);
         
         mav.addObject("list", list);
         mav.setViewName("/userList");
         return mav;
      }   
   /* 회원 상세정보 페이지 가기 */
   @RequestMapping(value = "/userProfile", method = RequestMethod.GET)
   public ModelAndView viewUserProfile(@RequestParam("userSeq") int userSeq, HttpServletRequest request,
         HttpServletResponse response) {
      ModelAndView mav = new ModelAndView();
      String viewName = "/viewUserProfile";
      UserVO user = managerService.selectUserInfo(userSeq);

      mav.addObject("member", user);
      mav.setViewName(viewName);
      return mav;
   }

   /* 회원정보 수정 */
   @RequestMapping(value = "/updateUserInfo", method = { RequestMethod.GET, RequestMethod.POST })
   public ModelAndView updateUserInfo(@ModelAttribute("info") UserVO user, HttpServletRequest request,
         HttpServletResponse response) {
      ModelAndView mav = new ModelAndView();
      boolean flag = false;

      int userSeq = Integer.parseInt(request.getParameter("userSeq").trim());
      String id = request.getParameter("id");
      String pwd = request.getParameter("pwd");
      String name = request.getParameter("name");
      String email = request.getParameter("email");
      String phoneNum = request.getParameter("phoneNum");
      String joinDate = request.getParameter("joinDate");
      String status = request.getParameter("status");
      String gitLink = request.getParameter("gitLink");

      user.setUserSeq(userSeq);
      user.setId(id);
      user.setPwd(pwd);
      user.setName(name);
      user.setEmail(email);
      user.setPhoneNum(phoneNum);
      user.setJoinDate(joinDate);
      user.setStatus(status);
      user.setGitLink(gitLink);

      System.out.println(user);
      flag = managerService.updateUserInfo(user);

      if (flag) {
         mav.addObject("user", user);
         System.out.println("userSeq = " + userSeq);
      }

      System.out.println("updateController");
      mav.setViewName("redirect:/manager/userProfile?userSeq=" + userSeq);
      return mav;
   }

   /* 일반 유저 리스트 */
   @RequestMapping(value = "/userList", method = { RequestMethod.GET, RequestMethod.POST })
   public ModelAndView userList(HttpServletRequest request, HttpServletResponse response) {
      ModelAndView mav = new ModelAndView();

      ArrayList<UserVO> list = managerService.selectAllUserList();

      mav.addObject("list", list);

      mav.setViewName("/userList");
      return mav;
   }

   /* 상태(status) 'N'으로 바꾸기 */
   @RequestMapping(value = "/updateUserStatus", method = { RequestMethod.GET, RequestMethod.POST })
   public ModelAndView updateUserStatus(@RequestParam("userSeq") int userSeq, HttpServletRequest request,
         HttpServletResponse response) {
      ModelAndView mav = new ModelAndView();
      boolean flag = false;

      flag = managerService.updateUserStatus(userSeq);

      System.out.println("delete success");
      mav.setViewName("redirect:/manager/userList");
      return mav;
   }
}