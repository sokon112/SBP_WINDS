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


	$(".rejectBtn").click(function(){
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
	/*let reasonReject=$("#rejectReason")
	$(".rejectBtn").click(function(){
		
		reasonReject.attr('type','text');

});
$(".checkBtn").click(function(){ 
			
			var str = ""
			var tdArr = new Array();	// 배열 선언
			var checkBtn = $(this);
			
			// checkBtn.parent() : checkBtn의 부모는 <td>이다.
			// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = checkBtn.parent().parent();
			var td = tr.children();
			
			console.log("클릭한 Row의 모든 데이터 : "+tr.text());
			
			var no = td.eq(0).text();
			var userid = td.eq(1).text();
			var name = td.eq(2).text();
			var email = td.eq(3).text();
			
			
			// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
			td.each(function(i){	
				tdArr.push(td.eq(i).text());
			});
			
			console.log("배열에 담긴 값 : "+tdArr);
			
			str +=	" * 클릭된 Row의 td값 = No. : <font color='red'>" + no + "</font>" +
					", 아이디 : <font color='red'>" + userid + "</font>" +
					", 이름 : <font color='red'>" + name + "</font>" +
					", 이메일 : <font color='red'>" + email + "</font>";		
			
			$("#ex2_Result1").html(" * 클릭한 Row의 모든 데이터 = " + tr.text());		
			$("#ex2_Result2").html(str);	
		});*/
})