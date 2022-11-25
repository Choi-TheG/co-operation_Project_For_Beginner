/* 페이지 내 이동 설정 및 이동속도 */
$(document).ready(function($) {

    $(".scrollMove").click(function(event){         

            event.preventDefault();

            $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);

    });

});

/* 퀵메뉴 설정 및 이동속도 */
$(document).ready(function(){
	  var currentPosition = parseInt($(".quickmenu").css("top"));
	  $(window).scroll(function() {
	    var position = $(window).scrollTop(); 
	    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},2048);
	  });
	});