/**
 * boardread.jsp 에서 사용할 스크립트
 */

$(function(){
   
   
   //operForm 가져온 후 전송하기
   var operForm = $("#operForm");
   
   //관리자 삭제버튼 클릭시 모달창 보이기
   $("#addelete").click(function(){
      operForm.attr('action','/board/main/addelete');
      operForm.attr('method','post');
      operForm.submit();
   })   
   
   //목록버튼 클릭시 get /board/main/boardlist
   $(".btn-primary").click(function(){
      operForm.find("input[name='bno']").remove();
      operForm.attr('action','/board/main/boardlist');
      operForm.submit();
   })
   
   //수정,삭제 모달 영역 가져오기
   let modifymodal = $(".modifymodal");
   let deletemodal = $(".deletemodal");   
   
   //수정버튼 클릭시 모달창 보이기
   $("#modifyBtn").click(function(){
      modifymodal.modal("show");
   })   
   
   //수정-비번완료버튼 클릭시  get방식 /board/main/boardmodify
   $("#mmodalSubmit").click(function(){
      operForm.find("input[name='password']").val($('#inpassword').val());      
      operForm.attr('action','/board/main/modifypassword');
      operForm.attr('method','post');
      operForm.submit();
         
   })
   
   //수정-비번취소버튼 클릭시  get방식 /board/main/boardmodify
   $("#mmodalCansle").click(function(){
      modifymodal.modal('hide');
   })
   
   
   //삭제버튼 클릭시 모달창 보이기
   $("#deleteBtn").click(function(){
      deletemodal.modal("show");
   })   
   
   //삭제-완료버튼 클릭시  get방식 /board/boardlist
   $("#dmodalSubmit").click(function(){
      var delpassword = $("#delpassword").val();
      operForm.find("input[name='password']").val($('#delpassword').val());
      operForm.attr('action','/board/main/boarddelete');
      operForm.attr('method','post');
      operForm.submit();
         
   })
   
   //삭제-취소버튼 클릭시  get방식 /board/boardlist
   $("#dmodalCansle").click(function(){
      modifymodal.modal('hide');
   })
   
   
   
   
   
   
   //댓글 작업
   
   //댓글이 보여질 영역 가져오기
   let replyUl = $(".chat");
   showList(1);   
   
   //모달 영역 가져오기
   let cmodal = $(".commentmodal");   
   
   
   //모달 영역 안에 있는 input 가져오기
   var modalcontent = cmodal.find("input[name='content']");
   var modaldnickname = cmodal.find("input[name='dnickname']");
   var modaldate = cmodal.find("input[name='uploaddate']");
   var modalpassword = cmodal.find("input[name='password']");
      
   //모달 영역 안에 있는 버튼 가져오기
   var modalModifyBtn = $("#modalModifyBtn");
   var modalRegisterBtn = $("#modalRegisterBtn");
   var modalRemoveBtn = $("#modalRemoveBtn");
   
   
   
   //댓글달기 버튼 클릭시  
   $("#addcomment").click(function(){
      
      //input안에 들어있는 value 제거
      cmodal.find("input").val("");
      
      
      //작성날짜 제거한 후 모달 보여주기
      modaldate.closest("div").hide();
      
      // 수정,삭제버튼 제거 
      cmodal.find("button[id!='modalCloseBtn']").hide();
      modalRegisterBtn.show();
      
      
      cmodal.modal("show");
   })   
   
   //댓글 삽입 - bno,content(댓글내용),nickname(작성자)
   $("#modalRegisterBtn").click(function(){
      
      //모달안에 있는 댓글 작성자, 댓글 내용 가져오기
      var content = {
         bno:bno,
         content: modalcontent.val(),
         dnickname: modaldnickname.val(),
         password: modalpassword.val()
      };      
      
      replyService.add(content,function(result){
         
         /*if(result){
            alert(result);
         }   */      
         
         cmodal.find("input").val("");
         cmodal.modal("hide");
         
         showList(-1);
         
         
      });  //add 종료
   }) //#modalRegisterBtn 종료
   
   
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
            str+="<li class='left clearfix' data-dno='"+data[i].dno+"'>";
            str+="<div>"
            str+="<div class='header'>"
            str+="<strong class='primary-font'>"+data[i].dnickname+"</strong>"
            str+="<small class='pull-right text-muted'>"+replyService.displayTime(data[i].replyDate)+"</small>"
            str+="<p>"+data[i].content+"</p>";
            str+="</div></div></li>";
         }
         replyUl.html(str);   
         showReplyPage(total);      
      })      
   }
   
   
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
      
      //닉네임 여부 확인
      if(!dnickname){
         alert("로그인 한 후 삭제가 가능합니다.");
         cmodal.modal("hide");
         return;
      }      
            
      
      // dno 가져오기   
      var dno = cmodal.data("dno");   
      
      replyService.remove(dno,oridnickname,function(result){
         //alert(result);
         
         //모달 창 닫기
         cmodal.modal("hide");
         showList(pageNum);         
      });      
   }) //#modalRemoveBtn 종료      
   
   //댓글 수정
   $("#modalModifyBtn").click(function(){
      
      var content= {
         dno:cmodal.data("dno"),
         content: modalcontent.val(),
         dnickname : modaldnickname.val()
      }   
      
      replyService.update(content,function(result){
         /*if(result){
            alert(result);
         }*/
         
         //모달 창 닫기
         cmodal.modal("hide");
         //showList 호출
         showList(pageNum);      
         
      });      
   }) //#modalModifyBtn 종료
   
   
   //이벤트 위임 : li 태그는 나중에 생기는 요소이기 때문에 ul 에 먼저 이벤트를 건 후
   //              li 에 넘겨주는 방식
   $(replyUl).on("click","li",function(){
      
      //현재 클릭된 li 요소의 rno 가져오기
      var dno = $(this).data("dno");   
      
      
      replyService.get(dno,function(data){
         console.log(data)
         
         //댓글 모달 창에 보여주기
         modalcontent.val(data.content);
         modaldnickname.val(data.dnickname);
         modaldate.val(replyService.displayTime(data.uploaddate)).prop("readonly","readonly");
         // rno 값 필수로 담기(PK)
         cmodal.data("dno",data.dno);
         
         
         //작성날짜 영역 보여주기 => 등록 후 댓글 보는 작업을 진행할 수도 있기 때문
         modaldate.closest("div").show();
         cmodal.find('button').show();
         cmodal.find("button[id='modalRegisterBtn']").hide();
         
         cmodal.modal("show");         
      })      
   })
   
   
   
})



















