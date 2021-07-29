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
	$("#modalRegisterBtn").click(function(){
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
})