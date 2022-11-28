<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view Message</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
	
	#vmWrap {
		width: 60%;
		height: 100%;
		margin-left: 100px;
		margin-top: 80px;
	}
	.vmName {
		width: 100%;
		height: 60px;
		margin-bottom: 50px;
	}
	.vmContent {
		width: 100%;
		height: 500px;
	}
	.left {
		width: 20%;
		height: 100%;
		float: left;
		text-align: right;
	}
	.left>p {
		padding: 5px 40px 5px 0;
		color: #384D59;
		font-family: 'Noto Sans KR', sans-serif;
	}
	.right {
		width: 70%;
		height: 100%;
		float: left;
		border: 1px solid lightgray;
		border-radius: 20px;
		box-shadow: 1px 2px 3px 0 lightgray;
	}
	.right>p {
		padding: 4px 30px 4px 30px;
		font-family: 'Noto Sans KR', sans-serif;
	}
	.rContent {
		overflow: auto;
	}
	.vmBtn {
		width: 100%;
		height: 60px;
		margin-top: 50px;
		margin-bottom: 80px;
	}
	.btn {
		color: #384D59;
		padding: 7px 10px;
		font-weight: 300;
		background-color: white;
		border-radius: 15px;
		border: 1px solid #384D59;
		font-size: 15px;
	}
	.nBtn {
		color: #ff3333;
		padding: 7px 10px;
		font-weight: 300;
		background-color: white;
		border-radius: 15px;
		border: 1px solid #ff3333;
		font-size: 15px;
	}
	.btn1 {
		float: left;
		margin-left: 100px;
	}
	.btn2 {
		float: right;
	}
</style>
</head>
<body>
<div id="vmWrap">
	<div class="vmName">
		<div class="left">
			<p>보낸 유저</p>
		</div>
		<div class="right">
			<p>${message.fromUserName}</p>
		</div>
	</div>
	<div class="vmContent">
		<div class="left">
			<p>내용</p>
		</div>
		<div class="right rContent">
			<p>${message.content}</p>
		</div>
	</div>
	<div class="vmBtn">
		<div class="btn1">
			<button type="button" onclick="location.href='messageList?messageSeq=${message.messageSeq}'" class="btn">뒤로</button>
		</div>
		<div class="btn2">
			<c:if test="${message.messageType eq 'inviteProject'}">
				<button  onclick="location.href='inviteProjectConfirm?messageSeq=${message.messageSeq}&teamId=${message.teamId}&toUserSeq=${message.toUserSeq}&fromUserSeq=${message.fromUserSeq}&toUserName=${message.toUserName}'" 
				type="button" class="btn">확인</button>
				<button onclick="location.href='inviteProjectReject?messageSeq=${message.messageSeq}&teamId=${message.teamId}&toUserSeq=${message.toUserSeq}&fromUserSeq=${message.fromUserSeq}&toUserName=${message.toUserName}'"
			 	type="button" class="nBtn">거절</button>
			</c:if>
		</div>
	</div>
</div>
</body>
</html>