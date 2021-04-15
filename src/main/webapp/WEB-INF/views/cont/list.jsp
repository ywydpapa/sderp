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
    $('#contTable').DataTable({
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
							계약 현황 조회
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--Page-header end 페이지 타이틀 -->
		
			<!--계약조회-->
			<div class="cnt_wr">
				<div class="row">
					<form id="searchForm" method="post" onsubmit="return false;" class="col-sm-12">
						<div class="col-sm-12">
							<div class="card_box sch_it">
								<div class="btn_wr text-right">
									<button class="btn btn-sm btn-inverse" onClick="javascript:fnClearall()"><i class="icofont icofont-spinner-alt-3"></i>초기화</button>
									<button class="btn btn-sm btn-primary" onClick="javascript:fnListcon()"><i class="icofont icofont-search"></i>검색</button>
									<button class="btn btn-sm btn-outline" onClick="javascript:fnSetPage('${path}/cont/write.do')"><i class="icofont icofont-pencil-alt-2"></i>등록</button>		
								</div>
								<div class="form-group row">
									<div class="col-sm-12 col-xl-3">
										<label class="col-form-label" for="co_name">거래처(고객)</label>
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
										<label class="col-form-label" for="co_name">유지보수업체</label>
															<div class="input-group input-group-sm mb-0">
																		<input type="text" class="form-control" name="ptncName"
																			id="ptncName" value="" readonly /> <input
																			type="hidden" name="ptncNo" id="ptncNo"
																			value="" /> <span class="input-group-btn">
																			<button class="btn btn-primary sch-company"
																				data-remote="${path}/modal/popup.do?popId=ptnc"
																				type="button" data-toggle="modal"
																				data-target="#ptncModal">
																				<i class="icofont icofont-search"></i>
																			</button>
																		</span>
																		<div class="modal fade " id="ptncModal" tabindex="-1"
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
										<label class="col-form-label" for="co_name">공급업체</label>
										<div class="input-group input-group-sm">
											<div class="input-group input-group-sm mb-0">
																		<input type="text" class="form-control" name="supplyName"
																			id="supplyName" value="" readonly /> <input
																			type="hidden" name="supplyNo" id="supplyNo"
																			value="" /> <span class="input-group-btn">
																			<button class="btn btn-primary sch-company"
																				data-remote="${path}/modal/popup.do?popId=supply"
																				type="button" data-toggle="modal"
																				data-target="#supplyModal">
																				<i class="icofont icofont-search"></i>
																			</button>
																		</span>
																		<div class="modal fade " id="supplyModal" tabindex="-1"
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
									</div>
									<div class="col-sm-12 col-xl-3">
										<label class="col-form-label" for="co_name">계약업체</label>
										<div class="input-group input-group-sm mb-0">
																		<input type="text" class="form-control" name="buyrName"
																			id="buyrName" value="" readonly /> <input
																			type="hidden" name="buyrNo" id="buyrNo"
																			value="" /> <span class="input-group-btn">
																			<button class="btn btn-primary sch-company"
																				data-remote="${path}/modal/popup.do?popId=buyr"
																				type="button" data-toggle="modal"
																				data-target="#buyrModal">
																				<i class="icofont icofont-search"></i>
																			</button>
																		</span>
																		<div class="modal fade " id="buyrModal" tabindex="-1"
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
								</div>
								<div class="form-group row">
									<div class="col-sm-12 col-xl-3">
										<label class="col-form-label" for="co_name">계약명</label>
										<input type="text" class="form-control form-control-sm" id="contTitle" name="" placeholder="">
									</div>
									<div class="col-sm-12 col-xl-3">
										<label class="col-form-label" for="co_name">계약방식</label>
										<select name="select" class="form-control form-control-sm" id="contractType">
											<option value>선택</option>
											<c:forEach var ="contractType" items="${contractType}">
												<option value = "${contractType.codeNo}">${contractType.desc03}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-sm-12 col-xl-6">
										<label class="col-form-label" for="co_name">판매일자</label>
										<div class="ms-selectable sales_date">
										<p class="input_inline"><input class="form-control form-control-sm col-xl-6" type="date" id="targetDatefrom" onChange="javascript:inputDate($('#targetDatefrom').val(), $('#targetDateto').val())"> ~ <input class="form-control form-control-sm col-xl-6" type="date" id="targetDateto" onChange="javascript:inputDate($('#targetDatefrom').val(), $('#targetDateto').val())">
										</div>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12 col-xl-3">
										<label class="col-form-label" for="co_name">담당자</label>
										<input type="text" class="form-control form-control-sm" id="userName" name="" placeholder="">
									</div>
									<div class="col-sm-12 col-xl-3">
										<label class="col-form-label" for="co_name">판매방식</label>
										<select name="select" class="form-control form-control-sm" id="contType">
											<option value>선택</option>
											<c:forEach var="contType" items="${contType}">
												<option value="${contType.codeNo}">${contType.desc03}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-sm-12 col-xl-6">
										<label class="col-form-label" for="co_name">유지보수기간</label>
										<p class="input_inline"><input class="form-control form-control-sm col-xl-6" type="date" id="freemaintSdate" onChange="javascript:inputDate($('#freemaintSdate').val(), $('#freemaintEdate').val())"> ~ <input class="form-control form-control-sm col-xl-6" type="date" id="freemaintEdate" onChange="javascript:inputDate($('#freemaintSdate').val(), $('#freemaintEdate').val())">
										</p>
									</div>
								</div>
							</div>	
						</div>
					</form>
				</div>
			</div>
	</c:if>
	<!--//계약조회-->
	 	 <!--리스트 table-->
	<div class="cnt_wr" id="list-container">
		<div class="row">
			<div class="col-sm-12">
				<div class="card-block table-border-style">
					<div class="table-responsive">
						<table id="contTable" class="table table-striped table-bordered nowrap ">
							<colgroup>
								<col width="1%"/>
								<col width="5%"/>
								<col width="20%"/>
								<col width="10%"/>
								<col width="5%"/>
								<col width="12%"/>
								<col width="5%"/>
								<col width="10%"/>
								<col width="10%"/>
								<col width="7%"/>
								<col width="5%"/>
								<col width="10%"/>
							</colgroup>							
							<thead>
								<tr>
									<th><input class="border-checkbox" type="checkbox" id="checkbox0"></th>
									<th>계약방식</th>
									<th>계약명</th>
									<th>고객명</th>
									<th>판매방식</th>
									<th>계약금액</th>
									<th>담당자</th>
									<th>무상유지보수 시작일</th>
									<th>무상유지보수 만료일</th>
									<th>계산서 발행일</th>
									<th>판매일</th>
									<!-- <th>상세정보</th> -->
								</tr>
							</thead>
							<tbody>
							<c:forEach var="row" items="${list}">
								<tr>
									<td scope="row"><input class="border-checkbox" type="checkbox" id="checkbox0"></td>
									<td>
										<c:choose>
										<c:when test="${row.soppNo != 0}">판매계약</c:when>
										<c:when test="${row.exContNo != 0}">유지보수</c:when>
										</c:choose>
									</td>
									<td><a href="javascript:fnSetPage('${path}/cont/detail/${row.contNo}')">${row.contTitle}</a></td>							
									<td>${row.custName}</td>
									<td>${row.contTypeN}</td>
									<td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.contAmt}" /></td>
									<td>${row.userName}</td>
									<td>${row.freemaintSdate}</td>
									<td>${row.freemaintEdate}</td>
									<td>-</td>
									<td>${row.contOrddate}</td>
									<%-- <td><a href="javascript:fnSetPage('${path}/cont/detail/${row.contNo}')">상세정보</a></td> --%>
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
	/* $('#userModal').on('show.bs.modal', function(e) {
		var button = $(e.relatedTarget);
		var modal = $(this);
		modal.find('.modal-body').load(button.data("remote"));
	});
	*/
	$('#buyrModal').on('show.bs.modal', function(e) {
		var button = $(e.relatedTarget);
		var modal = $(this);
		modal.find('.modal-body').load(button.data("remote"));
	});
	$('#supplyModal').on('show.bs.modal', function(e) {
		var button = $(e.relatedTarget);
		var modal = $(this);
		modal.find('.modal-body').load(button.data("remote"));
	});
	$('#ptncModal').on('show.bs.modal', function(e) {
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
	function fnSetBuyrData(a, b) {
		$("#buyrNo").val(b);
		$("#buyrName").val(a);
		$(".modal-backdrop").remove();
		$("#buyrModal").modal("hide");
	}
	function fnSetSupplyData(a, b) {
		$("#supplyNo").val(b);
		$("#supplyName").val(a);
		$(".modal-backdrop").remove();
		$("#supplyModal").modal("hide");
	}
	function fnSetPtncData(a, b) {
		$("#ptncNo").val(b);
		$("#ptncName").val(a);
		$(".modal-backdrop").remove();
		$("#ptncModal").modal("hide");
	}
	
	function fnListcon() {
		var contData = {};
		if($("#contractType").val() == "10126"){													// 계약방식
			contData.soppNo = 1;
			contData.exContNo = 0;
		} else if($("#contractType").val() == "10127"){
			contData.soppNo = 0;
			contData.exContNo = 1;
		}
		contData.custNo = $("#custNo").val() ? $("#custNo").val() : 0;
		contData.ptncNo = $("#ptncNo").val() ? $("#ptncNo").val() : 0;
		contData.supplyNo = $("#supplyNo").val() ? $("#supplyNo").val() : 0;
		contData.buyrNo = $("#buyrNo").val() ? $("#buyrNo").val() : 0;
		contData.contTitle = $("#contTitle").val() ? $("#contTitle").val() : null;
		contData.contType = $("#contType").val() ? $("#contType").val() : null;						// 판매방식
		contData.targetDatefrom = $("#targetDatefrom").val() ? $("#targetDatefrom").val() : null;
		contData.targetDateto = $("#targetDateto").val() ? $("#targetDateto").val() : null;
		contData.userName = $("#userName").val() ? $("#userName").val() : null;
		contData.freemaintSdate = $("#freemaintSdate").val() ? $("#freemaintSdate").val() : null;
		contData.freemaintEdate = $("#freemaintEdate").val() ? $("#freemaintEdate").val() : null;
		
		fnSetList('${path}/cont/listcon.do', contData);
	}
	</script>
