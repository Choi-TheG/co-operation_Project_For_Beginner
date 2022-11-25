<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입창</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	console.log('ready');
	
	$("#typePositionGroup").change(function(){
		document.getElementById("textPositionGroup").value = document.getElementById("typePositionGroup").value;
	});
	
	$("#selectPositionGroup").change(function(){
		document.getElementById("textPositionGroup").value = $("#selectPositionGroup option:selected").val();
	});
	
	$(".table-title-radio").change(function(){
		document.getElementById("textPositionGroup").value = "";
		let position = $(".table-title-radio").val();
		if($(".table-title-radio:checked").val() == "manager"){
			$("#clickManager").show();
			$("#clickUser").hide();
		} else{
			$("#clickManager").hide();
			$("#clickUser").show();
		}
	});
	
	$("#checkId").on("click",function(){ //중복 체크 기능
		let id = document.getElementById("userId").value;
		if(id === ""){ //아이디 빈값 일 경우
			alert("아이디를 입력해주세요");
			return false;
		}
		
		let reg = /\s/g;

		if (id.match(reg)){
		  alert("ID에 공백이 있습니다");
		  document.getElementById("userId").value = "";
		  document.getElementById("checkIdYn").value= "N";
		  return false;
		}
		
		$.ajax({
			type : "get",
			url : "checkId",
			dataType : "text",
			data : {userId:id},
			success : function(data,status){
				let jsonBoolean = JSON.parse(data);
				if(!jsonBoolean){
					alert("이미 존재하는 아이디 입니다");
					document.getElementById("userId").value = "";
					document.getElementById("checkIdYn").value= "N"; //숨겨진 인풋 텍스트에 값 N 입력
				} else{
					alert("사용 가능한 아이디 입니다");
					document.getElementById("checkIdYn").value= "Y"; //숨겨진 인풋 텍스트에 값 Y 입력
				}
			},
			error : function(data,status){
			},
			complete : function(data,status){
				console.log("finish");
			}
		}); // ajax end 
		
	}); // #checkId
	$("#checkEmail").on("click",function(){ //중복 체크 기능
		let email = document.getElementById("userEmail").value;
		if(email === ""){ //아이디 빈값 일 경우
			alert("이메일을 입력해주세요");
			return false;
		}
		$.ajax({
			type : "get",
			url : "checkEmail",
			dataType : "text",
			data : {userEmail:email},
			success : function(data,status){
				let jsonBoolean = JSON.parse(data);
				if(!jsonBoolean){
					alert("이미 존재하는 이메일 입니다");
					document.getElementById("userEmail").value = "";
					document.getElementById("checkEmailYn").value= "N"; //숨겨진 인풋 텍스트에 값 N 입력
				} else{
					alert("등록 가능한 이메일 입니다");
					document.getElementById("checkEmailYn").value= "Y"; //숨겨진 인풋 텍스트에 값 Y 입력
				}
			},
			error : function(data,status){
			},
			complete : function(data,status){
				console.log("finish");
			}
		}); // ajax end 
		
	}); // #checkEmail
	$("#checkPhoneNum").on("click",function(){ //중복 체크 기능
		let phoneNum = document.getElementById("userPhoneNum").value;
		if(phoneNum === ""){ //아이디 빈값 일 경우
			alert("연락처를 입력해주세요");
			return false;
		}
		$.ajax({
			type : "get",
			url : "checkPhoneNum",
			dataType : "text",
			data : {userPhoneNum:phoneNum},
			success : function(data,status){
				let jsonBoolean = JSON.parse(data);
				if(!jsonBoolean){
					alert("이미 존재하는 연락처 입니다");
					document.getElementById("userPhoneNum").value = "";
					document.getElementById("checkPhoneNumYn").value= "N"; //숨겨진 인풋 텍스트에 값 N 입력
				} else{
					alert("등록 가능한 연락처 입니다");
					document.getElementById("checkPhoneNumYn").value= "Y"; //숨겨진 인풋 텍스트에 값 Y 입력
				}
			},
			error : function(data,status){
			},
			complete : function(data,status){
				console.log("finish");
			}
		}); // ajax end 
		
	}); // #checkPhoneNum
	$('#creatUserForm').submit(function(){ // submit 버튼 클릭시 발동 , 아이디 중복이거나 중복 체크 안했을경우 진행 안됨
		let checkIdYn = document.getElementById("checkIdYn").value; //숨겨진 인풋 텍스트에 Y값이 없으면 진행 안됨
		let checkPwdYn = document.getElementById("checkPwdYn").value;
		let checkEmailYn = document.getElementById("checkEmailYn").value;
		let checkPhoneNumYn = document.getElementById("checkPhoneNumYn").value;
		let textPositionGroup = document.getElementById("textPositionGroup").value;
		let userName = document.getElementById("userName");

		if(!$('.table-title-radio').is(':checked')){
			alert("포지션을 선택을 먼저 해주세요");
			return false;
		} 
		
		if(textPositionGroup == "none" || textPositionGroup == ""){
			alert("소속을 입력해 주세요");
			return false;
		}
		
        if(checkIdYn != "Y"){
        	alert("아이디 중복 체크를 먼저 해주세요");
        	return false;
        }
        else if(checkPwdYn != "Y"){
        	alert("비밀번호를 정확히 입력해 주세요");
        	return false;
        }
        else if(userName == ""){
        	alert("이름을 입력해 주세요");
        	return false;
        }
        else if(checkEmailYn != "Y"){
        	alert("이메일 중복 체크를 먼저 해주세요");
        	return false;
        }
        else if(checkPhoneNumYn != "Y"){
        	alert("연락처 중복 체크를 먼저 해주세요");
        	return false;
        }
        else{
        	alert("회원가입을 축하합니다");
        }
        
	});
	
	$("#userPwd").on("change",function(){
	let pwd = document.getElementById("userPwd").value;
	let Uppercnt = 0;
	let Lowercnt = 0;
	let Numcnt = 0;
	let array = pwd.split("");
	for(let i in array){
		if(isNaN(array[i]) && array[i]==array[i].toUpperCase()){
			Uppercnt++;
		} else if(isNaN(array[i]) && array[i]==array[i].toLowerCase()){
			Lowercnt++;
		} else if(!isNaN(array[i])){
			Numcnt++;
		}
	}
	
	let reg = /\s/g;

	if (pwd.match(reg)){
	  alert("비밀번호에 공백이 있습니다");
	  document.getElementById("userPwd").value = "";
	  $('#checkPwd').html("");
	  document.getElementById("checkPwdYn").value= "N";
	  return false;
	} 
	
	if(Uppercnt > 0 && Lowercnt > 0 && Numcnt > 0 && pwd.length >= 8 ){
		$('#checkPwd').html("&#9989; 사용가능한 비밀번호 입니다.");
		document.getElementById("checkPwdYn").value= "Y";
	} else if(pwd.length < 8){
		$('#checkPwd').html("&#10060; 최소 8자 이상이어야 합니다");
		document.getElementById("checkPwdYn").value= "N";
	} else{
		$('#checkPwd').html("&#10060; 대문자,소문자,숫자 각각 최소 1자 이상 필요합니다");
		document.getElementById("checkPwdYn").value= "N";
	}
});
}); // document end	
</script>
<style type="text/css">
	.board-main {
		width:50%;
		height:80%;
		float:center;
		display:block;
		margin-left:20%;
		margin-top:3%;
		text-align: center;
	}
	.button {
		color:white;
		padding: 7px 20px;
		font-weight: bold;
		border:0;
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
	.login-button {
		padding:10px 20%;
		font-size: 20px;
		background-color: #384D59;
		border-radius:5px;
		border:0;
		margin-top: 10%;
	}
	.table {
		width: 100%;
		height: 90%;
		
	}
	.table tr {
		height: 70px;
		font-weight: bold;
	}
	.table td {
		font-size: 20px;
	}
	.join {
		font-size: 35px;
		
	}
	.table-title-text {
		height:30px;
		font-weight: bold;
		width: 300px;
		font-size: 18px;
	}
	.table-title-text input {
		height: 100%;
		width: 98%;
		font-size: 16px;
	}
	.table-title-radio {
		height:30px;
		font-weight: bold;
		width: 50px;
		font-size: 18px;
		vertical-align:3px;
	}
	.table-title-position {
		height:30px;
		font-weight: bold;
		width: 95%;
		font-size: 15px;
		vertical-align:3px;
	}
	.labelPostion{
		position: relative;
		top:-10px;
		padding-right:20px;
	}
	.table-title {
		width: 150px;
	}
	.check-area {
		width: 200px;
		font-size: 13px;
	}
</style>
<body>
<div class="board-main">
<form action="createUser" method="post" id ="creatUserForm">
<input type="hidden" id="checkIdYn" value="N">
<input type="hidden" id="checkPwdYn" value="N">
<input type="hidden" id="checkEmailYn" value="N">
<input type="hidden" id="checkPhoneNumYn" value="N">
<input type="hidden" id="textPositionGroup" value="" name="positionGroup" >

<table class="table">
	<tr>
		<th class="join" colspan="3">회원가입</th>
	</tr>
	<tr>
		<td class="table-title">유형</td>
		<td>
			<input class="table-title-radio" type="radio" name="position" value="user"><label class="labelPostion">유저</label>
			<input class="table-title-radio" type="radio" name="position" value="manager"><label class="labelPostion">관리자</label>
		</td>
		<td>
			<div id="clickManager" style="display:none;">
				<input class="table-title-position"  type="text" placeholder="소속을 입력해주세요" id ="typePositionGroup">
			</div>
			<div id="clickUser" style="display:none;">
				<select class="table-title-position"  id="selectPositionGroup">
   					<option value="none">소속을 선택해주세요</option>
     				<c:forEach var="list" items="${list}"><option value="${list}">${list}</option></c:forEach>
 				</select>
			</div>
		</td>
	</tr>
	<tr>
		<td class="table-title">아이디</td>
		<td><input class="table-title-text" type="text" placeholder="ID" name="id" id="userId"></td>
		<td><input class="button search-button check-area" type="button" value="아이디 중복 확인" id="checkId"></td>
	</tr>
	<tr>
		<td class="table-title">비밀번호</td>
		<td><input class="table-title-text" type="password" placeholder="password" name="pwd" id="userPwd"></td>
		<td class="check-area"><div id="checkPwd"></div></td>
	</tr>
	<tr>
		<td class="table-title">이름</td>
		<td><input class="table-title-text" type="text" placeholder="name" name="name" id="userName"></td>
	</tr>
	<tr>
		<td class="table-title">이메일</td>
		<td><input class="table-title-text" type="text" placeholder="e-mail" name="email" id=userEmail></td>
		<td><input class="button search-button check-area" type="button" value="이메일 중복 확인" id="checkEmail"></td>
	</tr>
	<tr>
		<td class="table-title">연락처</td>
		<td><input class="table-title-text" type="text" placeholder="phoneNumber" name="phoneNum" id=userPhoneNum></td>
		<td><input class="button search-button check-area" type="button" value="연락처 중복 확인" id="checkPhoneNum"></td>
	</tr>
	<tr>
		<td class="table-title">git 링크</td>
		<td><input class="table-title-text" type="text" placeholder="gitLink" name="gitLink"></td>
	</tr>
	<tr>
		<th colspan="3"><input class="button login-button" type="submit" value="회원가입"></th>
	</tr>
</table>
</form>
</div>
</body>
</html>