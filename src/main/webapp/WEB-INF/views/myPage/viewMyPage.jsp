<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>개인정보 조회</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
		<title>Bootstrap Example</title>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
		<style type="text/css">
		/* 마이페이지 전페를 감싸는 div */
		#mpWrap {
			width: 90%;
			height: 100%;	
			/* border: 7px solid red; */
		}
		
		/* 마이페이지 제목 */
		.infoTitle {
			float: left;
			margin-left: 170px;
			margin-top: 50px;
			font-weight: bold;
			font-size: 30px;
			/* border: 7px solid red; */
		}
		
		/* 프로필 사진을 감싸는 div */
		.profileImg {
			clear: both;
			float: left;
			padding-top: 150px;
			margin-left: 150px;
		}
		
		.mpImg {
			width: 200px; 
			height: 200px; 
			border-radius: 200px;
		}
		
		/* 전체 form을 감싸는 div */
		.myInfo {
			height: 600px;
			float: right;
			margin-right: 300px;
			/* border: 7px solid red; */
		}
		
		/* 하나의 form을 감싸는 div */
		.col-md-6 {
			margin-top: 15px;
		}
		
		/* 개인정보가 들어있는 form */
		.form {
			width: 350px;
			height: 50px;
			border: 0.5px solid lightgray;
			border-radius: 6px;
			outline: none;
			padding-left: 10px;
			color: #384D59;
		}
		
		/* 수정, 탈퇴 버튼 감싸는 div */
		.mpBtns {
			height: 70px;
			padding: 15px 0;
			margin-top: 30px;
		} 
		
		/* 수정, 탈퇴 버튼 */
		.mpBtn {
			height: 50px;
			border: none;
			border-radius: 10px;
			color: white;
			background-color: #1982FC;
			padding: 0 15px;
		}
		
		/* 회원 탈퇴 버튼 */
		.removeBtn {
			float: right;
			margin-right: 65px;
		}
		
		/* form 라벨 안 폰트 */
		.mpFont {
			vertical-align: middle;
			font-weight: bold;
			color: #384D59;
		}
		</style>
	</head>
	<body>
		<div id="mpWrap">
			<div class="infoTitle">
				<font>마이페이지</font>
			</div>
			<div class="profileImg">
				<img src="${contextPath}/resources/images/basic.png" class="mpImg" />
			</div>
		
			<div class="myInfo">
				<div class="col-md-6">
					<label for="name" class="form-label"><font class="mpFont">이름</font></label>
					<input type="text" name="name" value="${member.name}" class="form" readonly="readonly">
				</div>
				
				<div class="col-md-6">
					<label for="id" class="form-label"><font class="mpFont">아이디</font></label>
					<input type="text" name="id" id="id" value="${member.id}" class="form" readonly="readonly">
				</div>   
				
				<div class="col-md-6">
					<label for="email" class="form-label"><font class="mpFont">이메일</font></label>
					<input type="email" name="email" class="form" value="${member.email}" readonly="readonly">
				</div>
				
				<div class="col-md-6">
					<label for="phoneNum" class="form-label"><font class="mpFont">휴대폰</font></label>
					<input type="text" name="phoneNum" class="form" value="${member.phoneNum}" readonly="readonly">
				</div>
				
				<div class="col-md-6">
					<label for="git" class="form-label"><font class="mpFont">git 링크</font></label>
					<input type="text" name="gitLink" class="form" value="${member.gitLink}" readonly="readonly">
				</div>
				
				<div class="mpBtns">
					<a href="${contextPath}/user/viewUpdatePwdCheck"><button class="mpBtn">수정하러 가기</button></a>
					<a href="${contextPath}/user/viewRemovePwdCheck"><button class="mpBtn removeBtn">회원 탈퇴</button></a>
				</div>
			</div> <!-- .myInfo end -->
		</div> <!-- #mpWrap end -->
	</body>
</html>