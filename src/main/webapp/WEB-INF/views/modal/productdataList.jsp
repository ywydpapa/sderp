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
	<table id="productTable" class="table table-striped table-bordered nowrap">
		<thead>
			<tr>
				<th>상품번호</th>
				<th>상품명</th>
				<th>상품설명</th>
				<th>상세정보</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="row" items="${list}">
				<tr align="center">
					<td>${row.productNo}</td>
					<td><a
						href="javascript:fnSetProductData('${row.productName}','${row.productNo}');">${row.productName}</a></td>
					<td>${row.productDesc}</td>
					<td>
						<span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="Disabled tooltip">
						  <button class="btn btn-primary" style="pointer-events: none;" type="button" disabled>Disabled button</button>
						</span>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script>
$(function(){
    $('#productTable').DataTable({
    	info:false
    });
});
</script>

