<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	th,td{
		text-align:center;
		border: 1px solid black;
	}
</style>
</head>
<body>
<table id="adminTable">
	<tr>
		<th>프로젝트seq</th>
		<th>팀ID</th>
		<th>프로젝트명</th>
		<th>완료유무</th>
		<th>진척률</th>
		<th>생성일자</th>
		<th>팀장유저seq</th>
	</tr>
	
	<c:forEach var="project" items ="${list}">
		<tr>
			<td>${project.projectSeq}</td>
			<td>${project.teamId}</td>
			<td>${project.projectName}</td>
			<td>${project.finishYn}</td>
			<td>${project.percentage}</td>
			<td>${project.createDate}</td>
			<td>${project.teamLeaderSeq}</td>	
		</tr>
	</c:forEach>
	
</table>
</body>
</html>