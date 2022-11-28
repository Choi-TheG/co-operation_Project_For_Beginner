<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User List</title>
</head>
<body>
<h1>User</h1>
<table>
<a href="viewJoinPage">신규 생성</a>
<c:forEach  var="user" items="${list}">
   <tr>
      <td>아이디 : ${user.id}</td>
      <td>비밀번호 : ${user.pwd}</td>
      <td>이름 : ${user.name}</td>
      <td>이메일 : ${user.email}</td>
      <td>전화번호 : ${user.phoneNum}</td>
      <td><a href="delete?seq=${user.userSeq}">삭제</a></td>
   </tr>
</c:forEach>
</table>
</body>
</html>