<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<script type="text/javascript">

function fn_productInsert() {
	var productData = {};
	productData.productName 		= $("#productName").val();
	productData.custNo					= $("#custNo").val();
	productData.productDesc	 		= $("#productDesc").val();
	console.log(productData);
	$.ajax({ url: "${path}/product/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
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

</script>
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
								<th scope="row">상품명</th>
								<td>
									<input type="text" name ="productName" id ="productName" class="form-control form-control-sm" >
								</td>
							</tr>
							<tr>
								<th scope="row">공급고객사</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										 <input type="text" class="form-control" name="custName" id="custName" value="" />
										<input type="hidden" name="custNo" id="custNo" value="" />
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
													<p>Loading!!!</p>
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
									<textarea  name="productDesc" id="productDesc" rows="8" class="form-control"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="btn_wr text-right mt-3">
					<!--<button class="btn btn-md btn-success f-left">목록</button>-->
					<button class="btn btn-md btn-primary" onClick="fn_productInsert()" value="확인">확인</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
		$('#custModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		function fnSetCustData(a, b) {
			$("#custNo").val(b);
			$("#custName").val(a);
			$(".modal-backdrop").remove();
			$("#custModal").modal("hide");
		}

	</script>
