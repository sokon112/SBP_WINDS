/**
 * 파일업로드 / 모달 / 정보저장
 */
$(function(){
	
	var modalplus = $("#modal2 .modal-body");
	
	function destmodal1(){
		var str = "<label class='input-group-text' for='dest'>결재자</label>";
		str += "<select class='form-select' id='dest' name='dest'>";
		str += "<option selected>결재자 선택</option>";
		str += "<option value='이지은(대표이사)'>이지은(대표이사)</option>";
		str += "<option value='한소희(인사팀)'>한소희(인사팀장)</option>";
		str += "<option value='채수빈(기획팀)'>채수빈(기획팀장)</option>";
		str += "<option value='배수지(개발팀)'>배수지(개발팀장)</option>";
		str += "<option value='김소현(재무홍보팀)'>김소현(재무홍보팀장)</option>";
		str += "<option value='김유정(총무팀)'>김유정(총무팀장)</option>";
		str += "</select>";
		str += "<button type='button' class='btn btn-primary' id='chooseDest'>결재자 선택</button>";
		modalplus.html(str);
	}
	
	function destmodal2(){
		var dest = $("#dest").val();
		var str = "<label class='input-group-text' for='dest'>결재자</label>";
		str+="<input type='text' class='form-control' id='recipient-name' readonly='readonly' value='"+dest+"'>";
		str+="<p></p>";
		str+="<label class='input-group-text' for='review'>검토자</label>";
		str+="<select class='form-select' id='review' name='review'>";
		
		if(dest=='이지은(대표이사)'){
			var dest = '10030001';
			str+="<option selected>검토자 선택</option>";
			str+="<option value='15080002'>한소희(인사팀)</option>";
			str+="<option value='15080003'>채수빈(기획팀)</option>";
			str+="<option value='15080004'>배수지(개발팀)</option>";
			str+="<option value='15080005'>김소현(재무홍보팀)</option>";
			str+="<option value='15080006'>김유정(총무팀)</option>";
		}
		else if(dest=='한소희(인사팀)'){
			var dest = '15080002';
			str+="<option selected>검토자 선택</option>";
			str+="<option value='null'>없음</option>";
		}
		else if(dest=='채수빈(기획팀)'){
			var dest = '15080003';
			str+="<option selected>검토자 선택</option>";
			str+="<option value='null'>없음</option>";
		}
		else if(dest=='배수지(개발팀)'){
			var dest = '15080004';
			str+="<option selected>검토자 선택</option>";
			str+="<option value='null'>없음</option>";
		}
		else if(dest=='김소현(재무홍보팀)'){
			var dest = '15080005';
			str+="<option selected>검토자 선택</option>";
			str+="<option value='null'>없음</option>";
		}
		else if(dest=='김유정(총무팀)'){
			var dest = '15080006';
			str+="<option selected>검토자 선택</option>";
			str+="<option value='null'>없음</option>";
		}
		else{
			alert("결재자를 선택해주세요");
			destmodel1();
		}
		
		str += "</select>";
		modalplus.html(str);
	}
	
	$("#chooseDest").click(function(){
		destmodal2();
	})
	
	$("#chooseModify").click(function(){
		destmodal1();
		$("#chooseDest").click(function(){
			destmodal2();
		})
	})
	
	let modal = $("#modal2");
	
	$("#selectDest").click(function(){
		var str = "";
		var dest = $("#dest").val();
		var review = $("#review").val();
		
		str += "<input type='hidden' name='dest' value='"+dest+"'>";
		str += "<input type='hidden' name='review' value='"+review+"'>";
		
		var form = $("form");
		form.append(str);
		modal.modal("hide");
	})
	
	//업로드 되는 파일의 종류와 크기 제한
	function checkExtension(fileName,fileSize){
		
		var regex = new RegExp("(.*?)\.(hwp|txt|jpg|gif|png|bmp)");
		
		var maxSize = 10242880; //5MB
		
		if(fileSize>maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	
	$("input[type='file']").change(function(){
		
		//첨부 파일 가져오기
		var files=$("input[name='uploadFile']")[0].files;
		console.log(files);
		
		//첨부파일을 formData 로 만들어 전송
		var formData = new FormData();
		for(var i=0;i<files.length;i++){
			if(!checkExtension(files[i].name,files[i].size)){
				return false;
			}
			formData.append("uploadFile",files[i]);
		}		
		
		// enctype="multipart/form-data" => processData:false,contentType:false,
		
		$.ajax({
			url:'/uploadAjax', //도착지
			type:'post',
			processData:false,
			contentType:false,
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			data:formData,
			success:function(result){
				console.log(result);
				showUploadedFile(result);
				$("input[name='uploadFile']").val("");
			},
			error:function(xhr,status,error){
				console.log("에러");
			}
		})
	})//input[type=file] 종료
	
	function showUploadedFile(uploadResultArr){
		var str = "";
		var uploadResult = $(".uploadResult ul");
		
		$(uploadResultArr).each(function(i,obj){
			if(obj.fileType){ //image
				// 썸네일 이미지 경로 링크				
				// 2021\\06\\17\\s_2a7f8a81-525e-4781-a814-970096f42b45_2.png
				var fileCallPath = encodeURIComponent(obj.uploadPath+"\\s_"+obj.uuid+"_"+obj.fileName);
			
				// 원본 이미지 경로
				var originPath = obj.uploadPath+"\\"+obj.uuid+"_"+obj.fileName;
				originPath = originPath.replace(new RegExp(/\\/g),"/");
			
				str+="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"'";
				str+=" data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";
				str+="<a href=\"javascript:showImage(\'"+originPath+"\')\">";
				str+="<span>"+obj.fileName+"</span>";
				str+=" <button type='button' class='btn btn-warning btn-circle btn-sm' data-file='"+fileCallPath+"' data-type='image'>";
				str+="<i class='fa fa-times'></i></button><br>";			
				str+="<img src='/display?fileName="+fileCallPath+"'></a>";
				str+="</li>";
			}else{
				var fileCallPath = encodeURIComponent(obj.uploadPath+"\\"+obj.uuid+"_"+obj.fileName);
				str+="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"'";
				str+=" data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";
				str+="<span>"+obj.fileName+"</span>";
				str+=" <button type='button' class='btn btn-warning btn-circle btn-sm' data-file='"+fileCallPath+"' data-type='file'>";
				str+="<i class='fa fa-times'></i></button><br>";
				str+="<a href='/download?fileName="+fileCallPath+"'>";
				str+="<img src='/resources/img/attach.png'></a>";
				str+="</li>";				
			}
		})		
		uploadResult.append(str);
	}// showUploadedFile 종료	
	
	
	//submit 버튼 중지
	$("button[type='submit']").click(function(e){
		e.preventDefault();
		
		
		var str="";
		$(".uploadResult ul li").each(function(idx,obj){
			var job = $(obj);
			//수집된 정보를 hidden 태그로 작성
			str+="<input type='hidden' name='attachList["+idx+"].uuid' value='"+job.data("uuid")+"'>";
			str+="<input type='hidden' name='attachList["+idx+"].uploadPath' value='"+job.data("path")+"'>";
			str+="<input type='hidden' name='attachList["+idx+"].fileName' value='"+job.data("filename")+"'>";
			str+="<input type='hidden' name='attachList["+idx+"].fileType' value='"+job.data("type")+"'>";
		})
		
		console.log(str);
		
		//게시글 등록 폼 가져오기
		var form = $("form");
		//수집된 내용 폼에 추가하기
		form.append(str);
		//폼 전송하기
		form.submit();
	})
	
	//X버튼 클릭시 동작
	$(".uploadResult").on("click","button",function(){
		//목록에 있는 첨부파일 삭제,서버 폴더 첨부파일 삭제
		var targetFile = $(this).data("file");
		var type = $(this).data("type");
		
		//li 태그 가져오기
		var targetLi = $(this).closest("li");
		
		$.ajax({
			url:'/deleteFile',
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			data:{
				fileName:targetFile,
				type:type
			},
			type:'post',
			success:function(result){
				console.log(result);
				targetLi.remove();
			}
		})
		
	})
})
























