<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<script type="text/javascript">
	if("${contDto.soppNo}" != "0") {
		$('.contDetailSopp').show();
		$('.contDetailCont').hide();
	}else {
		$('.contDetailSopp').hide();
		$('.contDetailCont').show();
	}

	$('input[name=contractType]').on('click', function() {
		if ($(this).val() == 'NEW') {
			$('.contDetailSopp').show();
			$('.contDetailCont').hide();
		} else {
			$('.contDetailSopp').hide();
			$('.contDetailCont').show();
		}
	});
</script>
<!-- Page-header start 페이지 타이틀-->
<div class="page-header2">
	<div class="row align-items-end">
		<div class="col-lg-12">
			<div class="page-header-title">
				<div class="d-inline">
					계약 조회
				</div>
			</div>
		</div>
	</div>
</div>
<!--Page-header end 페이지 타이틀 -->

<!--Page-header end 페이지 타이틀 -->
<div class="cnt_wr">
	<!-- Row start -->
	<div class="row">
		<div class="col-lg-12 col-xl-12">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs  tabs" role="tablist">
				<li class="nav-item"><a class="nav-link active"
										data-toggle="tab" href="#tab01" role="tab">기본정보</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
										href="#tab02" role="tab">매입매출 내역</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
										href="#tab03" role="tab">견적 내역</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
										href="#tab04" role="tab">파일첨부</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
										href="#tab05" role="tab">기술지원 내역</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
										href="#tab06" role="tab">영업활동 내역</a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content tabs m-t-20">
				<div class="tab-pane active" id="tab01" role="tabpanel">
				<!--계약등록-->
				<div class="cnt_wr">
					<h5 class="cont_title"><i class="icofont icofont-square-right"></i>계약정보</h5>
					<div class="row">
						<div class="col-sm-12">
							<div class="card-block table-border-style">
								<div class="table-responsive">
									<table class="table table-sm bst02">
										<colgroup>
											<col width="15%" />
											<col width="35%"/>
											<col width="15%"/>
											<col width="35%"/>
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">등록구분</th>
												<td colspan="3">
													<div class="form-radio">
														<form>
															<div class="radio radio-inline">
																<label> <input type="radio" name="contractType" value="NEW" <c:if test="${contDto.soppNo != 0}">checked</c:if>> <i class="helper"></i>판매계약</label>
															</div>
															<div class="radio radio-inline">
																<label> <input type="radio" name="contractType" value="OLD" <c:if test="${contDto.exContNo != 0}">checked</c:if>> <i class="helper"></i>유지보수</label>
															</div>
														</form>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row" class="requiredTextCss">계약명</th>
												<td colspan="3">
													<input type="text" class="form-control form-control-sm" id="contTitle" name="contTitle" value="${contDto.contTitle }">
												</td>
											</tr>
											<tr>
												<th scope="row" >계약번호</th>
												<td>
													<input type="text" id="contNo" name="contNo" class="form-control " readonly value="${contDto.contNo}">
												</td>
												<th class="contDetailSopp requiredTextCss">영업기회</th>
												<td class="contDetailSopp">
													<div class="input-group input-group-sm mb-0">
														<input type="text" class="form-control" name="soppTitle" id="soppTitle" value="${contDto.soppTitle}" />
														<input type="hidden" class="form-control" name="soppNo" id="soppNo" value="${contDto.soppNo}" />
														<span class="input-group-btn">
															<button class="btn btn-primary sch-opportunity2"
																data-remote="${path}/modal/popup.do?popId=sopp"
																type="button" data-toggle="modal" data-target="#soppModal">
																<i class="icofont icofont-search"></i>
															</button>
														</span>
														<div class="modal fade " id="soppModal" tabindex="-1"
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
																		<h5>영업기회목록</h5>
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
												</td>
												<th class="contDetailCont requiredTextCss">계약</th>
												<td class="contDetailCont">
													<div class="input-group input-group-sm mb-0">
														<input type="text" class="form-control" name="oldContTitle" id="oldContTitle" value="${contDto.exContName}"/>
														<input type="hidden" name="oldContNo" id="oldContNo" value="${contDto.exContNo}" />
														<span class="input-group-btn">
															<button class="btn btn-primary sch-opportunity2" data-remote="${path}/modal/popup.do?popId=cont"
																	type="button" data-toggle="modal" data-target="#contModal">
																<i class="icofont icofont-search"></i>
															</button>
														</span>
														<div class="modal fade " id="contModal" tabindex="-1"
															 role="dialog">
															<div class="modal-dialog modal-80size" role="document">
																<div class="modal-content modal-80size">
																	<div class="modal-header">
																		<h4 class="modal-title"></h4>
																		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																			<span aria-hidden="true">&times;</span>
																		</button>
																	</div>
																	<div class="modal-body">
																		<h5>계약 목록</h5>
																		<p>Loading!!!</p>
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row" class="requiredTextCss">담당사원</th>
												<td>
													<div class="input-group input-group-sm mb-0">
														<input type="text" class="form-control" name="userName" id="userName" value="${contDto.userName}" />
														<input type="hidden" class="form-control" name="userNo" id="userNo" value="${contDto.userNo}" />
														 <span class="input-group-btn">
															<button class="btn btn-primary sch-company"
																data-remote="${path}/modal/popup.do?popId=user"
																type="button" data-toggle="modal" data-target="#userModal">
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
																		<button type="button"
																			class="btn btn-default waves-effect "
																			data-dismiss="modal">Close</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</td>
												<th scope="row">판매방식</th>
												<td>
													<select name="contType" class="form-control form-control-sm" id="contType">
														<option value="">선택</option>
														<c:forEach var ="contType" items="${contType}">
															<option value = "${contType.codeNo}" <c:if test="${contDto.contType == contType.codeNo}">selected</c:if>>${contType.desc03}</option>
														</c:forEach>
													</select>
												</td>


											</tr>
											<tr>
												<th class="requiredTextCss">거래처</th>
												<td>
													<div class="input-group input-group-sm mb-0">
														<input type="text" class="form-control" name="custName" id="custName" value="${contDto.custName}" />
														<input type="hidden" name="custNo" id="custNo" value="${contDto.custNo}" /> <span class="input-group-btn">
															<button class="btn btn-primary sch-company"
																	data-remote="${path}/modal/popup.do?popId=cust"
																	type="button" data-toggle="modal" data-target="#custModal">
																<i class="icofont icofont-search"></i>
															</button>
														</span>
														<div class="modal fade " id="custModal" tabindex="-1"
															 role="dialog">
															<div class="modal-dialog modal-80size" role="document">
																<div class="modal-content modal-80size">
																	<div class="modal-header">
																		<h4 class="modal-title">거래처검색</h4>
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
																		<button type="button"
																				class="btn btn-default waves-effect "
																				data-dismiss="modal">Close</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</td>
												<th>거래처 담당자</th>
												<td>
													<div class="input-group input-group-sm mb-0">
														<input type="text" id="custmemberName" name="custmemberName" class="form-control " value="${contDto.custmemberName}">
														<input type="hidden" id="custmemberNo" name="custmemberNo" class="form-control " value="${contDto.custmemberNo}">
														<span class="input-group-btn">
															<button class="btn btn-primary sch-company btn-sm" type="button"><i class="icofont icofont-search"></i></button>
														</span>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row">엔드유저</th>
												<td>
													<div class="input-group input-group-sm mb-0">
														<input type="text" class="form-control" id="endCustName" value="${contDto.buyrName}" />
														<input type="hidden" id="endCustNo" value="${contDto.buyrNo}" />
														<span class="input-group-btn">
															<button class="btn btn-primary sch-partner" data-remote="${path}/modal/popup.do?popId=endCust" type="button" data-toggle="modal" data-target="#endCustModal">
																<i class="icofont icofont-search"></i>
															</button>
														</span>
														<div class="modal fade " id="endCustModal" tabindex="-1" role="dialog">
															<div class="modal-dialog modal-80size" role="document">
																<div class="modal-content modal-80size">
																	<div class="modal-header">
																		<h4 class="modal-title"></h4>
																		<button type="button" class="close" onclick="$('#endCustModal').modal('hide');" aria-label="Close">
																			<span aria-hidden="true">&times;</span>
																		</button>
																	</div>
																	<div class="modal-body">
																		<h5>엔드유저 목록</h5>
																		<p>Loading!!!</p>
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-default waves-effect" onclick="$('#endCustModal').modal('hide');">Close</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</td>
												<th>엔드유저 담당자</th>
												<td>
													<div class="input-group input-group-sm mb-0">
														<input type="text" id="endCustmemberName" name="endCustmemberName" class="form-control " value="${contDto.buyrMemberName}">
														<input type="hidden" id="endCustmemberNo" name="endCustmemberNo" class="form-control " value="${contDto.buyrMemberNo}">
														<span class="input-group-btn">
															<button class="btn btn-primary sch-company btn-sm"  data-remote="${path}/modal/popup.do?popId=endCustmem&compNo=" type="button" data-toggle="modal" data-target="#endCustmemberModal" id="endCustmemberModalbtn" data-whatever="">
																<i class="icofont icofont-search"></i>
															</button>
														</span>
														<div class="modal fade " id="endCustmemberModal" tabindex="-1" role="dialog">
															<div class="modal-dialog modal-80size" role="document">
																<div class="modal-content modal-80size">
																	<div class="modal-header">
																		<h4 class="modal-title">고객 검색</h4>
																		<button type="button" class="close" onclick="$('#endCustmemberModal').modal('hide');" aria-label="Close">
																			<span aria-hidden="true">&times;</span>
																		</button>
																	</div>
																	<div class="modal-body">
																		<h5>엔드유저 고객 목록</h5>
																		<p>엔드유저를 먼저 입력해주셔야 목록이 보입니다.</p>
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-default waves-effect" onclick="$('#endCustmemberModal').modal('hide');">Close</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row">발주일자</th>
												<td>
													<div class="input-group input-group-sm mb-0">
														<input class="form-control form-control-sm col-sm-12" type="date" id="contOrddate" name="contOrddate" value="${contDto.contOrddate}">
													</div>
												</td>
												<th>공급일자</th>
												<td>
													<div class="input-group input-group-sm mb-0">
														<input class="form-control form-control-sm col-sm-12" type="date" id="supplyDate" name="supplyDate" value="${contDto.supplyDate}" >
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row">검수일자</th>
												<td>
													<div class="input-group input-group-sm mb-0">
														<input class="form-control form-control-sm col-sm-12" type="date" id="delivDate" name="delivDate" value="${contDto.delivDate}">
													</div>
												</td>
												<th scope="row" class="contDetailSopp">무상 유지보수일자</th>
												<td class="contDetailSopp">
													<div class="input-group input-group-sm mb-0">
														<input class="form-control form-control-sm col-sm-6 m-r-5" type="date" id="freemaintSdate" value="${contDto.freemaintSdate}"> ~ <input class="form-control form-control-sm col-sm-6 m-l-5" type="date" id="freemaintEdate" value="${contDto.freemaintEdate}">
													</div>
												</td>
												<th scope="row" class="contDetailCont">유상 유지보수일자</th>
												<td class="contDetailCont">
													<div class="input-group input-group-sm mb-0">
														<input class="form-control form-control-sm col-sm-6 m-r-5" type="date" id="paymaintSdate" value="${contDto.paymaintSdate}"> ~ <input class="form-control form-control-sm col-sm-6 m-l-5" type="date" id="paymaintEdate" value="${contDto.paymaintEdate}">
													</div>
												</td>
											</tr>
											<tr>
												<th >계약금액</th>
												<td>
													<input style="text-align: right;" type="text" id="contAmt" name="contAmt" class="form-control " value="<fmt:formatNumber value="${contDto.contAmt}" pattern="#,###"/>">
												</td>
												<th >VAT 포함여부</th>
												<td>
													 <select name="vatYn" id="vatYn" class="form-control form-control-sm">
														 <option value="Y" <c:if test="${contDto.vatYn eq 'Y'}">selected</c:if> >Yes</option>
														<option value="N" <c:if test="${contDto.vatYn eq 'N'}">selected</c:if> >No</option>
													</select>
												</td>
											</tr>
											<tr>
												<th scope="row">매출이익</th>
												<td>
													<input style="text-align: right;" type="text" id="net_profit" name="net_profit" class="form-control" value="<fmt:formatNumber value="${contDto.net_profit}" pattern="#,###"/>">
												</td>
												<th>지역</th>
												<td>
													<select name="select" id="contArea" class="form-control form-control-sm" >
														<option value="">선택</option>
														<c:forEach var="contArea" items="${contArea}">
															<option value="${contArea.codeNo}" <c:if test="${contDto.contArea eq contArea.codeNo}">selected</c:if>>${contArea.desc03}</option>
														</c:forEach>
													</select>
												</td>
											</tr>
											<tr>
												<th scope="row">내용</th>
												<td colspan="3">
													<textarea name="contDesc" id="contDesc" rows="8" class="form-control">${contDto.contDesc}</textarea>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				</div>
				<div class="tab-pane " id="tab02" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive" style="overflow-x: hidden;">
							<form name="form2" method="post" onsubmit="return false;">
								<table class="table table-sm bst02" id="addinout">
									<colgroup>
										<col width="5%" />
										<col width="30%" />
										<col width="15%" />
										<col width="10%" />
										<col width="20%" />
										<col width="15%" />
										<col width="5%" />
									</colgroup>
									<thead>
									<tr>
										<th class="text-center">구분(매입/매출)</th>
										<th class="text-center">항목</th>
										<th class="text-center">단가</th>
										<th class="text-center">수량</th>
										<th class="text-center">금액</th>
										<th class="text-center">비고</th>
										<th class="text-center">삭제</th>
									</tr>
									</thead>
									<tbody>
									<tr class="item1">
										<td><select id="data01Type" name="data01Type">
											<option value="1101">매입</option>
											<option value="1102">매출</option>
										</select></td>
										<td>
											<div class="input-group input-group-sm mb-0">
												<input type="hidden" id="productNo1" value="" /> <input
													type="text" class="form-control" name="product"
													id="data01Title" value="" /> <span
													class="input-group-btn">
														<button class="btn btn-primary sch-company"
																onclick="fn_productdataTableReload()" type="button"
																data-toggle="modal" data-target="#productdataModal">
															<i class="icofont icofont-search"></i>
														</button>
													</span>
											</div> <!--모달 팝업-->
											<div class="modal fade" id="productdataModal" tabindex="-1"
												 role="dialog">
												<div class="modal-dialog modal-80size" role="document">
													<div class="modal-content modal-80size">
														<div class="modal-header">
															<h4 class="modal-title">상품목록</h4>
															<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<jsp:include
																	page="/WEB-INF/views/modal/productdataListSalesInOut.jsp" />
														</div>
														<div class="modal-footer">
															<button type="button"
																	class="btn btn-default waves-effect "
																	data-dismiss="modal">Close</button>
														</div>
													</div>
												</div>
											</div> <!--//모달 팝업-->
										</td>
										<td><input type="text" id="data01Netprice" required
												   class="form-control form-control-sm"
												   style="min-width: 80px;" /></td>
										<td><input type="text" id="data01Quanty" required
												   class="form-control form-control-sm"
												   style="min-width: 80px;" /></td>
										<td><input type="text" id="data01Amt"
												   class="form-control form-control-sm" readonly
												   placeholder="자동계산됩니다." style="min-width: 80px;" /></td>
										<td><input type="text" id="data01Remark"
												   class="form-control form-control-sm" /></td>
										<td><button id="data01Addbtn"
													onClick="javascript:fn_data01Insert()">추가</button></td>
									</tr>
									</tbody>
								</table>
							</form>

							<table class="table table-sm bst02" id="inoutlist">
								<colgroup>
									<col width="5%" />
									<col width="30%" />
									<col width="15%" />
									<col width="10%" />
									<col width="20%" />
									<col width="15%" />
									<col width="5%" />
								</colgroup>
								<thead>
								<tr>
									<th class="text-center">구분(매입/매출)</th>
									<th class="text-center">항목</th>
									<th class="text-center">단가</th>
									<th class="text-center">수량</th>
									<th class="text-center">금액</th>
									<th class="text-center">비고</th>
									<th class="text-center">삭제</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach var="row" items="${dtodata01}">
									<tr class="item1">
										<td><c:if test="${row.dataType eq '1101'}">매입 </c:if>
											<c:if test="${row.dataType eq '1102'}">매출 </c:if></td>
										<td>${row.dataTitle}</td>
										<td style="text-align: right"><fmt:formatNumber
												value="${row.dataNetprice}" pattern="#,###" /></td>
										<td style="text-align: right"><fmt:formatNumber
												value="${row.dataQuanty}" pattern="#,###" /></td>
										<td style="text-align: right"><fmt:formatNumber
												value="${row.dataAmt}" pattern="#,###" /></td>
										<td>${row.dataRemark}</td>
										<td><button id="inoutDelbtn"
													onClick="javascript:fn_data01delete(${row.soppdataNo})">삭제</button></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="tab-pane " id="tab03" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive" style="overflow-x: hidden;">
							<form name="form2" method="post" onsubmit="return false;">
								<table class="table table-sm bst02">
									<tbody>
									<tr>
										<th scope="row">견적추가</th>
									</tr>
									</tbody>
								</table>
								<table class="table table-sm bst02" id="addquty">
									<colgroup>
										<col width="5%" />
										<col width="30%" />
										<col width="15%" />
										<col width="10%" />
										<col width="20%" />
										<col width="15%" />
										<col width="5%" />
									</colgroup>
									<thead>
									<tr>
										<th class="text-center">구분(상품/서비스)</th>
										<th class="text-center">항목</th>
										<th class="text-center">단가</th>
										<th class="text-center">수량</th>
										<th class="text-center">금액</th>
										<th class="text-center">비고</th>
										<th class="text-center">추가</th>
									</tr>
									</thead>
									<tbody>
									<tr class="item1">
										<td><select id="data02Type">
											<option value="2201">상품</option>
											<option value="2202">서비스</option>
										</select></td>
										<td>
											<div class="input-group input-group-sm mb-0">
												<input type="hidden" id="productNo2" value="" /> <input
													type="text" class="form-control" name="product"
													id="data02Title" value="" /> <span
													class="input-group-btn">
														<button class="btn btn-primary sch-company"
																onclick="fn_productdataTableReload2()" type="button"
																data-toggle="modal" data-target="#productdataModal2">
															<i class="icofont icofont-search"></i>
														</button>
													</span>
											</div> <!--모달 팝업-->
											<div class="modal fade" id="productdataModal2" tabindex="-1"
												 role="dialog">
												<div class="modal-dialog modal-80size" role="document">
													<div class="modal-content modal-80size">
														<div class="modal-header">
															<h4 class="modal-title">상품목록</h4>
															<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<%--<%@ include file="/WEB-INF/views/modal/productdataList.jsp" %>--%>
															<jsp:include
																	page="/WEB-INF/views/modal/productdataListSalesEstimate.jsp" />
														</div>
														<div class="modal-footer">
															<button type="button"
																	class="btn btn-default waves-effect "
																	data-dismiss="modal">Close</button>
														</div>
													</div>
												</div>
											</div> <!--//모달 팝업-->

										</td>
										<td><input type="text"
												   class="form-control form-control-sm" id="data02Netprice"
												   style="min-width: 80px;" /></td>
										<td><input type="text"
												   class="form-control form-control-sm" id="data02Qty"
												   style="min-width: 80px;" /></td>
										<td><input type="text"
												   class="form-control form-control-sm" id="data02Amt"
												   style="min-width: 80px;" readonly /></td>
										<td><input type="text" id="data02Remark"
												   class="form-control form-control-sm" /></td>
										<td><button id="data02Addbtn"
													onClick="javascript:fn_data02Insert()">추가</button></td>
									</tr>
									</tbody>
								</table>

							</form>
							<table class="table table-sm bst02">
								<tbody>
								<tr>
									<th scope="row">견적목록</th>
								</tr>
								</tbody>
							</table>
							<table class="table table-sm bst02" id="qutylist">
								<colgroup>
									<col width="5%" />
									<col width="30%" />
									<col width="15%" />
									<col width="10%" />
									<col width="20%" />
									<col width="15%" />
									<col width="5%" />
								</colgroup>
								<thead>
								<tr>
									<th class="text-center">구분(상품/서비스)</th>
									<th class="text-center">항목</th>
									<th class="text-center">단가</th>
									<th class="text-center">수량</th>
									<th class="text-center">금액</th>
									<th class="text-center">비고</th>
									<th class="text-center">삭제</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach var="row2" items="${dtodata02}">
									<tr class="item1">
										<td><c:if test="${row2.dataType eq '2201'}">상품 </c:if>
											<c:if test="${row2.dataType eq '2202'}">서비스</c:if></td>
										<td>${row2.dataTitle}</td>
										<td style="text-align: right"><fmt:formatNumber
												value="${row2.dataNetprice}" pattern="#,###" /></td>
										<td style="text-align: right"><fmt:formatNumber
												value="${row2.dataQuanty}" pattern="#,###" /></td>
										<td style="text-align: right"><fmt:formatNumber
												value="${row2.dataAmt}" pattern="#,###" /></td>
										<td>${row2.dataRemark}</td>
										<td><button id="inoutDelbtn"
													onClick="javascript:fn_data02delete(${row2.soppdataNo})">삭제</button></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="tab-pane " id="tab04" role="tabpanel">
					<button class="btn btn-md btn-primary" data-toggle="modal"
							data-target="#fileUploadModal" onClick="openFileUploadModal()"
							style="float: right; padding: 5px 12px; margin-bottom: 9px;">등록</button>
					<div class="modal fade " id="fileUploadModal" tabindex="-1"
						 role="dialog">
						<div class="modal-dialog modal-80size" role="document">
							<div class="modal-content modal-80size">
								<div class="modal-header">
									<h4 class="modal-title">파일 등록</h4>
									<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form id="uploadForm">
										<input type="file" name="file" id="fileUpload" />
										<!-- <input type="button" id="uploadButton" value="등록" onclick="uploadFile()"/> -->
									</form>
									<br> 파일 설명<input type="text" class="form-control"
													 id="fileDesc" />
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default waves-effect "
											onclick="uploadFile()">등록</button>
									<button type="button" class="btn btn-default waves-effect "
											data-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>
					<div class="card-block table-border-style">
						<div class="table-responsive" style="overflow-x: hidden;">
							<!-- <form name="form2" method="post" onsubmit="return false;"> -->
							<table class="table table-sm bst02">
								<colgroup>
									<col width="25%" />
									<col width="45%" />
									<col width="20%" />
									<col width="10%" />
								</colgroup>
								<thead>
								<th class="text-center">일자</th>
								<th class="text-center">파일명</th>
								<th class="text-center">파일설명</th>
								</thead>
								<tbody>
								<c:forEach var="row2" items="${soppFiles}">
									<tr class="item1">
										<td>${row2.uploadDate}</td>
										<td><a href="javascript:downloadFile('${row2.fileId}');">${row2.fileName}</a></td>
										<td>${row2.fileDesc}</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="tab-pane " id="tab05" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive" style="overflow-x: hidden;">
							<form name="form2" method="post" onsubmit="return false;">
								<table class="table table-sm bst02">
									<colgroup>
										<col width="10%" />
										<col width="20%" />
										<col width="40%" />
										<col width="20%" />
										<col width="10%" />
									</colgroup>
									<thead>
									<th class="text-center">일자</th>
									<th class="text-center">지원형태</th>
									<th class="text-center">장소</th>
									<th class="text-center">담당자</th>
									<th class="text-center">비고</th>
									</thead>
									<tbody>
									<c:forEach var="row2" items="${techdinsopp}">
										<tr class="item1">
											<td>${row2.techdFrom}</td>
											<td>${row2.techdTypeN}</td>
											<td>${row2.techdPlace}</td>
											<td>${row2.userName}</td>
											<td>${row2.techdDesc}</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
				<div class="tab-pane " id="tab06" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive" style="overflow-x: hidden;">
							<form name="form2" method="post" onsubmit="return false;">
								<table class="table table-sm bst02" id="example">
									<colgroup>
										<col width="10%" />
										<col width="30%" />
										<col width="20%" />
										<col width="10%" />
										<col width="10%" />
										<col width="20%" />
									</colgroup>
									<thead>
									<tr>
										<th class="text-center">일자</th>
										<th class="text-center">활동종류</th>
										<th class="text-center">내역</th>
										<th class="text-center">담당자</th>
										<th class="text-center">장소</th>
										<th class="text-center">비용</th>
									</tr>
									</thead>
									<tbody>
									<c:forEach var="row2" items="${salesinsopp}">
										<tr class="item1">
											<td>${row2.salesFrdatetime}</td>
											<td>${row2.salesTypeN}</td>
											<td>${row2.salesDesc}</td>
											<td>${row2.userName}</td>
											<td>${row2.salesPlace}</td>
											<td>경비관련 연결예정</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="btn_wr text-right mt-3">
				<button class="btn btn-md btn-success f-left" onClick="fnSetPage('${path}/cont/list.do')">계약목록</button>
				<button class="btn btn-md btn-primary" onClick="fn_SaveCont()">계약정보 수정</button>
				<button class="btn btn-md btn-inverse" onClick="fnSetPage('${path}/cont/list.do')">취소</button>
			</div>
