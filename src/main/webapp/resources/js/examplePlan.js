// 모달 예시
function modal(){
	const open = () => {
		document.querySelector("#modal").classList.remove("hidden");
	}
	const close = () => {
	    document.querySelector("#modal").classList.add("hidden");
	  }
	document.querySelector("#openBtn").addEventListener("click", open);
	document.querySelector("#closeBtn").addEventListener("click", close);
	document.querySelector("#bg").addEventListener("click", close);
}

// 모달
function documentsName(){
	const open = () => {
		document.querySelector("#modal").classList.remove("hidden");
	}
	const close = () => {
	    document.querySelector("#modal").classList.add("hidden");
	  }
	document.querySelector("#documentsName").addEventListener("click", open);
	document.querySelector("#closeBtn").addEventListener("click", close);
	document.querySelector("#bg").addEventListener("click", close);
}

// 모달2
function modal2(){
	const open = () => {
		document.querySelector("#modal2").classList.remove("hidden");
	}
	const close = () => {
	    document.querySelector("#modal2").classList.add("hidden");
	  }
	document.querySelector("#openBtn2").addEventListener("click", open);
	document.querySelector("#closeBtn2").addEventListener("click", close);
	document.querySelector("#bg2").addEventListener("click", close);
}