package com.project.asc.vo;

public class UserVO {

   private int userSeq;
   private String id;
   private String pwd;
   private String name;
   private String email;
   private String phoneNum;
   private String joinDate;
   private String status;
   private String gitLink;
   private int startRowNum;
   private int viewRows;
   private String keyword;
   private String position;
   private String positionGroup;
   private String unReadingMessageYn;
   
   public UserVO() {};
   
   public UserVO(int userSeq,String id,String pwd,String name,String email,
         String phoneNum,String joinDate,String status,String gitLink,
         int startRowNum, int viewRows, String keyword, String position, String positionGroup,String unReadingMessageYn) {
      this.userSeq = userSeq;
      this.id = id;
      this.pwd = pwd;
      this.name = name;
      this.email = email;
      this.phoneNum = phoneNum;
      this.joinDate = joinDate;
      this.status = status;
      this.gitLink = gitLink;
      this.startRowNum = startRowNum;
      this.viewRows = viewRows;
      this.keyword = keyword;
      this.position = position;
      this.positionGroup = positionGroup;
      this.unReadingMessageYn = unReadingMessageYn;
   }

   public int getUserSeq() {
      return userSeq;
   }

   public void setUserSeq(int userSeq) {
      this.userSeq = userSeq;
   }

   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getPwd() {
      return pwd;
   }

   public void setPwd(String pwd) {
      this.pwd = pwd;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getPhoneNum() {
      return phoneNum;
   }

   public void setPhoneNum(String phoneNum) {
      this.phoneNum = phoneNum;
   }

   public String getJoinDate() {
      return joinDate;
   }

   public void setJoinDate(String joinDate) {
      this.joinDate = joinDate;
   }

   public String getStatus() {
      return status;
   }

   public void setStatus(String status) {
      this.status = status;
   }

   public String getGitLink() {
	   return gitLink;
   }

   public void setGitLink(String gitLink) {
	   this.gitLink = gitLink;
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
	
	public String getKeyword() {
		return keyword;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
    
	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}
	
	public String getPositionGroup() {
		return positionGroup;
	}

	public void setPositionGroup(String positionGroup) {
		this.positionGroup = positionGroup;
	}

	public String getUnReadingMessageYn() {
		return unReadingMessageYn;
	}

	public void setUnReadingMessageYn(String unReadingMessageYn) {
		this.unReadingMessageYn = unReadingMessageYn;
	}

	@Override
		public String toString() {
			return "userSeq : "+this.userSeq +
		      "/ id : "+this.id +
		      "/ pwd : "+this.pwd   +
		      "/ name :" +this.name  +
		      "/ email : " + this.email  +
		      "/ phoneNum : "+this.phoneNum +
		      "/ joinDate : "+ this.joinDate +
		      "/ status : "+this.status +
		      "/ gitLink : "+ this.gitLink  +
		      "/ keyword : "+ this.keyword +
		      "/ position : " + this.position+
		      "/ positionGroup : " + this.positionGroup+
		      "/ unReadingMessageYn : " + this.unReadingMessageYn;
		}
}