<!--//계약등록-->

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
		$('#ptncModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		$('#soppModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		$('#supplyModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		$('#contModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});


		function fnSetCustData(a, b) {
			$("#custName").val(a);
			$("#custNo").val(b);
			$(".modal-backdrop").remove();
			$("#custModal").modal("hide");
		}
    	
		function fnSetUserData(a, b) {
			$("#userNo").val(a);
			$("#userName").val(b);
			$(".modal-backdrop").remove();
			$("#userModal").modal("hide");
		}
		
		function fnSetPtncData(a, b) {
			$("#ptncNo").val(b);
			$("#ptncName").val(a);
			$(".modal-backdrop").remove();
			$("#ptncModal").modal("hide");
		}
		
		function fnSetSoppData(a, b) {
			$("#soppNo").val(b);
			$("#soppTitle").val(a);
			$(".modal-backdrop").remove();
			$("#soppModal").modal("hide");
		}

		function fnSetSupplyData(a, b) {
			$("#supplyNo").val(b);
			$("#supplyName").val(a);
			$(".modal-backdrop").remove();
			$("#supplyModal").modal("hide");
		}

		function fnSetContData(a,b,c,d){
			$("#oldContTitle").val(a);
			$("#oldContNo").val(b);
			$(".modal-backdrop").remove();
			$("#contModal").modal("hide");
		}

		function fnToggleLayer() {
			$(".techdDetailCont").each(function () {
				if($(this).css('display') == 'none'){
					$(this).show();
				} else {
					$(this).hide();
				}
			});
		}

		function fn_SaveCont() {
			var contData = {};
			contData.contNo 					= $("#contNo").val();
			var contractType					= $("input[name='contractType']:checked").val();	// 신규 영업지원 or 기존계약
			if(contractType == 'NEW'){
				contData.soppNo					= $("#soppNo").val();			// 영업기회
				contData.exContNo				= 0;							// 기존계약
				contData.cntrctMth				= ${contractType[0].codeNo};
			} else {
				contData.soppNo					= 0;							// 영업기회
				contData.exContNo				= $("#oldContNo").val();		// 기존계약
				contData.cntrctMth				= ${contractType[1].codeNo};
			}
			contData.contTitle 				= $("#contTitle").val(); 		// 계약명
			if($("#userName").val() != "")			contData.userNo		 	= Number($("#userNo").val());			// 담당사원
			var net_profit = Number($("#net_profit").val().replace(/[\D\s\._\-]+/g, "")); // 매출이익
			if (net_profit >= 0){
				contData.net_profit = net_profit;
			} else {
				contData.net_profit = 0;
			}
			if($("#custName").val() != "")			contData.custNo 		= Number($("#custNo").val());			// 거래처
			if($("#custmemberName").val() != "")	contData.custmemberNo	= Number($("#custmemberNo").val());		// 거래처 담당자
			if($("#endCustName").val() != "") 		contData.buyrNo			= Number($("#endCustNo").val());		// 엔드유저
			if($("#endCustmemberName").val() != "") contData.buyrMemberNo	= Number($("#endCustmemberNo").val());	// 엔드유저 담당자
			if($("#contOrddate").val() != "")		contData.contOrddate 			= $("#contOrddate").val();		// 발주일자
			if($("#supplyDate").val() != "") 		contData.supplyDate = $("#supplyDate").val();		// 공급일자
			if($("#delivDate").val() != "")  		contData.delivDate	 = $("#delivDate").val();		// 검수일자

			var contAmt = Number($("#contAmt").val().replace(/[\D\s\._\-]+/g, ""));			// 계약금액
			if (contAmt >= 0){
				contData.contAmt = contAmt;
			} else {
				contData.contAmt = 0;
			}
			if($("#freemaintSdate").val() != "") contData.freemaintSdate = $("#freemaintSdate").val();	// 무상유지보수 시작일자
			if($("#freemaintEdate").val() != "") contData.freemaintEdate = $("#freemaintEdate").val();	// 무상유지보수 마감일자
			if($("#vatYn").val() != "")		contData.vatYn					= $("#vatYn").val();			// VAT 포함여부 (기본값 : Y)
			if($("#contArea").val() != "") 		contData.contArea 				= $("#contArea").val();			// 지역
			if($("#contType").val() != "")		contData.contType 				= $("#contType").val();			// 판매방식
			if($("#contDesc").val() != "")		contData.contDesc			 	= $("#contDesc").val();			// 계약내용

			if (!contData.contTitle) {
				alert("계약명 제목을 입력하십시오.");
				return;
			} else if (!contData.custNo){
				alert("거래처를 입력하십시오.");
				return;
			}

			$.ajax({ url: "${path}/cont/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
						data: contData , // HTTP 요청과 함께 서버로 보낼 데이터 
						method: "POST", // HTTP 요청 메소드(GET, POST 등) 
						dataType: "json" // 서버에서 보내줄 데이터의 타입 
					}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
					.done(function(data) {
						if(data.code == 10001){
							alert("저장 성공");
							fnSetPage('${path}/cont/list.do');
						}else{
							alert("저장 실패");
						}
					}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
					.fail(function(xhr, status, errorThrown) { 
						alert("통신 실패");
					});
		}

		$(document).ready(function() {
			if($("#soppNo").val() != '0') {
				$($(".techdDetailCont")[2]).hide();
				$($(".techdDetailCont")[3]).hide();
			} else if($("#exContNo").val() != '0') {
				$($(".techdDetailCont")[0]).hide();
				$($(".techdDetailCont")[1]).hide();
			}

			$('input[name=contractType]').on('change', function() {
				fnToggleLayer();
			});

			var $input = $("#contAmt");

			// 이벤트 시작 ==========================================================================
			// 이벤트시 동작
			$input.on("keyup", function (event) {
				// 긁어와서 이벤트 체크
				var selection = window.getSelection().toString();
				if (selection !== '') return;
				if ($.inArray(event.keyCode, [38, 40, 37, 39]) !== -1) return;

				// 긁어오는값을 콤마를 제거해서 숫자변환
				var $this = $(this);
				var input = $this.val();
				var input = input.replace(/[\D\s\._\-]+/g, "");
				input = input ? parseInt(input, 10) : 0;
				var ti = input;

				// 데이터 반환
				$this.val(function () {
					return (input === 0) ? "0" : input.toLocaleString("en-US");
				});
			});
		});
	</script>

