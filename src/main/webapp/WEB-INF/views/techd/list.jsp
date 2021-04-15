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
<script>
$(function(){
    $('#techdTable').DataTable({
    	info:false,
		order: [[ 7, "desc" ]],
    });
});
$(function(){
	$("#btnAdd").click(function(){
		location.href="${path}/techd/write.do"
	});
});

</script>
<style>
	a {
		text-decoration:underline;
	}
</style>

	<c:if test="${preserveSearchCondition != 'Y'}">
		<!-- Page-header start 페이지 타이틀-->
		<div class="page-header2">
			<div class="row align-items-end">
				<div class="col-lg-12">
					<div class="page-header-title">
						<div class="d-inline">
							기술지원 조회
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--Page-header end 페이지 타이틀 -->
	
	
		<!--기술지원 대상조회-->
		<div class="cnt_wr">
			<div class="row">
				<form id="searchForm" method="post" onsubmit="return false;" class="col-sm-12">
					<div class="col-sm-12">
						<div class="card_box sch_it">
							<div class="btn_wr text-right">
								<button class="btn btn-sm btn-inverse" onClick="javascript:fnClearall()"><i class="icofont icofont-spinner-alt-3"></i>초기화</button>
								<button class="btn btn-sm btn-primary" onClick="javascript:fnListcon()"><i class="icofont icofont-search"></i>검색</button>
		      					<button class="btn btn-sm btn-outline"onClick="javascript:fnSetPage('${path}/techd/write.do')"><i class="icofont icofont-pencil-alt-2"></i>등록</button>
										
							</div>
							<div class="form-group row">
							<div class="col-sm-12 col-xl-3">
								<label class="col-form-label" for="userName">담당사원</label>
								<div class="input-group input-group-sm mb-0">
									<input type="text" class="form-control" name="userName"
										id="userName" value="" readonly /> <input type="hidden"
										name="userNo" id="userNo" value="" /> <span
										class="input-group-btn">
										<button class="btn btn-primary sch-company"
											data-remote="${path}/modal/popup.do?popId=user" type="button"
											data-toggle="modal" data-target="#userModal">
											<i class="icofont icofont-search"></i>
										</button>
									</span>
									<div class="modal fade " id="userModal" tabindex="-1"
										role="dialog">
										<div class="modal-dialog modal-80size" role="document">
											<div class="modal-content modal-80size">
												<div class="modal-header">
													<h4 class="modal-title"></h4>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<h5>사용자목록</h5>
													<p>Loading!!!</p>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default waves-effect "
														data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="col-sm-12 col-xl-3">
								<label class="col-form-label" for="custName">엔드유저</label>
								<div class="input-group input-group-sm mb-0">
									<input type="text" class="form-control" name="custName" id="custName" value="" readonly />
									<input type="hidden" name="custNo" id="custNo" value="" />
									<span class="input-group-btn">
										<button class="btn btn-primary sch-company"
											data-remote="${path}/modal/popup.do?popId=cust" type="button"
											data-toggle="modal" data-target="#custModal">
											<i class="icofont icofont-search"></i>
										</button>
									</span>
									<div class="modal fade " id="custModal" tabindex="-1"
										role="dialog">
										<div class="modal-dialog modal-80size" role="document">
											<div class="modal-content modal-80size">
												<div class="modal-header">
													<h4 class="modal-title"></h4>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<h5>거래처목록</h5>
													<p>Loading!!!</p>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default waves-effect "
														data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="col-sm-12 col-xl-3">
								<label class="col-form-label" for="custmemberName">엔드유저 담당자</label>
								<div class="input-group input-group-sm mb-0">
									<input type="text" class="form-control" name="custmemberName"
										id="custmemberName" value="" readonly /> <input type="hidden"
										name="custmemberNo" id="custmemberNo" value="" /> <span
										class="input-group-btn">
										<button class="btn btn-primary sch-company"
											data-remote="${path}/modal/popup.do?popId=custmem&compNo=" type="button"
											data-toggle="modal" data-target="#custmemberModal" id="custmemberModalbtn">
											<i class="icofont icofont-search"></i>
										</button>
									</span>
									<div class="modal fade " id="custmemberModal" tabindex="-1"
										role="dialog">
										<div class="modal-dialog modal-80size" role="document">
											<div class="modal-content modal-80size">
												<div class="modal-header">
													<h4 class="modal-title"></h4>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<h5>고객목록</h5>
													<p>거래처를 먼저 입력해주셔야 목록이 보입니다.</p>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default waves-effect "
														data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-12 col-xl-3">
								<label class="col-form-label" for="co_name">진행단계</label>
								<select name="select" class="form-control form-control-sm" id="techdSteps">
									<option value>선택</option>
									<c:forEach var ="techdSteps" items="${techdSteps}">
										<option value = "${techdSteps.codeNo}">${techdSteps.desc03}</option>
									</c:forEach>
								</select>
							</div>
							</div>
							<div class="form-group row">
								<div class="col-sm-12 col-xl-6">
									<label class="col-form-label" for="co_name">등록일</label>
									<p class="input_inline"><input class="form-control form-control-sm col-xl-6" type="date" id="targetDatefrom" onChange="javascript:inputDate($('#targetDatefrom').val(), $('#targetDateto').val())"> ~ <input class="form-control form-control-sm col-xl-6" type="date" id="targetDateto" onChange="javascript:inputDate($('#targetDatefrom').val(), $('#targetDateto').val())">
									</p>
								</div>
								<div class="col-sm-12 col-xl-6">
									<label class="col-form-label" for="co_name">기술지원요청내용</label>
									<input type="text" class="form-control form-control-sm" id="techdDesc" name="" placeholder="">
								</div>
							</div>
						</div>	
					</div>
				</form>
			</div>
		</div>
		<!--//기술지원 대상조회-->
	
	</c:if>

	 <!--리스트 table-->
	<div class="cnt_wr" id="list-container">
		<div class="row">
			<div class="col-sm-12">
				<div class="card-block table-border-style">
					<div class="table-responsive">
						<table id="techdTable" class="table table-striped table-bordered nowrap">
							<colgroup>
								<col width="1%"/>
								<col width="7%"/>
								<col width="30%"/>
								<col width="24%"/>
								<col width="15%"/>
								<col width="8%"/>
								<col width="5%"/>
								<col width="10%"/>
							</colgroup>							
							<thead>
								<tr>
									<th><input class="border-checkbox" type="checkbox" id="checkbox0"></th>
									<th>등록구분</th>
									<th>요청명</th>
									<th>기술지원요청내용</th>
									<th>거래처</th>
									<th>진행단계</th>
									<th>담당사원</th>
									<th>기술지원 시작일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${list}">
								<tr>
									<th scope="row"><input class="border-checkbox" type="checkbox" id="checkbox0"></th>
									<td>
										<c:if test="${row.soppNo != 0}">신규 영업지원</c:if>
										<c:if test="${row.contNo != 0}">유지보수</c:if>
									</td>
									<td><a href="javascript:fnSetPage('${path}/techd/detail/${row.techdNo}')">${row.techdTitle}</a></td>
									<td>${row.techdDesc}</td>
									<td>${row.custName}</td>
									<td>${row.techdStepsN}</td>
									<td>${row.userName}</td> 
									<td>
										<fmt:parseDate value="${row.techdFrom}" var="techdFrom" pattern="yyyy-MM-dd HH:mm:ss"/>
										<fmt:formatDate value="${techdFrom}" pattern="yyyy-MM-dd"/>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--//리스트 table-->

	
