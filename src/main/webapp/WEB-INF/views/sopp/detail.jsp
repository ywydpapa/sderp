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
<script src="${path}/assets/js/jquery/jquery.min.js"></script>
<!-- Editable-table js -->
<!--
<script type="text/javascript" src="${path}/assets/pages/edit-table/jquery.tabledit.js"></script>
<script type="text/javascript" src="${path}/assets/pages/edit-table/editable.js"></script>
-->
<!-- Page-header start 페이지 타이틀-->
<div class="page-header2">
	<div class="row align-items-end">
		<div class="col-lg-12">
			<div class="page-header-title">
				<div class="d-inline">
					영업기회조회
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
					<div class="cnt_wr">
						<div class="row">
							<div class="col-sm-12">
								<div class="card-block table-border-style">
									<div class="table-responsive">
										<table class="table table-sm bst02">
											<colgroup>
												<col width="15%" />
												<col width="35%" />
												<col width="15%" />
												<col width="35%" />
											</colgroup>
											<tbody>
											<tr>
												<th scope="row" class="requiredTextCss">영업기회명</th>
												<td colspan="3"><input type="text"
														class="form-control form-control-sm" id="soppTitle"
														name="soppTitle" value="${dto.soppTitle}"> <input
														type="hidden" id="soppNo" name="soppNo"
														value="${dto.soppNo}"></td>
											</tr>
											<tr>
												<th scope="row" class="requiredTextCss">담당사원</th>
												<td>
													<div class="input-group input-group-sm mb-0">
														<input type="text" class="form-control" name="userName"
															id="userName" value="${dto.userName}" readonly /> <input
															type="hidden" name="userNo" id="userNo"
															value="${dto.userNo}" /> <span class="input-group-btn">
																<button class="btn btn-primary sch-company"
																	data-remote="${path}/modal/popup.do?popId=user"
																	type="button" data-toggle="modal"
																	data-target="#userModal">
																	<i class="icofont icofont-search"></i>
																</button>
															</span>
														<div class="modal fade " id="userModal" tabindex="-1"
															 role="dialog">
															<div class="modal-dialog modal-80size" role="document">
																<div class="modal-content modal-80size">
																	<div class="modal-header">
																		<h4 class="modal-title"></h4>
																		<button type="button" class="close"
																				data-dismiss="modal" aria-label="Close">
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
												<th scope="row">거래처</th>
												<td>
													<div class="input-group input-group-sm mb-0">
														<input type="text" class="form-control" name="custName"
															   id="custName" value="${dto.custName}" readonly /> <input
															type="hidden" name="custNo" id="custNo"
															value="${dto.custNo}" /> <span class="input-group-btn">
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
												</td>
											</tr>
											<tr>
												<th scope="row">거래처 담당자</th>
												<td>
													<div class="input-group input-group-sm mb-0">
														<input type="text" class="form-control" name="custmemberName"  id="custmemberName" value="" readonly/>
														<input type="hidden" name="custmemberNo" id="custmemberNo" value="" />
														<span class="input-group-btn">
																<button class="btn btn-primary sch-partner"
																		data-remote="${path}/modal/popup.do?popId=custmem&compNo="
																		type="button" data-toggle="modal" data-target="#custmemberModal"
																		id="custmemberModalbtn">
																	<i class="icofont icofont-search"></i>
																</button>
															</span>
														<div class="modal fade " id="custmemberModal" tabindex="-1"
															 role="dialog">
															<div class="modal-dialog modal-80size" role="document">
																<div class="modal-content modal-80size">
																	<div class="modal-header">
																		<h4 class="modal-title">고객 검색</h4>
																		<button type="button" class="close"	data-dismiss="modal" aria-label="Close">
																			<span aria-hidden="true">&times;</span>
																		</button>
																	</div>
																	<div class="modal-body">
																		<h5>고객 목록</h5>
																		<p>거래처를 먼저 입력해주셔야 목록이 보입니다.</p>
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="close"	data-dismiss="modal" aria-label="Close">
																	</div>
																</div>
															</div>
														</div>
													</div>
												</td>
												<th scope="row">엔드유저</th>
												<td>
													<div class="input-group input-group-sm mb-0">
														<input type="text" class="form-control" name="ptncName"
															   id="ptncName" value="${dto.ptncName}" readonly /> <input
															type="hidden" name="ptncNo" id="ptncNo"
															value="${dto.ptncNo}" /> <span class="input-group-btn">
																<button class="btn btn-primary sch-partner"
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
																		<h4 class="modal-title"></h4>
																		<button type="button" class="close"
																				data-dismiss="modal" aria-label="Close">
																			<span aria-hidden="true">&times;</span>
																		</button>
																	</div>
																	<div class="modal-body">
																		<h5>협력사목록</h5>
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
											</tr>
											<tr>
												<th scope="row" class="requiredTextCss">진행단계</th>
												<td><select name="soppStatus" id="soppStatus"
														class="form-control form-control-sm"
														onchange="javascript:changeProbability()">
													<c:forEach var = "sstatuslist" items="${sstatuslist}">
														<option value="${sstatuslist.codeNo}">${sstatuslist.desc03}</option>
													</c:forEach>
												</select></td>
												<th scope="row">가능성</th>
												<td><span class="input_inline"><input
														type="text" class="form-control form-control-sm"
														id="soppSrate" name="soppSrate" value="${dto.soppSrate}"></span>
													%</td>
											</tr>
											<tr>
												<th scope="row">출처</th>
												<td><select name="soppSource" id="soppSource"
														class="form-control form-control-sm">
													<option value="">선택</option>
													<option value="201">인터넷</option>
													<option value="202">방송</option>
													<option value="203">신문</option>
													<option value="204">거래처</option>
													<option value="205">동료</option>
													<option value="206">기타</option>
												</select></td>
												<th scope="row">매출예정일</th>
												<td><input 	class="form-control form-control-sm col-md-8"
														name="soppTargetDate" id="soppTargetDate" type="date"
														value="${dto.soppTargetDate}"></td>
											</tr>
											<tr>
												<th scope="row">판매방식</th>
												<td><select name="soppType" id="soppType"
														class="form-control form-control-sm col-md-4">
													<option value>선택</option>
													<c:forEach var = "saleslist" items="${saleslist}">
														<option value="${saleslist.codeNo}" <c:if test="">selected</c:if>>${saleslist.desc03}</option>
													</c:forEach>
												</select></td>
												<th scope="row">예상매출</th>
												<td><span class="input_inline"><input style="text-align:right"
															type="text" class="form-control form-control-sm"
															id="soppTargetAmt" name="soppTargetAmt" value="<fmt:formatNumber value="${dto.soppTargetAmt}" pattern="#,###"/>"></span>원</td>
											</tr>
											<tr>
												<th scope="row">설명</th>
												<td colspan="3"><textarea name="soppDesc"
															id="soppDesc" rows="8" class="form-control">${dto.soppDesc}</textarea></td>
											</tr>
											<c:if test="${dto.sopp2regDatetime != null}">
												<tr>
													<th scope="row">승인/반려 의견<br/>(시간 : <fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${dto.sopp2regDatetime}"/>)</th>
													<td colspan="3"><textarea name="sopp2Desc" id="sopp2Desc" rows="8" class="form-control" readonly>${dto.sopp2Desc}</textarea></td>
												</tr>
											</c:if>
											</tbody>
										</table>

									</div>
								</div>
								<div class="btn_wr text-right mt-3">
									<button class="btn btn-md btn-success f-left"
											onClick="javascript:fnSetPage('${path}/sopp/list.do')">목록</button>
									<button class="btn btn-md btn-primary"
										onClick="fn_soppUpdate()">수정</button>
									<button class="btn btn-md btn-inverse">취소</button>
								</div>
							</div>
						</div>
					</div>
					<!--//영업기회등록-->
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
												<input type="hidden" id="productNo1" value=""/>
												<input type="text" class="form-control" name="product" id="data01Title" value="" />
												<span class="input-group-btn">
														<button class="btn btn-primary sch-company" onclick="fn_productdataTableReload()" type="button" data-toggle="modal" data-target="#productdataModal"><i class="icofont icofont-search"></i></button>
													</span>
											</div>
											<!--모달 팝업-->
											<div class="modal fade" id="productdataModal" tabindex="-1" role="dialog">
												<div class="modal-dialog modal-80size" role="document">
													<div class="modal-content modal-80size">
														<div class="modal-header">
															<h4 class="modal-title">상품목록</h4>
															<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<jsp:include page="/WEB-INF/views/modal/productdataListSalesInOut.jsp"/>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default waves-effect " data-dismiss="modal">Close</button>
														</div>
													</div>
												</div>
											</div>
											<!--//모달 팝업-->
										</td>
										<td><input type="text" id="data01Netprice" required	class="form-control form-control-sm" style="min-width: 80px;" /></td>
										<td><input type="text" id="data01Quanty" required class="form-control form-control-sm" style="min-width: 80px;" /></td>
										<td><input type="text" id="data01Amt" class="form-control form-control-sm" readonly placeholder="자동계산됩니다." style="min-width: 80px;" /></td>
										<td><input type="text" id="data01Remark" class="form-control form-control-sm" /></td>
										<td><button id="data01Addbtn" onClick="javascript:fn_data01Insert()">추가</button></td>
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
										<td><c:if test="${row.dataType eq '1101'}">매입 </c:if><c:if test="${row.dataType eq '1102'}">매출 </c:if></td>
										<td>${row.dataTitle}</td>
										<td style="text-align:right"><fmt:formatNumber value="${row.dataNetprice}" pattern="#,###"/></td>
										<td style="text-align:right"><fmt:formatNumber value="${row.dataQuanty}" pattern="#,###"/></td>
										<td style="text-align:right"><fmt:formatNumber value="${row.dataAmt}" pattern="#,###"/></td>
										<td>${row.dataRemark}</td>
										<td><button id="inoutDelbtn" onClick="javascript:fn_data01delete(${row.soppdataNo})">삭제</button></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							<div class="btn_wr text-right mt-3">
								<button class="btn btn-md btn-success f-left"
										onClick="javascript:fnSetPage('${path}/sopp/list.do')">목록</button>
							</div>
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
												<input type="hidden" id="productNo2" value=""/>
												<input type="text" class="form-control" name="product" id="data02Title" value="" />
												<span class="input-group-btn">
														<button class="btn btn-primary sch-company" onclick="fn_productdataTableReload2()" type="button" data-toggle="modal" data-target="#productdataModal2"><i class="icofont icofont-search"></i></button>
													</span>
											</div>
											<!--모달 팝업-->
											<div class="modal fade" id="productdataModal2" tabindex="-1" role="dialog">
												<div class="modal-dialog modal-80size" role="document">
													<div class="modal-content modal-80size">
														<div class="modal-header">
															<h4 class="modal-title">상품목록</h4>
															<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<%--<%@ include file="/WEB-INF/views/modal/productdataList.jsp" %>--%>
															<jsp:include page="/WEB-INF/views/modal/productdataListSalesEstimate.jsp"/>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default waves-effect " data-dismiss="modal">Close</button>
														</div>
													</div>
												</div>
											</div>
											<!--//모달 팝업-->

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
										<td><button id="data02Addbtn" onClick="javascript:fn_data02Insert()">추가</button></td>
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
										<td><c:if test="${row2.dataType eq '2201'}">상품 </c:if><c:if test="${row2.dataType eq '2202'}">서비스</c:if></td>
										<td>${row2.dataTitle}</td>
										<td style="text-align:right"><fmt:formatNumber value="${row2.dataNetprice}" pattern="#,###"/></td>
										<td style="text-align:right"><fmt:formatNumber value="${row2.dataQuanty}" pattern="#,###"/></td>
										<td style="text-align:right"><fmt:formatNumber value="${row2.dataAmt}" pattern="#,###"/></td>
										<td>${row2.dataRemark}</td>
										<td><button id="inoutDelbtn" onClick="javascript:fn_data02delete(${row2.soppdataNo})">삭제</button></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							<div class="btn_wr text-right mt-3">
								<button class="btn btn-md btn-success f-left"
										onClick="javascript:fnSetPage('${path}/sopp/list.do')">목록</button>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane " id="tab04" role="tabpanel">
					<button class="btn btn-md btn-primary" data-toggle="modal" data-target="#fileUploadModal" onClick="openFileUploadModal()" style="float: right; padding: 5px 12px; margin-bottom: 9px;">등록</button>
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
										<input type="file" name="file" id="fileUpload"/>
										<!-- <input type="button" id="uploadButton" value="등록" onclick="uploadFile()"/> -->
									</form>
									<br>
									파일 설명<input type="text" class="form-control" id="fileDesc"/>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default waves-effect "	onclick="uploadFile()">등록</button>
									<button type="button"
											class="btn btn-default waves-effect "
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
							<!-- </form> -->
							<div class="btn_wr text-right mt-3">
								<button class="btn btn-md btn-success f-left"
									onClick="javascript:fnSetPage('${path}/sopp/list.do')">목록</button>
							</div>
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
							<div class="btn_wr text-right mt-3">
								<button class="btn btn-md btn-success f-left"
									onClick="javascript:fnSetPage('${path}/sopp/list.do')">목록</button>
							</div>
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
							<div class="btn_wr text-right mt-3">
								<button class="btn btn-md btn-success f-left"
									onClick="javascript:fnSetPage('${path}/sopp/list.do')">목록</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Row end -->
</div>
<!--영업기회등록-->
<script>

	function fn_Reloaddata01(url, data){
		$("#inoutlist").empty();
		$("#inoutlist").load(url, data, function(){
			setTimeout(function(){
			}, 500);
		});
	}

	function fn_Reloaddata02(url, data){
		$("#qutylist").empty();
		$("#qutylist").load(url, data, function(){
			setTimeout(function(){
			}, 500);
		});
	}

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
	$('#buyrModal').on('show.bs.modal', function(e) {
		var button = $(e.relatedTarget);
		var modal = $(this);
		modal.find('.modal-body').load(button.data("remote"));
	});
	$('#ptncModal').on('show.bs.modal', function(e) {
		var button = $(e.relatedTarget);
		var modal = $(this);
		modal.find('.modal-body').load(button.data("remote"));
	});
	$('#productdataModal').on('show.bs.modal', function(e){
		var button = $(e.relatedTarget);
		var modal = $(this);
		modal.find('.modal-body').load(button.data("remote"));
	});
	$('#productdataModal2').on('show.bs.modal', function(e){
		var button = $(e.relatedTarget);
		var modal = $(this);
		modal.find('.modal-body').load(button.data("remote"));
	});
	$('#soppStatus').val('${dto.soppStatus}').prop("selected",true);
	$('#soppType').val('${dto.soppType}').prop("selected",true);
	$('#soppSource').val('${dto.soppSource}').prop("selected",true);

	// 기존상품외 임의로 기입
	$("#data01Title").on("change",function () {
		$("#productNo1").val("");
	});
	$("#data02Title").on("change",function () {
		$("#productNo2").val("");
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
	function fnSetBuyrData(a, b) {
		$("#buyrNo").val(b);
		$("#buyrName").val(a);
		$(".modal-backdrop").remove();
		$("#buyrModal").modal("hide");
	}
	function fnSetPtncData(a, b) {
		$("#ptncNo").val(b);
		$("#ptncName").val(a);
		$(".modal-backdrop").remove();
		$("#ptncModal").modal("hide");
	}
	function fnSetproductdata(a,b){
		$("#productNo1").val(a);
		$("#data01Title").val(b);
		//$(".modal-backdrop").remove();
		//$("#productdataModal").modal("hide");
		// 모달이 정상적으로 제거되지않아 close 버튼 트리거로 구성함
		$("#productdataModal").find(".modal-footer button").trigger('click');
	}
	function fnSetproductdata2(a,b){
		$("#productNo2").val(a);
		$("#data02Title").val(b);
		$("#productdataModal2").find(".modal-footer button").trigger('click');
	}

	function fn_soppUpdate() {
		var soppData = {};
		soppData.soppNo 		= $("#soppNo").val();
		soppData.soppTitle 		= $("#soppTitle").val();
		soppData.userNo 		= $("#userNo").val();
		soppData.custNo 		= $("#custNo").val();
		soppData.ptncNo 		= $("#ptncNo").val();
		soppData.soppStatus 	= $("#soppStatus").val();
		soppData.soppSrate 	    = !$("#soppSrate").val()?0:$("#soppSrate").val();
		soppData.soppSource 	= $("#soppSource").val();
		soppData.soppTargetDate	= $("#soppTargetDate").val();
		soppData.soppType 		= $("#soppType").val();
		var tamt = $("#soppTargetAmt").val();
		tamt = (tamt.replace(/,/g,""));
		soppData.soppTargetAmt 		= tamt;
		soppData.soppDesc 		= $("#soppDesc").val();

		$.ajax({ url: "${path}/sopp/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
			data: soppData , // HTTP 요청과 함께 서버로 보낼 데이터
			method: "POST", // HTTP 요청 메소드(GET, POST 등)
			dataType: "json" // 서버에서 보내줄 데이터의 타입
		}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
				.done(function(data) {
					if(data.code == 10001){
						alert("저장 성공");

					}else{
						alert("저장 실패");
					}
				}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
				.fail(function(xhr, status, errorThrown) {
					alert("통신 실패");
				});
	}

	function fn_data01Insert() {
		var data01Data = {};
		data01Data.soppNo 		= $("#soppNo").val();
		data01Data.catNo	 	= '100001';
		var productNo			= $("#productNo1").val();
		if(productNo != ""){
			data01Data.productNo	= productNo;
		} else {
			data01Data.productNo	= 0;
		}
		data01Data.dataTitle 	= $("#data01Title").val();
		data01Data.dataType		= $("#data01Type").val();
		data01Data.dataNetprice	= $("#data01Netprice").val().replace(/[\D\s\._\-]+/g, "");
		data01Data.dataQuanty	= $("#data01Quanty").val().replace(/[\D\s\._\-]+/g, "");
		data01Data.dataAmt 		= $("#data01Amt").val().replace(/[\D\s\._\-]+/g, "");
		data01Data.dataRemark 	= $("#data01Remark").val();

		$.ajax({ url: "${path}/sopp/insertdata01.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
			data: data01Data , // HTTP 요청과 함께 서버로 보낼 데이터
			method: "POST", // HTTP 요청 메소드(GET, POST 등)
			dataType: "json" // 서버에서 보내줄 데이터의 타입
		}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
				.done(function(data) {
					if(data.code == 10001){
						alert("저장 성공");
						var url="${path}/sopp/inoutlist/"+$("#soppNo").val();
						fn_Reloaddata01(url);
					}else{
						alert("저장 실패");
					}
				}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
				.fail(function(xhr, status, errorThrown) {
					alert("통신 실패");
				});
	}

	function fn_data02Insert() {
		var data02Data = {};
		data02Data.soppNo 		= $("#soppNo").val();
		data02Data.catNo	 	= '100004';
		var productNo			= $("#productNo2").val();
		if(productNo != ""){
			data02Data.productNo	= productNo;
		} else {
			data02Data.productNo	= 0;
		}
		data02Data.dataTitle 	= $("#data02Title").val();
		data02Data.dataType		= $("#data02Type").val();
		data02Data.dataNetprice	= $("#data02Netprice").val().replace(/[\D\s\._\-]+/g, "");
		data02Data.dataQuanty	= $("#data02Qty").val().replace(/[\D\s\._\-]+/g, "");
		data02Data.dataAmt 		= $("#data02Amt").val().replace(/[\D\s\._\-]+/g, "");
		data02Data.dataRemark 	= $("#data02Remark").val();

		$.ajax({ url: "${path}/sopp/insertdata02.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
			data: data02Data , // HTTP 요청과 함께 서버로 보낼 데이터
			method: "POST", // HTTP 요청 메소드(GET, POST 등)
			dataType: "json" // 서버에서 보내줄 데이터의 타입
		}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
				.done(function(data) {
					if(data.code == 10001){
						alert("저장 성공");
						var url="${path}/sopp/qutylist/"+$("#soppNo").val();
						fn_Reloaddata02(url);
					}else{
						alert("저장 실패");
					}
				}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
				.fail(function(xhr, status, errorThrown) {
					alert("통신 실패");
				});
	}




	function fn_data01delete(soppdataNo) {
		var msg = "선택한 건을 삭제하시겠습니까?";
		if( confirm(msg) ){
		$.ajax({ url: "${path}/sopp/deletedata01.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: {soppdataNo : soppdataNo}, // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
				.done(function(data) {
					if(data.code == 10001){
						alert("삭제 성공");
						var url="${path}/sopp/inoutlist/"+$("#soppNo").val();
						fn_Reloaddata01(url);
					}else{
						alert("삭제 실패");
					}
				}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
				.fail(function(xhr, status, errorThrown) {
					alert("통신 실패");
				});
		}
	}

	function fn_data02delete(soppdataNo) {
		var msg = "선택한 건을 삭제하시겠습니까?";
		if( confirm(msg) ){
		$.ajax({ url: "${path}/sopp/deletedata02.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: {soppdataNo : soppdataNo}, // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
				.done(function(data) {
					if(data.code == 10001){
						alert("삭제 성공");
						var url="${path}/sopp/qutylist/"+$("#soppNo").val();
						fn_Reloaddata02(url);
					}else{
						alert("삭제 실패");
					}
				}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
				.fail(function(xhr, status, errorThrown) {
					alert("통신 실패");
				});
		}
	}



	function uploadFile() {
		var uploadForm = $('#uploadForm')[0];
		var uploadData = new FormData(uploadForm);

		if(!uploadData.get('file').name) {
			alert('파일을 선택해주세요');

		}else {
			uploadData.append('fileDesc', $('#fileDesc').val());
			$.ajax({
				url : "${path}/sopp/uploadfile/"+$("#soppNo").val(),
				method : "POST",
				data : uploadData,
				contentType : false,
				processData : false
			}).done(function(data){
				if(data.code == 10001){
					alert('파일 업로드 완료');
				}else {
					alert('파일 업로드 실패');
				}
			}).fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});

		}

	}

	function downloadFile(fileId) {
		var downloadData = {};
		downloadData.soppNo = $("#soppNo").val();
		downloadData.fileId = fileId;

		$.ajax({
			url : "${path}/sopp/downloadfile",
			data : downloadData,
			method : "POST",
			xhrFields: {
				responseType: 'blob'
			},
		}).done(function(data, status, xhr){
			var fileName = xhr.getResponseHeader('content-disposition');
			var link = document.createElement('a');
			link.href = window.URL.createObjectURL(data);
			link.download = fileName;
			link.click();

		}).fail(function(xhr, status, errorThrown) {
			alert("통신 실패");
		});
	}

	function openFileUploadModal() {

	}

	$(function(){
		$('#data01Netprice,#data01Quanty').on('keyup',function(){

			var sum1 = parseInt($("#data01Netprice").val().replace(/[\D\s\._\-]+/g, "") || 0 );
			var sum2 = parseInt($("#data01Quanty").val().replace(/[\D\s\._\-]+/g, "") || 0 );

			var sum = sum1 * sum2;
			$("#data01Netprice").val(sum1.toLocaleString("en-US"));
			$("#data01Quanty").val(sum2.toLocaleString("en-US"));
			$("#data01Amt").val(sum.toLocaleString("en-US"));
		});
		$('#data02Netprice,#data02Qty').on('keyup',function(){

			var sum1 = parseInt($("#data02Netprice").val().replace(/[\D\s\._\-]+/g, "") || 0 );
			var sum2 = parseInt($("#data02Qty").val().replace(/[\D\s\._\-]+/g, "") || 0);

			var sum = sum1 * sum2;
			$("#data02Netprice").val(sum1.toLocaleString("en-US"));
			$("#data02Qty").val(sum2.toLocaleString("en-US"));
			$("#data02Amt").val(sum.toLocaleString("en-US"));
		});

		var $input = $("#soppTargetAmt");

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