$(document).ready(function(){
	let teamLeaderSeq = document.getElementById("teamLeaderSeq").value;
	let userSeq = document.getElementById("userSeq").value;
	if(teamLeaderSeq === userSeq){
		 document.getElementById("projectName").readOnly=false;
	}
	
	let oldProjectName = document.getElementById("projectName").value;
	let thisProjectSeq = document.getElementById("projectSeq").value;
	let checkProjectName = false;
	$("#clickModify").on("click",function(){
		let newProjectName = document.getElementById("projectName").value;
		if(oldProjectName === newProjectName){
			alert("동일한 프로젝트명 입니다");
		} else if (newProjectName === ""){
			alert("프로젝트명을 입력해 주세요");
			document.getElementById("projectName").value = oldProjectName;
		} else{
			$.ajax({
				type : "get",
				url : "checkProjectName",
				dataType : "text",
				data : {projectName:newProjectName},
				success : function(data,status){
				
				let jsonBoolean = JSON.parse(data);
					if(!jsonBoolean){
						alert("이미 존재하는 팀명 입니다");
						document.getElementById("projectName").value = oldProjectName;
					} else{
						if(confirm('수정하시겠습니까?') == true){
							$.ajax({
								type : "get",
								url : "modifyProjectName",
								dataType : "text",
								data : {projectName:newProjectName,projectSeq:thisProjectSeq},
								success : function(data,status){
								let jsonBoolean = JSON.parse(data);
									if(jsonBoolean){
										alert("수정 완료");
										oldProjectName = newProjectName;
									} else{
										alert("수정 실패");
										document.getElementById("projectName").value = oldProjectName;
									}
								},
								error : function(data,status){
									console.log("error");
								},
								complete : function(data,status){
									console.log("finish");
								}
							}); // 두번째 ajax end
						} else{
							document.getElementById("projectName").value = oldProjectName;
						}
						
					}
				},
				error : function(data,status){
					console.log("error");
				},
				complete : function(data,status){
					console.log("finish");
				}
			}); // 첫번째 ajax end 
		}
	});
});