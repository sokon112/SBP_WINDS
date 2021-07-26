/**
 * read.jsp 에서 사용할 스크립트
 */

function showImage(fileCallPath){
	$(".bigPictureWrapper").css("display","flex").show();
	
	$(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>")
	                .animate({width:'100%', height:'100%'},1000);
}
$(function(){
	//결재선 모달 관련
	let modal = $("#modal2");
	
	$("#selectDest").click(function(){
		var str = "";
		var dest = $("#dest").val();
		
		console.log(dest);
		
		str += "<input type='hidden' name='dest' value='"+dest+"'>";
		
		var destname = "";
		if(dest =='10030001'){
			destname = "이지은(대표이사)";
		}
		else {
			destname = "알 수 없음";
		}
		$("#destinput").val(destname);
		var form = $("form");
		form.append(str);
		modal.modal("hide");
	})
	
	//첨부 파일 가져오기
	$.getJSON({
		url:'getAttachList',
		data:{
			bno:bno
		},
		success:function(data){
			console.log(data);
			
			var str="";
			$(data).each(function(i,obj){
				if(obj.fileType){ //image				
					var fileCallPath = encodeURIComponent(obj.uploadPath+"\\s_"+obj.uuid+"_"+obj.fileName);
											
					str+="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"'";
					str+=" data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";							
					str+="<img src='/display?fileName="+fileCallPath+"'>";
					str+="</li>";
				}else{					
					str+="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"'";
					str+=" data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";
					str+="<span>"+obj.fileName+"</span><br>";				
					str+="<img src='/resources/img/attach.png'>";
					str+="</li>";				
				}
			})
			$(".uploadResult ul").html(str);			
		}
	}) //getJSON 종료
	
	
	$(".uploadResult").on("click","li",function(){
		var liObj = $(this);
		
		
		var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
		
		if(liObj.data("type")){
			showImage(path.replace(new RegExp(/\\/g),"/"));			
		}else{
			self.location="/download?fileName="+path;
		}
	})
	
	//확대된 사진 영역 없애기
	$(".bigPictureWrapper").click(function(){
		//원본 사진 줄이기
		$(".bigPicture").animate({width:'0%', height:'0%'},1000);
		
		//확대된 영역 없애기
		setTimeout(function(){
			$(".bigPictureWrapper").hide();
		},1000);		
	})
	
	//operForm 가져온 후 전송하기
	var operForm = $("#operForm");
	
	//Modify버튼 클릭시  get방식 /board/modify
	$(".btn-default").click(function(){
		operForm.attr('action','/od/modify');
		operForm.submit();
	})
	
	
})




















