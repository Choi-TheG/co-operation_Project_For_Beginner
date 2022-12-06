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
#content{margin-bottom: 8px}

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

textarea{ font-size: 20px; }

select{ float: right; }

/* DivTable */
.divTable{ display: table;width: 96%; }
.divTableRow { display: table-row; }
.divTableHeading { display: table-header-group;}
.divTableCell, .divTableHead { display: table-cell;height:36px;}
.divTableHeading { display: table-header-group;}
.divTableFoot { display: table-footer-group;}
.divTableBody { display: table-row-group;}

.divTable, .divTableCell, .divTableHead{ border: 1px solid #c5c5c5; }

.divTableHead{ font-size: 20px; }

.divTableRow:hover{}

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

.textArea{ resize: none; border: 0px; }

.hidden{ display: none; }

.red{ color: red; font-weight: bold; text-decoration: underline }

.bodyTitle{ font-weight: bold;text-align: center; font-size: 20px }

#selectUser{
	width:65%;
	height:28px;
	font-size:16px;
	margin-right:3%;
	margin-top:3px
}

#fullHD{ width:130px; }

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
		<li><a href="../implementation/viewImplementation?projectSeq=${project.projectSeq }&pageNum=1">구현</a></li>
		<li class="li6"><a href="../test/manageTest">테스트</a></li>
		<li><a href="../project/viewComplete">완성</a></li>
	</ul>
