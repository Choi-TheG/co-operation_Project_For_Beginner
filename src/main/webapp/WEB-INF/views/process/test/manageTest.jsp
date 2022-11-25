<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
/* processNav */

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

.processNav .li6>a {
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
/* //////////////////////////////////////////////// */
/* UnitTest */
/* //////////////////////////////////////////////// */
input[type=text]{
	border: 0px;
	width: 90%;
	height: 26px;
	font-size: 20px;
	display: center;
}

button, input[type=button]{
	color: white;
    background-color: #384D59;
    border: 0;
    padding: 5px;
    border-radius: 5px;
    font-weight: bold;
    width: 70px;
    margin-left: 3px;
    text-align: center;
}

textarea{
	
}

table, td, th{
	border: 1px solid #c5c5c5;
}

th{
	width:20%;
	text-align:right
}

tr:hover{
	
}

.numText{
	border: 0px;
	width: 50px;
	height: 30px;
	font-size: 20px;
	display: center;
}

.updelBtn{
	width:96%;
	margin-top:3px;
	margin-left:2px;
}

.hidden{
	display: none;
}

#createBtn{
	width: 96%;
	margin: 0px;
	height: 25px;
	border: 1px solid #c2c2c2;
	border-radius: 5px;
	background-color: #fff;
	color: #000;
	text-align: center;
	font-size: 14px;
}

#createBtn:hover{
	border-radius: 5px;
	background-color: #f5f5f5;
}

</style>
</head>
<body>
<nav class="processNav">
	<ul>
		<li><a href="../project/manageProject">프로젝트</a></li>
		<li><a href="../documents/manageDocuments">문서 관리</a></li>
		<li><a href="../function/manageFunction">기능</a></li>
		<li><a href="../wbs/manageWbs">일정</a></li>
		<li><a href="../implementation/viewImplementation">구현</a></li>
		<li class="li6"><a href="../test/manageTest">테스트</a></li>
		<li><a href="../project/viewComplete">완성</a></li>
	</ul>
</nav>
<div style="font-size:1em;"><h1>단위 테스트</h1></div>
<table id="testTable" style="width:96%;">
	<c:forEach var="test" items="${list}" begin="0" end="0">
		<!-- hidden 수정버튼 누르기 전 -->
		<tr id="textHead${test.testSeq}">
			<td style="width:5%"></td>
			<th>
				<div style="float:left">
					<input type="button" onclick="viewUpdateHeadBtn(${test.testSeq})" value="수정">
				</div>
				사용자
			</th>
			<th>
				${test.customer}
			</th>
			<th>
				담당자
			</th>
			<th>
				<%-- <select name="manager" id="">
					<option selected disabled></option>
					<option value="${member.id}">${member.id}</option>
				</select> --%>
				${test.manager}
			</th>
		</tr>
		<!-- hidden 수정버튼 누르고난 후 -->
		<tr id="updateHead${test.testSeq}" class='hidden'>
			<td style="width:5%">
				
			</td>
			<th>
				<div style="float:left">
					<input type="button" onclick="updateHeadBtn(${test.testSeq})" value="수정">
					<input type="button" onclick="historyBack()" value="뒤로가기">
				</div>
				사용자
			</th>
			<th>
				<input type="text" value="${test.customer}" name="customer" id="customer${test.testSeq}">
			</th>
			<th>
				담당자
			</th>
			<th>
				
				<input type="text" value="${test.manager}" name="manager" id="manager${test.testSeq}">
			</th>
		</tr>
	</c:forEach>
	<tr style="text-align:center;font-weight:bold;"><td>No</td><td>테스트시나리오 / 테스트데이터</td><td>예상 결과</td><td>실제 결과</td><td>비고</td></tr>
	
	<c:forEach var="test" items="${list}" varStatus="index">
		<tbody id="tbody">
		<!-- hidden 수정버튼 누르기 전 -->
		<tr id="text${test.testSeq}" class="textHover">
			<td style="text-align:center" class="btnCell hidden">
				<input type="button" onclick="viewUpdateBtn(${test.testSeq})" value="수정" class="upBtn updelBtn">
				<input type="button" onclick="deleteBtn(${test.testSeq})" value="삭제" class="delBtn updelBtn">
			</td>
			<td style="text-align:center" class="textCell">
				${test.scenarioNo}
				<input type="button" onclick="viewUpdateBtn(${test.testSeq})" value="수정" class="upBtn updelBtn">
				<input type="button" onclick="deleteBtn(${test.testSeq})" value="삭제" class="delBtn updelBtn">
			</td>
			<td>
				${test.scenarioData}
			</td>
			<td>
				${test.expected}
			</td>
			<td>
				${test.result}
			</td>
			<td>
				${test.remark}
			</td>
		</tr>
		</tbody>
		<!-- hidden 수정버튼 누르고난 후 -->
		<tr id="update${test.testSeq}" class=" hidden">
			<td>
				<input type="text" value="${test.scenarioNo}" name="scenarioNo" id="scenarioNo${test.testSeq}">
				<input type="button" onclick="updateBtn(${test.testSeq})" value="수정" class="updelBtn">
				<input type="button" onclick="historyBack()" value="뒤로가기" class="updelBtn">
			</td>
			<td>
				<!-- textarea 줄 바꿈 시 수정할 때 빈값 같이 들어감으로 인해 한줄로 처리 -->
				<textarea rows="10" cols="28" name="scenarioData" id="scenarioData${test.testSeq}">${test.scenarioData}</textarea>
			</td>
			<td>
				<textarea rows="10" cols="28" name="expected" id="expected${test.testSeq}">${test.expected}</textarea>
			</td>
			<td>
				<textarea rows="10" cols="28"name="result" id="result${test.testSeq}">${test.result}</textarea>
			</td>
			<td>
				<textarea rows="10" cols="28" name="remark" id="remark${test.testSeq}">${test.remark}</textarea>
			</td>
		</tr>
	</c:forEach>
	
