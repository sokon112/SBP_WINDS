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
                    <h1 class="page-header">Board Modify</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>            
            <div class="row">
                <div class="col-lg-12">
                	<div class="panel panel-default">
                        <div class="panel-heading">
                           Board Modify Page
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                			<form action="" method="post" role="form">
                				<div class="form-group">
                					<label>제목</label>
                					<input class="form-control" name="title" value="${vo.title}">                				
                				</div>  
                				<div class="form-group">
                					<label>내용</label>
                					<textarea class="form-control" rows="3" name="content">${vo.contents}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>닉네임</label>
                					<input class="form-control" name="writer" readonly="readonly" value="${vo.nickname}">                				
                				</div>  
                				<%-- spring security 추가 --%>
                				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                				
                				
                				
                				           			
                				<button type="submit" data-oper='list' class="btn btn-info">List</button>              			
                			</form>
                		</div>
                	</div>
                </div>
            </div>
   
<%-- remove와 list를 위한 폼--%>
<form action="" id="operForm" method="post">
	<input type="hidden" name="type" value="${cri.type}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" />
	<input type="hidden" name="pageNum" value="${cri.pageNum}" />
	<input type="hidden" name="amount" value="${cri.amount}" />	
	<input type="hidden" name="bno"  value="${vo.bno}"/>
	
	<%-- spring security 추가 --%>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <input type="hidden" name="nickname"  value="${vo.nickname}"/>
</form>  

<%-- 스크립트 --%>
<script>
	let bno = ${vo.bno};
	var csrfHeaderName="${_csrf.headerName}";
	var csrfTokenValue="${_csrf.token}";
</script>
<script src="/resources/js/modify.js"></script>
<%@include file="/WEB-INF/includes/board/footer.jsp" %>
