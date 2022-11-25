<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>개인정보 수정</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
		<title>Bootstrap Example</title>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
		<style type="text/css">
		/* 마이페이지 전페를 감싸는 div */
		#mpWrap {
			width: 90%;
			height: 1100px;	
			padding-top: 50px;
			/* border: 7px solid red; */
		}
		
		/* 마이페이지 제목 */
		.infoTitle {
			float: left;
			margin-left: 120px;
			margin-top: 20px;
			font-weight: bold;
			font-size: 30px;
			/* border: 7px solid red; */
		}
		
 		/* 프로필 사진을 감싸는 div */
		.profileImg {
			clear: both;
			float: left;
			padding-top: 150px;
			margin-left: 120px;
		}
		
		.mpImg {
			width: 200px; 
			height: 200px; 
			border-radius: 200px;
		} 
		
		/* 전체 form을 감싸는 div */
		.myInfo {
			height: 600px;
			float: right;
			margin-right: 250px;
			/* border: 7px solid red; */
		}
		
		/* 하나의 form을 감싸는 div */
		.col-md-6 {
			margin-top: 15px;
		}
		
		/* 개인정보가 들어있는 form */
		.form {
			width: 350px;
			height: 50px;
			border: 0.5px solid lightgray;
			border-radius: 6px;
			outline: none;
			padding-left: 10px;
			color: #384D59;
		}
		
		.newPw {
			width: 350px;
			height: 50px;
			border: 0.5px solid lightgray;
			border-radius: 6px;
			outline: none;
			padding-left: 10px;
			color: #384D59;	
		}
		
		/* 수정 버튼 감싸는 div */
		.mpBtns {
			height: 70px;
			padding: 15px 0;
		} 
		
		/* 수정 버튼 */
		.mpBtn {
			width: 350px;
			height: 50px;
			border: none;
			border-radius: 10px;
			color: white;
			background-color: #1982FC;
			padding: 0 15px;
			margin-top: 20px;
		}
		
		/* form 라벨 안 폰트 */
		.mpFont {
			vertical-align: middle;
			font-weight: bold;
			color: #384D59;
		}
		</style>
	</head>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
	      console.log('ready');
	               
	      $('.newPw').keyup('keypress', function() {
	         let pw1 = $("#newPw1").val();
	         let pw2 = $("#newPw2").val();
	                  
	         var newPw = $("#newPw1").val();
	           var id = $("#id").val();
	            
	           var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{1,}$/;
	         
	         if(pw1 != "" || pw2 != "") {
	            if(pw2 === "") {
	               $("#ckNewPwd2").html('비밀번호를 입력하세요.');
	               $("#ckNewPwd2").attr('color', 'gray');
	            } else if(pw1 == pw2 && true === reg.test(newPw)) {
	               $("#ckNewPwd2").html('일치하는 비밀번호입니다.');
	               $("#ckNewPwd2").attr('color', 'green');
	            } else if(pw1 == pw2 && false === reg.test(newPw)){
	               $("#ckNewPwd2").html('대문자,소문자,숫자 각각 최소 1자 이상 필요합니다.');
	               $("#ckNewPwd2").attr('color', 'red');
	            } else {
	               $("#ckNewPwd2").html('비밀번호가 일치하지 않습니다.');
	               $("#ckNewPwd2").attr('color', 'red');
	            } 
	         }
	                  
	      }); // .newPw end
	      
	        $("#newPw1").keyup("keypress", function() {
	            var newPw = $("#newPw1").val();
	            var id = $("#id").val();
	            
	            var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{1,}$/;
	            
	            if(false === reg.test(newPw)) {
	               $("#ckNewPwd1").html('대문자,소문자,숫자 각각 최소 1자 이상 필요합니다.');
	               $("#ckNewPwd1").attr('color', 'gray');
	            } else {
	               $("#ckNewPwd1").html('사용가능한 비밀번호입니다.');
	               $("#ckNewPwd1").attr('color', 'green');
	               console.log("success");
	            }
	            
	         }); // #newPw1 end
	                  
	         $('#updateInfoForm').submit(function() { // submit 버튼 클릭 시 발동, 비밀번호가 일치해야 수정 가능
	            let pw1 = $("#newPw1").val();
	            let pw2 = $("#newPw2").val();
	            
	            var newPw = $("#newPw1").val();
	            var id = $("#id").val();
	            
	            var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{1,}$/;
	                     
	            if(pw1 != "" && pw2 != "") {
	             if(false === reg.test(newPw)){
	                 alert("대문자,소문자,숫자 각각 최소 1자 이상 필요합니다."); 
	                 return false;
	               }
	               if(pw1 == pw2){
	                  alert("수정 완료");
	               } else{
	                   alert("수정 비밀번호가 정확히 일치하지 않습니다.");
	                  return false;
	               }
	            } 
	                     
	         }); // #updateInfoForm end
	   }); // document end
	</script>
	<body>
		<div id="mpWrap">
			<div class="infoTitle">
				<font>개인정보 수정</font>
			</div>
			<form action="${contextPath}/user/updateMyInfo" method="POST" id="updateInfoForm">
			<input type="hidden" name="pwd1" value="${member.pwd}">
	 			<div class="profileImg">
					<img src="${contextPath}/resources/images/basic.png" class="mpImg" />
				</div>
				
				<div class="myInfo">
					<div class="col-md-6">
						<label for="name" class="form-label"><font class="mpFont">이름</font></label>
						<input type="text" name="name" value="${member.name}" class="form" >
					</div>
						
					<div class="col-md-6">
						<label for="id" class="form-label"><font class="mpFont">아이디</font></label>
						<input type="text" name="id" id="id" value="${member.id}" class="form" readonly="readonly">
					</div>  

					<div class="col-md-6">
						<label for="pwd" class="form-label"><font class="mpFont">현재 비밀번호</font></label>
						<input type="password"  name="pwd" value="${member.pwd}" class="form" readonly="readonly">
					</div>
						
					<div class="col-md-6">
						<label for="pwd" class="form-label"><font class="mpFont">새로운 비밀번호</font></label>
						<input type="password" name="newPw1" class="newPw" id="newPw1" placeholder="새로운 비밀번호">
						<br />
						<font id="ckNewPwd1"></font>
					</div>
						
					<div class="col-md-6">
						<label for="pwd" class="form-label"><font class="mpFont">새로운 비밀번호(확인)</font></label>
						<input type="password" name="newPw2" class="newPw" id="newPw2" placeholder="새로운 비밀번호(확인)">
						<br />
						<font id="ckNewPwd2"></font>
					</div>
						
					<div class="col-md-6">
						<label for="email" class="form-label"><font class="mpFont">이메일</font></label>
						<input type="email" name="email" class="form" value="${member.email}">
					</div>
						
					<div class="col-md-6">
						<label for="phoneNum" class="form-label"><font class="mpFont">휴대폰</font></label>
						<input type="text" name="phoneNum" class="form" value="${member.phoneNum}">
					</div>
						
					<div class="col-md-6">
						<label for="git" class="form-label"><font class="mpFont">git 링크</font></label>
						<input type="text" name="gitLink" class="form" value="${member.gitLink}">
					</div>
				
					<div class="mpBtns">
						<input type="submit" value="수정하기" class="mpBtn">
					</div>
				</div> <!-- .myInfo end -->
			</form>
		</div> <!-- #mpWrap end -->	
	</body>
</html>