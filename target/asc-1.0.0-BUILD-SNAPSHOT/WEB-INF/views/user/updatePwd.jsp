<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	.button {
		color:white;
		padding: 7px 20px;
		font-weight: bold;
		border:0;
	}

	.login-button {
		padding:10px 25%;
		margin-top:30px;
		font-size: 20px;
		background-color: #384D59;
		border-radius:5px;
		font-size: 15px;
	}
	.input-box{
	  position:relative;
	  margin:10px 0px;
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
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		console.log('ready');
		
		//처음엔 비번 맞다 틀리다 경고창 안보이게 hide
		$("#alert-success").hide();
		$("#alert-fail").hide();
		
		$("input").keyup(function(){
			//아이디가 checkPwd인 input 요소의 값을 pwd 변수에 저장
			var pwd1=$("#checkPwd1").val();
			var pwd2=$("#checkPwd2").val();
			//pwd1, pwd2값 비교
			if(pwd1 != "" || pwd2 != "") {
				if(pwd1 != "" && pwd2 != "" && pwd1 == pwd2) {
					$("#alert-success").show();
					$("#alert-fail").hide();
					//버튼 비활성화 속성 제거
					$("#submit").removeAttr("disabled"); 
				} else if(pwd1 != "" && pwd2 != "" && pwd1 != pwd2) {
					$("#alert-success").hide();
					$("#alert-fail").show();
					//버튼 비활성화
					$("#submit").attr("disabled","disabled");
				}
			}
		});//비밀번호 동일한지 체크
		
		$("#alert-pattern-success").hide();
		$("#alert-pattern-fail").hide();
		$("input").keyup(function(){
			console.log("pattern-ready");
			var pwd = $("#checkPwd1").val();
			var num = pwd.search(/[0-9]/);
			var eng = pwd.search(/[a-z]/);
			var engCap = pwd.search(/[A-Z]/);
			
			var checkNum = false;
			var checkEng = false;
			var checkEngCap = false;
			var checkLen = false;
			
			if(eng >= 0) {
				checkEng = true;
			}
			if(num >= 0) {
				checkNum = true;
			}
			if(engCap >= 0) {
				checkEngCap = true;
			}
			if(pwd.length > 7) {
				checkLen = true;
			}
			
			if(checkNum&&checkEng&&checkEngCap&&checkLen == true) {
				$("#alert-pattern-success").show();
				$("#alert-pattern-fail").hide();
			} else {
				$("#alert-pattern-success").hide();
				$("#alert-pattern-fail").show();
				$("#submit").attr("disabled","disabled");
			}
		});//비밀번호 패턴 체크
	});
</script>

<title>Insert title here</title>
</head>
<body>
<div class="board-main">

<div class="input-box">
<form action="./updatePwd" method="POST"> 
<input type="hidden" name="id" value="${user.id}">
     <div class="input-box">
         <input type="password" id="checkPwd1" name="newPwd" placeholder="새 비밀번호">
         <label for="password">새 비밀번호</label>
         <div id="alert-pattern-success" style="color:green;">사용가능한 비밀번호 입니다.</div>
		 <div id="alert-pattern-fail" style="color:red;">대문자, 소문자, 숫자 포함 8자 이상이어야 합니다.</div>
     </div>

     <div class="input-box">
         <input type="password" id="checkPwd2" name="reNewPwd" placeholder="비밀번호 확인">
         <label for="password">비밀번호 확인</label>
         <div id="alert-success" style="color:green;">비밀번호가 일치합니다.</div>
		 <div id="alert-fail" style="color:red;">비밀번호가 일치하지 않습니다.</div>
     </div>
     <input class="button login-button" type="submit" id="submit" value="비밀번호 변경">
</form>
</div>
</div>

</body>
</html>