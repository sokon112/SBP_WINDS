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
	                <td>
								${vacation.vacationApplication.id}
						</td>
						<td>
								${vacation.vacationAppNum}
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
	                <th>${vacation.reason}</th>

	                <th>
	                </th>
	                <td>
	                <c:if test="${vacation.state eq '신청' }">
	                    <button type="button" class="btn btn-primary" onclick="">승인</button>
	                    <button type="button" class="btn btn-secondary">거절</button>
	                    </c:if>
	                <c:if test="${vacation.state ne '신청' }">    
	                    <input type="text" value="${vacation.state }" disabled>
	                    </c:if>	
	                 </td>
	                 
	            </tr>
  			</c:forEach>          
        </tbody>
    </table>
</div>
    <button type='button' onclick="location.href='vacationManager'">닫기</button>
    </form>
    
<form action="vacationManagerCheckOne" method="get" id="actionForm">	
	
<%-- 댓글 작성 폼 --%>  
<div class="modal" tabindex="-1" id="replyModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h5 class="modal-title">Reply</h5>
      </div>
      <div class="modal-body">
        <div class="form-group">
        	<label for="">댓글 내용</label>
        	<input type="text" name="reply" class="form-control" value="댓글내용"/>
        </div>
        <div class="form-group">
        	<label for="">작성자</label>
        	<input type="text" name="replyer" class="form-control" value="작성자"/>
        </div>
        <div class="form-group">
        	<label for="">작성일</label>
        	<input type="text" name="replyDate" class="form-control" value="작성일"/>
        </div>        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" id="modalRegisterBtn">등록</button>
        <button type="button" class="btn btn-warning" id="modalModifyBtn">수정</button>
        <button type="button" class="btn btn-danger" id="modalRemoveBtn">삭제</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="modalCloseBtn">종료</button>
      </div>
    </div>
  </div>
</div>
</form> 
    <script src="/resources/js/vacation/vacationManagerConfirm.js"></script>
</body>
</html>