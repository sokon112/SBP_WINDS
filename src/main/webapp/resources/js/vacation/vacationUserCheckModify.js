/**
 * vacationUserlist.jsp 스크립트
 */
$(function(){
	//operForm 가져온 후 전송하기
	var operForm = $("#operForm");
	
	//확인버튼 클릭시 get /vacation/list
	$(".btn-primary").click(function(){		
		operForm.attr('action','/vacation/vacationUserList');
		operForm.submit();
	})
})
























