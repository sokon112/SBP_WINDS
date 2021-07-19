<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/includes/vacation/header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

<form action="">
    <button onclick="preMonth">왼쪽화살표</button>
    <input class="form-control" name="bno" readonly="readonly" value="<fmt:formatDate pattern='yyyy년 MM월'  value='${cri.nowMonth}'/>">
	
    <button onclick="nextMonth">오른쪽화살표</button>
    

   <div class="panel-body">
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
							${vacation.vacationApplication.id}
					</td>
					<td>
							${vacation.vacationApplication.name}
					</td>
					<td>
							${vacation.type}
					</td>
					<td>
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${vacation.startterm}"/>
						<strong>~</strong>
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${vacation.endterm}"/>
					</td>
					<td>${vacation.state}</td>
					<td>
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${vacation.applicationDate}"/>
					</td>
					<td>
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${vacation.approvalDate}"/>
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
    </div>
    <!-- start search -->
    <div class="row"> 

                            	<div class="col-md-12">
                            	  <div class="col-md-8"><!--search Form-->
                            		<form action="" id="searchForm">
                            			<select name="type" id="" class="form-control">
                            				<option value="">-----------</option>
                            				<option value="I" <c:out value="${cri.keyType=='I'?'selected':''}"/>>사원번호</option>
                            				<option value="T" <c:out value="${cri.keyType=='T'?'selected':''}"/>>분류</option>
                            			</select>
                            			<input type="text" name="keyword" value="${cri.keyword}" />
                            			<button type="button" class="btn btn-default">검색</button>
                            		</form>
                            	   </div>
                            	   <div class="col-md-2 col-md-offset-2">

								  </div>
                             	 </div>                             	 
                      		 </div><!-- end search -->
    
    <button type="button" class="btn btn-success" id="modalRegisterBtn" onclick="location.href='vacationManagerConfirm'">휴가심사(${cnt})</button>
 
   </form>
<!-- 페이지 나누기 추가 -->            
<form action="list" method="get" id="actionForm">	
	<input type="hidden" name="keyType" value="${cri.keyType}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" />

</form>      
   
   <script>
	let id = 4;
	

</script>
<script src="/resources/js/vacation/list.js"></script>
</body>
</html>