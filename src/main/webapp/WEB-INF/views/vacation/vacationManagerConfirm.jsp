<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/includes/vacation/header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <meta charset="utf-8">
<title>Insert title here</title>
<style>
th,td{
text-align:center;
width:15%;}
</style>
</head>
<body>
<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">휴가심사</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>            
            <div class="row">
                <div class="col-lg-12">
                	<div class="panel panel-default">
                        <div class="panel-heading">
                          
                        </div>
                        <!-- /.panel-heading -->


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
	        
	            <tr class="chat">
	                <td> 
							 	${vacation.vacationAppNum}
				 <input type="hidden" name="vacationNum" class="vacationAppNum" value="${vacation.vacationAppNum}">
	           				
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
 	                
		                
			                <button type="button" name="successBox" class="btn btn-primary">승인</button> 
			            	<button type="button" name="rejectBox"  class="btn btn-secondary">거절</button>
							<input type="hidden" class="rejectReason" name="resonBox" placeholder="거절 이유">
							<input type="hidden" name="resonBoxCheck" class="btn btn-danger" value="거절이유 작성완료">
							<input type="hidden" name="hiddenBox" class="hiddenBox" value="완료">
	                 </td>
	                 
	            </tr>
	            
  			</c:forEach>  
  
        </tbody>
        
    </table>
</div>
  			   <button type='button' class="btn btn-info pull-right">닫기</button>     
<!--     </form> -->
     </div>
                	</div>
                </div>   
<!-- <form action="vacationManagerCheckOne" method="get" id="actionForm">	
	

</form>  -->
<form action="" id="manageForm" method="post">
	<%-- 	<input type="hidden" name="id"  value="${vacation.id}"/> --%>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
<form action="" id=successRejectForm method="post">
	<%-- 	<input type="hidden" name="id"  value="${vacation.id}"/> --%>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
<script type="text/javascript">

var csrfHeaderName="${_csrf.headerName}";
var csrfTokenValue="${_csrf.token}";

</script>
<script src="/resources/js/vacation/vacationManagerConfirm.js"></script>
<%@include file="/WEB-INF/includes/vacation/footer.jsp" %>
</body>
</html>