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

		$.ajax({
			url:'/vacation/'+vacationAppNum+'/ok',			
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},			
			success:function(result){
    			console.log(result);
				td.find("button[name='successBox']").hide();
				td.find("button[name='rejectBox']").hide();
				td.find("input[name='hiddenBox']").attr('value','승인');
				td.find("input[name='hiddenBox']").attr('type','text');
    		}
		});
		
	});
//csrf 토큰값이 안넘어와서  302에러가 발생함
	$(".btn-secondary").click(function(){
		var checkBtn = $(this);

		var tr = checkBtn.parent().parent();
        var td = tr.children();
		
		var rejectReason = td.find('input[name="resonBox"]');
		var rejectReasonCheck = td.find('input[name="resonBoxCheck"]');
		var button1 = td.find('input[class="btn-primary"]');

		rejectReason.attr("type","text");
		rejectReasonCheck.attr("type","button");
		button1.hide();
	});
	$(".btn-danger").click(function(){
		
		var checkBtn = $(this);

		var tr = checkBtn.parent().parent();
        var td = tr.children();
		
		var vacationAppNum = td.eq(0).find('input').val();
		var refusalReason = td.find('input[name="resonBox"]').val();
		

		$.ajax({
			type:'post',
			url:'/vacation/'+vacationAppNum+'/no',
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			data:JSON.stringify(refusalReason
			),
			contentType: "application/json; charset=UTF-8",
			success:function(result){
    			console.log(result);
				td.find("button[name='successBox']").hide();
				td.find("button[name='rejectBox']").hide();
				td.find("input[name='resonBox']").hide();
				td.find("input[name='resonBoxCheck']").hide();
				
				td.find("input[name='hiddenBox']").attr('value','거절');
				td.find("input[name='hiddenBox']").attr('type','text');
    		}
		});	
	});//
	
	
})