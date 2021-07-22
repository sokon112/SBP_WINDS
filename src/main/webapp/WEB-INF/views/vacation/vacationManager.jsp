
<%@page import="com.spring.vacation.domain.VacationCriteria"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/includes/vacation/header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
    <meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">휴가신청관리</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        
                        <!-- /.panel-heading -->
                        <div class="panel-body">
    <button type="button" class="glyphicon glyphicon-arrow-left" onclick="preMonth()">왼쪽화살표</button>
    <input class="form-control" name="bno" readonly="readonly" value="<fmt:formatDate pattern='yyyy년 MM월'  value='${VacationPageVO.cri.nowMonth}'/>">
	
    <button class="glyphicon glyphicon-arrow-right" onclick="nextMonth">오른쪽화살표</button>

        <table class="table table-striped table-bordered table-hover">
        <thead>
	        <tr>
	            <th>신청서번호</th>
	            <th>사원번호</th>
	            <th>이름</th>
	            <th>분류</th>
	            <th>기간</th>
	            <th>상태</th>
	            <th>신청날짜</th>
	            <th>승인날짜</th>
            </tr>
        </thead>
        <tbody>
           <c:forEach var="vacation" items="${list}">
				<tr>
					<td>
							${vacation.vacationAppNum}
					</td>
					<td>
							${vacation.id}
					</td>
					<td>
							${vacation.vacationApplication.name}
					</td>
					<td>
							${vacation.type}
					</td>
					<td>
						<fmt:formatDate pattern="yyyy-MM-dd"  value="${vacation.startterm}"/>
						<strong>~</strong>
						<fmt:formatDate pattern="yyyy-MM-dd"  value="${vacation.endterm}"/>
					</td>
					<td>${vacation.state}</td>
					<td>
						<fmt:formatDate pattern="yyyy-MM-dd"  value="${vacation.applicationDate}"/>
					</td>
					<td>
						<fmt:formatDate pattern="yyyy-MM-dd"  value="${vacation.approvalDate}"/>
					</td>
					<td>
					
						<a href="${vacation.vacationAppNum}" class="move">
							확인
						</a> 
					</td>
				</tr>
			</c:forEach>
        </tbody>
    </table>


    <div class="row"> <!-- start search -->
                            	<div class="col-md-12">
                            	  <div class="col-md-8"><!--search Form-->
                            		<form action="" id="searchForm" method="post">
                            			<select name="keyType" id="" class="form-control">
                            				<option value="">-----------</option>
                            				<option value="I" <c:out value="${VacationPageVO.cri.keyType=='I'?'selected':''}"/>>사원번호</option>
                            				<option value="T" <c:out value="${VacationPageVO.cri.keyType=='T'?'selected':''}"/>>분류</option>
                            				<option value="IT" <c:out value="${VacationPageVO.cri.keyType=='IT'?'selected':''}"/>>사원번호 or 분류</option>
                            			</select>
                            			<input type="text" name="keyword" value="${VacationPageVO.cri.keyword}" />
                            			<!-- 검색시에도 페이지당 게시물 수와 현재 페이지에 대한 정보가 따라가야 함 -->
                            			<input type="hidden" name="pageNum" value="${VacationPageVO.cri.pageNum}"/>
                            			<input type="hidden" name="amount" value="${VacationPageVO.cri.amount}" />
                            			<button type="button" class="btn btn-default">검색</button>
                            		</form>
                            	   </div>
                            	   <div class="col-md-2 col-md-offset-2">
                            	   	<!--페이지 목록 갯수 지정하는 폼-->
                            	   	<select name="" id="amount" class="form-control" method="post">
                            	   		<option value="10"  <c:out value="${VacationPageVO.cri.amount==10?'selected':''}"/> >10</option>
                            	   		<option value="20"  <c:out value="${VacationPageVO.cri.amount==20?'selected':''}"/>>20</option>
                            	   		<option value="30"  <c:out value="${VacationPageVO.cri.amount==30?'selected':''}"/>>30</option>
                            	   		<option value="40"  <c:out value="${VacationPageVO.cri.amount==40?'selected':''}"/>>40</option>
                            	   	</select>
								  </div>
                             	 </div>                             	 
                      		 </div><!-- end search -->
                      		     
    <button type="button" class="btn btn-success" id="modalRegisterBtn" onclick="location.href='vacationManagerConfirm'">휴가심사(${cnt})</button>
<!-- start Pagination -->
                            <div class="text-center">
                            	<ul class="pagination">
                            		<c:if test="${VacationPageVO.prev}">
                            			<li class="paginate_button previous"><a href="${VacationPageVO.startPage-1}">Previous</a></li>
                 					</c:if>          		
                            		
                            		<c:forEach var="idx" begin="${VacationPageVO.startPage}" end="${VacationPageVO.endPage}">
                            			<li class="paginate_button ${VacationPageVO.cri.pageNum==idx?'active':''}">
                            				<a href="${idx}">${idx}</a>
                            			</li>
                            		</c:forEach>
                            		
                            		<c:if test="${VacationPageVO.next}">
                            			<li class="paginate_button next"><a href="${VacationPageVO.endPage+1}">Next</a></li>
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
<!-- 페이지 나누기 추가 -->            
<form action="vacationManager" method="post" id="actionForm">	
	<input type="hidden" name="keyType" value="${VacationPageVO.cri.keyType}" />
	<input type="hidden" name="keyword" value="${VacationPageVO.cri.keyword}" />
	<input type="hidden" name="pageNum" value="${VacationPageVO.cri.pageNum}" />
	<input type="hidden" name="amount" value="${VacationPageVO.cri.amount}" />
<%-- 	<input type="hidden" name="nowMonth" value="${VacationPageVO.cri.nowMonth}" /> --%>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>      
<form action="" id="checkPageForm" method="post">
	<%-- 	<input type="hidden" name="id"  value="${vacation.id}"/> --%>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
<script>

	//let id='${vacation.id}';

</script>
<script src="/resources/js/vacation/vacationManager.js"></script>
<%@include file="/WEB-INF/includes/vacation/footer.jsp" %>
</body>
</html>