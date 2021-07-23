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
<form action="/vacation/vacationManagerConfirm">
<input type="text" id="yearMonth"  value="휴가심사" disabled>

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
							<fmt:formatDate pattern="yyyy-MM-dd"  value="${vacation.startterm}"/>

	                		<strong>~</strong>

							<fmt:formatDate pattern="yyyy-MM-dd"  value="${vacation.endterm}"/>
						</td>
	                <th>${vacation.reason}</th>
	                <td>
<%-- 	                <c:if test="${vacation.state eq '신청' }"> --%>
	                    <button type="button" id="successBtn" onclick="${vacation.vacationAppNum}" class="btn btn-primary">승인</button>
	                    <button type="button" id="rejectBtn"  class="btn btn-secondary">거절</button>
	                <%-- </c:if>
	                <c:if test="${vacation.state ne '신청' }">     --%>
	                    <input type="text" value="${vacation.state }" disabled>
	           <%--      </c:if>	 --%>
	                 </td>
	                 
	            </tr>
  			</c:forEach>          
        </tbody>
    </table>
</div>
    <button type='button' class="btn btn-info">닫기</button>
    </form>
    
<form action="vacationManagerCheckOne" method="get" id="actionForm">	
	
<%-- 댓글 작성 폼 --%>  
<div class="modal modifymodal" tabindex="-1" id="replyModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h5 class="modal-title">거절 사유</h5>
      </div>
      <div class="modal-body">
        <div class="form-group">
        	<label for="">vacationAppNum</label>
        	<input type="text" name="vacationAppNum" id="form-num" class="form-control form-num" value="신청서 번호" readonly="readonly"/>
        </div>
        <div class="form-group">
        	<label for="">거절사유</label>
        	<textarea name="rejectReason" class="form-control"  rows="" cols="">거절사유</textarea>
        	
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" id="modalRegisterBtn">등록</button>
        <button type="button"  class="btn btn-warning" id="cancelBtn" data-dismiss="modal" >취소</button>

      </div>
    </div>
  </div>
</div>
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