package com.project.asc.vo;

public class TeamMemberVO {
	private int teamMemberSeq;
	private int userSeq;
	private String userName;
	private String teamId;
	private String teamLeader;
	private String createDate;
	private String teamCategory;
	
	public TeamMemberVO() {}
	
	public TeamMemberVO(int teamMemberSeq,int userSeq,String userName, String teamId,String teamLeader,String createDate,String teamCategory) {
		this.teamMemberSeq = teamMemberSeq;
		this.userSeq = userSeq;
		this.userName = userName;
		this.teamId = teamId;
		this.teamLeader = teamLeader;
		this.createDate = createDate;
		this.teamCategory = teamCategory;
	}
	
	public int getTeamMemberSeq() {
		return teamMemberSeq;
	}

	public void setTeamMemberSeq(int teamMemberSeq) {
		this.teamMemberSeq = teamMemberSeq;
	}

	public int getUserSeq() {
		return userSeq;
	}

	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getTeamId() {
		return teamId;
	}

	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}

	public String getTeamLeader() {
		return teamLeader;
	}

	public void setTeamLeader(String teamLeader) {
		this.teamLeader = teamLeader;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getTeamCategory() {
		return teamCategory;
	}

	public void setTeamCategory(String teamCategory) {
		this.teamCategory = teamCategory;
	}

	@Override
	public String toString() {
		return "teamMemberSeq : " + this.teamMemberSeq + 
		"userSeq : " + this.userSeq+
		"teamId : " + this.teamId+
		"teamLeader : " + this.teamLeader+
		"createDate : " + this.createDate+
		"teamCategory : " + this.teamCategory;
	}
}
