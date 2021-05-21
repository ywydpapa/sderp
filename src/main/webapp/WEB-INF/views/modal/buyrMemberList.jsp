<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<div class="dt-responsive table-responsive">
	<table id="buyrMemberTable" class="table table-striped table-bordered nowrap">
		<thead>
		<tr>
			<th>고객 담당자 번호</th>
			<th>고객 성명</th>
			<th>직급</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="row" items="${list}">
			<tr align="center">
				<td>${row.custData03no}</td>
				<td><a href="javascript:fnSetbuyrMmereData('${row.custData03no}','${row.custMname}');">${row.custMname}</a></td>
				<td>${row.custMrank}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
<script>
	$(function(){
		$('#buyrMemberTable').DataTable({
			info:false,
			searching: true
		});
	});
</script>