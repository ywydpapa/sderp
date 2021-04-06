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

<script>
$(function(){
    var productdataTable = $('#productTable').DataTable({
		ajax : '${path}/productdata/list',
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
			{data : 'productDataNo'}
		],
		columnDefs: [
			{
				"render": function (data, type, row) {
					return '<a href="' + data + '">Detail</a>';
				},
				"targets": 4
			}
		]
    });

    $('#btn-productdataTable').on('click', function(){
    	productdataTable.ajax.reload();
	});
    /*
    $("#TransactionTable").DataTable({
        ajax: '/Transaction/GetData',
        columns: [
        { data: 'status' },
        { data: 'transactionId' },
        { data: 'creditCardNumber' },
        { data: 'supplier' },
        { data: 'createdAt' },
        { data: 'amount' }
        ]
    });

    {
	"data": [
	 {
	 "status": 2,
	 "transactionId": 12345,
	 "creditCardNumber": "1234324324",
	 "supplier": "Office Depot",
	 "createdAt": "2008-12-28T00:00:00",
	 "amount": 500.0
		}
	  ]
	}
	// https://stackoverflow.com/questions/45401172/jquery-datatables-load-data-ajax
     */

});
</script>

