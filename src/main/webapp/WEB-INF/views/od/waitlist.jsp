<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../../includes/od/header.jsp" %>

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

.move{
white-space:normal;
display:-webkit-box; 
-webkit-line-clamp:1; 
-webkit-box-orient:vertical; 
overflow:hidden;
}

</style>
    		<div class="container-fluid">
    		<div class="col-sm-3 col-md-2 sidebar">
		        	<ul class="nav nav-sidebar">
		            	<li><a href='waitlist'>미결문서 보관함</a></li>
		            	<li><a href='completelist'>결재완료 보관함</a></li>
		            	<li><a href='templist'>임시보관함</a></li>
		          	</ul>
		        </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <h1 class="page-header">미결 문서 보관함</h1>
                </div>
                <div class="row"> <!-- start search -->
                				
                            	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                            	  <div class="col-xs-13"><!--search Form-->
                            		<form action="" id="searchForm">
                            		<div class="col-md-7"></div>
                            		<div class="col-md-2">
                            			<select name="type" id="" class="form-control">
                            				<option value="">-----------</option>
                            				<option value="T" <c:out value="${pageVO.cri.type=='T'?'selected':''}"/>>제목</option>
                            				<option value="U" <c:out value="${pageVO.cri.type=='U'?'selected':''}"/>>송신자</option>
                            			</select>
                            		</div>	
                            			<input type="text" name="keyword" value="${pageVO.cri.keyword}" />
                            			<!-- 검색시에도 페이지당 게시물 수와 현재 페이지에 대한 정보가 따라가야 함 -->
                            			<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum}"/>
                            			<input type="hidden" name="amount" value="${pageVO.cri.amount}" />
                            			<button type="button" class="btn btn-default">검색</button>
                            		</form>
                            	</div>
                            </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="container-fluid" style="margin-top:20px">
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" >
                   <div class="panel panel-default">
                   
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>공문번호</th>
                                        <th>공문제목</th>
                                        <th>처리단계</th>
                                        <th>송신부서</th>
                                        <th>송신자명</th>
                                        <th>작성일</th>
                                        <th>만료기한</th>
                                    </tr>									
                                </thead>
								<tbody>
							 	<sec:authorize access="isAuthenticated()">
								<c:forEach var="vo" items="${waitlist}">
									<tr>
										<td>${vo.docNum}</td>
										<td><a href="${vo.docNum}" class="move">${vo.title}</a></td>
										<td>${vo.state}</td>
										<td>${vo.deptName}</td>
										<td>${vo.name}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${vo.regDate}"/></td>
										<td>${vo.retentDate} 년</td>
									</tr>
								</c:forEach>
								</sec:authorize>								
								</tbody>
                            </table>
                            <div class="col-md-2">
                            	   	<!--페이지 목록 갯수 지정하는 폼-->
                            	   	<select name="" id="amount" class="form-control">
                            	   		<option value="10"  <c:out value="${pageVO.cri.amount==10?'selected':''}"/>>10</option>
                            	   		<option value="20"  <c:out value="${pageVO.cri.amount==20?'selected':''}"/>>20</option>
                            	   		<option value="30"  <c:out value="${pageVO.cri.amount==30?'selected':''}"/>>30</option>
                            	   		<option value="40"  <c:out value="${pageVO.cri.amount==40?'selected':''}"/>>40</option>
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
                               
            <!-- /.row -->
<!-- 페이지 나누기 추가 -->            
<form action="waitlist" method="get" id="actionForm">	
	<input type="hidden" name="type" value="${pageVO.cri.type}" />
	<input type="hidden" name="keyword" value="${pageVO.cri.keyword}" />
	<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum}" />
	<input type="hidden" name="amount" value="${pageVO.cri.amount}" />	
</form>            
          
<!-- 모달 추가 -->
<div class="modal" tabindex="-1" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">게시글 등록</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>처리가 완료되었습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>        
      </div>
    </div>
  </div>
</div>
<!-- 스크립트 -->
<script>
	let result='${result}';
</script>
<script src="/resources/js/od/storagelist.js"></script>
<%@include file="../../includes/od/footer.jsp" %>      