</table>
<input type="button" onclick="location.href='createTest.do'" value="+ 추가" id="createBtn">

<!-- //////////////////////////script//////////////////////////////////////// -->
<script>
/* 마우스오버 */

/* 1. tr에 마우스를 올린다. 2. 행에 맞는 수정/삭제 버튼을 보이게한다.(클래스 정보 변경)
   1. tbody의 tr 갯수 정보를 받아온다.(var i) 2. i만큼 반복하며 tr 클래스들에 여기서 쓸 이름을 새로 붙혀준다.
 	3. 그 값에 올라가면 버튼이 보이게 한다 */
/*
// 원하는 class 정보 받아오기
var btnCell = document.querySelectorAll(".btnCell");	// class="btnCell"인 객체 모두를 선택
var textCell = document.querySelectorAll(".textCell");
var selector = document.querySelectorAll(".textHover");
// tbody에서 tr 갯수
var tr_count = $('#tbody tr').length;
console.log(btnCell);		// btnCell List
console.log(btnCell[0]);	// 1st btnCell
console.log(btnCell[3]);	// 4th btnCell
console.log(btnCell[4]);	// undefined
console.log(selector);		// textHover List
console.log(tr_count);		// tr count = 4
for(var i=0;i<tr_count;i++){
	console.log(i);			// i = 0~3
	console.log("selector : "+selector[i]);	// selector[0]~[3]
	console.log("cell : "+btnCell[i]);		// btnCell[0]~[3]

	// i번째 selector에 마우스 올라올 시 up, del 버튼 hidden 클래스 제거
	selector[i].addEventListener("mouseover", function(){
		btnCell[i].classList.remove("hidden"); // Uncaught TypeError: Cannot read properties of undefined (reading 'classList') at HTMLTableRowElement.<anonymous>
		textCell[i].classList.add("hidden");
	});
	// i번째 selector에 마우스 나갈 시 up, del 버튼 hidden 클래스 생성
	selector[i].addEventListener("mouseout", function(){
		btnCell[i].classList.add("hidden");
		textCell[i].classList.remove("hidden");
	});
}
*/
/* 행 수정 페이지 */
function viewUpdateBtn(testSeq){
	document.getElementById("update"+testSeq).classList.remove("hidden");
	document.getElementById("text"+testSeq).classList.add("hidden");
}

/* 행 수정 */
function updateBtn(testSeq){
	var scenarioNo = document.getElementById("scenarioNo"+testSeq).value;
	var scenarioData = document.getElementById("scenarioData"+testSeq).value;
	var expected = document.getElementById("expected"+testSeq).value;
	var result = document.getElementById("result"+testSeq).value;
	var remark = document.getElementById("remark"+testSeq).value;	
	
	$.ajax({
		type: "get",
		url: "updateTest",
		dataType: "text",
		data: {testSeq:testSeq, scenarioNo:scenarioNo, scenarioData:scenarioData,
			expected:expected, result:result, remark:remark},
		success: function(data){
			console.log('update done.');
			location.reload();
		}, error: function(data){
			alert('fail');
		}
	});
}


/* 사용자, 담당자 수정 페이지 */
function viewUpdateHeadBtn(testSeq){
	/* document.getElementById("updateHead").classList.remove("hidden"); */
	document.getElementById("updateHead"+testSeq).classList.remove("hidden");
	/* document.getElementById("textHead").classList.add("hidden"); */
	document.getElementById("textHead"+testSeq).classList.add("hidden");
}

/* 사용자, 담당자 수정 */
function updateHeadBtn(testSeq){
	var customer = document.getElementById("customer"+testSeq).value;
	var manager = document.getElementById("manager"+testSeq).value;
	
	$.ajax({
		type: "get",
		url: "updateHeadTest",
		dataType: "text",
		data: {testSeq:testSeq, customer:customer, manager:manager},
		success: function(data){
			console.log('top update done.');
			location.reload();
		}
	});
}

/* 수정 중 뒤로가기 경고 */
function historyBack(){
	var check = confirm('수정사항을 저장하지 않고 돌아가시겠습니까?');
	if(check){
		location.reload();
	}
}

/* 행 삭제 */
function deleteBtn(testSeq){
	var check = confirm('정말로 삭제하시겠습니까?')
	if(check){
		location.href = 'deleteTest?testSeq='+testSeq;
	}
	return check;
}

</script>
</body>
</html>