<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../resources/js/user.js"></script>
</head>
<body>
<form action="createUser" method="post" id ="creatUserForm">
<table>
	<tr><td><input type="hidden" id="checkIdYN" value="N"></td></tr>
	<tr><td>ID :</td><td><input type="text" name="id" id="userId"></td><td><input type="button" value="아이디 중복 확인" id="checkId"></td></tr>
	<tr><td>비밀번호 :</td><td><input type="password" name="pwd" id="pwd"></td><td><div id="checkPwd"></div></td></tr>
	<tr><td>이름 :</td><td><input type="text" name="name" value=""></td><td></td></tr>
	<tr><td>이메일 :</td><td><input type="text" name="email" value=""></td><td></td></tr>
	<tr><td>전화번호 :</td><td> <input type="text" name="phoneNum" value=""></td><td></td></tr>
	<tr><td colspan="3"><input type="submit" value="신규 생성"></td></tr>
</table>	
</form>
</body>
</html>