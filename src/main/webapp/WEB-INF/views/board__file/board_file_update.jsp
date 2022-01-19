<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp" />
<jsp:include page="../body-top.jsp" />

<div class="content-page">
	<div class="content">

		<!-- Start Content-->
		<div class="container-fluid">
			<div>
				<h4 class="header-title mt-0 mb-3 title_bar">
					<span></span> 자료실 수정
				</h4>
			</div>
			<div class="row">

				<div class="col-xl-12">
					<div class="card-box">
						<div class="middle_searchform">
						
							<form action="${pageContext.request.contextPath}/board__file/board_file_update_action" method="POST"> <!-- enctype="multipart/form-data">-->
								<div class="form-group">
									<label for="userName">Title</label>
									<div class="form-group row" >
										<input type="text"  name="bf_Title"
											placeholder="제목을 입력해주세요." class="form-control"
											id="board_file_Title"
											value="${board_file_detail[0].bf_Title}">
									</div>
								</div>

								<div class="form-group">
									<blockquote>
										<blockquote>
											<label for="userName">Content</label>
										</blockquote>
									</blockquote>
									<textarea id="textarea" class="form-control"
										name="bf_Contents" maxlength="225" rows="8">${board_file_detail[0].bf_Contents}</textarea>
								</div>
								
								<!-- file 1 -->
								<!--<div class="form-group">
									<label for="userName">1. 파일첨부</label>
									<div class="custom-file">
										<input type="file" class="custom-file-input" id=q_file name="file1" value="">
											<label class="custom-file-label"></label>
									</div>

								</div>-->
								
								
								<!-- file 2 -->
								<!--<div class="form-group">
									<label for="userName">2. 파일첨부</label>
									<div class="custom-file">
										<input type="file" class="custom-file-input" id=q_file name="file2" value="">
											<label class="custom-file-label"></label>
									</div>

								</div>-->
								
								<div class="form-group text-center mb-0">
									<button class="btn btn-primary waves-effect waves-light mr-1"
										type="submit">등록</button>
									<button type="reset"
										class="btn btn-secondary waves-effect waves-light" onclick="location.href='${pageContext.request.contextPath}/board__file/board_file'">
										취소</button>
								</div>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
									<input type="hidden" name="bf_pk"
									value="${board_file_detail[0].bf_pk}" />
							</form>
						</div>
					</div>
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- container-fluid -->
	</div>
	<!-- content -->
<jsp:include page="../body-bottom.jsp" />
</body>
</html>