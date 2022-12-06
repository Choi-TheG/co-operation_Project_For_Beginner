<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function submit1(frm) {
		frm.action="viewFindInfoId";
		frm.method="GET";
		frm.submit();
		return true;
	}
	
	function submit2(frm) {
		frm.action="viewFindInfoPwd";
		frm.method="GET";
		frm.submit();
		return true;
	}
</script>
<style type="text/css">
	.board-main {
		width:30%;
		height:50%;
		float:center;
		display:block;
		margin-left:20%;
		margin-top:7%;
		text-align: center;
	}
	#iwantheight {
		min-height: 500px;
	}
	.button {
		color:white;
		padding: 7px 20px;
		font-weight: bold;
		border:0;
	}
	.button-position {
		font-size: 25px;
	}
	.login-button {
		padding:10px 40%;
		font-size: 20px;
		background-color: #384D59;
		border-radius:5px;
		
	}
	.search-button {
		background-color:white;
		margin-top: 10px;
		border:none;
		border-bottom: 1px solid #384D59;
		color:#384D59;
		font-weight: bold;
		font-size:13px;
	}
	.input-box{
	  position:relative;
	  margin:10px 0;
	}
	.input-box > input{
	  background:transparent;
	  border:none;
	  border-bottom: solid 1px #ccc;
	  padding:20px 0px 5px 0px;
	  font-size:14pt;
	  width:100%;
	}
	input::placeholder{
		color:transparent;
	}
	input:placeholder-shown + label{
	  color:#aaa;
	  font-size:14pt;
	  top:15px;
	}
	input:focus + label, label{
	  color:#8aa1a1;
	  font-size:10pt;
	  pointer-events: none;
	  position: absolute;
	  left:0px;
	  top:0px;
	  transition: all 0.2s ease ;
	  -webkit-transition: all 0.2s ease;
	  -moz-transition: all 0.2s ease;
	  -o-transition: all 0.2s ease;
	}
	input:focus, input:not(:placeholder-shown){
	  border-bottom: solid 1px #8aa1a1;
	  outline:none;
	}
</style>
<body>
<form action="login" method="POST" id="loginForm" name="form1">
<input type="hidden" value ="${projectYN}" name="projectYN"><!-- 로그인 하지않고 프로젝트 생성 눌렀을경우 Y -->
<div class="board-main">

     <div class="input-box">
         <input id="username" type="text" name="id" placeholder="아이디">
         <label for="username">아이디</label>
     </div>

     <div class="input-box">
         <input id="password" type="password"  name="pwd" placeholder="비밀번호">
         <label for="password">비밀번호</label>
     </div>
</br>
		<div class="button-position">
			<input class="button login-button" type="submit" value="로그인" id="loginBtn" onclick="nullCheck(); return false;"></br>
			<input class="button search-button" type="button" value="아이디 찾기" onclick="return submit1(this.form);">
			<input class="button search-button" type="button" value="비밀번호 찾기" onclick="return submit2(this.form);">
		</div>
</div>
</form>
<script type="text/javascript">
	function nullCheck() {
		let frm = document.form1;
		if(!frm.id.value){
			alert("아이디를 입력하세요");
			frm.id.focus();
			return false;
		}
		if(!frm.pwd.value){
			alert("비밀번호를 입력하세요");
			frm.pwd.focus();
			return false;
		} else {
			let id = frm.id.value;
			let pwd = frm.pwd.value;
			
			$.ajax({
				type:'get',
				url:'./checkIdPwd',
				dataType:'text',
				data:{
					userId:id,
					userPwd:pwd
				},
				success:function(data,status){
					let jsonBoolean = JSON.parse(data);
					if(!jsonBoolean){
						alert("아이디/비밀번호를 확인해주세요");
						return false;
					} else {
						frm.submit();
					}
				},
				error : function(data,status){
					console.log("error");
					console.log(url);
				},
				complete:function(data,status){
					console.log("complete");
				}
			})
		}
	}
</script>
</body>
</html>


