<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<script>
$(function(){
    $('#productTable').DataTable({
    	info:false,
		searching: true
    });
});

$(function(){
	$("#btnAdd").click(function(){
		location.href="${path}/product/write.do "
	});
});
</script>
<%
String userRole = "";
	if ((String) session.getAttribute("userRole") != null) {
		userRole = (String) session.getAttribute("userRole");
	}
	%>
<!-- Page-header start 페이지 타이틀-->
<div class="page-header2">
	<div class="row align-items-end">
		<div class="col-lg-12">
			<div class="page-header-title">
				<div class="d-inline">
					상품 설정
				</div>
			</div>
		</div>
	</div>
</div>
<!--Page-header end 페이지 타이틀 -->

<!--회원리스트 table-->
<div class="cnt_wr">
	<div class="row">
		<div class="col-sm-12">
			<div class="btn_wr text-right">
				<button class="btn btn-sm btn-primary f-right" type="button" id="btnAdd" onClick="fnSetPage('${path}/product/write.do')"><i class="icofont icofont-plus"></i>상품등록</button>
			</div>
			<div class="card-block table-border-style">
				<div class="dt-responsive table-responsive">
					<table id="productTable" class="table table-striped table-bordered nowrap dataTable">
						<colgroup>
							<col width="5%"/>
							<col width="15%"/>
							<col width="15%"/>
							<col width="15%"/>
							<col width="20%"/>
							<col width="10%"/>
						</colgroup>					
						<thead>
							<tr>
								<th class="text-center">상품 번호</th>
								<th class="text-center">공급사</th>
								<th class="text-center">제품그룹</th>
								<th class="text-center">상품명</th>
								<th class="text-center">상품설명</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="row" items="${list}">
								<tr align="center">
									<td>${row.productNo}</td>
									<td>${row.custName}</td>
									<td>${row.productCategoryName}</td>
									<td><a href="javascript:fnSetPage('${path}/product/detail/${row.productNo}')" style="text-decoration:underline;">${row.productName}</a></td>
									<td>${row.productDesc}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
				
				