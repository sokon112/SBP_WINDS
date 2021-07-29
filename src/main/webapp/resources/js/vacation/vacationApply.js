/**
 *  vacationApply.js 유효성 검사 하는 페이지
 */

/*//keyword 가져오기
		var keyword = $("input[name='keyword']").val();
		

		
		if(keyType===''){
			alert("검색 기준을 확인하세요");
			$("select[name='keyType']").focus();
			return false;
		}*/
$(function(){
	// 모달 창 띄우기
	checkModal(result);
	
	//history.replaceState({},null,null);
	
	function checkModal(result){
		if(result===''||history.state){
			return;
		}
		 alert(result);
	}

var applyForm = $("#applyForm");
	

	$("#modalRegisterBtn").click(function(){
		//e.preventDefault();
	

		var selectType=$("select[name='type']").val();	
		if(selectType==='none'){
			$("select[name='type']").forcus();
			return false;
		}
		
	
		applyForm.submit();
	})
})