package com.project.asc.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.asc.service.BoardService;
import com.project.asc.service.ImplementationService;
import com.project.asc.vo.BoardVO;
import com.project.asc.vo.PageVO;
import com.project.asc.vo.ProjectVO;
import com.project.asc.vo.UserVO;

@RequestMapping("/implementation")
@Controller("implementationController")
public class ImplementationController {

	@Autowired
	private ImplementationService implementationService;
	
	/* 개발일지 페이지(리스트) */
	@RequestMapping(value = "/viewImplementation", method = RequestMethod.GET)
	public ModelAndView viewImplementation(@RequestParam("projectSeq") String projectSeq, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = "/implementation/viewImplementationPaging";
		//한번에 보여줄 게시글 수
		int viewRows = 7;
		//현재 페이지 번호
		String pageNumSt = request.getParameter("pageNum");
		int pageNum = Integer.parseInt(pageNumSt);
		//해당 페이지의 첫번째 게시글 순서
		int startRowNum = (pageNum-1)*viewRows;
		//전체 게시글 수 
		int totalBoardNum = implementationService.totalBoardNum(projectSeq);
		//전체 페이지 수
		int totalPageNum = 0;
		if(totalBoardNum%viewRows==0) {
			totalPageNum = (int) Math.ceil(totalBoardNum/viewRows);
		} else {
			totalPageNum = (int) Math.ceil(totalBoardNum/viewRows) + 1;
		}	
		//페이징 관련 정보 page에 저장
		PageVO page = new PageVO();
		page.setPageNum(pageNum);
		page.setStartRowNum(startRowNum);
		page.setTotalBoardNum(totalBoardNum);
		page.setTotalPageNum(totalPageNum);
		mav.addObject("page", page);
		int[] pageRange = new int[totalPageNum];
		for (int i=0; i>totalPageNum; i++) {
			pageRange[i] = i+1;
		}
	    mav.addObject("pageRange", pageRange);
	    ArrayList<BoardVO> board = implementationService.selectImplementationPaging(projectSeq,startRowNum,viewRows);
	    for(int i=0;i<board.size();i++) {
			BoardVO vo = board.get(i);
			String boardContent = vo.getBoardContent();
			boardContent = boardContent.replace("\r\n", "<br>");
			vo.setBoardContent(boardContent);
		}
		mav.addObject("boardList", board);
		ArrayList<BoardVO> teamMemberList = implementationService.selectTeamMember(projectSeq);
		mav.addObject("teamMemberList",teamMemberList);
		mav.setViewName(viewName);
		return mav;
	}
	
	/* 개발일지 작성페이지 이동 */
	@RequestMapping(value="/viewWriteImplementation", method=RequestMethod.GET)
	public ModelAndView viewWriteImplementation(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = "/implementation/viewWriteImplementation";
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String boardTitle = sdf.format(date);
		System.out.println("boardTitle = "+boardTitle);
		String projectSeq = request.getParameter("projectSeq");
		String userSeq = request.getParameter("userSeq");
		ArrayList<BoardVO> board = implementationService.selectSchedule(projectSeq, boardTitle, userSeq);
		System.out.println(board);
		if(board.size() != 0) {
			String str = "";
			for(int i=0; i<board.size(); i++) {
				str = str + (i==0 ? board.get(i).getOperation() : "&#10;"+board.get(i).getOperation());
			}
			System.out.println(str);
			mav.addObject("str", str);
		}
		mav.setViewName(viewName);
		return mav;
	}
	
	/* 개발일지 등록(등록 후 게시판 리스트 조회 화면으로) */
	@RequestMapping(value="/writeImplementation", method=RequestMethod.POST)
	public ModelAndView writeImplementation(@ModelAttribute("info") BoardVO board, @RequestParam("projectSeq") String projectSeq, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = "redirect:./viewImplementation?projectSeq";
		//파일 업로드 처리
		String fileName = null;
		MultipartFile uploadFile = board.getUploadFile();
		String originalFileName = "";
		if(!uploadFile.isEmpty()) {
			originalFileName = uploadFile.getOriginalFilename();
			//확장자 구하기
			String ext = FilenameUtils.getExtension(originalFileName);
			//UUID 구하기
			UUID uuid = UUID.randomUUID();
			
			fileName = uuid + "." + ext;
			uploadFile.transferTo(new File("C:\\dev\\file\\" + fileName));
//			uploadFile.transferTo(new File("/var/lib/tomcat9/webapps/ROOT/dev/downloads/" + fileName));
		} 
		board.setFileName(fileName != null ? fileName : "");
		board.setRealFileName(fileName != null ? originalFileName : "");
		
		boolean flag = implementationService.insertImplementation(board);
		if(flag) {
			viewName = "redirect:./viewImplementation?projectSeq="+projectSeq+"&pageNum=1";
		}
		mav.setViewName(viewName);
		return mav;
	}
	
