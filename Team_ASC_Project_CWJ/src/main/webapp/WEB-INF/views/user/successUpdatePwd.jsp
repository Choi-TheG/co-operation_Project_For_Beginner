<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.board-main {
		width:40%;
		height:50%;
		float:center;
		display:block;
		margin-left:15%;
		margin-top:11%;
		text-align: center;
	}
	.button {
		color:white;
		padding: 7px 20px;
		font-weight: bold;
		border:0;
	}
	.login-button {
		padding:10px 23%;
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
</style>
<title>Insert title here</title>
</head>
<body>

<div class="board-main">

<div class="input-box">
<form action="viewLogin" method="GET" id="findInfoIdForm"> 
    <div style="font-size:30px;">비밀번호 변경에 성공하셨습니다.</div>
    </br>
    <input class="button login-button" type="submit" value="로그인" id="findIdBtn"></br>
	
</form>
</div>
</div>
</body>
</html>