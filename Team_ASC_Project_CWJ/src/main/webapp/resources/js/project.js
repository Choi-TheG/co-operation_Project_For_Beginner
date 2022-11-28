/**
 * 
 */
 
$(document).ready(function(){
		console.log('ready');
		
		$("#checkProjectName").on("click",function(){ //중복 체크 기능
			let pn = document.getElementById("projectName").value;
			if(pn === ""){
				alert("팀명을 입력해주세요");
				return false;
			}
			
			$.ajax({
				type : "get",
				url : "checkProjectName",
				dataType : "text",
				data : {projectName:pn},
				success : function(data,status){
				
				let jsonBoolean = JSON.parse(data);
					if(!jsonBoolean){
						alert("이미 존재하는 팀명 입니다");
						document.getElementById("projectName").value = "";
						document.getElementById("checkProjectNameYN").value= "N"; //숨겨진 인풋 텍스트에 값 N 입력
					} else{
						alert("사용 가능한 팀명 입니다");
						document.getElementById("checkProjectNameYN").value= "Y"; //숨겨진 인풋 텍스트에 값 Y 입력
					}
				
					
				},
				error : function(data,status){
					console.log("error");
				},
				complete : function(data,status){
					console.log("finish");
				}
			}); // ajax end 
			
		}); // #checkId
		$('#creatProjectForm').submit(function(){ // submit 버튼 클릭시 발동 , 아이디 중복이거나 중복 체크 안했을경우 진행 안됨
			let checkProjectNameYn = document.getElementById("checkProjectNameYN").value; //숨겨진 인풋 텍스트에 Y값이 없으면 진행 안됨
            if(checkProjectNameYn != "Y"){
            	alert("팀명 중복 체크를 먼저 해주세요");
            	return false;
            }
    	});
}); // document end	