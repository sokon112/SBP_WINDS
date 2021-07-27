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
<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">휴가신청서</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>            
            <div class="row">
                <div class="col-lg-12">
                	<div class="panel panel-default">
                        <div class="panel-heading">
                           Board Read Page
                        </div>
                        <!-- /.panel-heading -->
<form action="/vacation/vacationManagerConfirm">
<input type="text" id="yearMonth" class="form-control" name="bno" readonly="readonly"  value="휴가심사" disabled>

<div class="panel-body">
        <table class="table table-striped table-bordered table-hover">
        <thead>
        <tr>
            <th>신청서번호</th>
            <th>사원번호</th>
            <th>이름</th>
            <th>분류</th>
            <th>기간</th>
            <th>사유</th>
            <th>상태</th>
            </tr>
        </thead>
        <tbody>
	        <c:forEach var="vacation" items="${list}">
	        
	            <tr>
	                <td><input type="hidden" id="vacationNum" value="${vacation.vacationAppNum}"> 
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
					<fmt:formatDate pattern="yyyy-MM-dd"  value="${vacation.term}"/>

			</td>
	                <th>${vacation.reason}</th>
	                <td>
	                <c:if test="${vacation.state eq '신청' }">
	                    <button type="button" id="successBtn" onclick="${vacation.vacationAppNum}" class="btn btn-primary">승인</button>
	                    <!-- <button type="button" id="rejectBtn" data-toggle='modal' data-target="#modifyModal" class="btn btn-secondary">거절</button> -->
	                    <button type="button" id="rejectBtn" onclick="${vacation.vacationAppNum}+'/no'" class="btn btn-secondary">거절</button>
	                </c:if>
	           <c:if test="${vacation.state ne '신청' }">
	                  <input type="text" value="${vacation.state }" disabled>
	           </c:if>	 

	           <input type="hidden" id="rejectReason" placeholder="거절 이유">

	                 </td>
	                 
	            </tr>
	            
  			</c:forEach>        
        </tbody>
    </table>
</div>
    <button type='button' class="btn btn-info">닫기</button>
    </form>
     </div>
                	</div>
                </div>   
<form action="vacationManagerCheckOne" method="get" id="actionForm">	
	

</form> 
<form action="" id="manageForm" method="post">
	<%-- 	<input type="hidden" name="id"  value="${vacation.id}"/> --%>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>

 <script src="/resources/js/vacation/vacationFunction.js"></script>
    <script src="/resources/js/vacation/vacationManagerConfirm.js"></script>
    <%@include file="/WEB-INF/includes/vacation/footer.jsp" %>
</body>
</html>