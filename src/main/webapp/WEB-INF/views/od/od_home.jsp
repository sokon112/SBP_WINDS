<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="/WEB-INF/includes/od/header.jsp" %>
<html>
<head>
	<title>Official Documents</title>
</head>
<body>
<div align="center">
	<h1>SBP Winds Official Documents</h1>
	<pre class="mt-5 mb-3 text-muted text-center"> 
Soldesk Big-Data Professional Winds
김석현 남광우 심태현 이채은 박다영 황다빈
	</pre>
</div>
<div class="mainlist">
	<button type="button" id="wait">미결문서 보관함</button>
	<button type="button" id="success">결재 완료 보관함</button>
	<button type="button" id="temp">임시 보관함</button>

	<div id="result">
		<table class="table">
			
		</table>
	</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
$(function(){
	$("#wait").click(function(){
		$.getJSON({
			url:'/mainwaitlist',
			contentType:'application/json;charset=utf-8',
			success:function(data){
				console.log(data);
				
				let str="";
				
				$.each(data,function(idx,element){
					str += "<tr>";
					str += "<td>"+element.docNum+"</td><td>"+element.title+"</td><td>"+element.send+"</td><td>"+element.state+"</td>";
					str += "</tr>";
				})
				
</script>



<%@include file="/WEB-INF/includes/od/footer.jsp" %>





