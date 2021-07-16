<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../../includes/od/header.jsp"%>
<link rel="stylesheet" href="/resources/dist/css/attach.css" />
<div class="center">
	<div class="col-lg-12">
		<h1 class="page-header">공문 수정</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"></div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form action="" method="post" role="form">
					<!-- 상신 Modal -->
					<div class="modal fade" id="modal1" data-backdrop="static"
						tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="staticBackdropLabel">상신</h5>
								</div>
								<p></p>
								<div class="modal-body">
									<div class="btn-group" data-toggle="buttons">
										<label class="btn btn-info"> 
										<input type="checkbox" autocomplete="off" name="state" value="미결"> 상신
										</label> 
										<label class="btn btn-primary"> 
										<input type="checkbox" autocomplete="off" name="state" value="결재완료"> 결재
										</label> 
										<label class="btn btn-danger"> 
										<input type="checkbox" autocomplete="off" name="state" value="반려"> 반려
										</label>
									</div>
									<form>
										<div class="form-group">
										<p></p>
											<label for="recipient-name" class="control-label">공문
												제목:</label> <input type="text" class="form-control"
												id="recipient-name" readonly="readonly" value="${vo.title}">
										</div>
										<div class="form-group">
											<label for="recipient-name" class="control-label">첨부파일
												리스트:</label> <input type="text" class="form-control"
												id="recipient-name" readonly="readonly"
												value="${vo.attachFile}">
										</div>
										<div class="form-group">
											<label for="message-text" class="control-label">의견:</label>
											<textarea class="form-control" id="message" name="message"></textarea>
										</div>
									</form>
								</div>
								<div class="modal-footer">
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
									<label class="input-group-text" for="reviewer">검토자</label>
									<select class="form-select" id="reviewer" name="review">
										<option selected>검토자 선택</option>
										<option value="18081354">한소희(인사팀)</option>
										<option value="17071235">채수빈(재무팀)</option>
										<option value="16114567">배수지(홍보팀)</option>
									</select>
									<p></p>
									<label class="input-group-text" for="destination">결재자</label>
									<select class="form-select" id="destination" name="dest">
										<option selected>결재자 선택</option>
										<option value="98074561">고길동(인사팀)</option>
										<option value="99774852">신형만(재무팀)</option>
										<option value="00894187">봉미선(홍보팀)</option>
									</select>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary">저장</button>
								</div>
							</div>
						</div>
					</div>
					<sec:authentication property="principal" var="info"/>
                				<sec:authorize access="isAuthenticated()"><%--로그인 여부 확인--%>
									<c:if test="${info.id==vo.send}"><%--로그인한 사용자와 작성자가 동일여부 확인 --%>
                						<button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal1">상신</button>
										<button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal2">결재선</button>
										<button type="submit" class="btn btn-info">임시저장</button>
										<button type="submit" class="btn btn-info">삭제</button>
                					</c:if>
                				</sec:authorize>
					
                	             			
					<button type="reset" class="btn btn-info">취소</button>
					<p></p>
					<div class="col-sm-4">
						<label class="form-label">공문번호</label> <input class="form-control"
							name="docNum" readonly="readonly" value="${vo.docNum}"> <label
							class="form-label">작성일자</label> <input class="form-control"
							name="regDate" readonly="readonly" value="${vo.regDate}">
						<p></p>
						<label class="input-group-text" for="inputGroupSelect01">보존기한</label>
						<p></p>
						<select class="form-select" id="inputGroupSelect01"
							name="retentDate">
							<option selected>보존기한을 선택하세요</option>
							<option value="1">1년</option>
							<option value="2">2년</option>
							<option value="3">3년</option>
						</select>
						<p></p>
					</div>

					<div class="col-sm-4">
						<label class="form-label">작성자</label> 
						<input class="form-control" name="send" readonly="readonly" value="${vo.send}">
					</div>
					<div class="col-sm-4">
						<label class="form-label">수신자</label> 
						<input class="form-control" name="dest" readonly="readonly" value="${vo.dest}">
					</div>
					<p></p>
					<div class="col-md-6">
						<label class="form-label">공문제목</label> 
						<input class="form-control" name="title">
					</div>
					<div class="col-md-12">
						<label>내용</label>
						<textarea class="form-control" rows="20" name="contents"></textarea>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">File 첨부</div>
			<div class="panel-body">
				<div class="form-group uploadDiv">
					<input type="file" name="uploadFile" multiple />
				</div>
				<div class="uploadResult">
					<ul></ul>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="/resources/js/modify.js"></script>
<%@include file="../../includes/od/footer.jsp"%>


















