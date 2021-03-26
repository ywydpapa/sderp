<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<script type="text/javascript">
function fn_productUpdate() {
	
	var productData = {};
	
	productData.productNo 			= $("#productNo").val();
	productData.productName 		= $("#productName").val();
	productData.productPrice 		= $("#productPrice").val();
	productData.productDesc 		= $("#productDesc").val();
	
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
												<input name="productNo" id ="productNo" value="${dto.productNo}" readonly class="form-control form-control-sm">
											</td>
										</tr>
										<tr>
											<th scope="row">상품명</th>
											<td>
												<input name="productName" id ="productName" value="${dto.productName}" class="form-control form-control-sm">
											</td>
										</tr>
										<tr>
											<th scope="row">상품가격</th>
											<td>
												<input name="productPrice" id ="productPrice" value="${dto.productPrice}" class="form-control form-control-sm">
											</td>
										</tr>
										<tr>
											<th scope="row">상품설명</th>
											<td>
												<textarea name="productDesc" id ="productDesc" value="${dto.productDesc}" rows="8" class="form-control">${dto.productDesc}</textarea>
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
							<form name = "form2" method="post" onsubmit="return false;">
								<table class="table table-sm bst02">
									<colgroup>
										<col width="25%" />
										<col width="75%"/>
									</colgroup>				
									<tbody>
										<tr>
											<th scope="row">상품가격</th>
											<td>
												<input name="custAddr" id="custAddr" value="${dto.productPrice}" class="form-control form-control-sm">
											</td>
										</tr>
									</tbody>
								</table>
							</form>
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

                                                