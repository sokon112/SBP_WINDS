<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="/WEB-INF/includes/od/header.jsp" %>
<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Main Search List</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Main Search List
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>공문번호</th>
                                        <th>제   목</th>
                                        <th>단   계</th>
                                        <th>수신일자</th>
                                        <th>보 관 함</th>
                                    </tr>									
                                </thead>
								<!-- 게시판 리스트 반복문 -->
								<tbody>
									<c:forEach var="vo" items="${searchlist}">
										<tr>
										<td>${vo.docNum}</td>
										<td><a href="${vo.docNum}" class="move">${vo.title}</a></td>
										<td>${vo.state}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${vo.regDate}"/></td>
										<td>${vo.storage}</td>
										</tr>
									</c:forEach>
								</tbody>
                            </table>
                            	   <div class="col-md-2 col-md-offset-2">
                            	   	<!--페이지 목록 갯수 지정하는 폼-->
                            	   	<select name="" id="amount" class="form-control">
                            	   		<option value="10" <c:out value="${pageVO.cri.amount==10?'selected':''}"/>>10</option>
                            	   		<option value="20" <c:out value="${pageVO.cri.amount==20?'selected':''}"/>>20</option>
                            	   		<option value="30" <c:out value="${pageVO.cri.amount==30?'selected':''}"/>>30</option>
                            	   		<option value="40" <c:out value="${pageVO.cri.amount==40?'selected':''}"/>>40</option>
                            	   	</select>
								  </div>
                             	 </div>                             	 
                      		 </div><!-- end search -->
                            <!-- start Pagination -->
                            <div class="text-center">
                            	<ul class="pagination">
                            		<c:if test="${pageVO.prev}">
                            			<li class="paginate_button previous"><a href="${pageVO.startPage-1}">Previous</a></li>
                            		</c:if>
                            		
                            		<c:forEach var="idx" begin="${pageVO.startPage}" end="${pageVO.endPage}">
                            			<li class="paginate_button ${pageVO.cri.pageNum==idx?'active':''}">
                            				<a href="${idx}">${idx}</a>
                            			</li>
                            		</c:forEach>
                            		
                            		<c:if test="${pageVO.next}">
                            			<li class="paginate_button next"><a href="${pageVO.endPage+1}">Next</a></li>
                            		</c:if>
                            	</ul>
                            </div>
                            <!-- end Pagination -->   
                            </div>
                            <!-- end panel-body -->
                        </div>
                        <!-- end panel -->
                    </div>                   
                </div>               
            <!-- /.row -->
<!-- 페이지 나누기 추가 -->            
<form action="list" method="get" id="actionForm">
	<input type="hidden" name="type" value="${pageVO.cri.type}">
	<input type="hidden" name="keyword" value="${pageVO.cri.keyword}">
	<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum}">
	<input type="hidden" name="amount" value="${pageVO.cri.amount}">
</form>
<script src="/resources/js/od/list.js"></script>
<%@include file="/WEB-INF/includes/od/footer.jsp" %>
=