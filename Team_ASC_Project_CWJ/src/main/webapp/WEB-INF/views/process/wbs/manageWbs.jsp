<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 관리</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
.processNav>ul {
	list-style: none;
	display: inline-block;
	width: 95%;
	height: 100px;
	text-align: center;
}
.processNav>ul>li {
	float: left;
}
.processNav>ul>li>a {
	border: 2px solid white;
	background-color: #F1F3F5;
	color: #384D59;
	text-decoration: none;
	font-size: 20px;
	display: block;
	width: 130px;
	padding: 30px 30px;
}
.processNav>ul>li>a:hover {
	border: 5px solid #0F2859;
	background-color: white;
	color: #384D59;
	text-decoration: none;
	font-size: 20px;
	font-weight: bold;
	display: block;
	width: 130px;
	padding: 30px 30px;
}
.processNav .li4>a {
	border: 5px solid #0F2859;
	background-color: white;
	color: #384D59;
	text-decoration: none;
	font-size: 20px;
	font-weight: bold;
	display: block;
	width: 130px;
	padding: 30px 30px;
}

a{
	text-decoration:none;color:#000;
}

a:hover{
	font-weight:bold;
}

table{
	width: 95%;
}

th{
	text-align: center;
	border-bottom: 1px solid #c2c2c2;
	font-size: 20px;
}
tr:hover{ background-color:#ffc054; }

input[type=date], select{
	border: 0px;
	padding:0px;
	maring:0px;
	width: 100%;
	height:30px;
	text-align:center;
}

.stepTr{
	background-color:#D7D7D7;
}
.stepMainTr{
	background-color:#F0F0F0;
}
.stepMainSubTr{
	background-color:#CCD2E8;
}
.stepTd{
	background-color:#E5EBF1;
	text-align:center;
}
.textCenter{
	text-align:center;
}

.btn2 {
	float: right;
	margin-right:75px;
}
button, input[type=button] {
	color: white;
    background-color: #384D59;
    border: 0;
    padding: 5px;
    border-radius: 5px;
    font-weight: bold;
    margin-right: 5px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function submit1(frm) {
	if(confirm('처리 하시겠습니까?') == true){
		frm.action="updateWbs";
		frm.method="GET";
		frm.submit();
		return true;
	}
}	
$(document).ready(function(){
	var startDate = "";
	var endDate = "";
	$('.nBtn').on('click',function(){
		if(confirm('정말로 취소하시겠습니까?') == true){
			location.href = 'manageWbs';
		}
	});
	
	$('#wbsTable tr').click(function(){
		// 현재 클릭된 Row(<tr>)
		var tr = $(this); 
		var td = tr.children(); // tr 자식 td 값
		
		startDate = td.eq(6).find("input").val();
		endDate = td.eq(7).find("input").val();
		
	});
	
	$('#wbsTable tr').change(function(){
		// 현재 클릭된 Row(<tr>)
		var tr = $(this); 
		var td = tr.children(); // tr 자식 td 값
		
		var changeStartDate = td.eq(6).find("input").val();
		var changeEndDate = td.eq(7).find("input").val();
		
		if(changeStartDate != "" && changeEndDate != "" && changeStartDate > changeEndDate){
			alert("종료일자가 시작일자보다 빠릅니다");
			td.eq(7).html('<input type="date" value="' + endDate + '" name="endDate">');
		}
		
		var td0 = td.eq(0); //맨 앞 td의 값
		td0.html('<input type="hidden" value="U" name="status">');
		$('.btn2').show();
	});
	
	$('.noUser').click(function(){
		alert("작업자와 시작,종료일자를 먼저 선택해주세요");
	});
});
</script>
</head>
<body>
<nav class="processNav">
	<ul>
		<li><a href="../project/manageProject">프로젝트</a></li>
		<li><a href="../documents/manageDocuments">문서 관리</a></li>
		<li><a href="../task/manageTask">기능</a></li>
		<li class="li4"><a href="../wbs/manageWbs">일정</a></li>
		<li><a href="../implementation/viewImplementation?projectSeq=${project.projectSeq }&pageNum=1">구현</a></li>
		<li><a href="../test/manageTest">테스트</a></li>
		<li><a href="../project/viewComplete">완성</a></li>
	</ul>
</nav>
<form action=# method="GET">
	<table id="wbsTable">
		<tr><!-- 컬럼 -->
			<th style="width:10%;">단계</th>
			<th style="width:10%;">주요기능</th>
			<th>세부기능</th>
			<th style="width:10%;">작업자</th>
			<th style="width:10%;">상태</th>
			<th style="width:10%;">진척률</th>
			<th style="width:10%;">시작일</th>
			<th style="width:10%;">종료일</th>
		</tr>
		<c:forEach var="step" items="${stepList}">
			<tr class="stepTr"><!-- 단계별 -->
				<td class="stepTd">${step.step}</td><td colspan="5"></td><td class="textCenter"><input type="date" value="${step.startDate}" readonly></td><td class="textCenter"><input type="date" value="${step.endDate}" readonly></td>
			</tr>
			<c:forEach var="stepMain" items="${stepMainList}">
				<c:if test="${step.step eq stepMain.step}">
					<tr class="stepMainTr"><!-- 동일한 단계 + 주요 기능별 -->
						<td class="stepTd"></td><td colspan="5">${stepMain.mainTask}</td><td class="textCenter"><input type="date" value="${stepMain.startDate}" readonly></td><td class="textCenter"><input type="date" value="${stepMain.endDate}" readonly></td>
					</tr>
					<c:forEach var="stepMainSub" items="${stepMainSubList}">
						<c:if test="${step.step eq stepMain.step && stepMain.mainTask eq stepMainSub.mainTask}">
							<tr class="stepMainSubTr"><!-- 동일한 단계 + 동일환 주요 기능 + 세부 기능별 -->
								<td class="stepTd"><input type="hidden" value="" name="status"></td><td><input type="hidden" value="${stepMainSub.taskSeq}" name="taskSeq"></td>
								<td>
									<c:choose>
										<c:when test="${stepMainSub.userSeq ne '' && stepMainSub.startDate <= stepMainSub.endDate}"><!-- 작업자 O -->
											<a href="manageWbsDetail?taskSeq=${stepMainSub.taskSeq}">${stepMainSub.subTask}</a>
										</c:when>
										<c:otherwise><!-- 작업자 X -->
											<div class="noUser">${stepMainSub.subTask}</div>
										</c:otherwise>
									</c:choose>
								</td>
								<td class="textCenter">
									<select name="userSeq">
	   									<option value="">작업자 선택</option>
	     								<c:forEach var="teamMember" items="${teamMemberList}">
	     									<option value="${teamMember.userSeq}"<c:if test ="${stepMainSub.userSeq eq teamMember.userSeq}">selected="selected"</c:if>>${teamMember.userName}</option>
	     								</c:forEach>
	 								</select>
								</td>
								<td class="textCenter">
									<c:choose>
										<c:when test="${stepMainSub.finishYn eq 'N' && stepMainSub.percentage eq 0}">진행전</c:when>
										<c:when test="${stepMainSub.finishYn eq 'N' && stepMainSub.percentage ne 0}">진행중</c:when>
										<c:when test="${stepMainSub.finishYn eq 'Y' && stepMainSub.percentage eq 100}">완료</c:when>
									</c:choose>
								</td>
								<td class="textCenter">${stepMainSub.percentage}%</td>
								<td class="textCenter"><input type="date" value="${stepMainSub.startDate}" name="startDate"></td>
								<td class="textCenter"><input type="date" value="${stepMainSub.endDate}" name="endDate"></td>
							</tr>
						</c:if>
					</c:forEach>
				</c:if>
			</c:forEach>
		</c:forEach>
	</table>
	<div style="height:40px;"></div>
	<div class="btn2" style="display:none;">
		<input type="button" value="처리" class="btn" onclick="submit1(this.form);">
		<input type="button" value="취소" class="nBtn">
	</div>	
</form>
</body>
</html>