<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    <%@include file="/WEB-INF/includes/vacation/header.jsp" %>

<html>
<head>
    <meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<form action="/vacationApplyResult" method="post" role="form">
        <div class="panel-body">
        <table class="table table-striped table-bordered table-hover">
            <thead>
           	 <tr>
                <th colspan="3">휴가신청서</th>
                </tr> 
            </thead>
            <tbody>
                <tr>
                	<tr>
	                    <th>사원번호</th>
	                    <td colspan="3">
<sec:authentication property="principal" var="info"/>
                				
	                    	<input type="text" name="id" readonly="readonly" value="${info.id }">
	                    </td>
                    </tr>
                <tr>
               
                    <th>분류</th>
                    <td colspan="3">
                        <select name="type" >
                            <option value="none">=== 선택 ===</option>
                            <option value="annual">연차</option>
                            <option value="공가">공가</option>
                            <option value="병가">병가</option>
                            <option value="보상">보상</option>
                          </select>
                    </td>
                </tr>
                <tr>
                    <th>기간</th>
                    <td><input type="date" name="startterm" id="startDay"></td>
                    <td>~</td>
                    <td><input type="date" name="endterm" id="endDay"></td>
                </tr>

                <tr>
                    <th>사유</th>
                    <td colspan="3">
                    	<textarea class="form-control" rows="3" name="reason"></textarea> 
                    </td>
                </tr>
            </tbody>
        </table>
        </div>
        <%-- spring security 추가 --%>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <button type="submit" class="btn btn-success" id="modalRegisterBtn">신청</button>
    </form>
<!--     <script type="text/javascript">
    	let id=${vo.id}
    </script> -->
<%@include file="/WEB-INF/includes/vacation/footer.jsp" %>
</body>
</html>