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

</head>

<body>
<title>비번찾기</title>
</head>
<body>
<div class="board-main">

<div class="input-box">
<form action="findInfoPwd" method="POST" id="findInfoIdForm"> 
	 <div class="input-box">
         <input type="text" placeholder="아이디" name="id" id="userEmail">
         <label for="id">아이디</label>
     </div>
     <div class="input-box">
         <input id="username" type="text" name="name"  id="userName" placeholder="이름">
         <label for="username">이름</label>
     </div>

     <div class="input-box">
         <input type="text" placeholder="abc@email.com" name="email" id="userEmail">
         <label for="email">이메일</label>
     </div>
     
     <input class="button login-button" type="submit" value="비밀번호 찾기" id="findIdBtn"></br>
	 <a href="viewFindInfoId"><input class="button search-button" type="button" value="아이디 찾기"></a>
</form>
</div>
</div>

</html>