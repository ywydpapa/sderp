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
	<table id="productdataTable" class="table table-striped table-bordered nowrap">
		<thead>
			<tr>
				<th>상품번호</th>
				<th>제품코드명</th>
				<th>상품명</th>
				<th>상품설명</th>
				<th>상세정보</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>

<%--
<%
	String url = request.getParameter("url");
%>
--%>

<script>
	var productdataTable = $('#productdataTable').DataTable({
			info:false,
			'processing': true,
			'language': {
				'loadingRecords': '&nbsp;',
				'processing': '<div class="spinner"></div>'
			},
			columns : [
				{data : 'productNo'},
				{data : 'productCategoryName'},
				{data : 'productName'},
				{data : 'productDesc'},
				{data : 'productNo'}
			],

			columnDefs: [
				{
					"render": function (data, type, row) {
						// 마우스 올리면 또는 클릭하면 툴팁으로 데이터 상세 표시 ** AJAX로 구현이 필요
						return '<a href="' + '${path}/productdata/listAjax' + data.productNo + '">Detail</a>';
					},
					"targets": 4
				}
			]
		});

    function fn_productdataTableReload(){
		$.ajax({
			type: "get",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			url : '${path}/product/listAjax'
		}).done(function (result) {
			result = JSON.parse(result);
			console.dir(result.length);
			console.dir(JSON.parse(result.data));
			var arr = JSON.parse(result.data);
			console.log(arr.length);
			productdataTable.clear();
			for(var i=0; i<arr.length; i++){
				productdataTable.row.add(arr[i]).draw();
			}
		})
	}
</script>

