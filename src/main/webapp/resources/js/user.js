/**
 * 
 */
$(document).ready(function(){
		console.log('ready');
		
		$("#checkId").on("click",function(){ //중복 체크 기능
			let id = document.getElementById("userId").value;
			if(id === ""){ //아이디 빈값 일 경우
				alert("아이디를 입력해주세요");
				return false;
			}
			$.ajax({
				type : "get",
				url : "checkId",
				dataType : "text",
				data : {userId:id},
				success : function(data,status){
					let jsonBoolean = JSON.parse(data);
					if(!jsonBoolean){
						alert("이미 존재하는 아이디 입니다");
						document.getElementById("userId").value = "";
						document.getElementById("checkIdYN").value= "N"; //숨겨진 인풋 텍스트에 값 N 입력
					} else{
						alert("사용 가능한 아이디 입니다");
						document.getElementById("checkIdYN").value= "Y"; //숨겨진 인풋 텍스트에 값 Y 입력
					}
				},
				error : function(data,status){
				},
				complete : function(data,status){
					console.log("finish");
				}
			}); // ajax end 
			
		}); // #checkId
		$('#creatUserForm').submit(function(){ // submit 버튼 클릭시 발동 , 아이디 중복이거나 중복 체크 안했을경우 진행 안됨
			let checkIdYn = document.getElementById("checkIdYN").value; //숨겨진 인풋 텍스트에 Y값이 없으면 진행 안됨
			let checkPwdYn = document.getElementById("checkPwdYN").value;
            if(checkIdYn != "Y"){
            	alert("아이티 중복 체크를 먼저 해주세요");
            	return false;
            }
            else if(checkPwdYn != "Y"){
            	alert("비밀번호를 정확히 입력해 주세요");
            	return false;
            }
            else{
            	alert("회원가입을 축하합니다");
            }
            
    	});
    	
    	$("#pwd").on("change",function(){
		let pwd = document.getElementById("pwd").value;
		let Uppercnt = 0;
		let Lowercnt = 0;
		let Numcnt = 0;
		let array = pwd.split("");
		for(let i in array){
			if(isNaN(array[i]) && array[i]==array[i].toUpperCase()){
				Uppercnt++;
			} else if(isNaN(array[i]) && array[i]==array[i].toLowerCase()){
				Lowercnt++;
			} else if(!isNaN(array[i])){
				Numcnt++;
			}
		}
		if(Uppercnt > 0 && Lowercnt > 0 && Numcnt){
			$('#checkPwd').html("&#9989; 비밀번호 사용가능합니다");
			document.getElementById("checkPwdYN").value= "Y";
		} else{
			$('#checkPwd').html("&#10060; 대문자,소문자,숫자 각각 최소 1자 이상 필요합니다");
			document.getElementById("checkPwdYN").value= "N";
		}
	});
}); // document end	