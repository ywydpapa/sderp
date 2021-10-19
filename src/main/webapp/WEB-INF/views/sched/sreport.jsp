<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top.jsp"/>

<div id="main_content">
			<div class="page-header2">
				<div class="row align-items-end">
					<div class="col-lg-12">
						<div class="page-header-title">
							<div class="d-inline">
								업무 일지 작성
							</div>
						</div>
					</div>
				</div>
			</div>
	<div class="cnt_wr" id="list-container">
		<div class="row">
			<div class="col-sm-12">
				<div class="card-block table-border-style">
					<div class="table-responsive">
						<table id="schedTable" class="table table-striped table-bordered nowrap">
							<colgroup>
								<col width="2%">
								<col width="2%">
								<col width="15%">
								<col width="15%">
							</colgroup>
							<thead>
								<tr>
									<th>주차</th>
									<th>요일</th>
									<th>일정제목</th>
									<th>일정시작</th>
									<th>일정종료</th>
									<th>일정내용</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="ritem" items="${rlist}">
							<tr>
								<td><c:if test="${ritem.weektype eq 'p'}">지난주</c:if><c:if test="${ritem.weektype eq 't'}">이번주</c:if><c:if test="${ritem.weektype eq 'n'}">다음주</c:if></td>
								<td><c:if test="${ritem.weekdays eq 1}">일</c:if><c:if test="${ritem.weekdays eq 2}">월</c:if><c:if test="${ritem.weekdays eq 3}">화</c:if><c:if test="${ritem.weekdays eq 4}">수</c:if><c:if test="${ritem.weekdays eq 5}">목</c:if><c:if test="${ritem.weekdays eq 6}">금</c:if><c:if test="${ritem.weekdays eq 7}">토</c:if></td>
								<td>${ritem.title}</td>
								<td>${ritem.start}</td>
								<td>${ritem.end}</td>
								<td>${ritem.schedType}</td>
							</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--//table-->
</div>
<jsp:include page="../body-bottom.jsp"/>
