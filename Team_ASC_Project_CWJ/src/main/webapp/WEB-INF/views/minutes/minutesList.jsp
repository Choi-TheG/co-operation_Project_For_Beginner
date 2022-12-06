<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회의록 목록</title>
		<style type="text/css">
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300; 400&display=swap');
		
			#mlWrap {
				width: 70%;
				text-align: center;
				margin-left: 10%;
				margin-top: 80px;
			}
			h1 {
				margin-bottom: 50px;
			}
			.mlDate {
				float: left;
				height: 40px;
				position: relative;
			}
			.mlDate>input {
				width: 130px;
				height: 30px;
				text-align: center;
				position: absolute;
				bottom: 0px;
			}
			.mlBtn {
				float: right;
			}
			.mlBtn>a>button {
				position: relative;
				border: 0px;
				padding: 10px 20px;
				display: inline-block;
				background-color: #ff0062;
				box-shadow: 0px 4px 0px #d40051;
				color: white;
				font-weight: 400;
				font-family: 'Noto Sans KR', sans-serif;
				font-size: 17px;
			}
			.mlBtn>a>button:active {
				top: 4px;
				background-color: #d40051;
				box-shadow: 0px 0px #d40051; 
				color: white;
				font-weight: 400;
				font-family: 'Noto Sans KR', sans-serif;
				font-size: 17px;
			}
			.mlTbl {
				clear: both;
				padding-top: 50px;
			}
			table {
				width: 100%;
				text-align: center;
				border-collapse: collapse;
				color: #384D59;
			}
			th {
				border: 1px solid gray;
				height: 70px;
				background: #F1F3F5;
			}
			td {
				border: 1px solid gray;
			}
			.ml1, .ml2, .ml4 {
				width: 15%;
			}
			.ml3>a {
				text-decoration: none;
				display: block;
				padding: 30px;
				color: #384D59;
			}
			.ml3>a:hover {
				text-decoration: none;
				display: block;
				padding: 30px;
				color: #0F2859;
				font-weight: bold;
			}
			.mlPaging {
				margin-top: 80px;
				margin-bottom: 80px;
			}
			.mlPaging>li {
				display: inline-block;
				text-decoration: none;
			}
			.mlPaging>li>a {
				display: inline-block;
				justify-content: center;
				text-decoration: none;
				font-size: 14px;
				width: 25px;
				height: 25px;
				color: #384D59;
				border: 1px solid gray;
			}
		</style>
	</head>
	<body>
		<div id="mlWrap">
			<input type="hidden" name="projectSeq" value="${project.projectSeq}">
			<input type="hidden" name="searchDate" value="${minutes.searchDate}">
			<h1>회의록 목록</h1>
			<div class="mlDate">
				<form action="../project/searchMinutes?projectSeq=${project.projectSeq}" method="GET">
					<input type="hidden" name="projectSeq" value="${project.projectSeq}">
					<input type="date" name="searchDate" value="${minutes.searchDate}" min="${project.startDate}" max="${project.endDate}">
					<input type="submit" value="검색">
				</form>
			</div>
			<div class="mlBtn">
				<a href="../project/viewWriteMinutes"><button>회의록 작성</button></a>
			</div>
			<div class="mlTbl">
				<table>
					<tr>
						<th>일자</th><th>시간</th><th>안건</th><th>작성자</th>
					</tr>
					<c:forEach var="minutes" items="${list}">
						<tr>
						<c:set var="start" value="${minutes.startTime}" />
						<c:set var="end" value="${minutes.endTime}" />
							<td class="ml1">${fn:substring(start,0,10)}</td>
							<td class="ml2">${fn:substring(start,11,16)}~${fn:substring(end,11,16)}</td>
							<td class="ml3"><a href="../project/readMinutes?minutesSeq=${minutes.minutesSeq}">${minutes.meetingTitle}</a></td>
							<td class="ml4">${member.name}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="mlPaging">
				<c:forEach var="num" items="${pageRange}" varStatus="status">
					<li>
						<a href="./minutesList?projectSeq=${project.projectSeq}&searchDate=${minutes.searchDate}&pageNum=${status.count}&totalBoardNum=${page.totalBoardNum}" name="pageNum">${status.count}</a>
					</li>
				</c:forEach>
			</div>
		</div>
	</body>
</html>