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
    $('#salesTable').DataTable({
    	info:false
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
							영업활동 조회
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--Page-header end 페이지 타이틀 -->
		<!--영업활동조회-->
		<div class="cnt_wr">
			<div class="row">
				<form id="searchForm" method="post" onsubmit="return false;" class="col-sm-12">
					<div class="col-sm-12">
						<div class="card_box sch_it">
							<div class="btn_wr text-right">
								<button class="btn btn-sm btn-inverse" onClick="javascript:fnClearall()"><i class="icofont icofont-spinner-alt-3"></i>초기화</button>
								<button class="btn btn-sm btn-primary" onClick="javascript:fnListcon()"><i class="icofont icofont-search"></i>검색</button>	
		      					<button class="btn btn-sm btn-outline"onClick="javascript:fnSetPage('${path}/sales/write.do')"><i class="icofont icofont-pencil-alt-2"></i>등록</button>
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
									<label class="col-form-label" for="soppTitle">영업기회</label>
									<div class="input-group input-group-sm mb-0">
																	<input type="text" class="form-control" name="soppTitle"
																		id="soppTitle" value="" readonly /> <input
																		type="hidden" name="soppNo" id="soppNo"
																		value="" /> <span class="input-group-btn">
																		<button class="btn btn-primary sch-company"
																			data-remote="${path}/modal/popup.do?popId=sopp"
																			type="button" data-toggle="modal"
																			data-target="#soppModal">
																			<i class="icofont icofont-search"></i>
																		</button>
																	</span>
																	<div class="modal fade " id="soppModal" tabindex="-1"
																		role="dialog">
																		<div class="modal-dialog modal-80size" role="document">
																			<div class="modal-content modal-80size">
																				<div class="modal-header">
																					<h4 class="modal-title">영업기회 검색</h4>
																					<button type="button" class="close"
																						data-dismiss="modal" aria-label="Close">
																						<span aria-hidden="true">&times;</span>
																					</button>
																				</div>
																				<div class="modal-body">
																					<h5>영업기회 목록</h5>
																					<p>Loading!!!</p>
																				</div>
																				<div class="modal-footer">
																					<button type="button"
																						class="btn btn-default waves-effect "
																						data-dismiss="modal">Close</button>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
								</div>
								<div class="col-sm-12 col-xl-3">
									<label class="col-form-label" for="custName">거래처</label>
																<div class="input-group input-group-sm mb-0">
																	<input type="text" class="form-control" name="custName"
																		id="custName" value="" readonly /> <input
																		type="hidden" name="custNo" id="custNo"
																		value="" /> <span class="input-group-btn">
																		<button class="btn btn-primary sch-company"
																			data-remote="${path}/modal/popup.do?popId=cust"
																			type="button" data-toggle="modal"
																			data-target="#custModal">
																			<i class="icofont icofont-search"></i>
																		</button>
																	</span>
																	<div class="modal fade " id="custModal" tabindex="-1"
																		role="dialog">
																		<div class="modal-dialog modal-80size" role="document">
																			<div class="modal-content modal-80size">
																				<div class="modal-header">
																					<h4 class="modal-title">거래처검색</h4>
																					<button type="button" class="close"
																						data-dismiss="modal" aria-label="Close">
																						<span aria-hidden="true">&times;</span>
																					</button>
																				</div>
																				<div class="modal-body">
																					<h5>거래처목록</h5>
																					<p>Loading!!!</p>
																				</div>
																				<div class="modal-footer">
																					<button type="button"
																						class="btn btn-default waves-effect "
																						data-dismiss="modal">Close</button>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
								</div>
								<div class="col-sm-12 col-xl-3">
									<label class="col-form-label" for="co_name">활동형태</label>
									<select name="select" class="form-control form-control-sm" id="salesType">
										<option value>선택</option>
										<c:forEach var = "acttype" items="${acttype}">
											<option value="${acttype.codeNo}">${acttype.desc03}</option>
										</c:forEach>
									</select>
								</div>
								
							</div>
							<div class="form-group row">
								<div class="col-sm-12 col-xl-6">
									<label class="col-form-label" for="co_name">활동일</label>
									<p class="input_inline"><input class="form-control form-control-sm col-xl-6" type="date" id="salesFrdatetime" onChange="javascript:inputDate($('#salesFrdatetime').val(), $('#salesTodatetime').val())"> ~ <input class="form-control form-control-sm col-xl-6" type="date" id="salesTodatetime" onChange="javascript:inputDate($('#salesFrdatetime').val(), $('#salesTodatetime').val())">
									</p>
								</div>
							</div>
						</div>	
					</div>
				
				</form>
			</div>
		</div>
		<!--//영업활동조회-->
	
	</c:if>

	 <!--리스트 table-->
	<div class="cnt_wr" id="list-container">
		<div class="row">
			<div class="col-sm-12">
			<div class="card-block table-border-style">
				<div class="table-responsive">
					<table id="salesTable" class="table table-striped table-bordered nowrap ">
							<colgroup>
								<col width="1%"/>
								<col width="15%"/>
								<col width="5%"/>
								<col width="15%"/>
								<col width="5%"/>
								<col width="5%"/>
								<col width="14%"/>
								<col width="5%"/>
								<col width="35%"/>
							</colgroup>							
							<thead>
								<tr>
									<th><input class="border-checkbox" type="checkbox" id="checkbox0"></th>
									<th>영업활동명</th>
									<th>일정</th>
									<th>영업기회명</th>
									<th>거래처</th>
									<th>담당사원</th>
									<th>파트너사</th>
									<th>활동형태</th>
									<th>일정설명</th>
									
								</tr>
							</thead>
							<tbody>
							<c:forEach var="row" items="${list}">
								<tr>
									<th scope="row"><input class="border-checkbox" type="checkbox" ></th>
									<td><a href="javascript:fnSetPage('${path}/sales/detail/${row.salesNo}')">${row.salesTitle}</a></td>
									<td>${row.salesFrdatetime}</td>
									<td>${row.soppTitle}</td>
									<td>${row.custName}</td>
									<td>${row.userName}</td>
									<td>${row.ptncName}</td>
									<td>${row.salesTypeN}</td>
									<td>${row.salesDesc}</td>
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
		$('#custModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		$('#userModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		$('#soppModal').on('show.bs.modal', function(e) {
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
    	function fnSetUserData(a, b) {
			$("#userName").val(b);
			$("#userNo").val(a);
			$(".modal-backdrop").remove();
			$("#userModal").modal("hide");
		}
    	function fnSetSoppData(a, b) {
			$("#soppNo").val(b);
			$("#soppTitle").val(a);
			$(".modal-backdrop").remove();
			$("#soppModal").modal("hide");
		}
    	
    	function fnListcon() {
    		var salesData = {};
    		salesData.userNo = $("#userNo").val() ? $("#userNo").val() : 0;
    		salesData.soppNo = $("#soppNo").val() ? $("#soppNo").val() : 0;
    		salesData.custNo = $("#custNo").val() ? $("#custNo").val() : 0;
    		salesData.salesType = $("#salesType").val() ? $("#salesType").val() : null;
    		salesData.salesFrdatetime = $("#salesFrdatetime").val() ? $("#salesFrdatetime").val() : null;
    		salesData.salesTodatetime = $("#salesTodatetime").val() ? $("#salesTodatetime").val() : null;
    		
    		fnSetList('${path}/sales/listcon.do', salesData);
    	}

</script>
	