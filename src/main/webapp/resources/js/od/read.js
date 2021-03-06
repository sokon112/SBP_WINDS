/**
 * read.jsp 에서 사용할 스크립트
 */

function showImage(fileCallPath){
	$(".bigPictureWrapper").css("display","flex").show();
	
	$(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"' style='max-width:500px;'>")
	                .animate({width:'100%', height:'100%'},1000);
}
function uploadfile(){
	var str = "";
	
	str+="<div class='form-group uploadDiv'>";
	str+="<input type='file' name='uploadFile' id='attachlist' multiple />";
	str+="</div>"
	
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
			destname = "반려 공문";
		}
		
		$("#destinput").val(destname);
		var form = $("form");
		form.append(str);
		modal.modal("hide");
	})
	function checksubmit(){
		var destin = $("#destinput").val();
		
		if(destin==='${vo.dest}'){
			alert("결재선을 지정해주세요");
			destin.focus();
		}
	}
	
	//상신 버튼 클릭시
	$("#request").click(function(e){
		e.preventDefault();
		
		checksubmit();
		
		uploadfile();
		
		var str="";
		
		str+="<input type='hidden' name='storage' value='미결'>";
		str+="<input type='hidden' name='state' value='결재요청'>";
		
		str+="<input type='hidden' name='type' value='${cri.type}' />";
		str+="<input type='hidden' name='keyword' value='${cri.keyword}' />";
		str+="<input type='hidden' name='pageNum' value='${cri.pageNum}' />";
		str+="<input type='hidden' name='amount' value='${cri.amount}' />	";
		str+="<input type='hidden' name='docNum'  value='${vo.docNum}'/>";
		//게시글 등록 폼 가져오기
		var form = $("#mainform");
		//수집된 내용 폼에 추가하기
		form.append(str);
		//폼 전송하기
		form.submit();
	})
	
	//결재 완료 버튼 클릭시
	$("#final").click(function(e){
		e.preventDefault();
		
		checksubmit();
		
		uploadfile();
		
		var str="";
		
		
		str+="<input type='hidden' name='dest' value='10030001'>";
		str+="<input type='hidden' name='storage' value='완결'>";
		str+="<input type='hidden' name='state' value='결재완료'>";
		
		str+="<input type='hidden' name='type' value='${cri.type}' />";
		str+="<input type='hidden' name='keyword' value='${cri.keyword}' />";
		str+="<input type='hidden' name='pageNum' value='${cri.pageNum}' />";
		str+="<input type='hidden' name='amount' value='${cri.amount}' />	";
		str+="<input type='hidden' name='docNum'  value='${vo.docNum}'/>";
		//게시글 등록 폼 가져오기
		var form = $("#mainform");
		//수집된 내용 폼에 추가하기
		form.append(str);
		//폼 전송하기
		form.submit();
	})
	// ad 반려 버튼 클릭시
	$("#adreject").click(function(e){
		e.preventDefault();
		
		checksubmit();
		
		uploadfile();
		var str="";
		
		
		
		str+="<input type='hidden' name='dest' value='10030001'>";
		str+="<input type='hidden' name='storage' value='완결'>";
		str+="<input type='hidden' name='state' value='반려'>";
		
		str+="<input type='hidden' name='type' value='${cri.type}' />";
		str+="<input type='hidden' name='keyword' value='${cri.keyword}' />";
		str+="<input type='hidden' name='pageNum' value='${cri.pageNum}' />";
		str+="<input type='hidden' name='amount' value='${cri.amount}' />	";
		str+="<input type='hidden' name='docNum'  value='${vo.docNum}'/>";
		//게시글 등록 폼 가져오기
		var form = $("#mainform");
		//수집된 내용 폼에 추가하기
		form.append(str);
		//폼 전송하기
		form.submit();
	})
	// mg 반려 버튼 클릭시
	$("#mgreject").click(function(e){
		e.preventDefault();
		
		checksubmit();
		
		uploadfile();
		var str="";
		
		str+="<input type='hidden' name='storage' value='완결'>";
		str+="<input type='hidden' name='state' value='반려'>";
		
		str+="<input type='hidden' name='type' value='${cri.type}' />";
		str+="<input type='hidden' name='keyword' value='${cri.keyword}' />";
		str+="<input type='hidden' name='pageNum' value='${cri.pageNum}' />";
		str+="<input type='hidden' name='amount' value='${cri.amount}' />	";
		str+="<input type='hidden' name='docNum'  value='${vo.docNum}'/>";
		//게시글 등록 폼 가져오기
		var form = $("#mainform");
		//수집된 내용 폼에 추가하기
		form.append(str);
		//폼 전송하기
		form.submit();
	})
	//첨부 파일 가져오기
	$.getJSON({
		url:'/od/getAttachList',
		data:{
			docNum:docNum
		},
		success:function(data){
			console.log(data);
			
			var str="";
			$(data).each(function(i,obj){
				if(obj.fileType){ //image				
					var fileCallPath = encodeURIComponent(obj.uploadPath+"\\s_"+obj.uuid+"_"+obj.fileName);
					$("#modalattach").val(obj.fileName);						
					str+="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"'";
					str+=" data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"' style='list-style:none;'>";							
					str+="<img src='/display?fileName="+fileCallPath+"'>";
					str+="</li>";
				}else{
					$("#modalattach").val(obj.fileName);					
					str+="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"'";
					str+=" data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"' style='list-style:none;'>";
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
	
	
	//Modify버튼 클릭시  get방식 /od/modify
	$("#modify").click(function(){
		
		var form = $("#actionForm");
		form.attr('action','/od/modify');
		form.submit();
	})
	
	$("#remove").click(function(){
		var form = $("#actionForm");
		form.attr('method','post');
		form.attr('action','/od/remove');
		form.submit();
	})
	
})




















