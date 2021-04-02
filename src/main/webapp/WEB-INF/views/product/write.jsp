<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<!-- Page-header start 페이지 타이틀-->
<div class="page-header2">
	<div class="row align-items-end">
		<div class="col-lg-12">
			<div class="page-header-title">
				<div class="d-inline">
					상품 등록
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
								<th scope="row">상품 카테고리명*</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="product" id="productCategoryName" value="" />
										<input type="hidden" class="form-control" name="product" id="productCategoryNo" value="" />
										<span class="input-group-btn">
											<button class="btn btn-primary sch-company" data-remote="${path}/modal/popup.do?popId=productGoodsCategory" type="button" data-toggle="modal" data-target="#productCategoryModal"><i class="icofont icofont-search"></i></button>
										</span>
									</div>
									<!--모달 팝업-->
									<div class="modal fade" id="productCategoryModal" tabindex="-1" role="dialog">
										<div class="modal-dialog modal-80size" role="document">
											<div class="modal-content modal-80size">
												<div class="modal-header">
													<h4 class="modal-title">카테고리 검색</h4>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<h5>카테고리 목록</h5>
													<p>등록된 카테고리가 없거나 로딩중입니다.</p>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default waves-effect " data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>
									<!--//모달 팝업-->
								</td>
							</tr>
							<tr>
								<th scope="row">상품명*</th>
								<td>
									<input type="text" name="product" id ="productName" class="form-control form-control-sm" >
								</td>
							</tr>
							<tr>
								<th scope="row">상품 기본가격*</th>
								<td>
									<input type="text" name="product" id ="productDefaultPrice" class="form-control form-control-sm" value="0">
								</td>
							</tr>
							<tr>
								<th scope="row">공급사*</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="product" id="custName" value="" />
										<input type="hidden" name="product" id="custNo" value="" />
										<span class="input-group-btn">
											<button class="btn btn-primary sch-company" data-remote="${path}/modal/popup.do?popId=cust" type="button" data-toggle="modal" data-target="#custModal"><i class="icofont icofont-search"></i></button>
										</span>
									</div>
									<!--모달 팝업-->
									<div class="modal fade" id="custModal" tabindex="-1" role="dialog">
										<div class="modal-dialog modal-80size" role="document">
											<div class="modal-content modal-80size">
												<div class="modal-header">
													<h4 class="modal-title">거래처검색</h4>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<h5>거래처목록</h5>
													<p>거래처 목록이 불러오는 중이거나 없습니다.</p>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default waves-effect " data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>
									<!--//모달 팝업-->
								</td>
							</tr>
							<tr>
								<th scope="row">상품설명</th>
								<td>
									<textarea  name="product" id="productDesc" rows="8" class="form-control"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="btn_wr text-right mt-3">
					<!--<button class="btn btn-md btn-success f-left">목록</button>-->
					<button class="btn btn-md btn-primary" onClick="fn_productInsert()" value="등록">등록</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
// 이벤트 영역 시작
$('#custModal').on('show.bs.modal', function(e) {
	var button = $(e.relatedTarget);
	var modal = $(this);
	modal.find('.modal-body').load(button.data("remote"));
});

$('#productCategoryModal').on('show.bs.modal', function(e) {
	var button = $(e.relatedTarget);
	var modal = $(this);
	modal.find('.modal-body').load(button.data("remote"));
});
// 이벤트 영역 끝

// 페이지 특화 함수 시작
function fnSetCategoryData(a,b){
	// '${row.productCategoryNo}','${row.productCategoryName}'
	$("#productCategoryNo").val(a);
	$("#productCategoryName").val(b);
	$(".modal-backdrop").remove();
	$("#productCategoryModal").modal("hide");
}

function fnSetCustData(a, b) {
	$("#custName").val(a);
	$("#custNo").val(b);
	$(".modal-backdrop").remove();
	$("#custModal").modal("hide");
}
		
function fn_productInsert() {
	var productData = {};
	var productCategoryNo = $("#productCategoryNo").val();		// 상품 카테고리 번호
	if(productCategoryNo != ""){
		productData.productCategoryNo	= productCategoryNo;
	}	
	productData.productCategoryName	= $("#productCategoryName").val();		// 상품 카테고리 명
	productData.productName 		= $("#productName").val();				// 상품 명
	productData.productDefaultPrice = $("#productDefaultPrice").val();		// 상품 기본 가격
	productData.productDesc	 		= $("#productDesc").val();				// 상품 설명
	productData.custNo				= $("#custNo").val();					// 공급사(외래키)
	console.dir(productData);
	$.ajax({ url: "${path}/product/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: productData , // HTTP 요청과 함께 서버로 보낼 데이터 
				method: "POST", // HTTP 요청 메소드(GET, POST 등) 
				dataType: "json" // 서버에서 보내줄 데이터의 타입 
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨..
			.done(function(data) {
				if(data.code == 10001){
					alert("저장 성공");
					fnSetPage('${path}/product/list.do');
				}else{
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) { 
				alert("통신 실패");
			});
}
// 페이지 특화 함수 끝
</script>
