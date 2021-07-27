/**
 * vacationUser.jsp 스크립트
 */
$(function(){
	
	
	//하단의 페이지 나누기 번호 클릭시 
	var listCheckForm = $("#listCheckForm");	
	//게시글 제목 클릭시
	$(".move").click(function(e){
		e.preventDefault(); //타이틀 a 속성 막기
		
		//actionForm에 bno 값을 추가하여 actionForm 보내기		
		listCheckForm.append("<input type='hidden' name='vacationAppNum' value='"+$(this).attr('href')+"'>");
		
		listCheckForm.attr('action','vacationUserListCheckOne');
		listCheckForm.submit();		
	})
	
	
	var preMonthForm = $("#preMonthForm");
	
	/*$(".glyphicon-arrow-left").click(function(e){

		preMonthForm.append("<input type='hidden' name='monthMove' value='pre'>");
		preMonthForm.attr('action','/vacation/vacationUserListMove');
		
		//actionForm 보내기
		preMonthForm.submit();
	})
	$(".glyphicon-arrow-right").click(function(e){

		preMonthForm.append("<input type='hidden' name='monthMove' value='next'>");
		preMonthForm.attr('action','/vacation/vacationUserListMove');
		
		//actionForm 보내기
		preMonthForm.submit();
	})*/
	
	
	/*$(".glyphicon-arrow-left").click(function(e){
		let date1=new date(preMonthForm.find("input[name='nowMonth']").val());
		date1.setMonth(date1.getMonth() - 1);
		console.log("date날짜" +date1);
		preMonthForm.attr("input[name='nowMonth']",date1);
		//preMonthForm.attr("<input type='hidden' name='nowMonth' value='+date+'>");
		
		//listCheckForm.find("input[name='monthMove']","value='pre'");
		preMonthForm.attr('action','/vacation/vacationUserList');
		
		//actionForm 보내기
		preMonthForm.submit();
	})
	$(".glyphicon-arrow-right").click(function(e){

		preMonthForm.append("<input type='hidden' name='monthMove' value='next'>");
		preMonthForm.attr('action','/vacation/vacationUserList');
		
		//actionForm 보내기
		preMonthForm.submit();
	})*/
	var date=new Date(nowMonth).val();
	$(".glyphicon-arrow-left").click(function(e){
		e.preventDefault();
		var leftForm=$("leftForm");
		date1=date.setMonth((date.getMonth)+2);
		leftForm.find("input[name='nowMonth']").val(date1);
		
		
		preMonthForm.attr('action','vacationUserList');
		leftForm.submit();
	})
	$(".glyphicon-arrow-right").click(function(e){

		preMonthForm.append("<input type='hidden' name='monthMove' value='next'>");
		preMonthForm.attr('action','vacationUserList');
		
		//actionForm 보내기
		preMonthForm.submit();
	})
})
























