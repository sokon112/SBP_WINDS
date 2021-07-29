/**
 * vacationUserCheckOne.jsp 에서 사용할 스크립트
 */


$(function(){
	

	//operForm 가져온 후 전송하기
	var operForm = $("#operForm");
	
	//수정 버튼 클릭시  get방식 /vacation/update
	$(".btn-warning").click(function(){
		
		operForm.attr('action','/vacation/vacationUserCheckModify');
		operForm.submit();
	})
	//삭제 버튼 클릭시  get방식 /vacation/delete
	$(".btn-danger").click(function(){
		
		operForm.attr('action','/vacation/delete');
		operForm.submit();
	})
	//반납 버튼 클릭시  get방식 /vacation/cancle
	$(".btn-info").click(function(){
		
		//현재 날짜와 비교해 이후 날짜라면 반납 가능 아니라면 알람창으로 불가능하다고 알리기 
		
		
		
		operForm.attr('action','/vacation/cancle');
		operForm.submit();
	})
	//확인버튼 클릭시 get /vacation/list
	$(".btn-primary").click(function(){		
		operForm.attr('action','/vacation/vacationUserList');
		operForm.submit();
	})
})




















