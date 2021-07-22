<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="/WEB-INF/includes/board/header.jsp" %>
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
                           커뮤니티 > 이벤트 > 게시물 읽기
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                			<form action="" role="form">
                				<div class="form-group">
                					<label>번호</label>
                					<input class="form-control" name="eno" readonly="readonly" value="${vo.eno}">                				
                				</div> 
                				<div class="form-group">
                					<label>제목</label>
                					<input class="form-control" name="etitle" readonly="readonly" value="${vo.etitle}">                				
                				</div>  
                				<div class="form-group">
                					<label>내용</label>
                					<textarea class="form-control" rows="3" name="econtents" readonly="readonly">${vo.econtents}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>작성자</label>
                					<input class="form-control" name="ewriter" readonly="readonly" value="${vo.ewriter}">                				
                				</div> 
                				<%-- 로그인한 사용자와 작성자가 동일할 때 Modify 버튼 보여주기 --%>
                				<sec:authentication property="principal" var="info"/>
                				<sec:authorize access="isAuthenticated()"><%-- 로그인 여부 확인 --%>
                					<c:if test="${info.authority=='admin'}"><%-- 로그인한 사용자와 작성자 동일여부 확인 --%>
                						<button type="button" class="btn btn-warning">삭제</button>
                					</c:if>     			
                				</sec:authorize>
                				
                				<button type="button" class="btn btn-default">수정</button>
                				<button type="button" class="btn btn-danger">삭제</button>
                				<button type="button" class="btn btn-info">목록</button>
                			</form>
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
	<input type="hidden" name="eno"  value="${vo.eno}"/>
</form>       
<script>
	let eno = ${vo.eno};
	
	
	
	var csrfHeaderName="${_csrf.headerName}";
	var csrfTokenValue="${_csrf.token}";
	
	
</script>
<script src="/resources/js/board/event/read.js"></script>
<script src="/resources/js/board/event/reply.js"></script>
<%@include file="/WEB-INF/includes/board/footer.jsp" %>
