/**
 * 댓글 스크립트 - 자바스크립트 모듈(관련있는 함수들의 모임) 구성
 */
$(function(){
	
	
	//댓글 작업
	
	//댓글이 보여질 영역 가져오기
/*	let replyUl = $(".chat");
	showList(1);*/	
	
	//모달 영역 가져오기
	let modal = $(".modal");	
	
	
	//모달 영역 안에 있는 input 가져오기
	var modalReply = modal.find("input[name='rejectReason']");
	
		
	//모달 영역 안에 있는 버튼 가져오기
	var modalModifyBtn = $("#modalModifyBtn");


	
	//댓글 삽입 - bno,reply(댓글내용),replyer(작성자)
	$("#modalRegisterBtn").click(function(){
		
		//모달안에 있는 댓글 작성자, 댓글 내용 가져오기
		var reply = {
			bno:bno,
			reply: modalReply.val(),
			replyer: modalReplyer.val()
		};		
		
		replyService.add(reply,function(result){
			
			/*if(result){
				alert(result);
			}	*/		
			
			modal.find("input").val("");
			modal.modal("hide");
			
			showList(-1);
			
			
		});  //add 종료
	}) //#modalRegisterBtn 종료
	
	
	var manageForm = $("#manageForm");
	
	//List버튼 클릭시 get /board/list
	$(".btn-info").click(function(){
		
		manageForm.attr('action','/vacation/vacationManager');
		manageForm.submit();
	})
/*	
	function showList(page){
		//댓글 목록 가져오기
		replyService.getList({bno:bno,page:page||1},function(total,data){
			console.log(total);
			console.log(data);
			
			if(page==-1){
				//마지막 페이지 계산
				pageNum = Math.ceil(total / 10.0);
				showList(pageNum);
				return;
			}
			
			//댓글이 없는 경우
			if(data==null || data.length==0){
				replyUl.html("");
				return;
			}		
						
			
			//댓글이 있는 경우
			var str="";
			for(var i=0,len=data.length||0;i<len;i++){
				str+="<li class='left clearfix' data-rno='"+data[i].rno+"'>";
				str+="<div>"
				str+="<div class='header'>"
				str+="<strong class='primary-font'>"+data[i].replyer+"</strong>"
				str+="<small class='pull-right text-muted'>"+replyService.displayTime(data[i].replyDate)+"</small>"
				str+="<p>"+data[i].reply+"</p>";
				str+="</div></div></li>";
			}
			replyUl.html(str);	
			showReplyPage(total);		
		})		
	}
	*/
/*	
	//페이지 나누기
	//댓글 페이지 영역 가져오기
	var replyPageFooter = $(".panel-footer");
	var pageNum=1;
	function showReplyPage(total){ 
		
		//마지막 페이지 계산
		var endPage = Math.ceil(pageNum/10.0)*10;
		//시작 페이지 계산
		var startPage = endPage - 9;		
		//이전 버튼
		var prev = startPage != 1;		
		//다음 버튼
		var next = false;
		
		if(endPage * 10 >= total){
			endPage = Math.ceil(total/10.0);
		}
		if(endPage * 10 < total){
			next = true;
		}
		
		var str="<ul class='pagination pull-right'>";
		if(prev){
			str += "<li class='page-item'><a class='page-link' href='"+(startPage-1)+"'>Prev</a></li>";			
		}
		
		for(var i=startPage;i<=endPage;i++){
			var active = pageNum == i?"active":"";
			str += "<li class='page-item "+active+"'>";
			str += "<a class='page-link' href='"+i+"'>"+i;
			str += "</a></li>";
		}
		
		if(next){
			str += "<li class='page-item'><a class='page-link' href='"+(endPage+1)+"'>Next</a></li>";			
		}
		
		str += "</ul>";
		replyPageFooter.html(str);
	}
	
	//댓글 페이지 번호 클릭시
	replyPageFooter.on("click","li a",function(e){
		e.preventDefault();  //a 태그의 동작 막기
		
		pageNum = $(this).attr("href");
		showList(pageNum);
		
	})	
	
		
	//댓글 삭제
	$("#modalRemoveBtn").click(function(){
		
		//로그인 여부 확인
		if(!replyer){
			alert("로그인 한 후 삭제가 가능합니다.");
			modal.modal("hide");
			return;
		}		
		
		//현재 모달창에 있는 작성자와 로그인 사용자가 같은지 확인
		
		//현재 모달창 작성자 가져오기
		var oriReplyer = modalReplyer.val();
		//비교
		if(oriReplyer!=replyer){
			alert('자신의 댓글만 삭제가 가능합니다.');
			modal.modal("hide");
			return;
		}
				
		
		// rno 가져오기	
		var rno = modal.data("rno");	
		
		replyService.remove(rno,oriReplyer,function(result){
			//alert(result);
			
			//모달 창 닫기
			modal.modal("hide");
			showList(pageNum);			
		});		
	}) //#modalRemoveBtn 종료		
	*/
	//댓글 수정
	$("#modalModifyBtn").click(function(){
		
		
		/*//로그인 여부 확인
		if(!replyer){
			alert("로그인 한 후 수정이 가능합니다.");
			modal.modal("hide");
			return;
		}	*/	
		
		//현재 모달창에 있는 작성자와 로그인 사용자가 같은지 확인
		
		//현재 모달창 작성자 가져오기
		/*var oriReplyer = modalReplyer.val();
		//비교
		if(oriReplyer!=replyer){
			alert('자신의 댓글만 수정이 가능합니다.');
			modal.modal("hide");
			return;
		}*/
		
		
		
		var reply= {
			rno:modal.data("vacationAppNum"),
			rejectReason: modalReply.val(rejectReason)
		}	
		
		re.update(reply,function(result){
			/*if(result){
				alert(result);
			}*/
			
			//모달 창 닫기
			modal.modal("hide");
			//showList 호출
			showList(pageNum);		
			
		});		
	}) //#modalModifyBtn 종료
	
	
	//이벤트 위임 : li 태그는 나중에 생기는 요소이기 때문에 ul 에 먼저 이벤트를 건 후
	//              li 에 넘겨주는 방식
	$(replyUl).on("click","li",function(){
		
		//현재 클릭된 li 요소의 rno 가져오기
		var rno = $(this).data("rno");	
		
		
		replyService.get(rno,function(data){
			console.log(data)
			
			//댓글 모달 창에 보여주기
			modalReply.val(data.reply);
			modalReplyer.val(data.replyer);
			
			// rno 값 필수로 담기(PK)
			modal.data("rno",data.rno);
			
			
			//작성날짜 영역 보여주기 => 등록 후 댓글 보는 작업을 진행할 수도 있기 때문

			modal.find('button').show();
			modal.find("button[id='modalRegisterBtn']").hide();
			
			modal.modal("show");			
		})		
	})




	function update(reply,callback){
		$.ajax({
			url:reply.rno+'/replies/',
			type:'put',
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			data:JSON.stringify(reply),
			contentType:'application/json',
			success:function(result){
				if(callback){
					callback(result);
				}
			}
		})
	}//update 종료
	
	function get(rno,callback){
		
		$.getJSON({
			url:'/replies/'+rno,
			success:function(data){
				if(callback){
					callback(data);
				}
			}
		})
	}
	
	function displayTime(timeValue){
		var today = new Date();
		
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);		
		
		if(gap < (1000*60*60*24)){ //댓글 단 날짜가 오늘이면 시분초
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [(hh > 9 ? '':'0')+hh, ':', (mi > 9 ? '':'0')+mi, ':', (ss > 9 ? '':'0')+ss].join('');
		}else{ //오늘이 아닌 경우 년/월/일
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();
			return [yy,'/',(mm > 9 ? '':'0')+mm,'/',(dd > 9 ?'':'0')+dd].join('');
		}
	}
	
	//public
	return {
		add:add,
		getList:getList,
		remove:remove,
		update:update,
		get:get,
		displayTime:displayTime
	}
	
	
	
	
})();











