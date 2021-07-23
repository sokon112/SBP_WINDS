<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="/WEB-INF/includes/od/header.jsp" %>
<style>
#searchForm {
float: right;
}
.page-header {
margin-top: 3px;
}


</style>

 	<div class="container-fluid">
       <div class="col-lg-12">
         <h1 class="page-header">ERDsystem</h1>
       </div>       <!-- /.col-lg-12 -->
	     <div class="row"> <!-- start search -->
	     	<div class="col-md-12" style="margin-bottom:10px">	<!--search Form-->
	            <form action="mainsearchlist" id="searchForm" >
	                <input type="text" name="keyword" placeholder="문서 제목을 입력하세요." />
	                <!-- 검색시에도 페이지당 게시물 수와 현재 페이지에 대한 정보가 따라가야 함 -->
	                <input type="hidden" name="pageNum" value="${PageVO.cri.pageNum}"/>
	                <input type="hidden" name="amount" value="${PageVO.cri.amount}"/>
	                <button type="button" class="btn btn-default">검색</button>
	           </form>
	        </div>                             	 
			<!-- end search -->
	     <div class="container-fluid">
	      	<div class="col-xs-6">
	      		<div class="panel panel-default">
	      			<div class="panel-heading" onclick="location.href='waitlist'" style="padding :8px">
	      				<button type="button" class="btn btn-link"><strong>미결 문서 보관함</strong></button>
	        		</div>
	         		<!-- /.panel-heading -->
	          		<div class="panel-body" style="padding-bottom:10px">
	           			<table class="table table-striped table-bordered table-hover">
	            			<thead >
								<tr>
									<th>문서번호</th>
	                                <th>제   목</th>
	                                <th>송 신 자</th>
	                                <th>단   계</th>
	                                <th>수신일자</th>
								</tr>								
	                         </thead>
							 <tbody>
							 <!-- 게시판 리스트 반복문 -->
								<c:forEach var="vo" items="${waitlist}">
									<tr>
										<td>${vo.docNum}</td>
										<td><a href="${vo.docNum}" class="move">${vo.title}</a></td>
										<td>${vo.name}</td>
										<td>${vo.state}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${vo.regDate}"/></td>
									</tr>
								</c:forEach>								
							</tbody>
	                     </table>
	                  </div>
	              </div>
	          </div>
	       <!-- end panel-body -->
	  	<div class="col-xs-6">
	       <div class="col-md-12">
	       		<div class="panel panel-default">
	                 <div class="panel-heading" onclick="location.href='completelist'" style="padding :1px">
	          			<button type="button" class="btn btn-link"><strong>결재 완료 보관함</strong></button>
	        		</div>
	         		<!-- /.panel-heading -->
	          		<div class="panel-body" style="padding-bottom:1px">
	           			<table class="table table-striped table-bordered table-hover">
	            			<thead>
								<tr>
									<th>문서번호</th>
	                                <th>제   목</th>
	                                <th>송 신 자</th>
	                                <th>수신일자</th>
								</tr>								
	                         </thead>
							 <tbody>
							 <!-- 게시판 리스트 반복문 -->
								<c:forEach var="vo" items="${completelist}">
									<tr>
										<td>${vo.docNum}</td>
										<td><a href="${vo.docNum}" class="move">${vo.title}</a></td>
										<td>${vo.name}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${vo.regDate}"/></td>
									</tr>
								</c:forEach>								
							</tbody>
	                     </table>
	                  </div>
	              </div>
	          </div>
	       <!-- end panel-body -->
	       <div class="col-md-12">
	       		<div class="panel panel-default">
	                  <div class="panel-heading" onclick="location.href='templist'" style="padding :1px">
	                  	<button type="button" class="btn btn-link"><strong>임시 보관함</strong></button>
	        		  </div>
	         		<!-- /.panel-heading -->
	          		<div class="panel-body" style="padding-bottom:1px">
	           			<table class="table table-striped table-bordered table-hover">
	            			<thead>
								<tr>
									<th>문서번호</th>
	                                <th>제   목</th>
	                                <th>송 신 자</th>
	                                <th>최종수정일자</th>
								</tr>								
	                         </thead>
							 <tbody>
							 <!-- 게시판 리스트 반복문 -->
								<c:forEach var="vo" items="${templist}">
									<tr>
										<td>${vo.docNum}</td>
										<td><a href="${vo.docNum}" class="move">${vo.title}</a></td>
										<td>${vo.name}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${vo.regDate}"/></td>
									</tr>
								</c:forEach>								
							</tbody>
	                     </table>
	                  </div>
	              </div>
	          </div>
	       </div>
	       <!-- end panel-body -->
	     </div>
	     <!-- /row -->
	 </div>
	</div>           
    <!-- /container-fluid-->
<script src="/resources/js/od/mainlist.js"></script>
<%@include file="/WEB-INF/includes/od/footer.jsp" %>




































