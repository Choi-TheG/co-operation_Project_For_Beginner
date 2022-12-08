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
	font-size: 18px;
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
.red{ color: red; font-weight: bold; text-decoration: underline;border: 1px solid red; opacity: 80% }
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
	<div style="font-size:1em;"><h1>단위 테스트</h1></div>
	<div class="divTable unstyledTable">
		<div class="divTableBody">
			<div class="divTableRow" style="text-align:center;font-weight:bold;font-size:22px;">
				<div class="divTableCell" style="width:15%;">담당자</div>
				<div class="divTableCell" style="width:10%;">No.</div>
				<div class="divTableCell" style="width:25%;font-size:20px">테스트 시나리오 / 테스트 데이터</div>
				<div class="divTableCell" style="width:25%">예상 결과</div>
				<div class="divTableCell" style="width:10%">실제 결과</div>
				<div class="divTableCell" style="width:15%">비고</div>
				<input type="hidden" value="${loginUser}" id="loginUser">
			</div>
			<!-- 수정버튼 누르기 전 -->
			<c:forEach var="test" items="${list}" varStatus="rowCount">
				<div id="text${rowCount.count}" class="divTableRow textHover ${test.manager}">
					<div class="divTableCell">
						<input type="text" value="${test.manager}" style="margin-top:0px;text-align:center;" class="manager" id="manager${rowCount.count}">
					</div>
					<div class="divTableCell">
						<input type="text" value="${test.scenarioNo}" style="margin-top: 0px;text-align:center" class="scenarioNo">
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
						<input type="text" value="${test.manager}" name="manager" id="manager${test.testSeq}" readonly="readonly">
					</div>
					<div class="divTableCell">
						<input type="text" value="${test.scenarioNo}" onkeypress='return checkNo(event)' style="border: 1px solid;radius: 5px;margin-top: 0px" name="scenarioNo" id="scenarioNo${test.testSeq}" class="scenarioNum" placeholder="0 or 0-0">
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
	<input type="button" onclick="location.href='createTest.do'" value="+ 추가" id="createBtn">
</form>
<script>
$(document).ready(function(){
	console.log("ready");
	
	let hover = document.querySelectorAll(".textHover");
	let btnDiv = document.querySelectorAll(".btnDiv");
	let tr_count = $('.btnDiv').length;
	let user = document.getElementById("loginUser").value;
	let manage = document.querySelectorAll(".manager");
	
	for(let i=1;i<tr_count+1;i++){
		let manager = manage[i-1].value;
		
		$('#text'+i).on("mouseover", function(){
			if(manager != user){
				btnDiv[i-1].classList.add("hidden");
			} else{
				btnDiv[i-1].classList.remove("hidden");
			}
			
		});
		$('#text'+i).on("mouseout", function(){
			btnDiv[i-1].classList.add("hidden");
		});
	}
	
	
// 시나리오 번호 고치지않은 번호 빨강처리
	let scenarioNo = document.querySelectorAll(".scenarioNo");
	let sceNo_count = scenarioNo.length;

	for(let i=0;i<sceNo_count;i++){
		if(scenarioNo[i].value == 0){
			scenarioNo[i].classList.add("red");
		}
	}
	
	var replaceChar = /[~!@\#$%^&*\()\=+_'\;<>\/.\`:\"\\,\[\]?|{}]/gi;
	var replaceNotFullKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;

    $(".scenarioNum").on("focusout", function() {
        var x = $(this).val();
        if (x.length > 0) {
            if (x.match(replaceChar) || x.match(replaceNotFullKorean)) {
                x = x.replace(replaceChar, "").replace(replaceNotFullKorean, "");
            }
            $(this).val(x);
        }
        }).on("keyup", function() {
            $(this).val($(this).val().replace(replaceChar, ""));
   });

}); // document.ready end

/* 행 수정 페이지 */
function viewUpdateBtn(seq,count){
	console.log(seq,count);
	
	document.getElementById("update"+seq).classList.remove("hidden");
	document.getElementById("text"+count).classList.add("hidden");
}



/* 행 수정 */
function updateBtn(testSeq){
	let textRow = document.getElementById("text"+testSeq);
	let updtRow = document.getElementById("update"+testSeq);
	let manager = document.getElementById("manager"+testSeq).value;
	let scenarioNo = document.getElementById("scenarioNo"+testSeq).value;
	let scenarioData = document.getElementById("scenarioData"+testSeq).value;
	let expected = document.getElementById("expected"+testSeq).value;
	let result = document.getElementById("result"+testSeq).value;
	let remark = document.getElementById("remark"+testSeq).value;
	/* console.log(testSeq+" + "+manager+" + "+scenarioNo+" + "+scenarioData+" + "
			+expected+" + "+result+" + "+remark); */
	
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