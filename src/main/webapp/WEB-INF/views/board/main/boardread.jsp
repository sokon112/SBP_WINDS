<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="/WEB-INF/includes/board/header.jsp" %>
<html>
<head>
	<title>Board</title>
</head>
<body>
<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">게시물 읽기</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>            
            <div class="row">
                <div class="col-lg-12">
                	<div class="panel panel-default">
                        <div class="panel-heading">
                           게시물 읽기
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                			<form action="" role="form">
                				<div class="form-group">
                					<label>번호</label>
                					<input class="form-control" name="bno" readonly="readonly" value="${vo.bno}">                				
                				</div> 
                				<div class="form-group">
                					<label>제목</label>
                					<input class="form-control" name="title" readonly="readonly" value="${vo.title}">                				
                				</div>  
                				<div class="form-group">
                					<label>내용</label>
                					<textarea class="form-control" rows="3" name="contents" readonly="readonly">${vo.contents}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>Writer</label>
                					<input class="form-control" name="nickname" readonly="readonly" value="${vo.nickname}">                				
                				</div>  
                				<%-- 로그인한 사용자와 작성자가 동일할 때 Modify 버튼 보여주기 --%>
                				<sec:authentication property="principal" var="info"/>
                				<sec:authorize access="isAuthenticated()"><%-- 로그인 여부 확인 --%>
                					<c:if test="${info.username==vo.nickname}"><%-- 로그인한 사용자와 작성자 동일여부 확인 --%>
                						<button type="button" class="btn btn-default">수정</button>
                					</c:if>     			
                				</sec:authorize>
                				
                				
                				<button type="button" class="btn btn-info">목록</button>          			
                			</form>
                		</div>
                	</div>
                </div>
            </div>
<%-- 댓글 리스트 보여주는 부분 --%>            
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i>
				댓글
				
		    </div>
			<div class="panel-body">
				<ul class="chat">
					<li class="left clearfix" data-rno='1'>
						<div>
							<div class="header">
								<strong class="primary-font">user00</strong>
								<small class="pull-right text-muted">2021-06-15 14:25</small>
								<p>Good Job!!</p>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<div class="panel-footer"></div><!-- 댓글 페이지 나누기 -->
		</div><!-- panel-default close -->
	</div><!-- col-lg-12 close -->
</div><!-- row close -->            
<%-- 댓글 작성 폼 --%>  
<div class="modal" tabindex="-1" id="replyModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h5 class="modal-title">댓글</h5>
      </div>
      <div class="modal-body">
        <div class="form-group">
        	<label for="">댓글 내용</label>
        	<input type="text" name="reply" class="form-control" value="댓글내용"/>
        </div>
        <div class="form-group">
        	<label for="">닉네임</label>
        	<input type="text" name="nickname" class="form-control" value="닉네임"/>
        </div>
        <div class="form-group">
        	<label for="">작성일</label>
        	<input type="text" name="uploaddate" class="form-control" value="작성일"/>
        </div>        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" id="modalRegisterBtn">등록</button>
        <button type="button" class="btn btn-warning" id="modalModifyBtn">수정</button>
        <button type="button" class="btn btn-danger" id="modalRemoveBtn">삭제</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="modalCloseBtn">종료</button>
      </div>
    </div>
  </div>
</div>
<%-- 페이지 나누기를 위해 필요한 값 --%>
<form action="" id="operForm">
	<input type="hidden" name="type" value="${cri.type}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" />
	<input type="hidden" name="pageNum" value="${cri.pageNum}" />
	<input type="hidden" name="amount" value="${cri.amount}" />	
	<input type="hidden" name="bno"  value="${vo.bno}"/>
</form>       
<script>
	let bno = ${vo.bno};
	
	
	
	var csrfHeaderName="${_csrf.headerName}";
	var csrfTokenValue="${_csrf.token}";
	
	
</script>
<script src="/resources/js/board/main/read.js"></script>
<script src="/resources/js/board/main/reply.js"></script>
<%@include file="/WEB-INF/includes/board/footer.jsp" %>
