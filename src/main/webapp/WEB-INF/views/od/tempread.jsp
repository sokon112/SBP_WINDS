<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../../includes/od/header.jsp"%>
<link rel="stylesheet" href="/resources/dist/css/attach.css" />
<div class="center">
	<div class="col-lg-12">
		<h1 class="page-header">임시 저장 공문 보기</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<form action="" method="post" role="form">
					<!-- 상신 Modal -->
					<div class="modal fade" id="modal1" data-backdrop="static"
						tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="staticBackdropLabel"></h5>
								</div>
								<p></p>
								<div class="modal-body">
									<div>
										<div class="form-group">
										<p></p>
											<label for="odtitle" class="control-label">공문
												제목:</label> <input type="text" class="form-control"
												id="modaltitle" value="${vo.title}" readonly="readonly">
										</div>
										<div class="form-group">
											<label for="attachfilelist" class="control-label">첨부파일
												리스트:</label> <input type="text" class="form-control"
												id="modalattach" readonly="readonly">
										</div>
										<div class="form-group">
											<label for="message-text" class="control-label">의견:</label>
											<textarea class="form-control" id="message" name="message"></textarea>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">										
									<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
									<button type="submit" class="btn btn-primary">상신</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 결재선 Modal -->
					<div class="modal fade" id="modal2" data-backdrop="static"
						tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="staticBackdrop">결재선 지정</h5>
								</div>
								<div class="modal-body">
									<label class="input-group-text" for="dest">결재자</label>
									<select class="form-select" id="dest">
										<option selected>결재자 선택</option>
										<option value="10030001">이사장</option>
									</select>
									<p></p>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary" id="selectDest">저장</button>
								</div>
							</div>
						</div>
					</div>
					<sec:authentication property="principal.memberVO" var="info"/>
                				<sec:authorize access="isAuthenticated()"><%--로그인 여부 확인--%>
									<c:if test="${info.id==vo.send}"><%--로그인한 사용자와 작성자가 동일여부 확인 --%>
										<button type="submit" class="btn btn-info">수정</button>
										<button type="submit" class="btn btn-info">삭제</button>
                					</c:if>
                					<c:if test="${info.id==vo.dest}">
                						<button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal1">상신</button>
										<button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal2">결재선</button>
                					</c:if>
                				</sec:authorize>	
					<button type="reset" class="btn btn-info" onclick="location.href='/od/'">취소</button>
					<p></p>
					<div class="col-sm-4">
						<label class="form-label">공문번호</label> <input class="form-control"
							name="docNum" readonly="readonly" value="${vo.docNum}"> <label
							class="form-label">작성일자</label> <input class="form-control"
							name="regDate" readonly="readonly" value="${vo.regDate}">
						<p></p>
						<label class="input-group-text" for="inputGroupSelect01">보존기한</label>
						<p></p>
						<input class="form-control" name="retentdate" readonly="readonly" value="${vo.retentDate}">
						<p></p>
					</div>

					<div class="col-sm-4">
						<label class="form-label">작성자</label> 
						<input class="form-control" name="send" readonly="readonly" value="${vo.send}">
					</div>
					<div class="col-sm-4">
						<label class="form-label">수신자</label> 
						<input class="form-control" name="dest" readonly="readonly" value="${vo.dest}" id="destinput">
					</div>
					<p></p>
					<div class="col-md-6">
						<label class="form-label">공문제목</label> 
						<input class="form-control" name="title" readonly="readonly" value="${vo.title}">
					</div>
					<div class="col-md-12">
						<label>내용</label>
						<textarea class="form-control" rows="20" name="contents" readonly="readonly" value="${vo.contents}"></textarea>
					</div>
				</form>
			</div>
		</div>
	</div>
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
<form action="" id="operForm">
	<input type="hidden" name="type" value="${cri.type}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" />
	<input type="hidden" name="pageNum" value="${cri.pageNum}" />
	<input type="hidden" name="amount" value="${cri.amount}" />	
	<input type="hidden" name="docNum"  value="${vo.docNum}"/>
</form>       
<script>
	let docNum = ${vo.docNum};
	
	var csrfHeaderName="${_csrf.parameterName}";
	var csrfTokenValue="${_csrf.token}";
</script>
<script src="/resources/js/od/read.js"></script>
<%@include file="../../includes/od/footer.jsp"%>


















