<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="/WEB-INF/includes/board/header.jsp" %>

<div class="container-fluid" style="margin: 20px">
	<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">게시물 읽기</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>            
            <div class="row">
                <div class="col-lg-12">
                	<div class="panel panel-default">
                        <div class="panel-heading">
                           커뮤니티 > 동호회 > 게시물 읽기
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                			<form action="" role="form">
                				<div class="form-group">
                					<label>번호</label>
                					<input class="form-control" name="hno" readonly="readonly" value="${vo.hno}">                				
                				</div> 
                				<div class="form-group">
                					<label>제목</label>
                					<input class="form-control" name="htitle" readonly="readonly" value="${vo.htitle}">                				
                				</div>  
                				<div class="form-group">
                					<label>내용</label>
                					<textarea class="form-control" rows="3" name="hcontents" readonly="readonly">${vo.hcontents}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>작성자</label>
                					<input class="form-control" name="hwriter" readonly="readonly" value="${vo.hwriter}">                				
                				</div>  
                				<%-- 첨부파일 목록 보여주기 --%>
								<div class="row">
									<div class="col-lg-12">
										<div class="panel panel-default">
											<div class="panel-heading">
												<i class="fa fas fa-file"></i> Files
											</div>
											<div class="panel-body">				
												<div class="uploadResult">
													<ul></ul>
												</div>
											</div>			
										</div>
									</div>
								</div> 
								<div class="bigPictureWrapper">
									<div class="bigPicture"></div>
								</div> 
                				<%-- 로그인한 사용자와 작성자가 동일할 때 Modify 버튼 보여주기 --%>
						<sec:authentication property="principal" var="info" />
						<sec:authorize access="isAuthenticated()">
							<%-- 로그인 여부 확인 --%>
							<c:if test="${info.memberVO.id=='10030001'}">
								<%-- 로그인한 사용자와 작성자 동일여부 확인 --%>
								<button type="button" class="btn btn-info" id="addelete">삭제하기</button>
							</c:if>
						</sec:authorize>
						<button type="button" class="btn btn-info pull-right">목록</button>
						<button type="button" style="margin-right: 3px;" name="hobbydelete" class="btn btn-danger pull-right" id="hdeleteBtn">삭제</button>
						<button type="button" style="margin-right: 3px;" name="hmodify" class="btn btn-warning pull-right" id="hmodifyBtn">수정</button>

					</form>
				</div>
			</div>
		</div>
	


</div>
</div>
<!-- 수정 버튼 모달 추가 -->
<div class="modal hmodifymodal" tabindex="-1" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">게시글 수정</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<table class="table">
					<tr>
						<td>비밀번호 입력</td>
						<td><input class="form-control" id="inpassword" type="text" name="password"></td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" id="modalSubmit" class="btn btn-success">완료</button>
				<button type="button" id="modalcansle" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>

<!-- 삭제 버튼 모달 추가 -->
<div class="modal hdeletemodal" tabindex="-1" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">게시글 삭제</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<table class="table">
					<tr>
						<td>비밀번호 입력</td>
						<td><input class="form-control" id="delpassword" type="text" name="epassword"></td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" id="hmodalSubmit" class="btn btn-success">완료</button>
				<button type="button" id="hmodalcansle" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div> 
<%-- 페이지 나누기를 위해 필요한 값 --%>
<form action="" id="operForm">
	<input type="hidden" name="type" value="${cri.type}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" />
	<input type="hidden" name="pageNum" value="${cri.pageNum}" />
	<input type="hidden" name="amount" value="${cri.amount}" />	
	<input type="hidden" name="hno"  value="${vo.hno}"/>
	<input type="hidden" name="htitle" value="${vo.htitle}" />
	<input type="hidden" name="hcontents" value="${vo.hcontents}" />
	<input type="hidden" name="hwriter" value="${vo.hwriter}" />
	<input type="hidden" name="hpassword" value="" />
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
</form>
<script>
	let hno = ${vo.hno};
	
	
	
	var csrfHeaderName="${_csrf.headerName}";
	var csrfTokenValue="${_csrf.token}";
	
	
</script>
<script src="/resources/js/board/hobby/hread.js"></script>
<script src="/resources/js/board/hobby/hreply.js"></script>
<%@include file="/WEB-INF/includes/board/footer.jsp" %>
