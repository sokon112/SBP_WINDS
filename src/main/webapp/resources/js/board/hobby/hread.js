/**
 * hobbyread.jsp 에서 사용할 스크립트
 */

function showImage(fileCallPath){
	$(".hbigPictureWrapper").css("bdisplay","flex").show();
	$(".hbigPicture").html("<img src='/bdisplay?fileName="+fileCallPath+"' style='max-width:500px;'>")
	                .animate({width:'100%', height:'100%'},1000);
}
$(function(){
	
	//첨부 파일 가져오기
	$.getJSON({
		url:'/board/hobby/getHattachList',
		data:{
			hno:hno
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
	$(".hbigPictureWrapper").click(function(){
		//원본 사진 줄이기
		$(".hbigPicture").animate({width:'0%', height:'0%'},1000);
		
		//확대된 영역 없애기
		setTimeout(function(){
			$(".hbigPictureWrapper").hide();
		},1000);		
	})
	
	
	
	
	
	
	
	//operForm 가져온 후 전송하기
	var operForm = $("#operForm");
	
	// 관리자: 삭제버튼 클릭시 모달창 보이기
	$("#addelete").click(function(){
		operForm.attr('action','/board/hobby/bhaddelete');
		operForm.attr('method','post');
		operForm.submit();
	})	
	
	//목록버튼 클릭시 get /board/hobby/hobbylist
	$(".btn-primary").click(function(){
		operForm.find("input[name='hno']").remove();
		operForm.attr('action','/board/hobby/hobbylist');
		operForm.submit();
	})
	
	//모달 영역 가져오기
	let hmodifymodal = $(".hmodifymodal");
	let hdeletemodal = $(".hdeletemodal");	
	
	//수정버튼 클릭시 모달창 보이기
	$("#hmodifyBtn").click(function(){
		hmodifymodal.modal("show");
	})	
	
	//수정-비번완료버튼 클릭시  get방식 /board/hobby/hobbymodify
	$("#hmodalSubmit").click(function(){
		operForm.find("input[name='hpassword']").val($('#inpassword').val());		
		operForm.attr('action','/board/hobby/hmodifypassword');
		operForm.attr('method','post');
		operForm.submit();
			
	})
	
	//수정-비번취소버튼 클릭시  get방식 /board/hobby/hobbymodify
	$("#hmmodalCansle").click(function(){
		hmodifymodal.modal('hide');
	})
	
	
	//삭제버튼 클릭시 모달창 보이기
	$("#hdeleteBtn").click(function(){
		hdeletemodal.modal("show");
	})	
	
	//삭제-완료버튼 클릭시  get방식 /hobby/hobbylist
	$("#hdmodalSubmit").click(function(){
		var delpassword = $("#delpassword").val();
		operForm.find("input[name='hpassword']").val($('#delpassword').val());
		operForm.attr('action','/board/hobby/hobbydelete');
		operForm.attr('method','post');
		operForm.submit();
			
	})
	
	//삭제-취소버튼 클릭시  get방식 /hobby/hobbylist
	$("#hdmodalCansle").click(function(){
		modifymodal.modal('hide');
	})
	
	
	
	
	
})








