/**
 * vacationManagerConfirm.jsp
 */
$(function(){

//닫기 버튼 누르면 manager페이지로 넘어감
	var manageForm = $("#manageForm");
	
	//Modify버튼 클릭시  get방식 /board/modify
	$(".btn-info").click(function(){
		manageForm.attr('action','/vacation/vacationManager');
		manageForm.submit();
	})
	
	$(".btn-primary").click(function(){
		$.ajax({
			type:'post',
			url:'/vacation/'+modalAppNum.val(),
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			contentType:'application/json',
			data:JSON.stringify(),
			success:function(result){
				if(callback){
					callback(result);
				}
			}			
		})	
	})
//승인 거절 값이 들어가기 때문에 form 에서 value값이 

	//모달 영역 가져오기
	let modal = $(".modal");	
	
	//모달 영역 안에 있는 input 가져오기
	var modalAppNum = modal.find("input[name='vacationAppNum']");
	var modalReject = modal.find("textarea[name='rejectReason']");

		
	//모달 영역 안에 있는 버튼 가져오기
	var modalRegisterBtn = $("#modalRegisterBtn");


	$("#rejectBtn").click(function(){
		//모달창 부르기
		modal.find(modalAppNum).val($("#vacationNum").val())

		modal.modal("show");
		
		
	})		
	
	//댓글 삽입 - bno,reply(댓글내용),replyer(작성자)
	$(modalRegisterBtn).click(function(){
		console.log("모달"+modalAppNum.val()+modalReject.val());
		//모달안에 있는 댓글 작성자, 댓글 내용 가져오기
		var rejectReasonData = {
			vacationAppNum:modalAppNum.val(),
			refusalreason: modalReject.val()
		}
		console.log("거절 이유"+rejectReasonData);
		
		$.ajax({
			type:'put',
			url:'/vacation/no/'+rejectReasonData.vacationAppNum+'',
			contentType:'application/json',
			data:JSON.stringify(rejectReasonData),
			success:function(result){
				if(callback){
					callback(result);
				}
			}			
		})		
			modal.find("input").val("");
			//modal.modal("hide");
	
	//add 종료
	}) //#modalRegisterBtn 종료
})