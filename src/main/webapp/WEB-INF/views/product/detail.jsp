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
					상품 정보
				</div>
			</div>
		</div>
	</div>
</div>
<!--Page-header end 페이지 타이틀 -->

<div class="cnt_wr">
	<!-- Row start -->
	<div class="row">
		<div class="col-lg-12 col-xl-12">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs  tabs" role="tablist">
				<li class="nav-item">
					<a class="nav-link active" data-toggle="tab" href="#tab01" role="tab">기본정보</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#tab02" role="tab">상세정보</a>
				</li>
				<li class="nav-item">
			</ul>
			<!-- Tab panes -->
			<div class="tab-content tabs m-t-20">
				<div class="tab-pane active" id="tab01" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<form name="form1" method="post">
								<table class="table table-sm bst02">
									<colgroup>
										<col width="25%" />
										<col width="75%"/>
									</colgroup>				
									<tbody>
										<tr>
											<th scope="row">상품번호</th>
											<td>
												<input name="product" id ="productNo" value="${dto.productNo}" readonly class="form-control form-control-sm">
											</td>
										</tr>
										<tr>
											<th scope="row">상품 카테고리명</th>
											<td>
												<div class="input-group input-group-sm mb-0">
													<input name="product" id ="productCategoryName" value="${dto.productCategoryName}" class="form-control form-control-sm">
													<input type="hidden" name="product" id ="productCategoryNo" value="${dto.productCategoryNo}" class="form-control form-control-sm">
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
											<th scope="row">상품명</th>
											<td>
												<input name="product" id ="productName" value="${dto.productName}" class="form-control form-control-sm">
											</td>
										</tr>
										<tr>
											<th scope="row">상품 기본가격</th>
											<td>
												<input name="product" id ="productDefaultPrice" value="${dto.productDefaultPrice}" class="form-control form-control-sm">
											</td>
										</tr>
										<tr>
											<th scope="row">공급사</th>
											<td>
												<div class="input-group input-group-sm mb-0">
													<input name="product" id ="custName" value="${dto.custName}" class="form-control form-control-sm">
													<input type="hidden" name="product" id ="custNo" value="${dto.custNo}" class="form-control form-control-sm">
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
												<textarea name="product" id ="productDesc" value="${dto.productDesc}" rows="8" class="form-control">${dto.productDesc}</textarea>
											</td>
										</tr>
									</tbody>
								</table>
							</form>
							<div class="btn_wr text-right mt-3">
								<button class="btn btn-md btn-success f-left" onClick="javascript:fnSetPage('${path}/product/list.do')">목록</button>
								<button class="btn btn-md btn-primary" value="수정" id="btnUpdate" onClick= "fn_productUpdate()">수정</button>
								<button class="btn btn-md btn-inverse" value="삭제" id="btnDelete" onClick= "fn_productDelete()">삭제</button>
							</div>
						</div>	
					</div>
				</div>
				<div class="tab-pane " id="tab02" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<table class="table table-sm bst02">
								<colgroup>
									<col width="5%" />
									<col width="20%"/>
									<col width="70%"/>
									<col width="5%"/>
								</colgroup>				
								<thead>
									<tr>
										<th scope="row">번호</th>
										<th scope="row">항목</th>
										<th scope="row">값</th>
										<th scope="row"><input type="button" value="추가"></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td><input type="text"/></td>
										<td><input type="text"/></td>
										<td><input type="button" value="삭제"></td>
									</tr>
									<tr>
										<td>2</td>
										<td><input type="text"/></td>
										<td><input type="text"/></td>
										<td><input type="button" value="삭제"></td>
									</tr>
									<tr>
										<td>3</td>
										<td><input type="text"/></td>
										<td><input type="text"/></td>
										<td><input type="button" value="삭제"></td>
									</tr>
								</tbody>
							</table>
							<div class="btn_wr text-right mt-3">
								<button class="btn btn-md btn-success f-left" onClick="javascript:fnSetPage('${path}/product/list.do')">목록</button>
								<button class="btn btn-md btn-primary" value="수정" id="btnUpdate" onClick= "fn_productUpdate()" >수정</button>
							</div>
						</div>	
					</div>
				</div>				
			</div>
		</div>
	</div>
	<!-- Row end -->
</div>
<style>
input[type=text] {
	width: 100%;
}
</style>
<script type="text/javascript">
//이벤트 영역 시작
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

function fn_productUpdate() {
	
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
	
	var $tableData = $("#tab02").find("tbody tr");
	
	/*
	var salesTargetlist = new Object();
	var dataList = new Array();
	
	$beforeData.each(function(){
		var userNo = $(this).attr('id');	// userNo
		var deptNo = $(this).data('deptno');// deptNo
		// 테이블 구조변경시 수정할 코드 .splice(시작,끝)
		var $detail = $(this).find("input[type=text]").splice(0,12);
		var mArr = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
		for(var i=0; i<12; i++){
			mArr[i] = Number($detail[i].value.replace(/[\D\s\._\-]+/g, ""));
		}
		
		var data = new Object();
		data['userNo'] = userNo;
		data['deptNo'] = deptNo;
		data['targetYear'] = targetYear;
		data['targetType'] = targetType;
		data['mm01'] = mArr[0];
		data['mm02'] = mArr[1];
		data['mm03'] = mArr[2];
		data['mm04'] = mArr[3];
		data['mm05'] = mArr[4];
		data['mm06'] = mArr[5];
		data['mm07'] = mArr[6];
		data['mm08'] = mArr[7];
		data['mm09'] = mArr[8];
		data['mm10'] = mArr[9];
		data['mm11'] = mArr[10];
		data['mm12'] = mArr[11];
		dataList.push(data);
	});
	
	salesTargetlist["salesTargetlist"] = dataList;
	
	JSON.stringify(salesTargetlist)
	*/
	
	console.log(productData);
	$.ajax({ url: "${path}/product/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				data: productData , // HTTP 요청과 함께 서버로 보낼 데이터 
				method: "POST", // HTTP 요청 메소드(GET, POST 등) 
				dataType: "json" // 서버에서 보내줄 데이터의 타입 
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
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
	
function fn_productDelete() {
	
	var productData = {};
	
	productData.productNo 			= $("#productNo").val();
	console.log(productData);
	$.ajax({ url: "${path}/product/delete.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				data: productData , // HTTP 요청과 함께 서버로 보낼 데이터 
				method: "POST", // HTTP 요청 메소드(GET, POST 등) 
				dataType: "json" // 서버에서 보내줄 데이터의 타입 
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
					alert("삭제 성공");
					fnSetPage('${path}/product/list.do');
				}else{
					alert("삭제 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) { 
				alert("통신 실패");
			});
}
</script>                                                