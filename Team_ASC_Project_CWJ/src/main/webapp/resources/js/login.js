/**
 * 
 */
$(document).ready(function(){
	$('#loginForm').submit(function(){ // submit 버튼 클릭시 발동 , 아이디 중복이거나 중복 체크 안했을경우 진행 안됨
			let id = document.getElementById("id").value; //숨겨진 인풋 텍스트에 Y값이 없으면 진행 안됨
			let pwd = document.getElementById("pwd").value;

			$.ajax({
				type : "get",
				url : "checkIdPwd",
				dataType : "text",
				data : {userId : id , userPwd : pwd},
				success : function(data,status){
					let jsonBoolean = JSON.parse(data);
					if(!jsonBoolean){
						alert("존재하지 않는 계정 입니다");
						return false;
					}
				},
				error : function(data,status){
					console.log("error");
				},
				complete : function(data,status){
					console.log("finish");
				}
			}); //ajax
    	}); //submit
});//ready