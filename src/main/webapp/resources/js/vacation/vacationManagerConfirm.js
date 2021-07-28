/**
 * vacationManagerConfirm.jsp
 */
$(function(){


//닫기 버튼 누르면 manager페이지로 넘어감
	var manageForm = $("#manageForm");
	

	//닫기 버튼을 눌렀을때 실행되는 구문
	$(".btn-info").click(function(){
		manageForm.attr('action','/vacation/vacationManager');
		manageForm.submit();
	})
	 var successRejectForm = $("#successRejectForm")



	$(".btn-primary").click(function(){
		
		var checkBtn = $(this);

		var tr = checkBtn.parent().parent();
        var td = tr.children();
		
		var vacationAppNum = td.eq(0).find('input').val();
		//var vacation={"vacationAppNum":vacationNum}
		alert(vacationAppNum);
		$.ajax({
			url:'/vacation/'+vacationAppNum+'/ok',
			type:'put',
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			data:JSON.stringify({vacationAppNum:vacationAppNum}),
			contentType:'application/json; charset=UTF-8',
			success:function(result){
    			console.log(result);
				alert="ok";
    		}
		});
		
	});
//csrf 토큰값이 안넘어와서  302에러가 발생함
	$(".btn-secondary").click(function(){
		var checkBtn = $(this);

		var tr = checkBtn.parent().parent();
        var td = tr.children();
		
		var vacationAppNum = td.eq(0).find('input').val();
		var rejectReason = td.find('input[name="resonBox"]');
		var rejectReasonCheck = td.find('input[name="resonBoxCheck"]');
		var button1 = td.find('input[class="btn-primary"]');
		alert(vacationAppNum);


		rejectReason.attr("type","text");
		rejectReasonCheck.attr("type","button");
		button1.hide();
	});
	$(".btn-info").click(function(){
		
		var checkBtn = $(this);

		var tr = checkBtn.parent().parent();
        var td = tr.children();
		
		var vacationAppNum = td.eq(0).find('input').val();
		var rejectReason = td.find('input[name="resonBox"]').val();
		//var vacation={"vacationAppNum":vacationNum}
		alert(vacationAppNum);
		$.ajax({
			url:'/vacation/'+vacationAppNum+'/no',
			type:'post',
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			data:JSON.stringify({vacationAppNum:vacationAppNum,refusalreason:rejectReason}),
			contentType:'application/json; charset=UTF-8',
			success:function(result){
    			console.log(result);
				alert="ok";
    		}
		});	
	});//
	
	
})