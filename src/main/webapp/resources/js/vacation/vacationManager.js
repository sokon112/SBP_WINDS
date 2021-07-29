/**
 * vacationManager.jsp 스크립트
 */
$(function(){

	//하단의 페이지 나누기 번호 클릭시 이동하는 js
	var actionForm = $("#actionForm");
	$(".paginate_button a").click(function(e){
		e.preventDefault();  //a 속성 중지
		
		//actionForm의 안의 pageNum의 값을 사용자가 선택한 번호로 변경
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		
		//actionForm 보내기
		actionForm.submit();
	})
	
	//게시물 수 변경 => checkbox
	$("#amount").change(function(){
		//사용자가 선택한 게시물 수 가져오기
		let amount = $(this).val();
		
		//actionForm의 안의 amount의 값을 사용자가 선택한 번호로 변경
		actionForm.find("input[name='amount']").val(amount);
		
		//actionForm 보내기
		actionForm.submit();
	})
	
	//게시글 제목 클릭시 => 해당 게시글로 이동
	$(".move").click(function(e){
		e.preventDefault(); //타이틀 a 속성 막기
		
		//actionForm에 bno 값을 추가하여 actionForm 보내기		
		actionForm.append("<input type='hidden' name='vacationAppNum' value='"+$(this).attr('href')+"'>");
		actionForm.attr('action','vacationManagerCheckOne');
		actionForm.submit();		
	})
	
	//검색
	//keyType or keyword 가 값이 없는 경우 경고 메세지를 주기
	//둘 다 값이 있다면 submit 하기
	$(".selectBtn").click(function(){
		e.preventDefault();
		//검색 폼 가져오기
		var searchForm = $("#searchForm");
		
		//type 가져오기
		var keyType = $("select[name='keyType']").val();
		
		//keyword 가져오기
		var keyword = $("input[name='keyword']").val();
		
		if(keyType===''){
			alert("검색 기준을 확인하세요");
			$("select[name='keyType']").focus();
			return false;
		}else if(keyword===''){
			alert("검색어를 확인하세요");
			$("input[name='keyword']").focus();
			return false;
		}
		
		//검색 처음에는 1page 보여주기
		searchForm.find("input[name='pageNum']").val("1");
		
		searchForm.submit();
	})
	
	//operForm 가져온 후 전송하기
	var checkPageForm = $("#checkPageForm");
	
	//심사 버튼을 눌렀을 때 
	$(".btn-success").click(function(){
		
		checkPageForm.attr('action','/vacation/vacationManagerConfirm');
		checkPageForm.submit();
	})
	
	//월 이동하는 것 왼쪽 화살표  => 이전달
	$(".glyphicon-arrow-left").click(function(e){
		
		var checkBtn = $(this);

		var monthDiv = checkBtn.parent().parent();

		var date=monthDiv.find('input[name="month"]').val();

		var yyyyMMdd = String(date);
		
	    var sYear = yyyyMMdd.substring(0,4);
	    var sMonth = yyyyMMdd.substring(6,8);

		var nextDate=new Date(sYear,sMonth-1);
		
		if(sMonth===1){
			sYear=sYear-1;
			sMonth=12;
		}else{
			sMonth=sMonth-2;
		}
		
		var newDate=new Date(sYear,sMonth);
		
		actionForm.append("<input type='hidden' name='nowMonth' value='"+newDate+"'>");
		actionForm.append("<input type='hidden' name='nextMonth' value='"+nextDate+"'>");
		actionForm.attr('action','vacationManager');
		actionForm.submit();
	})
		//월 이동하는 것 왼쪽 화살표  => 다음달
	$(".glyphicon-arrow-right").click(function(e){
		
		var checkBtn = $(this);

		var monthDiv = checkBtn.parent().parent();

		var date=monthDiv.find('input[name="nmonth"]').val();

		var yyyyMMdd = String(date);
		
	    var sYear = yyyyMMdd.substring(0,4);
	    var sMonth = yyyyMMdd.substring(6,8);


		var newDate=new Date(sYear,sMonth-1);
		
		if(sMonth===12){
			sYear=sYear+1;
			sMonth=1;
		}else{
			sMonth=sMonth;
		}
		
		var nextDate=new Date(sYear,sMonth);
	
		actionForm.append("<input type='hidden' name='nowMonth' value='"+newDate+"'>");
		actionForm.append("<input type='hidden' name='nextMonth' value='"+nextDate+"'>");
		actionForm.attr('action','vacationManager');
		actionForm.submit();
	})
})
























