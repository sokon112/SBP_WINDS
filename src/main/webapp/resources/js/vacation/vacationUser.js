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
		
		var preMonthForm=$("#preMonthForm");
	
	$(".glyphicon-arrow-left").click(function(e){
		
		var checkBtn = $(this);

		var tr = checkBtn.parent().parent();
        var td = tr.children();

		var date=td.find('input[name="month"]');

		var yyyyMMdd = String(date);
		
	    var sYear = yyyyMMdd.substring(0,4);
	    var sMonth = yyyyMMdd.substring(6,8);

		var nextDate=new Date(sYear,sMonth-1);
		
		if(sMonth==1){
			sYear=sYear-1;
			sMonth=12;
		}else{
			sMonth=sMonth-2;
		}
		
		var newDate=new Date(sYear,sMonth);
		
		preMonthForm.append("<input type='hidden' name='nowMonth' value='"+newDate+"'>");
		preMonthForm.append("<input type='hidden' name='nextMonth' value='"+nextDate+"'>");
		preMonthForm.attr('action','vacationUserList');
		preMonthForm.submit();
	})
	$(".glyphicon-arrow-right").click(function(e){
		
		var checkBtn = $(this);

		var tr = checkBtn.parent().parent();
        var td = tr.children();

		var date=td.find('h1').val();

		var yyyyMMdd = String(date);
		
	    var sYear = yyyyMMdd.substring(0,4);
	    var sMonth = yyyyMMdd.substring(6,8);


		var newDate=new Date(sYear,sMonth-1);
		
		if(sMonth==12){
			sYear=sYear+1;
			sMonth=1;
		}else{
			sMonth=sMonth;
		}
		
		var nextDate=new Date(sYear,sMonth);
	
		alert("newDate"+newDate);
		alert("nextDate"+nextDate);
		
		preMonthForm.append("<input type='hidden' name='nowMonth' value='"+newDate+"'>");
		preMonthForm.append("<input type='hidden' name='nextMonth' value='"+nextDate+"'>");
		preMonthForm.attr('action','vacationUserList');
		preMonthForm.submit();
	})
	
})























