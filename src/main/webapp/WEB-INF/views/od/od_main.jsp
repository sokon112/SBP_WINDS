<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="/WEB-INF/includes/od/header.jsp" %>
<html>
<head>
	<title>Official Documents</title>
</head>
<body>
	 <div class="row">
       <div class="col-lg-12">
         <h1 class="page-header">ERDsystem</h1>
       </div>
       <!-- /.col-lg-12 -->
     </div>
     <div class="row"> <!-- start search -->
     	<div class="col-md-12">
        	<div class="col-md-8"><!--search Form-->
            	<form action="mainsearchlist" id="searchForm" >
                	<input type="text" name="keyword" placeholder="문서 제목을 입력하세요." />
                    <!-- 검색시에도 페이지당 게시물 수와 현재 페이지에 대한 정보가 따라가야 함 -->
                    <input type="hidden" name="pageNum" value="1">
                    <input type="hidden" name="amount" value="10">
                    <button type="button" class="btn btn-default">검색</button>
                </form>
             </div>
        </div>                             	 
     </div><!-- end search -->
      <!-- /.row -->
      <div class="row">
      	<div class="col-lg-12">
      		<div class="panel panel-default">
      			<div class="panel-heading1">
          			미결 문서 보관함
        		</div>
         		<!-- /.panel-heading -->
          		<div class="panel-body1">
           			<table class="table table-striped table-bordered table-hover">
            			<div>
							<tr>
								<th>문서번호</th>
                                <th>제   목</th>
                                <th>송 신 자</th>
                                <th>단   계</th>
                                <th>수신일자</th>
							</tr>								
                         </div>
							<tbody>
							<!-- 게시판 리스트 반복문 -->
								<c:forEach var="vo" items="${waitlist}">
									<tr>
										<td>${vo.docNum}</td>
										<td><a href="${vo.docNum}" class="move">${vo.title}</a>[${vo.uname}]</td>
										<td>${vo.state}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${vo.regdate}"/></td>
									</tr>
								</c:forEach>								
								</tbody>
                            </table>
                  </div>
                  <!-- end panel-body1 -->
                  <div class="panel-heading1">
          			결재 완료 보관함
        		</div>
         		<!-- /.panel-heading -->
          		<div class="panel-body1">
           			<table class="table table-striped table-bordered table-hover">
            			<div>
							<tr>
								<th>문서번호</th>
                                <th>제   목</th>
                                <th>송 신 자</th>
                                <th>수신일자</th>
							</tr>								
                         </div>
							<tbody>
							<!-- 게시판 리스트 반복문 -->
								<c:forEach var="vo" items="${successlist}">
									<tr>
										<td>${vo.docNum}</td>
										<td><a href="${vo.docNum}" class="move">${vo.title}</a>[${vo.uname}]</td>
										<td>${vo.state}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${vo.regdate}"/></td>
									</tr>
								</c:forEach>								
								</tbody>
                            </table>
                  </div>
                  <!-- end panel-body1 -->
                  <div class="panel-heading1">
          			임시 보관함
        		</div>
         		<!-- /.panel-heading -->
          		<div class="panel-body1">
           			<table class="table table-striped table-bordered table-hover">
            			<div>
							<tr>
								<th>문서번호</th>
                                <th>제   목</th>
                                <th>송 신 자</th>
                                <th>최종수정일자</th>
							</tr>								
                         </div>
							<tbody>
							<!-- 게시판 리스트 반복문 -->
								<c:forEach var="vo" items="${templist}">
									<tr>
										<td>${vo.bno}</td>
										<td><a href="${vo.docNum}" class="move">${vo.title}</a>[${vo.uname}]</td>
										<td>${vo.state}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${vo.regdate}"/></td>
									</tr>
								</c:forEach>								
							</tbody>
                        </table>
                  </div>
                  <!-- end panel-body1 -->
              </div>
              <!-- end panel -->
           </div>                   
        </div>               
        <!-- /.row -->
<script src="/resources/js/list.js"></script>
<%@include file="/WEB-INF/includes/od/footer.jsp" %>





