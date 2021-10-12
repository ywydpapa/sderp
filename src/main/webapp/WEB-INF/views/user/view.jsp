<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top.jsp"/>

<div id="main_content">
	<script type="text/javascript">
	<c:if test="${userInfo.userId == sessionScope.userNo || sessionScope.userRole eq 'ADMIN'}">
		function fn_userUpdate() {
			var userData = {};
			userData.userId 		= $("#userId").val();
			userData.userPasswd 	= $("#userPasswd").val();
			userData.userName 		= $("#userName").val();
			userData.userRole 		= $("#userRole").val();
			userData.org_id 		= $("#userDept").val();
			$.ajax({ url: "${path}/user/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
						data: userData , // HTTP 요청과 함께 서버로 보낼 데이터
						method: "POST", // HTTP 요청 메소드(GET, POST 등)
						dataType: "json" // 서버에서 보내줄 데이터의 타입
					}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
					.done(function(data) {
						if(data.code == 10001){
							alert("저장 성공");
							var url = '${path}/user/list.do';
							location.href = url;
						}else{
							alert("저장 실패");
						}
					}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
					.fail(function(xhr, status, errorThrown) {
						alert("통신 실패");
					});
			}
	</c:if>
	</script>

	<!-- Page-header start 페이지 타이틀-->
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">
						사용자 수정
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Page-header end 페이지 타이틀 -->

	<div class="cnt_wr">
		<div class="row">
			<div class="col-sm-12">
				<div class="card-block table-border-style">
					<div class="table-responsive">
						<table class="table table-sm bst02">
							<colgroup>
								<col width="25%" />
								<col width="75%"/>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">아이디</th>
									<td>
										<input name="userId" id="userId" value="${userInfo.userId}" class="form-control form-control-sm" readonly>
									</td>
								</tr>
								<tr>
									<th scope="row">비밀번호</th>
									<td>
										<input type="password" name="userPasswd" id="userPasswd" value="" class="form-control form-control-sm" required>
									</td>
								</tr>
								<tr>
									<th scope="row">이름</th>
									<td>
										<input name="userName" id="userName"  value="${userInfo.userName}" class="form-control form-control-sm">
									</td>
								</tr>
								<tr>
									<th scope="row">사용자 권한</th>
									<td>
										<select name="userRole" id="userRole"  class="form-control form-control-sm">
										<option value="CUSER"<c:if test="${userInfo.userRole eq 'CUSER'}">selected</c:if> >일반사용자</option>
										<option value="PUSER"<c:if test="${userInfo.userRole eq 'PUSER'}">selected</c:if>>조직관리자</option>
										<option value="ADMIN"<c:if test="${userInfo.userRole eq 'ADMIN'}">selected</c:if>>시스템관리자</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>부서</td>
									<td><select class="form-control" name="userDept" id="userDept">
										<c:forEach var="listDept" items="${listDept}">
										<option value="${listDept.org_id}">${listDept.org_title}</option>
										</c:forEach>
										</select></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn_wr text-right mt-3">
						<button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/user/list.do'">목록</button>
						<c:if test="${userInfo.userNo == sessionScope.userNo || sessionScope.userRole eq 'ADMIN'}">
								<button class="btn btn-md btn-primary" onClick= "fn_userUpdate()">수정</button>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../body-bottom.jsp"/>