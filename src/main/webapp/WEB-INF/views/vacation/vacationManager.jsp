
<%@page import="com.spring.vacation.domain.VacationCriteria"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/includes/vacation/header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
	<head>
		<style>
			th,td{
				text-align:center;
				width:10%;
			}
			#amount {
				margin-bottom:10px;
				width:65px;
				position:sticky;
				left:200%;
			}
			h3{
				margin-top:1px;
			}
			.glyphicon{
				background: 0;
				border: 0;
				padding: 0;
				cursor: pointer
			}
		</style>
	    <meta charset="utf-8">
	<title>Insert title here</title>
	</head>
	<body>
		<div class="container-fluid" style="margin:20px">
			<div class="row">
		        <div class="col-lg-12">
		        	<h1 class="page-header">휴가신청관리</h1>
		        </div>
		        <!-- /.col-lg-12 -->
	        </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default"><!-- /.panel-heading -->
                        <div class="panel-body">
				  			<div class="selectMonth">
								<div class="col-md-4">
									<div></div>
									<button type="button" class="glyphicon glyphicon-arrow-left pull-right btn-lg" ></button>
								</div>
								<div class="col-md-4">
									<h3 align="center">
										<fmt:formatDate pattern='yyyy년 MM월'  value='${VacationPageVO.cri.nowMonth}'/>
									</h3>
									<input type="hidden" class="form-control" name="month" readonly="readonly" value="<fmt:formatDate pattern='yyyy년 MM월'  value='${VacationPageVO.cri.nowMonth}'/>"> 
									<input type="hidden" class="form-control11" name="nmonth" readonly="readonly" value="<fmt:formatDate pattern='yyyy년 MM월'  value='${VacationPageVO.cri.nextMonth}'/>">
								</div>
								<div class="col-md-4">
									<div></div>
									<button type="button" class="glyphicon glyphicon-arrow-right pull-left btn-lg" ></button>
								</div>
							</div>
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
							            <th>확인</th>
						            </tr>
						        </thead>
						        <tbody>
						           <c:forEach var="vacation" items="${list}">
										<tr>
											<td>${vacation.vacationAppNum}</td>
											<td>${vacation.id}</td>
											<td>${vacation.vacationApplication.name}</td>
											<td>${vacation.type}</td>
											<td>
												<fmt:formatDate pattern="yyyy-MM-dd"  value="${vacation.startterm}"/>
												<c:if test="${vacation.type eq '월차'}">
													~
													<fmt:formatDate pattern="yyyy-MM-dd"  value="${vacation.endterm}"/>
												</c:if>
											</td>
											<td>${vacation.state}</td>
											<td>
												<fmt:formatDate pattern="yyyy-MM-dd"  value="${vacation.applicationDate}"/>
											</td>
											<td>
												<fmt:formatDate pattern="yyyy-MM-dd"  value="${vacation.approvalDate}"/>
											</td>
											<td>
												<a href="${vacation.vacationAppNum}" class="move">확인</a> 
											</td>
										</tr>
									</c:forEach>
						        </tbody>
						    </table>
							<div class="row"><!-- start search -->
								<div class="col-md-12">
									<div class="col-md-8"><!--search Form-->
					                    <form action="" id="searchForm" method="post">
						                	<div class="col-md-2">
					                            <select name="keyType" id="" class="form-control">
					                            	<option value="">-----------</option>
					                            	<option value="I" <c:out value="${VacationPageVO.cri.keyType=='I'?'selected':''}"/>>사원번호</option>
					                            	<option value="T" <c:out value="${VacationPageVO.cri.keyType=='T'?'selected':''}"/>>분류</option>	
					                            </select>
					                        </div>
					                        <input type="text" name="keyword" value="${VacationPageVO.cri.keyword}" />
					                        <!-- 검색시에도 페이지당 게시물 수와 현재 페이지에 대한 정보가 따라가야 함 -->
					                        <input type="hidden" name="pageNum" value="${VacationPageVO.cri.pageNum}"/>
					                        <input type="hidden" name="amount" value="${VacationPageVO.cri.amount}" />
					                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					                        <button type="submit" class="btn btn-default selectBtn">검색</button>
				                        </form>
									</div>
				                    <div class="col-md-4"></div>
										<div class="col-md-1 col-md-offset-3">
						                <!--페이지 목록 갯수 지정하는 폼-->
						                    <select name="" id="amount" class="form-control">
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
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form> 
				<form action="" method="post" id="monthManager">
					<input type="hidden" name="keyType" value="${VacationPageVO.cri.keyType}" />
					<input type="hidden" name="keyword" value="${VacationPageVO.cri.keyword}" />
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>      
				<form action="" id="checkPageForm" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
			</div>
			<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="/resources/js/vacation/vacationManager.js"></script>
	<%@include file="/WEB-INF/includes/vacation/footer.jsp" %>
	<% response.setHeader("Cache-Control","no-store"); response.setHeader("Pragma","no-cache"); response.setDateHeader("Expires",0); if (request.getProtocol().equals("HTTP/1.1")) response.setHeader("Cache-Control", "no-cache"); %>
	</body>
</html>