package com.project.asc.vo;

public class PageVO {
	int viewRows;
	int startRowNum;
	int pageNum;
	int totalBoardNum;
	int totalPageNum;
	int totalUserCount;
	int searchUserCount;
	
	public PageVO() {}
	public PageVO(int startRowNum, int viewRows, int pageNum, int totalBoardNum, int totalPageNum, int totalUserCount, int searchUserCount) {
		this.startRowNum = startRowNum;
		this.viewRows = viewRows;
		this.pageNum = pageNum;
		this.totalBoardNum = totalBoardNum;
		this.totalPageNum = totalPageNum;
		this.totalUserCount = totalUserCount;
		this.searchUserCount = searchUserCount;
	}
	public int getStartRowNum() {
		return startRowNum;
	}
	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}
	public int getViewRows() {
		return viewRows;
	}
	public void setViewRows(int viewRows) {
		this.viewRows = viewRows;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getTotalBoardNum() {
		return totalBoardNum;
	}
	public void setTotalBoardNum(int totalBoardNum) {
		this.totalBoardNum = totalBoardNum;
	}
	public int getTotalPageNum() {
		return totalPageNum;
	}
	public void setTotalPageNum(int totalPageNum) {
		this.totalPageNum = totalPageNum;
	}
	public int getTotalUserCount() {
		return totalUserCount;
	}
	public void setTotalUserCount(int totalUserCount) {
		this.totalUserCount = totalUserCount;
	}
	public int getSearchUserCount() {
		return searchUserCount;
	}
	public void setSearchUserCount(int searchUserCount) {
		this.searchUserCount = searchUserCount;
	}
	

}
