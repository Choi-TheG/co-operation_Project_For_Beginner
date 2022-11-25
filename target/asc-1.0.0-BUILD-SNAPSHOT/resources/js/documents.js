	// 초기화
	function deleteDocuments(frm){
		var check = confirm('최초의 상태로 돌아갑니다 초기화 하시겠습니까?');
		if(check==true){
			frm.action="deletePlan.do";
			frm.method="post";
			frm.submit();
			console.log(check);
			return check;
		}
		console.log(check);
	}

	// 뒤로가기 경고창
	function historyBack(){
		var check = confirm('수정사항을 저장하지 않고 돌아가시겠습니까?');
		if(check==true){
			javascript:history.back();
		}
	}

	// 예문 팝업창 띄우기
	function examplePop(frm){
		window.open("examplePlan.do","","top=0, left=0, directories=no, location=no, menubar=no, status=yes, toolbar=no");
		window.opener="nothing";
		window.open('','_parent','');
		window.close();
	}

	// 중복 수정 방지(미구현)
	function checkDocumentsUpdate(type,frm){
		if(type==0){
			frm.action="viewUpdatePlan.do";
		} else {
			alert("다른 팀원이 수정 중에 있습니다");
		}
		frm.submit();
	}
	
	