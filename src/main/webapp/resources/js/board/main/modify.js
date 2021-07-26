/**
 * boardmodify.jsp 스크립트
 */
$(function(){
	
	//operForm 가져온 후 전송하기
	var operForm = $("#operForm");
	
	
	//완료버튼 클릭시 get modifypassword
	$("#modifySubmit").click(function(){
		operForm.attr('action','/board/main/boardlist');
		operForm.submit();
	})
	
	
	
	
	
	
	
	
})









