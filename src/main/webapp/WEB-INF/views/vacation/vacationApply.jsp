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
<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">휴가 신청서</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>            
            <div class="row">
                <div class="col-lg-12">
                	<div class="panel panel-default">
                        <div class="panel-heading">
                          휴가 신청서
                        </div>
<form action="/vacation/vacationApplyResult" method="post" role="form">
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
	                    	<input type="text" class="form-control" name="id" value="${info.username}" readonly="readonly">
	                    </td>
                    </tr>
                <tr>
               
                    <th>분류</th>
                    <td colspan="3">
                        <select name="type" class="form-control" >
                            <option value="none">=== 선택 ===</option>
                            <option value="half">반차</option>
                            <option value="monthly">월차</option>
                          </select>
                    </td>
                </tr>
                <tr>
                    <th>기간</th>
                    <td><input type="date" class="form-control" name="term" id="startDay"></td>
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
                    	</div>
                </div>
            </div> 
<!--     <script type="text/javascript">
    	let id=${vo.id}
    </script> -->
<%@include file="/WEB-INF/includes/vacation/footer.jsp" %>
</body>
</html>