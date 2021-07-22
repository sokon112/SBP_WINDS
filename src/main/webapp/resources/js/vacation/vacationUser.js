/**
 * vacationManager.jsp 스크립트
 */
$(function(){
	
	
	//하단의 페이지 나누기 번호 클릭시 
	var actionForm = $("#actionForm");
	$(".paginate_button a").click(function(e){
		e.preventDefault();  //a 속성 중지
		
		//actionForm의 안의 pageNum의 값을 사용자가 선택한 번호로 변경
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		
		//actionForm 보내기
		actionForm.submit();
	})
	
	//게시물 수 변경
	$("#amount").change(function(){
		//사용자가 선택한 게시물 수 가져오기
		let amount = $(this).val();
		
		//actionForm의 안의 amount의 값을 사용자가 선택한 번호로 변경
		actionForm.find("input[name='amount']").val(amount);
		
		//actionForm 보내기
		actionForm.submit();
	})
	
	//게시글 제목 클릭시
	$(".move").click(function(e){
		e.preventDefault(); //타이틀 a 속성 막기
		
		//actionForm에 bno 값을 추가하여 actionForm 보내기		
		listCheckForm.append("<input type='hidden' name='vacationAppNum' value='"+$(this).attr('href')+"'>");
		listCheckForm.attr('action','vacationUserListCheckOne');
		listCheckForm.submit();		
	})
	
	
	
})
























