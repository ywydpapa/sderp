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
	<table id="ptncTable" class="table table-striped table-bordered nowrap">
		<thead>
			<tr>
				<th>협력업체번호</th>
				<th>업체명</th>
				<th>대표자명</th>
				<th>사업자번호</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="row" items="${list}">
				<tr align="center">
					<td>${row.ptncNo}</td>
					<td><a
						href="javascript:fnSetPtncData('${row.ptncName}','${row.ptncNo}');">${row.ptncName}</a></td>
					<td>${row.custBossname}</td>
					<td>${row.custVatno}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script>
$(function(){
    $('#ptncTable').DataTable({
    	info:false
    });
});
</script>

