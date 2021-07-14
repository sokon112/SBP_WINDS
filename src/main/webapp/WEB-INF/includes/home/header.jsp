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
<body>
    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <a class="navbar-brand" href="/" >
					<img src="/resources/img/SBP_Winds_logo.png" class="img-thumbnail test" style="margin-top: 0; width: 150px;" alt="" />
				</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-center">               
                <li class="dropdown">
                    <a class="dropdown-toggle" href="/od/">
                        <i class="fa fa-envelope fa-fw"></i> ERD 시스템
                    </a>
                    <!-- /.dropdown-alerts -->
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" href="/board/">
                        <i class="fa fa-comment fa-fw"></i> 커뮤니티
                    </a>
                    <!-- /.dropdown-alerts -->
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" href="/vacation/">
                        <i class="fa fa-tasks fa-fw"></i> 휴가신청
                    </a>
                    <!-- /.dropdown-alerts -->
                </li>
                <li class="dropdown navbar-right">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>로그인 <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li>
                        	<a href="#"><i class="fa fa-sign-in fa-fw"></i> Login</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->
        </nav>
        <%-- 로그아웃을 클릭하면 전송할 폼 --%>
        <form action="#" method="post" id="logoutForm">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
        </form>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        
        
        
        
        
        
        
        
        
        
        
        
        