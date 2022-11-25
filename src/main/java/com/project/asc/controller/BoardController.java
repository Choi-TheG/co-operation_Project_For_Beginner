package com.project.asc.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.asc.service.BoardService;
import com.project.asc.vo.BoardVO;
import com.project.asc.vo.PageVO;
import com.project.asc.vo.ReplyVO;

@Controller("boardController")
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	/* 게시판 리스트 조회 페이징(프로젝트 번호로) */
	@RequestMapping(value="/boardListPaging", method=RequestMethod.GET)
	public ModelAndView boardListPaging(@RequestParam("projectSeq") String projectSeq, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = "/boardListPaging";
		//한번에 보여줄 게시글 수
		int viewRows = 10;
		//현재 페이지 번호
		String pageNumSt = request.getParameter("pageNum");
		int pageNum = Integer.parseInt(pageNumSt);
		//해당 페이지의 첫번째 게시글 순서
		int startRowNum = (pageNum-1)*viewRows;
		//전체 게시글 수 
		int totalBoardNum = boardService.totalBoardNum(projectSeq);
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
		//페이징 적용된 리스트 출력
		ArrayList<BoardVO> pagingList = boardService.boardListPaging(projectSeq,startRowNum,viewRows);
		mav.addObject("pagingList", pagingList);
		mav.setViewName(viewName);
		return mav;
	}	
	
	/* 상세조회 페이지(게시글 읽기) 이동 */
	@RequestMapping(value="/readBoard", method=RequestMethod.GET)
	public ModelAndView readBoard(@RequestParam("boardSeq") String boardSeq, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = "/readBoard";
		
		BoardVO board = boardService.selectOneBoard(boardSeq);
		String imageFileName = board.getFileName();
		String ext = "";
		int count = 0;
		if(!imageFileName.equals("")) {
			ext = board.getFileName().split("\\.")[1].toString();
			} 
		System.out.println("ext = "+ext);
		String[] imageExt = {"jpg","jpeg","png","bmp","dib","tif","jfif","gif"};
		for(String str : imageExt) {
			if(ext.equals(str)) {
				count = count + 1;
			}
		}
		if(count == 1) {
			mav.addObject("ext", ext);
		}
		mav.addObject("board", board);
		//댓글리스트 조회
		ArrayList<ReplyVO> reply = boardService.selectReply(boardSeq);
		mav.addObject("replyList", reply);
		
		mav.setViewName(viewName);
		return mav;
	}	
	
	/* 게시판 작성 페이지 */
	@RequestMapping(value="/viewWriteBoard", method=RequestMethod.GET)
	public ModelAndView viewWriteBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = "/viewWriteBoard";
		mav.setViewName(viewName);
		return mav;
	}
	
	/* 게시글 등록(등록 후 게시판 리스트 조회 화면으로) */
	@RequestMapping(value="/writeBoard", method= RequestMethod.POST)
	public ModelAndView writeBoard(@ModelAttribute("info") BoardVO board, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
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

		System.out.println("writeBoard = "+board);
		//게시물 등록(첨부파일 제외)
		boolean flag = boardService.insertBoard(board);
		if(flag) {
			System.out.println("게시글 등록");
			mav.addObject("board", board);
		}
		System.out.println("controller");
		String viewName = "redirect:./boardListPaging?projectSeq="+board.getProjectSeq()+"&pageNum=1";
		
		mav.setViewName(viewName);
		return mav;
	}	
	
	/* 수정페이지 이동 */
	@RequestMapping(value="/viewUpdateBoard", method=RequestMethod.GET)
	public ModelAndView viewUpdateBoard(@RequestParam("boardSeq") String boardSeq, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = "/viewUpdateBoard";
		BoardVO board = boardService.selectOneBoard(boardSeq);
		mav.addObject("board", board);
		mav.setViewName(viewName);
		return mav;
	}
	
	/* 게시글 수정(수정 후 게시글 상세조회 화면으로) */
	@RequestMapping(value="/updateBoard", method = RequestMethod.POST)
	public ModelAndView updateBoard(@ModelAttribute("info") BoardVO board, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = "/viewUpdateBoard";
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		String completeYn = request.getParameter("completeYn");
		String boardSeq = request.getParameter("boardSeq");
		board.setBoardTitle(boardTitle);
		board.setBoardContent(boardContent);
		board.setCompleteYn(completeYn);
		
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
//				uploadFile.transferTo(new File("/var/lib/tomcat9/webapps/ROOT/dev/downloads/" + fileName));
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
//				uploadFile.transferTo(new File("/var/lib/tomcat9/webapps/ROOT/dev/downloads/" + fileName));
				
				
				board.setFileName(fileName == oldFile ? oldFile : fileName);
				board.setRealFileName(fileName == oldFile ? oldOriginalFileName : originalFileName);
			} 
		}
		
		boolean flag = boardService.updateBoard(board);
		if(flag) {
			mav.addObject("board", board);
			viewName = "redirect:./readBoard?boardSeq="+boardSeq;
		}
		mav.setViewName(viewName);
		return mav;
	}
	
	/* 이미지 출력 */
	 @RequestMapping(value = "/getImage", produces = MediaType.IMAGE_JPEG_VALUE)
	 public @ResponseBody byte[] getImage(@RequestParam("fileName") String fileName) throws IOException {
		Map<String, Object> param = new HashMap<String, Object>();
		String filePath = "C:\\dev\\file\\";
//		String filePath = "/var/lib/tomcat9/webapps/ROOT/dev/downloads/";
		String res = filePath + fileName ;
		InputStream in = new FileInputStream(res);
		return IOUtils.toByteArray(in);
	 }
	
	/* 게시글 삭제(삭제 후 게시판 조회 화면) */
	@RequestMapping(value="/deleteBoard", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView deleteBoard(@RequestParam("boardSeq") String boardSeq, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String projectSeq=request.getParameter("projectSeq");
		String viewName = "redirect:../main";
		boolean flag = boardService.deleteBoard(boardSeq);
		if(flag) {
			viewName = "redirect:./boardListPaging?projectSeq="+projectSeq+"&pageNum=1";
			
		}
		mav.setViewName(viewName);
		return mav;
	}
	
	/* 게시글 검색*/
	@RequestMapping(value="/boardSearchListPaging", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView searchBoard(@ModelAttribute("info") BoardVO board, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String boardCategory = request.getParameter("boardCategory");
		String completeYn = request.getParameter("completeYn");
		String keyword = request.getParameter("keyword");
		String projectSeq = request.getParameter("projectSeq");

		board.setBoardCategory(boardCategory);
		board.setKeyword(keyword);
		board.setCompleteYn(completeYn);
		board.setProjectSeq(Integer.parseInt(projectSeq));

		String viewName = "/boardSearchListPaging";
		
		int viewRows = 10;
		String pageNumSt = request.getParameter("pageNum");
		
		int pageNum = 1;
		if (pageNumSt != null) {
			pageNum = Integer.parseInt(pageNumSt);
			viewName = "/boardSearchListPaging";
		} 
		int startRowNum = (pageNum-1)*viewRows;
		
		board.setStartRowNum(startRowNum);
		board.setViewRows(viewRows);
		String boardNum = request.getParameter("totalBoardNum");

		int totalBoardNum = boardService.searchBoardNum(board);
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
		ArrayList<BoardVO> searchList = boardService.searchBoard(board);
		mav.addObject("searchBoard", board);
		mav.addObject("searchList", searchList);
		mav.setViewName(viewName);
		return mav;
	}	
	
	/* 첨부파일 다운로드 */ 
	@RequestMapping(value = "/fileDownload")
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
	
	/* 게시글 수정 시 기존 첨부파일만 삭제 */
	@RequestMapping(value="/deleteFile", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView deleteFile(@RequestParam("boardSeq") String boardSeq, HttpServletRequest request, HttpServletResponse response) throws Exception {
	   ModelAndView mav = new ModelAndView();
	   String viewName = "redirect:../main";
	   boolean flag = boardService.deleteFile(boardSeq);
	   if(flag) {
	      viewName = "redirect:./viewUpdateBoard?boardSeq="+boardSeq;
	   }
	   mav.setViewName(viewName);
	   return mav;
	}    
	
	/* 댓글 쓰기 */
	@RequestMapping(value="/writeReply", method=RequestMethod.POST)
	public ModelAndView writeReply(@ModelAttribute("info") ReplyVO reply, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		boolean flag = boardService.writeReply(reply);
		if(flag) {
			mav.addObject("reply", reply);
		}
		String viewName = "redirect:./readBoard?boardSeq="+reply.getBoardSeq();
		mav.setViewName(viewName);
		return mav;
	}
	
	/* 댓글 삭제 */
	@RequestMapping(value="/deleteReply", method=RequestMethod.GET)
	public ModelAndView deleteReply(@RequestParam("boardSeq") String boardSeq, @RequestParam("replySeq") String replySeq, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = "redirect:./readBoard?boardSeq="+boardSeq;
		boolean flag = boardService.deleteReply(replySeq);
		if(flag) {
			mav.setViewName(viewName);
		}
		return mav;
	}
	
	/* 댓글 수정 */
	@RequestMapping(value="/updateReply", method=RequestMethod.POST)
	public ModelAndView updateReply(@RequestParam("replyContent") String replyContent, @RequestParam("boardSeq") String boardSeq, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		ReplyVO reply = new ReplyVO();
		String replySeq = request.getParameter("replySeq");
		String viewName = "redirect:./readBoard?boardSeq="+boardSeq;
		String[] replyContents = replyContent.split("\\,");
		String replyText = replyContents[0];
		reply.setBoardSeq(Integer.parseInt(boardSeq));
		reply.setReplySeq(Integer.parseInt(replySeq));
	
		reply.setReplyContent(replyText);
		boolean flag = boardService.updateReply(reply);
		mav.setViewName(viewName);
		return mav;
	}
	
	

}
