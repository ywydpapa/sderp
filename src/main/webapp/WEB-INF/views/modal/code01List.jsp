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
	<table id="code01Table" class="table table-striped table-bordered nowrap">
		<thead>
			<tr>
				<th>코드번호</th>
				<th>코드01</th>
				<th>표시명01</th>
				<th>설정값01</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="row" items="${list}">
				<tr align="center">
					<td>${row.codeNo}</td>
					<td><a
						href="javascript:fnSetCode01Data('${row.code01}','${row.desc01}');">${row.code01}</a></td>
					<td>${row.desc01}</td>
					<td>${row.value01}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script>
$(function(){
    $('#code01Table').DataTable({
    	info:false
    });
});
</script>