</nav>
<form action="#" method="GET" id="testForm">
	<div style="font-size:1em;"><h1>단위 테스트<input type="button" value="전체화면으로 보기" onclick="wide()" id="fullHD"></h1></div>
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
						<!-- 사용자 -->
					</div>
					<div class="divTableHead" style="text-align: right">
						<%-- ${test.customer} --%>
					</div>
					<div class="divTableHead" style="font-weight: bold;text-align: right;">
						담당자
					</div>
					<div class="divTableHead">
						<!-- 수정 페이지 버튼 -->
						<%-- <input type="button" onclick="viewUpdateHeadBtn(${test.testSeq})" class="hidden" id="updtBtn" value="수정"> --%>
						<select id="selectUser" name="selectUser">
							<option value="0">전체</option>
							<c:forEach var="userList" items="${userList}" varStatus="optionCount">
								<option value="${userList.userName}">${userList.userName}</option>
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
						<!-- 사용자 -->
					</div>
					<div class="divTableHead" style="text-align: right">
						<%-- <input type="text" value="${test.customer}" name="customer" id="customer"> --%>
					</div>
					<div class="divTableHead" style="font-weight: bold;text-align: right;">
						담당자
					</div>
					<div class="divTableHead" style="float:right;margin-bottom:0px">
						<input type="text" value="${loginUser}" name="maneger">
						<!-- 수정, 뒤로가기 버튼 -->
						<%-- <input type="button" onclick="historyBack()" value="뒤로가기">
						<input type="button" onclick="updateHeadBtn(${test.testSeq})" value="수정"> --%>
					</div>
				</div>
	
			</c:forEach>
		</div>
		<!-- 몸통 -->
		<div class="divTableBody">
			<div class="divTableRow">
				<div class="divTableCell" style="width:5%;">No</div>
				<div class="divTableCell" style="width:25%">테스트 시나리오 / 테스트 데이터</div>
				<div class="divTableCell" style="width:25%">예상 결과</div>
				<div class="divTableCell" style="width:10%">실제 결과</div>
				<div class="divTableCell" style="width:15%">비고</div>
			</div>
			<!-- 수정버튼 누르기 전 -->
			<c:forEach var="test" items="${list}" varStatus="rowCount">
				<div id="text${test.testSeq}" class="divTableRow textHover ${test.manager}">
					<div class="divTableCell">
						<c:if test="${test.scenarioNo eq 1}">
							<label for="scenario${rowCount.count}">${test.manager}</label>
						</c:if>
						<input type="text" value="${test.scenarioNo}" style="margin-top: 0px;text-align:center" class="scenarioNo" id="scenarioNo${rowCount.count}">
					</div>
					<div class="divTableCell">
						<textarea rows="10" cols="30" class="textArea" readonly="readonly">${test.scenarioData}</textarea>
					</div>
					<div class="divTableCell">
						<textarea rows="10" cols="30" class="textArea" readonly="readonly">${test.expected}</textarea>
					</div>
					<div class="divTableCell">
						<textarea rows="10" cols="30" class="textArea" readonly="readonly">${test.result}</textarea>
					</div>
					<div class="divTableCell">
						<textarea rows="10" cols="30" class="textArea" readonly="readonly">${test.remark}</textarea>
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
						<textarea rows="10" cols="30" name="scenarioData" id="scenarioData${test.testSeq}">${test.scenarioData}</textarea>
					</div>
					<div class="divTableCell">
						<textarea rows="10" cols="30" name="expected" id="expected${test.testSeq}">${test.expected}</textarea>
					</div>
					<div class="divTableCell">
						<textarea rows="10" cols="30" name="result" id="result${test.testSeq}">${test.result}</textarea>
					</div>
					<div class="divTableCell">
						<textarea rows="10" cols="30" name="remark" id="remark${test.testSeq}">${test.remark}</textarea>
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
</form>
<script>
$(document).ready(function(){
	console.log("ready");
// 첫 화면에는 무료로 행 추가 버튼 증정 이벤트	
	let createBtn = document.getElementById("createBtn");

	if(document.getElementById("only") == null){
		createBtn.classList.remove("hidden");
	} else{
		createBtn.classList.add("hidden");
	}
// 시나리오 번호 고치지않은 번호 빨강처리	
	let scenarioNo = document.querySelectorAll(".scenarioNo");
	let sceNo_count = scenarioNo.length;

	for(let i=0;i<sceNo_count;i++){
		if(scenarioNo[i].value == 0){
			scenarioNo[i].classList.add("red");
		}
	}
	
// select 가 onchange되면 선택한 text와 같은 친구들 list 출력(혹은 같지않은 친구들 hidden)
	$('#selectUser').on('change', function(){
		let btnDiv = document.querySelectorAll(".btnDiv");					// class="btnDev"인 객체 모두를 선택
		let upBtn = document.querySelector('#updtBtn');						// 수정 버튼
		let addBtn = document.querySelector('#createBtn');					// 행 생성 버튼
		let user = document.getElementById("loginUser").value;				// 로그인유저
		let selected = document.getElementById("selectUser");				// selectbox에서 선택된 사람
		let hover = document.querySelectorAll(".textHover");				// 테이블 행
		let tr_count = $('.btnDiv').length;									// 버튼 division 수
		let selectText = selected.options[selected.selectedIndex].text;		// text 추출
		let selectValue = selected.options[selected.selectedIndex].value;	// value 추출
		let man = document.querySelectorAll("."+selectText);				// userList class

		console.log("selec : "+selected);
		console.log("selectText : "+ selectText);
		console.log("selectValue : "+num);
		
		// 본인일 떄
		if(selectText == user){
			// tr 행 수만큼 반복
			for(let i=0;i<tr_count;i++){
			// 마우스 오버
				// i번째 selector에 마우스 올라올 시 up, del 버튼 hidden 클래스 제거
				hover[i].addEventListener("mouseover", function(){
					btnDiv[i].classList.remove("hidden");
				});
				// i번째 selector에 마우스 나갈 시 up, del 버튼 hidden 클래스 생성
				hover[i].addEventListener("mouseout", function(){
					btnDiv[i].classList.add("hidden");
				});
			}
			// 머릿글 수정 / 추가 버튼 출력
			// upBtn.classList.remove("hidden");
			addBtn.classList.remove("hidden");
		// 전체를 눌렀을 때
		} else if(selectValue == 0){
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
			/* upBtn.classList.add("hidden"); */
			addBtn.classList.add("hidden");
		}
		
		// selectText와 같은 manager 행만 출력
		for(let i=0;i<tr_count;i++){
			let flag = hover[i].classList.contains(selectText);
			console.log(flag);
			if(!flag){
				hover[i].classList.add("hidden");
			} else{
				hover[i].classList.remove("hidden");
			}
		}
		
		$.ajax({
			type: "get",
			url: "updateTest",
			dataType: "text",
			data: {testSeq:testSeq, scenarioNo:scenarioNo, scenarioData:scenarioData,
				expected:expected, result:result, remark:remark},
			success: function(data){
				location.reload();
				
			}, error: function(data){
				alert('fail');
			}
		});
	});
	
}); // document.ready end

/* 사용자 수정 추가 */

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
		let textSeq = document.getElementById("text"+seq);
		
		if(textSeq!=null){
			// hidden
			textSeq.classList.remove("hidden");
			document.getElementById("update"+seq).classList.add("hidden");
		}
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