<script>
	$('#userModal').on('show.bs.modal', function(e) {
		var button = $(e.relatedTarget);
		var modal = $(this);
		modal.find('.modal-body').load(button.data("remote"));
	});
	$('#custModal').on('show.bs.modal', function(e) {
		var button = $(e.relatedTarget);
		var modal = $(this);
		modal.find('.modal-body').load(button.data("remote"));
	});
	$('#custmemberModal').on('show.bs.modal', function(e) {
		var custNo = $("#custNo").val();
		var url = '${path}/modal/popup.do?popId=custmem&compNo=' + custNo;
		$("#custmemberModalbtn").data("remote",url);
		
		var button = $(e.relatedTarget);
		var modal = $(this);
		modal.find('.modal-body').load(button.data("remote"));
	});
	function fnSetUserData(a, b) {
		$("#userName").val(b);
		$("#userNo").val(a);
		$(".modal-backdrop").remove();
		$("#userModal").modal("hide");
	}
	function fnSetCustData(a, b) {
		$("#custNo").val(b);
		$("#custName").val(a);
		$(".modal-backdrop").remove();
		$("#custModal").modal("hide");
	}
	function fnSetCustmereData(a, b) {
		$("#custmemberNo").val(a);
		$("#custmemberName").val(b);
		$(".modal-backdrop").remove();
		$("#custmemberModal").modal("hide");
	}
	
	function fnListcon() {
		var techdData = {};
		techdData.userNo = $("#userNo").val() ? $("#userNo").val() : 0;
		techdData.custNo = $("#custNo").val() ? $("#custNo").val() : 0;
		techdData.custmemberNo = $("#custmemberNo").val() ? $("#custmemberNo").val() : 0;
		techdData.techdSteps = $("#techdSteps").val() ? $("#techdSteps").val() : null;
		techdData.targetDatefrom = $("#targetDatefrom").val() ? $("#targetDatefrom").val() : null;
		techdData.targetDateto = $("#targetDateto").val() ? $("#targetDateto").val() : null;
		techdData.techdDesc = $("#techdDesc").val() ? $("#techdDesc").val() : null;
		
		fnSetList('${path}/techd/listcon.do', techdData);
	}
</script>
		