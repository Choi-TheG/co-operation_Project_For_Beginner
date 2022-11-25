<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 상세정보</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
		<title>Bootstrap Example</title>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
		<style type="text/css">
		/* 회원 정보 전체를 감싸는 div */
		#profileWrap {
			width: 90%;
			height: 800px;
			padding-left: 100px;
			padding-right: 250px;
		}
		
		/* 해당 유저 이름 */
		.userName {
			width: 300px;
			margin-top: 100px;
			font-weight: bold;
			font-size: 30px;
		}
		
		.userInfo {
			clear: both;
			margin-top: 50px;
			float: left;
		}
		
		.plusInfo{
			float: right;
			margin-top: 43px;
		}
		
		/* 하나의 form을 감싸는 div */
		.col-md-6 {
			margin-top: 15px;
		}
		
		.itemWrap label{
			float: left;
			width: 90px;
			height: 50px;
			text-align: center;
			line-height: 50px;
			margin-top: 15px;
		}
		
		/* 유저정보가 들어있는 form */
		.form {
			width: 350px;
			height: 50px;
			border: 0.5px solid lightgray;
			border-radius: 6px;
			outline: none;
			padding-left: 10px;
			color: #384D59;
			margin-top: 15px;
		}
		
		/* 수정 버튼 감싸는 div */
		.mpBtns {
			height: 70px;
		} 
		
		/* 수정 버튼 */
		.mpBtn {
			width: 350px;
			height: 50px;
			border: none;
			border-radius: 10px;
			color: white;
			background-color: #1982FC;
			padding: 0 15px;
			margin-top: 50px;
			margin-left: 90px;
		}
		
		/* form 라벨 안 폰트 */
		.mpFont {
			vertical-align: middle;
			font-weight: bold;
			color: #384D59;
		}
		.read-only-color {
			border:none;
			background-color: rgba(119, 134, 165, 0.2);
		}
		</style>
	</head>
	<body>
		<div id="profileWrap">
			<form action="${contextPath}/manager/updateUserInfo" method="POST">
				<div class="userName">
					<font>[${member.name}] 회원 정보</font>
				</div>
				<div class="userInfo">
					<div class="itemWrap">
						<label for="name" class="form-label"><font class="mpFont">회원번호</font></label>
						<input type="text" name="userSeq" value="${member.userSeq}" class="form read-only-color" readonly="readonly">
					</div>	
						<br />
					<div class="itemWrap">
						<label for="id" class="form-label"><font class="mpFont">아이디</font></label>
						<input type="text" name="id" id="id" value="${member.id}" class="form read-only-color" readonly="readonly">
					</div>
						<br />
					<div class="itemWrap">
						<label for="pwd" class="form-label"><font class="mpFont">비밀번호</font></label>
						<input type="text" name="id" id="id" value="${member.pwd}" class="form read-only-color" readonly="readonly"> 
					</div>			
						<br />
					<div class="itemWrap">
						<label for="name" class="form-label"><font class="mpFont">이름</font></label>
						<input type="text" name="name" value="${member.name}" class="form">
					</div>									
						<br />
					<div class="itemWrap">
						<label for="email" class="form-label"><font class="mpFont">이메일</font></label>
						<input type="email" name="email" class="form" value="${member.email}">
					</div>					
						<br />
					<div class="itemWrap">
						<label for="phoneNum" class="form-label"><font class="mpFont">휴대폰</font></label>
						<input type="text" name="phoneNum" class="form" value="${member.phoneNum}">
					</div>	
				</div>
				
				<div class="plusInfo">
					<div class="itemWrap">
						<label for="git" class="form-label"><font class="mpFont">git 링크</font></label>
						<input type="text" name="gitLink" class="form" value="${member.gitLink}">
					</div>
						<br />
					<div class="itemWrap">
						<label for="joinDate" class="form-label"><font class="mpFont">가입일자</font></label>
						<input type="text" name="joinDate" class="form read-only-color" value="${member.joinDate}" readonly="readonly">
					</div>
						<br />
					<div class="itemWrap">
						<label for="status" class="form-label"><font class="mpFont">계정 상태</font></label>
						<c:choose>
							<c:when test="${member.status eq 'Y'}">
								<input type="text" name="status" class="form read-only-color" value="활동 회원" readonly="readonly" />
							</c:when>
							<c:otherwise>
								<input type="text" name="status" class="form read-only-color" value="비활동 회원 " readonly="readonly" />
							</c:otherwise>
						</c:choose>
					</div>
						<br />
					<div class="userBtn">
						<input type="submit" value="수정하기" class="mpBtn">
					</div>
				</div>	
				
			</form>
		</div>
	</body>
</html>