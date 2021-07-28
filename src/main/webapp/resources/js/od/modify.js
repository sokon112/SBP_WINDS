/**
 * modify.jsp 스크립트
 */
$(function(){
	
	//결재선 모달 관련
	$("#reg").click(function(){
		var title = $("#title").val()
		var attach = $("#attachlist").val();
		$("#modaltitle").val(title);
		$("#modalattach").val(attach);
	})
	
	let modal = $("#modal2");
	
	$("#selectDest").click(function(){
		var str = "";
		var dest = $("#dest").val();
		
		console.log(dest);
		
		str += "<input type='hidden' name='dest' value='"+dest+"'>";
		var deptNum;
		var destname = "";
		if(dest=='15080002'){
			destname = "한소희(인사팀장)";
			deptNum = 1001;
		}
		else if(dest=='15080003'){
			destname = "채수빈(기획팀장)";
			deptNum = 1002;
		}
		else if(dest=='15080004'){
			destname = "배수지(개발팀장)";
			deptNum = 1003;
		}
		else if(dest=='15080005'){
			destname = "김소현(재무홍보팀장)";
			deptNum = 1004;
		}
		else if(dest=='15080006'){
			destname = "김유정(총무팀장)";
			deptNum = 1005;
		}
		else {
			destname = "알 수 없음";
		}
		str += "<input type='hidden' name='deptNum' value='"+deptNum+"'>";
		$("#destinput").val(destname);
		var form = $("form");
		form.append(str);
		modal.modal("hide");
	})
	
	function checksubmit(){
		var destin = $("#destinput").val();
		var title = $("#title").val();
		var retent = $("#retentdate").val();
		
		if(destin==='${vo.dest}'){
			alert("결재선을 지정해주세요");
			destin.focus();
		}
		if(title===''){
			alert("제목을 입력하세요");
			title.focus();
		}
		if(retent==='0'){
			alert("보존기한을 선택해주세요");
			retent.focus();
		}
	}
	
	
	$("button[type='submit']").click(function(e){
		//button submit 기능 멈추기
		e.preventDefault();
		
		checksubmit();
		
		var str="";
		$(".uploadResult ul li").each(function(idx,obj){
			var job = $(obj);
			//수집된 정보를 hidden 태그로 작성
			str+="<input type='hidden' name='attachList["+idx+"].uuid' value='"+job.data("uuid")+"'>";
			str+="<input type='hidden' name='attachList["+idx+"].uploadPath' value='"+job.data("path")+"'>";
			str+="<input type='hidden' name='attachList["+idx+"].fileName' value='"+job.data("filename")+"'>";
			str+="<input type='hidden' name='attachList["+idx+"].fileType' value='"+job.data("type")+"'>";
		})
		
		str+="<input type='hidden' name='storage' value='미결'>";
		str+="<input type='hidden' name='state' value='요청'>";
		
		str+="<input type='hidden' name='type' value='${cri.type}' />";
		str+="<input type='hidden' name='keyword' value='${cri.keyword}' />";
		str+="<input type='hidden' name='pageNum' value='${cri.pageNum}' />";
		str+="<input type='hidden' name='amount' value='${cri.amount}' />	";
		str+="<input type='hidden' name='docNum'  value='${vo.docNum}'/>";
		
		console.log(str);
		
		var form = $("form");
		form.append(str);				
		form.submit();		
})
	
	
	//첨부 파일 가져오기
	$.getJSON({
		url:'getAttachList',
		data:{
			docNum:docNum
		},
		success:function(data){
			console.log(data);
			
			var str="";
			$(data).each(function(i,obj){
				if(obj.fileType){ //image				
					var fileCallPath = encodeURIComponent(obj.uploadPath+"\\s_"+obj.uuid+"_"+obj.fileName);
											
					str+="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"'";
					str+=" data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";	
					str+="<span>"+obj.fileName+"</span>";
					str+=" <button type='button' class='btn btn-warning btn-circle btn-sm' data-file='"+fileCallPath+"' data-type='image'>";
					str+="<i class='fa fa-times'></i></button><br>";							
					str+="<img src='/display?fileName="+fileCallPath+"'>";
					str+="</li>";
				}else{					
					str+="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"'";
					str+=" data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";					
					str+="<span>"+obj.fileName+"</span>";	
					str+=" <button type='button' class='btn btn-warning btn-circle btn-sm' data-file='"+fileCallPath+"' data-type='file'>";
					str+="<i class='fa fa-times'></i></button><br>";			
					str+="<img src='/resources/img/attach.png'>";
					str+="</li>";				
				}
			})
			$(".uploadResult ul").html(str);			
		}
	}) //getJSON 종료
	
	
	//X버튼 클릭시 동작
	$(".uploadResult").on("click","button",function(){	
		
		if(confirm("정말로 파일을 삭제하시겠습니까?")){
			//li 태그 가져오기
			var targetLi = $(this).closest("li");		
			
			targetLi.remove();			
		}
	})
	
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
	
	//업로드 되는 파일의 종류와 크기 제한
	function checkExtension(fileName,fileSize){
		
		var regex = new RegExp("(.*?)\.(txt|jpg|gif|png|bmp)");
		
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
	
})









