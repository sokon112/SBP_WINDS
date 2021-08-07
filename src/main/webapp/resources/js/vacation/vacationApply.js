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
		Swal.fire({
						  icon: 'error',
						  title: result,
						})
	}
	//휴가 신청 버튼 클릭하는 경우 값이 있는지 확인
	var applyForm = $(".applyForm");
	$("#registerBtn").click(function(){
		//e.preventDefault();

		var selectType=$("select[name='type']").val();
		var selectTerm=$("input[name='term']").val();	
		var writeReason=$("textarea[name='reason']").val();	
			
			
		if(selectType==='none'){
			Swal.fire({
						  icon: 'error',
						  title: '휴가 종류를 선택해 주세요',
						})
			return false;
		}		
		if(selectTerm===''){
			Swal.fire("기간을 선택해 주세요");
			return false;
		}
		if(writeReason===''){
			Swal.fire({
						  icon: 'error',
						  title: '이유를 입력해 주세요.',
						})
			return false;
		}
		
		applyForm.submit();
	})
	
	var selectoption=$("#selectOption");
	
	selectoption.change(function(){
		
		if(selectoption.val()==='half'){
			applyForm.find('input[name="startterm"]').attr('readonly',false);
			applyForm.find('input[name="startterm"]').attr('value','');
			applyForm.find('input[name="endterm"]').attr('value','');
			applyForm.find('input[name="cal"]').attr('type','button');
			applyForm.find('input[name="connect"]').attr('type','hidden');
			applyForm.find('input[name="endterm"]').attr('type','hidden');
			
		}
		if(selectoption.val()==='monthly'){
			applyForm.find('input[name="startterm"]').attr('readonly',false);
			applyForm.find('input[name="startterm"]').attr('value','');
			applyForm.find('input[name="endterm"]').attr('readonly',false);
			applyForm.find('input[name="endterm"]').attr('value','');
			applyForm.find('input[name="connect"]').attr('type','text');
			applyForm.find('input[name="endterm"]').attr('type','date');
			applyForm.find('input[name="cal"]').attr('type','button');		
		}
	});
	
	$(".btn-info").click(function(){
		var selectStart=$("input[name='startterm']").val();
		var selectEnd=$("input[name='endterm']").val();
		var today=new Date();
		//신청기간 확인
		//신청시작일<오늘날짜 
		if((today>new Date(selectStart))===true){
			Swal.fire({
						  icon: 'error',
						  title: '이후 기간을 선택해 주세요.',
						})		
				}
		else{
			//반차를 선택한 경우
			if(selectoption.val()==='half'){
				if(selectStart===''){
					
					Swal.fire({
						  icon: 'error',
						  title: '기간을 선택해 주세요.',
						})
				}
				else{
					
					applyForm.find('input[name="startterm"]').attr('readonly','readonly');
					
					applyForm.find('input[name="cal"]').attr('type','hidden');
					applyForm.find('input[name="term"]').attr('value',1);
				}
			}
			if(selectoption.val()==='monthly'){
				if(selectStart===''||selectEnd===''){
					Swal.fire({
						  icon: 'error',
						  title: '기간을 선택해 주세요.',
						})
				}else{
					var selectStartDate=new Date(selectStart);
					var selectEndDate=new Date(selectEnd);
					
					if((selectEndDate >= selectStartDate)===true){
						var diff = Math.abs(selectEndDate - selectStartDate);
						
					    diff = Math.ceil(diff / (1000 * 3600 * 24))+1;
		
						applyForm.find('input[name="startterm"]').attr('readonly','readonly');
						applyForm.find('input[name="endterm"]').attr('readonly','readonly');
						applyForm.find('input[name="cal"]').attr('type','hidden');
						applyForm.find('input[name="term"]').attr('value',diff);
					}else{
						
						Swal.fire({
						  icon: 'error',
						  title: '날짜를 다시 입력해 주세요.',
						})
					}
				}
				
					
			}
		}
		
	})


})