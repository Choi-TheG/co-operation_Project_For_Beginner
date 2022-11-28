<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원목록</title>
		<style type="text/css">
			table {
				margin: auto;
				width: 90%;status
				text-align: center;
			}
		</style>
		<script>
		function page(currentPage){
			location.href = "../manager/searchUser?status=''&keyword=''&pageNum=" + currentPage;
		}
		</script>
	</head>
	<body>
		<h1>회원 목록</h1><br />
		<form action="../manager/searchUser?status=''&keyword=''" method="POST">
			<select name="status" id="selectStatus">
				<option selected value="">--</option>
				<option value="Y">활동 회원</option>
				<option value="N">비활동 회원</option>
			</select>
			<input type="text" name="keyword" id="keyword"></input>
			<input type="submit" class="searchBtn" value="검색"></input>
		</form>
		<br /><br />
		<table id="userList" border="1">
			<tr>
				<th>No.</th><th>아이디</th><th>이름</th><th>이메일</th><th>가입일자</th><th></th><th></th>
			</tr>
		<c:forEach var="member" items="${userListPaging}" begin="0" step="1">
		<input type="hidden" name="userSeq1" value="${member.userSeq}">
			<tr>
				<td>${member.userSeq}</td>
				<td>${member.id}</td>
				<td>${member.name}</td>
				<td>${member.email}</td>
				<td>${member.joinDate}</td>
				<td><button><a href="${contextPath}/manager/viewUserProfile?userSeq=${member.userSeq}">수정</a></button></td>
				<form action="${contextPath}/manager/updateUserStatus?userSeq=${member.userSeq}" method="POST" name="removeForm">
					<td><input type="submit" value="삭제" onclick="return confirm('정말 삭제하시겠습니까?');"></td>
				</form>
			</tr>
		</c:forEach>
		</table>
			<div>
				<c:forEach var="num" items="${pageRange}" varStatus="status"> 
	 				<a href="#" onclick="page(${status.count})" name="pageNum">${status.count}</a>
	 			</c:forEach> 
				<%--  <c:forEach var="num" items="${pageRange}" varStatus="pageStatus">
					<span>
						 <a href="${contextPath}/manager/searchUser?status=${userListPaging.status}&keyword=${userListPaging.keyword}&pageNum=${pageStatus.count}&searchUserCount=${page.searchUserCount}" 
						name="pageNum">${pageStatus.count}</a> 
					</span>
				</c:forEach>  --%>
			</div>
	</body>
</html>