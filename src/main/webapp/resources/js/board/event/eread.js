/**
 * eventread.jsp 에서 사용할 스크립트
 */

function showImage(fileCallPath){
	$(".ebigPictureWrapper").css("bdisplay","flex").show();
	$(".ebigPicture").html("<img src='/bdisplay?fileName="+fileCallPath+"' style='max-width:500px;'>")
	                .animate({width:'100%', height:'100%'},1000);
}
$(function(){
	
	//첨부 파일 가져오기
	$.getJSON({
		url:'/board/event/getEattachList',
		data:{
			eno:eno
		},
		success:function(data){
			console.log(data);
			
			var str="";
			$(data).each(function(i,obj){
				if(obj.fileType){ //image				
					var fileCallPath = encodeURIComponent(obj.uploadPath+"\\s_"+obj.uuid+"_"+obj.fileName);
											
					str+="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"'";
					str+=" data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";							
					str+="<img src='/bdisplay?fileName="+fileCallPath+"'>";
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
			self.location="/bdownload?fileName="+path;
		}
	})
	
	
	
	//확대된 사진 영역 없애기
	$(".ebigPictureWrapper").click(function(){
		//원본 사진 줄이기
		$(".ebigPicture").animate({width:'0%', height:'0%'},1000);
		
		//확대된 영역 없애기
		setTimeout(function(){
			$(".ebigPictureWrapper").hide();
		},1000);		
	})
	
	
	
	
	
	
	//operForm 가져온 후 전송하기
	var operForm = $("#operForm");
	
	//----------------------------------변경함 : 관리자 삭제버튼 클릭시 모달창 보이기
	$("#addelete").click(function(){
		operForm.attr('action','/board/event/beaddelete');
		operForm.attr('method','post');
		operForm.submit();
	})	
	
	//목록버튼 클릭시 get /board/event/eventlist
	$(".btn-primary").click(function(){
		operForm.find("input[name='eno']").remove();
		operForm.attr('action','/board/event/eventlist');
		operForm.submit();
	})
	
	//모달 영역 가져오기
	let emodifymodal = $(".emodifymodal");
	let edeletemodal = $(".edeletemodal");	
	
	//수정버튼 클릭시 모달창 보이기
	$("#emodifyBtn").click(function(){
		//console.log("버튼클릭");
		emodifymodal.modal("show");
	})	
	
	//수정-비번완료버튼 클릭시  get방식 /board/event/eventmodify
	$("#emmodalSubmit").click(function(){
		operForm.find("input[name='epassword']").val($('#inpassword').val());		
		operForm.attr('action','/board/event/emodifypassword');
		operForm.attr('method','post');
		operForm.submit();
			
	})
	
	//수정-비번취소버튼 클릭시  get방식 /board/event/eventmodify
	$("#emmodalCansle").click(function(){
		emodifymodal.modal('hide');
	})
	
	
	//삭제버튼 클릭시 모달창 보이기
	$("#edeleteBtn").click(function(){
		edeletemodal.modal("show");
	})	
	
	//삭제-완료버튼 클릭시  get방식 /event/eventlist
	$("#edmodalSubmit").click(function(){
		var delpassword = $("#delpassword").val();
		operForm.find("input[name='epassword']").val($('#delpassword').val());
		operForm.attr('action','/board/event/eventdelete');
		operForm.attr('method','post');
		operForm.submit();
			
	})
	
	//삭제-취소버튼 클릭시  get방식 /event/eventlist
	$("#dmodalCansle").click(function(){
		modifymodal.modal('hide');
	})
	
	
	
	
	

	
	
})