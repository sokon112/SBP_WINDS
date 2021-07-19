<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="/WEB-INF/includes/board/header.jsp" %>

			<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">익명 게시판 글쓰기</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>            
            <div class="row">
                <div class="col-lg-12">
                	<div class="panel panel-default">
                        <div class="panel-heading">
                        	게시판 글쓰기
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                			<form action="" method="post" role="form">
                				<div class="form-group">
                					<label>제목</label>
                					<input class="form-control" name="title">                				
                				</div>  
                				<div class="form-group">
                					<label>내용</label>
                					<textarea class="form-control" rows="3" name="content"></textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>닉네임</label>
                					<input class="form-control" name="nickname">                				
                				</div> 
                				<div class="form-group">
                					<label>비밀번호</label>
                					<input class="form-control" name="password">                				
                				</div> 
                				<button type="submit" class="btn btn-default">올리기</button>              			
                				<button type="reset" class="btn btn-default">취소</button>              			
                			</form>
                		</div>
                	</div>
                </div>
            </div>  

<script src="/resources/js/register.js"></script> 
<%@include file="/WEB-INF/includes/board/footer.jsp" %>