	/* 첨부파일 다운로드 */
	@RequestMapping(value="/fileDownload")
	public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws Exception {

	    String filename = request.getParameter("fileName");
	    String originalFileName= request.getParameter("realFileName");
	    String realFilename="";
	    System.out.println(filename);

	    try {
	        String browser = request.getHeader("User-Agent");
	        //파일 인코딩
	        if (browser.contains("MSIE") || browser.contains("Trident")
	                || browser.contains("Chrome")) {
	            filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+",
	                    "%20");
	            originalFileName = URLEncoder.encode(originalFileName, "UTF-8").replaceAll("\\+",
	                    "%20");
//	        	filename = URLEncoder.encode(filename, "UTF-8").replaceAll("/+",
//	                    "%20");
//	            originalFileName = URLEncoder.encode(originalFileName, "UTF-8").replaceAll("/+",
//	                    "%20");
	        } else {
	            filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
	            originalFileName = new String(originalFileName.getBytes("UTF-8"), "ISO-8859-1");
	        }
	    } catch (UnsupportedEncodingException ex) {
	        System.out.println("UnsupportedEncodingException");
	    }
	    realFilename = "C:\\dev\\file\\" + filename;
//	    realFilename = "/var/lib/tomcat9/webapps/ROOT/dev/downloads/" + filename;
	    System.out.println(realFilename);
	    File file1 = new File(realFilename);
	    if (!file1.exists()) {
	        return ;
	    }
	    // 파일명 지정
	    response.setContentType("application/octer-stream");
	    response.setHeader("Content-Transfer-Encoding", "binary;");
	    response.setHeader("Content-Disposition", "attachment; filename=" + originalFileName + ";");
	    try {
	        OutputStream os = response.getOutputStream();
	        FileInputStream fis = new FileInputStream(realFilename);
	        int ncount = 0;
	        byte[] bytes = new byte[1024];
	        while ((ncount = fis.read(bytes)) != -1 ) {
	            os.write(bytes, 0, ncount);
	        }
	        fis.close();
	        os.close();
	    } catch (Exception e) {
	        System.out.println("FileNotFoundException : " + e);
	    }
	}
	
	/* 개발일지 삭제 */
	@RequestMapping(value="/deleteImplementation/{boardSeq}", method=RequestMethod.DELETE)
	@ResponseBody
	public boolean deleteImplementation(@PathVariable String boardSeq) throws Exception {
		return implementationService.deleteImplementation(boardSeq);
	}
	
	/* 첨부파일 삭제 */
	@RequestMapping(value="/deleteFile/{boardSeq}", method=RequestMethod.DELETE)
	@ResponseBody
	public boolean deleteFile(@PathVariable String boardSeq) throws Exception {
		return implementationService.deleteFile(boardSeq);
	}
	
	/* 개발일지 수정페이지 이동 */
	@RequestMapping(value="/viewUpdateImplementation", method=RequestMethod.GET)
	public ModelAndView viewUpdateImplementation(@RequestParam("boardSeq") String boardSeq, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = "/implementation/viewUpdateImplementation";
		BoardVO board = implementationService.selectOneImplementation(boardSeq);
		
		mav.addObject("board", board);
		mav.setViewName(viewName);
		return mav;
	}
	
	/* 개발일지 수정 */
	@RequestMapping(value="/updateImplementation", method=RequestMethod.POST)
	public ModelAndView updateImplementation(@ModelAttribute("info") BoardVO board, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = "redirect:./viewImplementation?projectSeq="+board.getProjectSeq()+"&pageNum=1";
		String boardSeq = request.getParameter("boardSeq");
		board.setBoardSeq(Integer.parseInt(boardSeq));
		//파일 업로드 처리
		String fileName = null;
		MultipartFile uploadFile = board.getUploadFile();
		String oldFile = request.getParameter("fileName");
		String oldOriginalFileName = request.getParameter("realFileName");
		String originalFileName = "";
		
		if(oldFile == null) {
			if(!uploadFile.isEmpty()) {
				originalFileName = uploadFile.getOriginalFilename();
				//확장자 구하기
				String ext = FilenameUtils.getExtension(originalFileName);
				//UUID 구하기
				UUID uuid = UUID.randomUUID();
				
				fileName = uuid + "." + ext;
				uploadFile.transferTo(new File("C:\\dev\\file\\" + fileName));
//						uploadFile.transferTo(new File("/var/lib/tomcat9/webapps/ROOT/dev/downloads/" + fileName));
			} 
			board.setFileName(fileName != null ? fileName : "");
			board.setRealFileName(fileName != null ? originalFileName : "");
		} else {
			if(!uploadFile.isEmpty()) {
				originalFileName = uploadFile.getOriginalFilename();
				//확장자 구하기
				String ext = FilenameUtils.getExtension(originalFileName);
				//UUID 구하기
				UUID uuid = UUID.randomUUID();
				fileName = uuid + "." + ext;
				uploadFile.transferTo(new File("C:\\dev\\file\\" + fileName));
//						uploadFile.transferTo(new File("/var/lib/tomcat9/webapps/ROOT/dev/downloads/" + fileName));
				board.setFileName(fileName == oldFile ? oldFile : fileName);
				board.setRealFileName(fileName == oldFile ? oldOriginalFileName : originalFileName);
			} 
		}
		boolean flag = implementationService.updateImplementation(board);
		if(flag) {
			mav.setViewName(viewName);
		}
		return mav;
	}
	
	/* 개발일지 검색 */
	@RequestMapping(value="/searchImplementationList", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView searchImplementation(@ModelAttribute("info") BoardVO board, @RequestParam("projectSeq") String projectSeq, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = "/implementation/viewImplementationPaging";
		String boardTitle = request.getParameter("boardTitle");
		String keyword = request.getParameter("keyword");
		board.setBoardTitle(boardTitle);
		board.setKeyword(keyword);
		
		int viewRows = 7;
		String pageNumSt = request.getParameter("pageNum");
		
		int pageNum = 1;
		if (pageNumSt != null) {
			pageNum = Integer.parseInt(pageNumSt);
			System.out.println("pageNum = "+pageNum);
			viewName = "/implementation/viewImplementationPaging";
		} 
		int startRowNum = (pageNum-1)*viewRows;
		
		board.setStartRowNum(startRowNum);
		board.setViewRows(viewRows);
		String boardNum = request.getParameter("totalBoardNum");

		int totalBoardNum = implementationService.searchImplNum(board);
		System.out.println("board = "+board);
		System.out.println("totalBoardNum = "+totalBoardNum);
		System.out.println("boardTitle = "+boardTitle);
		if (totalBoardNum == 0) {
			String totalBoardNumSt = request.getParameter("totalBoardNum");
			if(totalBoardNumSt!=null) {
				totalBoardNum = Integer.parseInt(totalBoardNumSt);
			} 
		}
		int totalPageNum = 0;
		if(totalBoardNum%viewRows==0) {
			totalPageNum = (int) Math.ceil(totalBoardNum/viewRows);
		} else {
			totalPageNum = (int) Math.ceil(totalBoardNum/viewRows) + 1;
		}
		PageVO page = new PageVO();
		page.setPageNum(pageNum);
		page.setStartRowNum(startRowNum);
		page.setTotalBoardNum(totalBoardNum);
		page.setTotalPageNum(totalPageNum);
		mav.addObject("page", page);
		request.getSession().setAttribute("boardNum", totalBoardNum);

		int[] pageRange = new int[totalPageNum];
		for (int i=0; i>totalPageNum; i++) {
			pageRange[i] = i+1;
		}
	    mav.addObject("pageRange", pageRange);
		//페이징 적용된 리스트 출력
		ArrayList<BoardVO> searchList = implementationService.searchImplementation(board);
	    for(int i=0;i<searchList.size();i++) {
			BoardVO vo = searchList.get(i);
			String boardContent = vo.getBoardContent();
			boardContent = boardContent.replace("\r\n", "<br>");
			vo.setBoardContent(boardContent);
		}
	    mav.addObject("searchBoard", board);
		mav.addObject("boardList", searchList);
		System.out.println("boardList = "+searchList);
		ArrayList<BoardVO> teamMemberList = implementationService.selectTeamMember(projectSeq);
		mav.addObject("teamMemberList",teamMemberList);
		mav.setViewName(viewName);
		return mav;
	}
	
	/* 일정 불러오는 메소드 */
	@RequestMapping(value="/getSchedule", method=RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getSchedule(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ProjectVO project = (ProjectVO) request.getSession().getAttribute("project");
		UserVO user = (UserVO) request.getSession().getAttribute("member");
		
		String projectSeq = String.valueOf(project.getProjectSeq());
		String boardTitle = request.getParameter("boardTitle");
		String userSeq = String.valueOf(user.getUserSeq());
		
		ArrayList<BoardVO> board = implementationService.selectSchedule(projectSeq, boardTitle, userSeq);
		System.out.println("board = "+board);
		String str = "";
		for(int i=0; i<board.size(); i++) {
			str = str + (i==0 ? board.get(i).getOperation() : "&#10;"+board.get(i).getOperation());
		}
		System.out.println(str);
		return str;
	}
	
}
