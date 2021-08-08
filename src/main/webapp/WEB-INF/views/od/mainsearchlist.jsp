<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="/WEB-INF/includes/od/header.jsp" %>

<style>

/* Hide for mobile, show later */
.sidebar {
  display: none;
}
@media (min-width: 768px) {
  .sidebar {
    position: fixed;
    top: 55px;
    bottom: 0;
    left: 0;
    z-index: 1000;
    display: block;
    margin-top:0;
    overflow-x: hidden;
    overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
    background-color:  #f8f8f8;
    border-right: 1px solid #eee;
  }
}
/* Sidebar navigation */
.nav-sidebar {
  margin-right: -21px; /* 20px padding + 1px border */
  margin-bottom: 20px;
  margin-left: -20px;
}
.nav-sidebar > li > a {
  padding-right: 20px;
  padding-left: 20px;
  font-size:15px;
  color: black;
  height:45px;
}

/*
 * Main content
 */

.main {
  padding: 5px;
  
}
@media (min-width: 768px) {
  .main {
    padding-right: 40px;
    padding-left: 40px;
  }
}

th,td{
text-align:center;
width:15%;}


#amount {
	margin-bottom:10px;
	width:65px;
	position:relative;
	left:65%;
}

.move{
white-space:normal;
display:-webkit-box; 
-webkit-line-clamp:1; 
-webkit-box-orient:vertical; 
overflow:hidden;
}
</style>

		<div class="container-fluid">
			<div class="row">
        		<div class="col-sm-3 col-md-2 sidebar" >
		        	<ul class="nav nav-sidebar">
		            	<li><a href='waitlist'>미결문서 보관함</a></li>
		            	<li><a href='completelist'>결재완료 보관함</a></li>
		            	<li><a href='templist'>임시보관함</a></li>
		          	</ul>
		        </div>
            	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
               		<h2 class="page-header">검색 결과</h2>
                		<div class="col-lg-12">
                    		<div class="panel panel-default">
                        		<div class="panel-heading">
                          	
                        		</div>
                        		<!-- /.panel-heading -->
                        		<div class="panel-body">
                        		<div class="col-md-2 col-md-offset-10">
                            	   	<!--페이지 목록 갯수 지정하는 폼-->
                            	   	<select name="" id="amount" class="form-control" >
                            	   		<option value="10" <c:out value="${pageVO.cri.amount==10?'selected':''}"/>>10</option>
                            	   		<option value="20" <c:out value="${pageVO.cri.amount==20?'selected':''}"/>>20</option>
                            	   		<option value="30" <c:out value="${pageVO.cri.amount==30?'selected':''}"/>>30</option>
                            	   		<option value="40" <c:out value="${pageVO.cri.amount==40?'selected':''}"/>>40</option>
                            	   	</select>
								  </div>
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
								<sec:authentication property="principal.memberVO" var="info"/>
							 		<sec:authorize access="isAuthenticated()">
									<c:forEach var="vo" items="${searchlist}">
									<c:if test="${info.deptNum==vo.deptNum}">	
										<tr>
										<td>${vo.docNum}</td>
										<td><a href="${vo.docNum}" class="move">${vo.title}</a></td>
										<td>${vo.state}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${vo.regDate}"/></td>
										<td>${vo.storage}</td>
										</tr>
									</c:if>	
									</c:forEach>
									</sec:authorize>
								</tbody>
                            </table>
                            	   
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
<form action="mainsearchlist" method="get" id="actionForm">
	<input type="hidden" name="type" value="${pageVO.cri.type}">
	<input type="hidden" name="keyword" value="${pageVO.cri.keyword}">
	<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum}">
	<input type="hidden" name="amount" value="${pageVO.cri.amount}">
</form>
<script src="/resources/js/od/mainlist.js"></script>
<%@include file="/WEB-INF/includes/od/footer.jsp" %>
=