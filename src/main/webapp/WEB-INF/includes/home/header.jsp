<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
<body >
    <div id="wrapper" >
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0; background-color:#ffffff">
            <div class="navbar-header" >
                <a class="navbar-brand" href="/" >
					<img src="/resources/img/SBP_Winds_logo_1.png" style="width: 130px;" alt="" />
				</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links"> 
                <sec:authorize access="isAuthenticated()">              
	                <li class="dropdown">
	                    <a class="dropdown-toggle" href="#" id="od">
	                        <i class="fa fa-folder fa-fw"></i> 전자 결제 시스템
	                    </a>
	                    <!-- /.dropdown-alerts -->
	                </li>
	                <li class="dropdown">
	                    <a class="dropdown-toggle" href="#" id="vacation">
	                        <i class="fa fa-tasks fa-fw"></i> 휴가관리
	                    </a>
	                    <!-- /.dropdown-alerts -->
	                </li>
	                <li class="dropdown">
	                   <a class="dropdown-toggle" href="#" id="board">
	                        <i class="fa fa-calendar fa-fw"></i> 커뮤니티
	                    </a>
	                    <!-- /.dropdown-alerts -->
	                </li>	     	                
                </sec:authorize>
                <sec:authorize access="!isAuthenticated()">
	                <li class="dropdown">
	                   <a class="dropdown-toggle" href="/board/">
	                        <i class="fa fa-calendar fa-fw"></i> 커뮤니티
	                    </a>
	                    <!-- /.dropdown-alerts -->
	                </li>	                
                </sec:authorize>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->
        </nav>
        <%-- 로그아웃을 클릭하면 전송할 폼 --%>
        <form action="/od/" method="post" id="odForm">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
        </form>
        <form action="/board/" method="post" id="boardForm">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
        </form>
        <form action="/vacation/" method="post" id="vacationForm">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
        </form>
       <!--  <div id="page-wrapper"> --><!-- 오류 발생 -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script>
        $(function(){
        	$("#board").click(function(e){
        		//a 태그 동작 막기
        		e.preventDefault();
        		
        		//form을 보낼때 csrf 값 포함해서 전송
       			$('#boardForm').submit();
        	})
        	$("#od").click(function(e){
        		//a 태그 동작 막기
        		e.preventDefault();
        		
        		//form을 보낼때 csrf 값 포함해서 전송
        		$('#odForm').submit();
        	})
        	$("#vacation").click(function(e){
        		//a 태그 동작 막기
        		e.preventDefault();
        		
        		//form을 보낼때 csrf 값 포함해서 전송
        		$('#vacationForm').submit();
        	})
        })
        </script>
        
        
        
        
        
        
        
        
        
        
        
        
        