<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>SBP Winds</title>
    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
   <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet"> 
    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">   
</head>
<body>
<sec:authentication property="principal" var="info"/>
<sec:authentication property="principal.memberVO" var="authinfo"/>
                        <c:forEach items="${authinfo.authority}" var="auth">
                               <c:set var="userauth" value="${auth.authority}"/>
                            </c:forEach>
                        
    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0; background-color:#ffffff">
            <div class="navbar-header" >
                <a class="navbar-brand" href="/" >
					<img src="/resources/img/SBP_Winds_logo_1.png" style="width: 130px;" alt="" />
				</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-center">
                <li class="dropdown">
                    <a class="dropdown-toggle move-page" href="#" id="vacationList">
                        <i class="fa fa-tasks fa-fw"></i>휴가 목록
                    </a>
                    
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->               
                <li class="dropdown">
                    <a class="dropdown-toggle move-page" href="#"id="vacationApplication">
                        <i class="fa fa-comment fa-fw"></i> 휴가 신청
                    </a>
                    <!-- /.dropdown-alerts -->
                </li>
                <!-- /.dropdown -->
                
                
                <c:if test="${userauth=='ad'}">
                <li class="dropdown">
                    <a class="dropdown-toggle move-page" href="#" id="vacationManager">
                        <i class="fa fa-tasks fa-fw"></i>휴가 신청 관리
                    </a>
                    <!-- /.dropdown-user -->
                </li>
                </c:if>
                
                <!-- /.dropdown -->
                <sec:authorize access="isAuthenticated()">
                <li class="dropdown navbar-right" style="margin-right: 10px;">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#" id="logout">
						Logout<i class="fa fa-sign-out fa-fw"></i>
					</a>				
                    <!-- /.dropdown-user -->
                </li>   
				<li class="navbar-right">
                <a>${info.memberVO.deptName} ${info.memberVO.name}</a>
                </li>
                
                </sec:authorize>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->
        </nav>
    </div>
        <%-- 로그아웃을 클릭하면 전송할 폼 --%>
        <form action="/logout" method="post" id="logoutForm">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
        </form>
 		<form action="/vacation/vacationUserList" method="post" id="vacactionListForm">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
        	<input type="hidden" name="id" value="${info.username}"/>
        </form>
        <form action="/vacation/vacationApply" method="post" id="vacationAppliForm">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
        </form>
        <form action="/vacation/vacationManager" method="post" id="vacationManagerForm">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
        </form>
       <!--  <div id="page-wrapper"> --><!-- 오류 발생 -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script>
        //let id='${info.username}';
        $(function(){
        	$("#logout").click(function(e){
        		//a 태그 동작 막기
        		e.preventDefault();
        		
        		//form을 보낼때 csrf 값 포함해서 전송
        		$('#logoutForm').submit();
        	})
        	$("#vacationList").click(function(e){
        		//a 태그 동작 막기
        		e.preventDefault();
        		
        		//form을 보낼때 csrf 값 포함해서 전송
       			$('#vacactionListForm').submit();
        	})
        	$("#vacationApplication").click(function(e){
        		//a 태그 동작 막기
        		e.preventDefault();
        		
        		//form을 보낼때 csrf 값 포함해서 전송
        		$('#vacationAppliForm').submit();
        	})
        	$("#vacationManager").click(function(e){
        		//a 태그 동작 막기
        		e.preventDefault();
        		
        		//form을 보낼때 csrf 값 포함해서 전송
        		$('#vacationManagerForm').submit();
        	})
        })
        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        
        
        
        
        
        
        
        
        
        
        
        
        