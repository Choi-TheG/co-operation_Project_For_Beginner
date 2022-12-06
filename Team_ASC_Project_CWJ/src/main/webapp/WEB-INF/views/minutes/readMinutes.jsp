<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회의록 읽기</title>
		<style type="text/css">
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300; 400&display=swap');
		
			#wmWrap {
				width: 80%;
				text-align: center;
				margin-top: 50px;
			}
			table {
				width: 100%;
				height: 100%;
				border-collapse: collapse;
				font-size: 16px;
			}
			th {
				border: 1px solid black;
				width: 15%; 
				height: 100%;
			}
			td {
				border: 1px solid black;
				text-align: left;
				height: 100%;
				padding: 30px;
			}
			.tr1, .tr2, .tr3>th {
				height: 80px;
			}
			.tr4>th {
				height: 100px;
			}
			.tr5>th {
				height: 500px;
			}
			.tr6, .tr7>th {
				height: 150px;
			}
			.rmBtn {
				margin-top: 60px;
				margin-bottom: 60px;
			}
			.rb {
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
			.rb:active {
				top: 4px;
				background-color: #d40051;
				box-shadow: 0px 0px #d40051; 
				color: white;
				font-weight: 400;
				font-family: 'Noto Sans KR', sans-serif;
				font-size: 17px;
			}
			.backBtn {
				margin-top: 50px;
				margin-bottom: 10px;
				float: left;
			}
			.backBtn>button[type=button] {
				color: #384D59;
				padding: 7px 10px;
				font-weight: 300;
				background-color: white;
				border-radius: 15px;
				border: 1px solid #384D59;
				font-size: 15px;
			}
		</style>
		<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	</head>
	<body>
		<div id="wmWrap">
			<h1>회의록</h1>
			<div class="backBtn">
				<button type="button" class="back" onclick="location.href='../project/minutesList?pageNum=1'">뒤로</button>
			</div>
			<form action="../project/viewUpdateMinutes" method="GET">
			<input type="hidden" name="minutesSeq" value="${minutes.minutesSeq}">
				<table>
					<tr class="tr1">
						<th>참석 인원</th>
						<td colspan="3">
							<c:choose>
								<c:when test="${minutes.extraPerson == null}">
									${minutes.attendees}
								</c:when>
								<c:otherwise>
									${minutes.attendees},${minutes.extraPerson}
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr class="tr2">
						<c:set var="start" value="${minutes.startTime}" />
						<c:set var="end" value="${minutes.endTime}" />
						<th>시작</th>
						<td>${fn:substring(start,0,16)}</td>
						<th>종료</th>
						<td>${fn:substring(end,0,16)}</td>
					</tr>
					<tr class="tr3">
						<th>장소</th>
						<td colspan="3">${minutes.meetingPlace}</td>
					</tr>
					<tr class="tr4">
						<th>회의 안건</th>
						<td colspan="3"><pre>${minutes.meetingTitle}</pre></td>
					</tr>
					<tr class="tr5">
						<th>회의 내용</th>
						<td colspan="3"><pre>${minutes.meetingContent}</pre></td>
					</tr>
					<tr class="tr6">
						<th>회의 결과</th>
						<td colspan="3"><pre>${minutes.meetingResult}</pre></td>
					</tr>
					<tr class="tr7">
						<th>비고</th>
						<td colspan="3"><pre>${minutes.meetingRemark}</pre></td>
					</tr>
				</table>
				<div class="rmBtn">
					<input type="submit" value="수정하러 가기" class="rb">
				</div>
			</form>
		</div>
	</body>
</html>