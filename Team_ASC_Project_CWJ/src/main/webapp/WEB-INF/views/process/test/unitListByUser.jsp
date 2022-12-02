<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="UTF-8">
<title>유저별 목록</title>
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

select{
	float: right;
}

/* DivTable */
.divTable{ display: table;width: 96%; }
.divTableRow { display: table-row; }
.divTableHeading { display: table-header-group;}
.divTableCell, .divTableHead { display: table-cell;height:36px;}
.divTableHeading { display: table-header-group;}
.divTableFoot { display: table-footer-group;}
.divTableBody { display: table-row-group;}

.divTable, .divTableCell, .divTableHead{
	border: 1px solid #c5c5c5;
}

.divTableHead{
	font-size: 20px;
}

.divTableRow:hover{
	
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
<div class="divTable unstyledTable">
	<!-- 머리 -->
	<div class="divTableHeading">
		<!-- 수정버튼 누르기 전 -->
		<c:forEach var="test" items="${list}" begin="0" end="0">
			<div id="textHead${test.testSeq}" class="head divTableRow">
				<div class="divTableHead" style="width:5%;">
					<input type="hidden" id="only">
				</div>
				<div class="divTableHead" style="font-weight: bold;text-align: right;">
					사용자
				</div>
				<div class="divTableHead" style="text-align: right">
					${test.customer}
				</div>
				<div class="divTableHead" style="font-weight: bold;text-align: right;">
					담당자
				</div>
				<div class="divTableHead">
					<input type="button" onclick="viewUpdateHeadBtn(${test.testSeq})" class="hidden" id="updtBtn" value="수정">
					<select id="selectUser" onchange="selectList(this.form)" name="selectedUser">
						<option value="0">전체</option>
						<c:forEach var="userList" items="${userList}" varStatus="optionCount">
							<option value="${optionCount.count}">${userList.userName}</option>
						</c:forEach>
					</select>
					<input type="hidden" id="loginUser" value="${loginUser}">
				</div>
			</div>
			<!-- 수정버튼 누른 후 -->
			<div id="updateHead${test.testSeq}" class="divTableRow hidden">
				<div class="divTableHead" style="width:5%;">
					
				</div>
				<div class="divTableHead" style="font-weight: bold;text-align: right;">
					사용자
				</div>
				<div class="divTableHead" style="text-align: right">
					<input type="text" value="${test.customer}" name="customer" id="customer">
				</div>
				<div class="divTableHead" style="font-weight: bold;text-align: right;">
					담당자
				</div>
				<div class="divTableHead" style="float:right;margin-bottom:0px">
					<input type="button" onclick="historyBack()" value="뒤로가기">
					<input type="button" onclick="updateHeadBtn(${test.testSeq})" value="수정">
					${loginUser}
					<input type="hidden" value="${loginUser}" name="maneger">
				</div>
			</div>

		</c:forEach>
	</div>
	<!-- 몸통 -->
	<div class="divTableBody">
		<div class="divTableRow">
			<div class="divTableCell" style="font-weight: bold;text-align: center;">No</div>
			<div class="divTableCell" style="font-weight: bold;text-align: center;width:20%">테스트 시나리오 / 테스트 데이터</div>
			<div class="divTableCell" style="font-weight: bold;text-align: center;width:20%">예상 결과</div>
			<div class="divTableCell" style="font-weight: bold;text-align: center;width:20%">실제 결과</div>
			<div class="divTableCell" style="font-weight: bold;text-align: center;width:20%">비고</div>
		</div>
		<!-- 수정버튼 누르기 전 -->
		<c:forEach var="test" items="${list}" varStatus="rowCount">
			<div id="text${test.testSeq}" class="divTableRow textHover ${test.manager}">
				<input type="hidden" value="${test.manager}" id="manager${rowCount.count}">
				<div class="divTableCell">
					${test.scenarioNo}
				</div>
				<div class="divTableCell">
					${test.scenarioData}
				</div>
				<div class="divTableCell">
					${test.expected}
				</div>
				<div class="divTableCell">
					${test.result}
				</div>
				<div class="divTableCell">
					${test.remark}
					<div class="btnDiv hidden" style="float:right;margin-bottom:0px;"><!-- 오른쪽 아래 마우스반응-->
						<input type="button" onclick="viewUpdateBtn(${test.testSeq},${rowCount.count})" value="수정" class="upBtn updelBtn">
						<input type="button" onclick="deleteBtn(${test.testSeq})" value="삭제" class="delBtn updelBtn">
					</div>
				</div>
			</div>
			<!-- 수정버튼 누른 후 -->
			<div id="update${test.testSeq}" class="divTableRow hidden">
				<div class="divTableCell">
					<input type="text" value="${test.scenarioNo}" onKeyUp="this.value=this.value.replace(/[^-0-9]/g,'');" style="border: 1px solid;radius: 5px;margin-top: 0px" name="scenarioNo" id="scenarioNo${test.testSeq}">
				</div>
				<div class="divTableCell">
					<textarea rows="10" cols="20" name="scenarioData" id="scenarioData${test.testSeq}">${test.scenarioData}</textarea>
				</div>
				<div class="divTableCell">
					<textarea rows="10" cols="20" name="expected" id="expected${test.testSeq}">${test.expected}</textarea>
				</div>
				<div class="divTableCell">
					<textarea rows="10" cols="20" name="result" id="result${test.testSeq}">${test.result}</textarea>
				</div>
				<div class="divTableCell">
					<textarea rows="10" cols="20" name="remark" id="remark${test.testSeq}">${test.remark}</textarea>
					<div style="float:right">
						<input type="button" onclick="updateBtn(${test.testSeq})" value="수정" class="updelBtn">
						<input type="button" onclick="historyBack(${test.testSeq})" value="뒤로가기" class="updelBtn">
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<input type="button" onclick="location.href='createTest.do'" value="+ 추가" id="createBtn" class="hidden">
<script>
//마우스 오버
//select text와 session 이름이 같다면 수정버튼 출력
//loginUser == selected 인 목록 출력
function selectList(frm){
	let btnDiv = document.querySelectorAll(".btnDiv");		// class="btnDev"인 객체 모두를 선택
	let upBtn = document.querySelector('#updtBtn');			// 수정 버튼
	let addBtn = document.querySelector('#createBtn');		// 행 생성 버튼
	let user = document.getElementById("loginUser").value;	// 로그인유저
	let selected = document.getElementById("selectUser");	// selectbox에서 선택된 사람
	let hover = document.querySelectorAll(".textHover");	// 테이블 행
	let tr_count = $('.btnDiv').length;						// 버튼 division 수
	let list = hover.classList;
	console.log(list);
	console.log(hover);
	
	 
	
	
	// text 추출
	let selectText = selected.options[selected.selectedIndex].text;
	// value 추출
	let num = selected.options[selected.selectedIndex].value;
	let man = document.querySelectorAll("."+selectText);
	/* console.log(selected); */
	console.log(man[0].classList.value);
	console.log(man[0] != null);
	console.log(man[1] != null);
	console.log(man[2] != null);
	
	// 본인일 떄
	if(selectText == user){
		
		// tr 행 수만큼 반복
		for(let i=0;i<tr_count;i++){
			
			// loginUser == selector인 hover만 출력
			/* hover[i].classList.add("hidden"); */
			if(man[i] != null){
				console.log(man[i].classList.value);
				console.log(hover[i].classList.value);
				man[i].classList.remove("hidden");
			}
			
			// 마우스 오버
			// i번째 selector에 마우스 올라올 시 up, del 버튼 hidden 클래스 제거
			hover[i].addEventListener("mouseover", function(){
				btnDiv[i].classList.remove("hidden"); // Uncaught TypeError: Cannot read properties of undefined (reading 'classList') at HTMLTableRowElement.<anonymous>
			});
			// i번째 selector에 마우스 나갈 시 up, del 버튼 hidden 클래스 생성
			hover[i].addEventListener("mouseout", function(){
				btnDiv[i].classList.add("hidden");
			});
			
			
		}
		
		// 머릿글 수정 / 추가 버튼 출력
		upBtn.classList.remove("hidden");
		addBtn.classList.remove("hidden");
	// 전체를 눌렀을 때
	} else if(num == 0){
		// 전체 목록 출력(페이지 새로고침)
		location.reload();
		
	// 본인이 아닐 때
	} else{
		
		// 수정, 삭제 버튼 숨기기
		for(let i=0;i<tr_count;i++){
			// loginUser != selector인 hover hidden
			hover[i].classList.add("hidden");
			
			// 마우스 오버
			hover[i].addEventListener("mouseover", function(){
			btnDiv[i].classList.add("hidden");
			});
		}
		
		// 수정 / 추가 버튼 숨기기
		upBtn.classList.add("hidden");
		addBtn.classList.add("hidden");
	}
	
}


/* 사용자, 담당자 수정 페이지 */
function viewUpdateHeadBtn(seq){
	console.log(seq);
	let update = document.getElementById("updateHead"+seq);
	let text = document.getElementById("textHead"+seq);
	console.log("update : "+update+" text : "+text);
	text.classList.add("hidden");
	update.classList.remove("hidden");
}

/* 사용자, 담당자 수정 */
function updateHeadBtn(testSeq){
	let customer = document.getElementById("customer").value;
	let manager = document.getElementById("loginUser").value;
	
	$.ajax({
		type: "get",
		url: "updateHeadTest",
		dataType: "text",
		data: {testSeq:testSeq, customer:customer, manager:manager},
		success: function(data){
			location.reload();
			console.log('top update done.');
		}
	});
}

/* 행 수정 페이지 */
function viewUpdateBtn(seq,count){
	console.log(seq,count);
	
	document.getElementById("update"+seq).classList.remove("hidden");
	document.getElementById("text"+seq).classList.add("hidden");
}

/* 행 수정 */
function updateBtn(testSeq){
	let textRow = document.getElementById("text"+testSeq);
	let updtRow = document.getElementById("update"+testSeq);
	let scenarioNo = document.getElementById("scenarioNo"+testSeq).value;
	let scenarioData = document.getElementById("scenarioData"+testSeq).value;
	let expected = document.getElementById("expected"+testSeq).value;
	let result = document.getElementById("result"+testSeq).value;
	let remark = document.getElementById("remark"+testSeq).value;
	
	$.ajax({
		type: "get",
		url: "updateTest",
		dataType: "text",
		data: {testSeq:testSeq, scenarioNo:scenarioNo, scenarioData:scenarioData,
			expected:expected, result:result, remark:remark},
		success: function(data){
			location.reload();
			console.log('update done.');
		}, error: function(data){
			alert('fail');
		}
	});
}


/* 수정 중 뒤로가기 경고 */
function historyBack(seq){
	let check = confirm('수정사항을 저장하지 않고 돌아가시겠습니까?');
	let text = $('#scenarioData'+seq).val();
	console.log("text : "+text);
	
	if(check){
		// 원래 값을 반환
		/* text.location.reload(); */
		// hidden
		document.getElementById("text"+seq).classList.remove("hidden");
		document.getElementById("update"+seq).classList.add("hidden");
	}
}

/* 행 삭제 */
function deleteBtn(testSeq){
	let check = confirm('정말로 삭제하시겠습니까?')
	if(check){
		location.href = 'deleteTest?testSeq='+testSeq;
	}
	return check;
}

</script>
</body>
</html>