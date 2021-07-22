/**
 * read.jsp 에서 사용할 스크립트
 */

function showImage(fileCallPath){
	$(".bigPictureWrapper").css("display","flex").show();
	
	$(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>")
	                .animate({width:'100%', height:'100%'},1000);
}
$(function(){
	

	//operForm 가져온 후 전송하기
	var operForm = $("#operForm");
	
	//List버튼 클릭시 get /board/list
	$(".btn-info").click(function(){
		
		operForm.attr('action','/vacation/vacationManager');
		operForm.submit();
	})
	

	
	
})




















