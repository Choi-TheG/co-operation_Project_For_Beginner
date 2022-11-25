<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
      
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원목록</title>
		<style type="text/css">
			#listWrap {
				width: 100%;
				height: 100%;
			}
			
			form {
				margin-top: 60px;
				margin-left: 60px;
			}
			
			table {
				margin: auto;
				width: 85%;
				height: 150px;
				text-align: center;
				margin-top: 30px;
			}
			
			table th {
				background-color: #d0d7de99;
			}
			
			table td {
				border-bottom: 1px solid #bcbcbc;
			}
	
			.mgBtn {
				width: 50px;
				color: #082040;
				background-color: rgba(0, 0, 0, 0);
				border: 1.5px solid #082040;
				border-radius:5px;
				font-weight: bold;
			}
			
			.mgBtn:hover {
				width: 50px;
				color: white;
				background-color: #082040;
				border: 0;
				border-radius:5px;
				font-weight: bold;
			}
		</style>
	</head>
	<body>
		<div id="listWrap">
			<form action="${contextPath}/manager/searchUser" method="POST">
	         <select name="status">
	            <option selected value="">--</option>
	            <option value="Y" <c:if test="${status eq 'Y'}">selected</c:if>>활동 회원</option>
	            <option value="N" <c:if test="${status eq 'N'}">selected</c:if>>비활동 회원</option>
	         </select>
	         <input type="text" name="keyword" value="${keyword}"></input>
	         <input type="submit" class="searchBtn" value="검색"></input>
	      </form>
			<br /><br />
			<table id="userList">
				<tr>
					<th>No.</th><th>아이디</th><th>이름</th><th>이메일</th><th>가입일자</th><th></th><th></th>
				</tr>
			<c:forEach var="member" items="${list}">
				<tr>
					<td>${member.userSeq}</td>
					<td>${member.id}</td>
					<td>${member.name}</td>
					<td>${member.email}</td>
					<td>${member.joinDate}</td>
					<td><a href="${contextPath}/manager/userProfile?userSeq=${member.userSeq}"><button class="mgBtn">수정</button></a></td>
					<form action="${contextPath}/manager/updateUserStatus?userSeq=${member.userSeq}" method="POST" name="removeForm">
	                <td><input type="submit" value="삭제" onclick="return confirm('정말 삭제하시겠습니까?');" class="mgBtn"></td>
	           	    </form>
				</tr>
			</c:forEach>
			</table>
		</div>
	</body>
</html>