/**
 *  vacationApply.js 유효성 검사 하는 페이지
 */

$(function(){
	
	//이전 컨트롤러에서 메세지 있다면 띄움
	checkModal(result);
	function checkModal(result){
		if(result===''||history.state){
			return;
		}
		 alert(result);
	}
	//휴가 신청 버튼 클릭하는 경우 값이 있는지 확인
	var applyForm = $(".applyForm");
	$("#registerBtn").click(function(){
		//e.preventDefault();

		var selectType=$("select[name='type']").val();
		var selectTerm=$("input[name='term']").val();	
		var writeReason=$("textarea[name='reason']").val();	
			
		if(selectType==='none'){
			alert("휴가 종류를 선택해 주세요");
			return false;
		}		
		if(selectTerm===''){
			alert("기간을 선택해 주세요");
			return false;
		}
		if(writeReason===''){
			alert("이유를 입력해 주세요");
			return false;
		}
		
		applyForm.submit();
	})
	
	var selectoption=$("#selectOption");
	
	selectoption.change(function(){
		
		if(selectoption.val()==='half'){
			applyForm.find('input[name="cal"]').attr('type','button');
			applyForm.find('input[name="term"]').attr('type','hidden');
			applyForm.find('input[name="connect"]').attr('type','hidden');
			applyForm.find('input[name="endterm"]').attr('type','hidden');
			
		}
		if(selectoption.val()==='monthly'){
			applyForm.find('input[name="connect"]').attr('type','text');
			applyForm.find('input[name="endterm"]').attr('type','date');
			applyForm.find('input[name="cal"]').attr('type','button');
			applyForm.find('input[name="term"]').attr('type','hidden');			
		}
	});
	//var term=Math.abs($("#endterm").val().getTime()-$("#startterm").val().getTime());
	$(".btn-info").click(function(){
		var selectStart=$("input[name='startterm']").val();
		var selectEnd=$("input[name='endterm']").val();
		var today=new Date();
		//신청기간 확인
		//신청시작일<오늘날짜 
		if((today>new Date(selectStart))===true){
				alert("이후 기간을 선택해 주세요");			
				}
		else{
			//반차를 선택한 경우
			if(selectoption.val()==='half'){
				if(selectStart===''){
					alert("기간을 선택해 주세요");
				}
				else{
					alert("selectStart : "+selectStart);
					applyForm.find('input[name="startterm"]').attr('readonly','readonly');
					applyForm.find('input[name="term"]').attr('type','text');
					applyForm.find('input[name="term"]').attr('value',1);
				}
			}
			if(selectoption.val()==='monthly'){
				if(selectStart===''||selectEnd===''){
					alert("기간을 선택해요....");
				}else{
					var selectStartDate=new Date(selectStart);
					var selectEndDate=new Date(selectEnd);
					
					alert(selectEndDate> selectStartDate);
					if((selectEndDate > selectStartDate)===true){
						var diff = Math.abs(selectEndDate - selectStartDate);
						
					    diff = Math.ceil(diff / (1000 * 3600 * 24))+1;
		
						alert(diff);
						applyForm.find('input[name="startterm"]').attr('readonly','readonly');
						applyForm.find('input[name="endterm"]').attr('readonly','readonly');
						applyForm.find('input[name="term"]').attr('type','text');
						applyForm.find('input[name="term"]').attr('value',diff);
					}	else{
						alert("날짜를 다시 입력해 주세요.");
					}
				}
				
					
			}
		}
		
	})


})