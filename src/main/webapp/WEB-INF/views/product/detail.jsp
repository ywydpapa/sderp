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
											<th scope="row">제품그룹</th>
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
											<th scope="row">상품설명</th>
											<td>
												<textarea name="product" id ="productDesc" value="${dto.productDesc}" rows="8" class="form-control">${dto.productDesc}</textarea>
											</td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>	
					</div>
				</div>
				<input type="hidden" id="productDataLastNo" value="${dto.productDataLastNo}">
				<div class="tab-pane " id="tab02" role="tabpanel">
					<div class="card-block table-border-style">
						<button class="btn btn-sm btn-secondary pull-right" style="margin-bottom: 5px;" onclick="fn_itemListAdd()">추가</button>
						<div class="table-responsive">
							<table class="table table-sm bst01">
								<colgroup>
									<col width="5%" />
									<col width="20%"/>
									<col width="70%"/>
									<col width="5%"/>
								</colgroup>				
								<thead>
									<tr>
										<th scope="row">순서</th>
										<th>항목</th>
										<th>값</th>
										<th>수정</th>
										<th>삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="row" items="${dto.productdataDTOList}" varStatus="varStatus">
										<tr id="${row.productDataNo}">
											<td style="text-align: center;">${varStatus.count}</td>
											<td><input class="productModel" type="text" value="${row.productModel}" onfocusout="fn_focusOutOrChangeEvent(this)" readonly /></td>
											<td><input type="text" value="${row.productPrice}" readonly/></td>
											<td>
												<div class="modify">
													<button class="btn btn-sm btn-warning" onclick="fn_itemListModify(this);">수정</button>
												</div>
												<div class="update">
													<%--<button class="btn btn-sm btn-instagram" onClick="fn_itemListUpdate(this);">등록</button>--%>
													<button class="btn btn-sm btn-dark" onClick="fn_itemListCancel(this);">취소</button>
												</div>
											</td>
											<td>
												<button class="btn btn-sm btn-danger" onclick="fn_itemListRemove(this);">삭제</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>	
					</div>
				</div>

				<div class="btn_wr text-right mt-3">
					<button class="btn btn-md btn-success f-left" onClick="javascript:fnSetPage('${path}/product/list.do')">목록</button>
					<button class="btn btn-md btn-danger" id="btnCopy" onClick= "fn_productCopy()">복제</button>
					<button class="btn btn-md btn-primary" id="btnInsert" onClick= "fn_productInsert()">등록</button>
					<button class="btn btn-md btn-inverse" id="btnCancel" onClick= "fn_productCancel()">취소</button>
					<button class="btn btn-md btn-primary" id="btnUpdate" onClick= "fn_productUpdate()">수정</button>
					<button class="btn btn-md btn-inverse" id="btnDelete" onClick= "fn_productDelete()">삭제</button>
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
input:read-only{
	border: aliceblue;
}
.itemRemove{
	display: none;
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
var colorObject = {
	0 : 'aliceblue',
	1 : 'bisque',
	2 : 'coral',
	3 : 'cornflowerblue',
	4 : 'darkseagreen'
}

function fn_focusOutOrChangeEvent(e){
	if($(e).css('backgroundColor') != 'rgb(255, 255, 255)'){
		$(e).css('backgroundColor','rgb(255, 255, 255)');
	}

	var productModel1 = $(".productModel");
	var productModel2 = $(".productModel");

	var result = false;
	for(var i=0; i<productModel1.length; i++){
		productModel1[i].style.backgroundColor = "";
	}

	for(var i=0; i<productModel1.length-1; i++){
		for(var j=1; j<productModel2.length; j++){
			if(productModel1[i].value == productModel2[j].value){
				if($(productModel1[i]).closest('tr').attr('id') != $(productModel2[j]).closest('tr').attr('id')){
					result = true;
					productModel1[i].style.backgroundColor = colorObject[0];
					productModel2[j].style.backgroundColor = colorObject[0];
				}
			}
		}
	}

	if(!result){
		$(e).css('backgroundColor','rgb(255, 255, 255)');
	}
}

function fn_itemListUpdate(e) {
	var parrent = $(e).closest('tr');
	var inputChildren = $(parrent).find('input');
	$(inputChildren[0]).prop('readonly',true);
	$(inputChildren[1]).prop('readonly',true);
	$(e).parent().prev().show();
	$(e).parent().hide();
	$(parrent).removeClass("itemModify");
}

function fn_itemListCancel(e) {
	var parrent = $(e).closest('tr');
	var inputChildren = $(parrent).find('input');
	$(inputChildren[0]).prop('readonly',true);
	$(inputChildren[1]).prop('readonly',true);
	$(e).parent().prev().show();
	$(e).parent().hide();
	$(parrent).removeClass("itemModify");
}

function fn_itemListModify(e) {
	var parrent = $(e).closest('tr');
	var inputChildren = $(parrent).find('input');
	console.dir(inputChildren);
	$(inputChildren[0]).prop('readonly',false);
	$(inputChildren[1]).prop('readonly',false);
	$(e).parent().next().show();
	$(e).parent().hide();
	$(parrent).addClass("itemModify");
}

function fn_itemListRemove(e){
	if(confirm("정말 삭제하시겠습니까?")) {
		var button = $(e);
		var tr = $(e).closest('tr');
		if(tr.hasClass('itemAdd')){
			// 신규 데이터인경우 tr 삭제 처리
			tr.remove();
		} else {
			// 기존 데이터인경우 hide 처리
			// tr.css("display", "none");
			tr.addClass('itemRemove');
			if(tr.hasClass('itemModify')){
				tr.removeClass('itemModify');
			}
		}
	} else {
		return false;
	}
}

var productNo, custName, custNo, productCategoryName, productCategoryNo, productName, productDefaultPrice, productDesc;
var tableDataId = new Array();
var tableDataItem = new Array();
var tableDataValue = new Array();

function fn_productCopy(){
	$("#btnInsert, #btnCancel").show();
	$("#btnCopy, #btnUpdate, #btnDelete").hide();
	productNo = $("#productNo").val();
	$("#productNo").val("자동생성 됩니다..");
	custName = $("#custName").val();
	custNo = $("#custNo").val();
	productCategoryName = $("#productCategoryName").val();
	productCategoryNo = $("#productCategoryNo").val();
	productName = $("#productName").val();
	productDefaultPrice = $("#productDefaultPrice").val();
	productDesc = $("#productDesc").val();
	var tableData = $("#tab02").find("tbody tr");
	tableData.each(function() {
		var Id = $(this).attr('id');
		tableDataId.push(Id);
		$(this).attr('id','');
		$(this).removeClass('itemRemove');
		$(this).removeClass('itemModify');
		$(this).addClass('itemAdd');
		var in0 = $(this).find("input[type=text]")[0];
		var in1 = $(this).find("input[type=text]")[1];
		tableDataItem.push(in0.value);
		in0.readOnly = false;
		tableDataValue.push(in1.value);
		in1.readOnly = false;
		var btn = $(this).find("button");
		$(btn[0]).hide();
		$(btn[1]).hide();
	});
}

function fn_productCancel(){

}

function fn_itemListAdd(){
	$element = $("#tab02").find("tbody");
	$Trelement = $element.find("tr");
	var i = 0;
	if($Trelement.length == 0){
		i=1;
	}
	else{
		i = Number( $($Trelement.last()).find("td")[0].innerText ) + 1;
	}
	var content = '<tr class="itemAdd">' +
					'<td style="text-align: center;">'+i+'<input type="hidden" value=""/></td>' +
					'<td><input type="text" class="productModel" onfocusout="fn_focusOutOrChangeEvent(this)"/></td>' +
					'<td><input type="text" /></td>' +
					'<td></td>' +
					'<td><button class="btn btn-sm btn-danger" onclick="fn_itemListRemove(this);">삭제</button></td>' +
			       '</tr>';
	$element.append(content);
}

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

function fn_itemDuplicate(){
	var itemDuplicate = false;
	var element = $("#tab02").find("tbody  tr");
	var inputElement = element.find("input:first");
	var item = new Set();
	for(var i=0; i<inputElement.length; i++){
		var addItem = $(inputElement[i]).val();
		item.add(addItem);
	}
	if(item.size == inputElement.length){
		itemDuplicate = false;
	} else {
		itemDuplicate = true;
	}
	return itemDuplicate;
}

function fn_productUpdate() {
	if(fn_itemDuplicate()){
		alert("항목은 중복으로 저장할수 없습니다.");
		return false;
	}
	
	var productData 				= new Object();
	var productNo 					= Number($("#productNo").val());
	productData.productNo 			= productNo								// 상품 번호
	var productCategoryNo 			= $("#productCategoryNo").val();		// 상품 카테고리 번호
	if(productCategoryNo != ""){
		productData.productCategoryNo	= productCategoryNo;
	}
	productData.productCategoryName	= $("#productCategoryName").val();		// 상품 카테고리 명
	productData.productName 		= $("#productName").val();				// 상품 명
	productData.productDefaultPrice = $("#productDefaultPrice").val();		// 상품 기본 가격
	productData.productDesc	 		= $("#productDesc").val();				// 상품 설명
	productData.custNo				= $("#custNo").val();					// 공급사(외래키)

	var productdataDTOList = new Array();
	var tableData = $("#tab02").find("tbody tr");
	tableData.each(function(){
		var data = new Object();
		var productDataNo = $(this).attr("id");
		var productModel = $(this).find("input[type=text]")[0].value;
		var productPrice = $(this).find("input[type=text]")[1].value;
		data['productNo'] = productNo;				// 상품 번호
		data['productDataNo'] = Number(productDataNo);
		data['productModel'] = productModel;
		data['productPrice'] = productPrice;
		if($(this).hasClass('itemRemove')) {
			// 기존 데이터 삭제
			data['mode'] = 'delete';
			productdataDTOList.push(data);
		} else if($(this).hasClass('itemAdd')) {
			// 기존 데이터 삭제
			data['mode'] = 'insert';
			productdataDTOList.push(data);
		} else if($(this).hasClass('itemModify')) {
			// 기존 데이터 삭제
			data['mode'] = 'update';
			productdataDTOList.push(data);
		}
	});
	productData['productdataDTOList'] = productdataDTOList;

	$.ajax({
				url: "${path}/product/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: JSON.stringify(productData) , // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
				contentType:"application/json",
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


$(document).ready(function() {
	//fn_itemListAdd();
	// document.querySelector('.productModel').addEventListener('.focusout', function (e){
	// 	console.dir(e);
	// });
	$(".update").hide();
	$("#btnInsert, #btnCancel").hide();
});
</script>                                                