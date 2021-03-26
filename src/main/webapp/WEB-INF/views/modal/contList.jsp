<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
    <!-- data tables css -->
<link rel="stylesheet" href="${path}/assets/css/plugins/dataTables.bootstrap4.min.css">
<!-- datatable Js -->
<script src="${path}/assets/pages/jquery.dataTables.min.js"></script>
<script src="${path}/assets/pages/dataTables.bootstrap4.min.js"></script>

<div class="dt-responsive table-responsive">
	<table id="contTable" class="table table-striped table-bordered nowrap">
		<thead>
			<tr>
				<th>계약번호</th>
				<th>계약명</th>
				<th>거래처명</th>
				<th>담당자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="row" items="${list}">
				<tr align="center">
					<td>${row.contNo}</td>
					<td><a
						href="javascript:fnSetContData('${row.contTitle}','${row.contNo}','${row.userNo}','${row.custNo}');">${row.contTitle}</a></td>
					<td>${row.contDesc}</td>
					<td>${row.userName}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script>
$(function(){
    $('#contTable').DataTable({
    	info:false
    });
});
</script>

