/**
 * vacationUserlist.jsp 스크립트
 */
$(function(){
	
	
	//operForm 가져온 후 전송하기
	var operForm = $("#operForm");
	
	//수정 버튼 클릭시  get방식 /vacation/update
/*	$(".btn-warning").click(function(){
		operForm.append("<input type='hidden' name='vacationAppNum' value='"+$(this).attr('href')+"'>");
		operForm.attr('action','/vacation/update');
		
		operForm.submit();
	})*/
	
	//확인버튼 클릭시 get /vacation/list
	$(".btn-primary").click(function(){		
		operForm.attr('action','/vacation/vacationUserList');
		operForm.submit();
	})
	
	
})
























