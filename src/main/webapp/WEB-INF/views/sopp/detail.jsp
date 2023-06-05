<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top.jsp"/>

<style>
	table > tbody > tr > td > .productInputDiv > .select2-container{
		width: 20% !important;
	}
	
	.select2-container .select2-selection--single{
		height: 100% !important;
	}
</style>

<div id="main_content">
	<!-- Page-header start 페이지 타이틀-->
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">영업기회조회</div>
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
				<ul class="nav nav-tabs  tabs" role="tablist" id="tablist">
					<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#tab01" role="tab">기본정보</a></li>
					<c:if test="${sessionScope.userNo eq  dto.userNo || sessionScope.userNo eq dto.secondUserNo || sessionScope.userRole eq 'ADMIN'}">
						<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab02" role="tab" id="dataType01_tab02">매입매출 내역(${fn:length(dtodata01)})</a></li>
					</c:if>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab03" role="tab" id="dataType01_tab03">견적 내역(${fn:length(estList)})</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab04" role="tab">파일첨부(${fn:length(soppFiles)})</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab05" role="tab">기술지원 내역(${fn:length(techdinsopp)})</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab06" role="tab">영업활동 내역(${fn:length(salesinsopp)})</a></li>
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
													<col width="5%"/>
													<col width="15%"/>
													<col width="5%"/>
													<col width="15%"/>
													<col width="5%"/>
													<col width="15%"/>
													<col width="5%"/>
													<col width="15%"/>
												</colgroup>
												<tbody>
													<tr>
														<th scope="row" class="requiredTextCss">담당사원</th>
														<td>
															<div class="input-group input-group-sm mb-0">
																<input type="text" class="form-control" name="userName" id="userName" autocomplete="off" data-completeSet="true" value="${dto.userName}" readonly> 
																<input type="hidden" name="userNo" id="userNo" value="${dto.userNo}" /> 
															</div>
														</td>
														<th scope="row" class="requiredTextCss">(부)담당자</th>
														<td>
															<select class="form-control" id="secondUserName" name="secondUserName" onchange="autoCompleteSelect(this);">
																<option value="">선택</option>
																<c:forEach var="row" items="${listUser}">
																	<option data-no="${row.userNo}" value="${row.userName}" <c:if test="${row.userNo eq dto.secondUserNo}">selected</c:if>>${row.userName}</option>
																</c:forEach>
															</select>
															<input type="hidden" class="form-control" name="secondUserNo" id="secondUserNo" value="${dto.secondUserNo}" />
														</td>
														<th class="requiredTextCss" scope="row">매출처</th>
														<td>
															<div class="input-group input-group-sm mb-0">
																<select class="form-control" id="custName" name="custName" onchange="autoCompleteSelect(this);">
																	<option value="">선택</option>
																	<c:forEach var="row" items="${listCust}">
																		<option data-no="${row.custNo}" value="${row.custName}" <c:if test="${row.custName eq dto.custName}">selected</c:if>>${row.custName}</option>
																	</c:forEach>
																</select>
																<input type="hidden" name="custNo" id="custNo" value="${dto.custNo}" /> 
																<%-- <input type="text" class="form-control" name="custName" id="custName" autocomplete="off" value="${dto.custName}"> --%> 
															</div>
														</td>
														<th scope="row">매출처 담당자</th>
														<td>
															<div class="input-group input-group-sm mb-0">
																<select class="form-control" id="custmemberName" name="custmemberName" onchange="autoCompleteSelect(this);">
																	<option value="">선택</option>
																	<c:forEach var="row" items="${listCustMember}">
																		<option data-no="${row.custData03no}" value="${row.custMname}" <c:if test="${row.custMname eq dto.custMemberName}">selected</c:if>>${row.custMname}</option>
																	</c:forEach>
																</select>
																<input type="hidden" name="custmemberNo" id="custmemberNo" value="${cto.custMemberNo}" />
																<%-- <input type="text" class="form-control" name="custmemberName" id="custmemberName" autocomplete="off" value="${dto.custMemberName}"> --%>
															</div>
														</td>
													</tr>
													
													<tr>
														<th class="requiredTextCss" scope="row">엔드유저</th>
														<td>
															<div class="input-group input-group-sm mb-0">
																<select class="form-control" id="endCustName" name="endCustName" onchange="autoCompleteSelect(this);">
																	<option value="">선택</option>
																	<c:forEach var="row" items="${listCust}">
																		<option data-no="${row.custNo}" value="${row.custName}" <c:if test="${row.custName eq dto.buyrName}">selected</c:if>>${row.custName}</option>
																	</c:forEach>
																</select>
																<input type="hidden" id="endCustNo" value="${dto.buyrNo}" />
																<%-- <input type="text" class="form-control" id="endCustName" value="${dto.buyrName}"> --%>
															</div>
														</td>
														<th scope="row" class="requiredTextCss">진행단계</th>
														<td><select name="soppStatus" id="soppStatus" class="form-control form-control-sm" <c:if test="${dto.soppStatus > 10185}">readonly</c:if>>
																<c:if test="${dto.soppStatus >= 10182 && dto.soppStatus < 10185}">
																	<option value="10292" selected>계약중</option>
																</c:if>
																<c:if test="${dto.soppStatus < 10182 || dto.soppStatus >= 10185}">
																    <c:forEach var="sstatuslist" items="${sstatuslist}">
																		<c:if test="${sstatuslist.codeNo < 10182}">
																			<option value="${sstatuslist.codeNo}">${sstatuslist.desc03}</option>
																		</c:if>
																	</c:forEach>
																</c:if>
														</select></td>
														<th scope="row">가능성</th>
														<td class="text-right">
														<span class="input_inline">
														<input type="text" class="form-control form-control-sm text-right"
																id="soppSrate" name="soppSrate" value="${dto.soppSrate}"></span>
															%</td>
															<th class="requiredTextCss" scope="row">계약구분</th>
														<td><select name="cntrctMth" id="cntrctMth"
															class="form-control form-control-sm">
																<option value="">선택</option>
																<option value="10247" <c:if test="${dto.cntrctMth eq 10247}">selected</c:if> >판매계약</option>
																<option value="10248" <c:if test="${dto.cntrctMth eq 10248}">selected</c:if> >유지보수</option>
																<option value="10254" <c:if test="${dto.cntrctMth eq 10254}">selected</c:if> >임대계약</option>
														</select></td>
													</tr>
													
													<tr>
														<th scope="row">매출예정일</th>
														<td><input
															class="form-control form-control-sm"
															name="soppTargetDate" id="soppTargetDate" type="date" max="9999-12-30"
															value="${dto.soppTargetDate}"></td>
															<th class="requiredTextCss" scope="row">판매방식</th>
														<td><select name="soppType" id="soppType"
															class="form-control form-control-sm">
																<option value="">선택</option>
																<c:forEach var="saleslist" items="${saleslist}">
																	<option value="${saleslist.codeNo}"
																		<c:if test="">selected</c:if>>${saleslist.desc03}</option>
																</c:forEach>
														</select></td>
														<th scope="row">예상매출</th>
														<td class="text-right">
															<span class="input_inline">
																<input style="text-align: right" type="text" class="form-control form-control-sm" id="soppTargetAmt" name="soppTargetAmt" onkeyup="moneyFormatInput(this);" value="<fmt:formatNumber value="${dto.soppTargetAmt}" pattern="#,###"/>">
															</span>원
														</td>
														<th class="requiredTextCss" id="Maintenance_name" style="display: none;">유지보수 기간</th>
														<td id="Maintenance_input" style="display: none; line-height: 30px;">
															<div class="input-group input-group-sm mb-0">
																<input class="form-control form-control-sm col-sm-6 m-r-5" type="date" max="9999-12-30" id="maintenance_S" value="${dto.maintenance_S}"> ~ <input class="form-control form-control-sm col-sm-6 m-l-5" type="date" max="9999-12-31" id="maintenance_E" value="${dto.maintenance_E}">
															</div>
														</td>	
													</tr>
													<tr>
												 		<th scope="row" class="requiredTextCss">카테고리</th>
														<td colspan="7">
															<div class="input-group m-0 productInputDiv">
																<select onchange="changeSelect(this);">
																	<option value="productName">항목선택</option>
																	<option value="inputText">직접입력</option>
																</select>
																<select id="productName" name="productName" onchange="productSelect(this);">
																	<option value="">선택</option>
																	<c:forEach var="row" items="${listProduct}">
																		<option data-no="${row.productNo}" value="${row.custName} : ${row.productName}">${row.productName}(${row.custName})</option>
																	</c:forEach>
																</select>
																<div class="input-group m-0" style="display:none; width: 20%;">
																	<input type="text" class="form-control" id="inputText">
																	<button type="button" class="btn btn-sm btn-primary" onclick="inputSelect(this);">추가</button>
																</div>
																<div class="form-control text-break w-100 categories" style="display: block; word-break: break-all; white-space: normal;"></div>
															</div>
														</td>
													</tr>
													<tr>
														<th class="requiredTextCss" scope="row">유지보수대상</th>
														<td>
															<select class="form-control form-control-sm" name="maintenanceTarget" id="maintenanceTarget">
																<option value="N">No</option>
																<option value="Y">Yes</option>
															</select>
														</td>
														<th scope="row" class="requiredTextCss">영업기회명</th>
														<td colspan="6">
															<input type="text" class="form-control form-control-sm" id="soppTitle" data-completeSet="true" name="soppTitle" value="${dto.soppTitle}"> 
															<input type="hidden" id="soppNo" name="soppNo" value="${dto.soppNo}">
														</td>
													</tr>
													<tr>
														<th scope="row">설명</th>
														<td colspan="7"><textarea name="soppDesc"
																id="soppDesc" rows="8" class="form-control">${dto.soppDesc}</textarea></td>
													</tr>
													<c:if test="${dto.sopp2regDatetime != null}">
														<tr>
															<th scope="row">승인/반려 의견<br />(시간 :
																<fmt:parseDate value="${dto.sopp2regDatetime}" var="sopp2regDatetime" pattern="yyyy-MM-dd HH:mm:ss"/>
																<fmt:formatDate value="${sopp2regDatetime}" pattern="yyyy-MM-dd HH:mm:ss"/>
																)
															</th>
															<td colspan="7"><textarea name="sopp2Desc" id="sopp2Desc" rows="8" class="form-control" readonly>${dto.sopp2Desc}</textarea></td>
														</tr>
													</c:if>
												</tbody>
											</table>
										</div>
									</div>
									<div class="btn_wr text-right mt-3" id="tab01_bottom">
										<button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/sopp/list.do'">목록</button>
										<c:if test="${(dto.userNo eq sessionScope.userNo || dto.secondUserNo eq sessionScope.userNo) && dto.soppStatus < 10182 && dto.cntrctMth ne 10248}">
											<button class="btn btn-md btn-danger" onClick="fn_Contreq()">계약요청</button>
											<button class="btn btn-md btn-danger" onClick="fn_Contfail()">계약실패</button>
										</c:if>
										<c:if test="${dto.userNo eq sessionScope.userNo || dto.secondUserNo eq sessionScope.userNo}">
											<button class="btn btn-md btn-danger" onClick="fn_soppDelete()">삭제</button>
										</c:if>
										<%-- <c:if test="${dto.userNo eq sessionScope.userNo || sessionScope.userRole eq 'ADMIN' || dto.secondUserNo eq sessionScope.userNo}"> --%>
											<button class="btn btn-md btn-primary" onClick="fn_soppUpdate()">수정</button>
											<button class="btn btn-md btn-inverse" onClick="javascript:location='${path}/sopp/list.do'">취소</button>
										<%-- </c:if> --%>
									</div>
								</div>
							</div>
						</div>
						<!--//영업기회등록-->
					</div>
					<div class="tab-pane " id="tab02" role="tabpanel">
						<div class="card-block table-border-style">
							<div class="table-responsive">
								<jsp:include page="/WEB-INF/views/module/inputSet/inputSetProductSalesInOut4.jsp"/>
								<jsp:include page="/WEB-INF/views/sopp/inoutlist4.jsp"/>
							</div>
						</div>
					</div>
					<div class="tab-pane " id="tab03" role="tabpanel">
						<div class="card-block table-border-style">
							<div class="table-responsive" style="overflow-x: hidden;">
								<jsp:include page="/WEB-INF/views/module/inputSet/inputSetProductSalesEstimate2.jsp"/>
								<jsp:include page="/WEB-INF/views/sopp/qutylist2.jsp"/>
							</div>
						</div>
					</div>
					<div class="tab-pane " id="tab04" role="tabpanel">
						<jsp:include page="filelist.jsp"/>
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
											<tr>
												<th class="text-center">일자</th>
												<th class="text-center">지원형태</th>
												<th class="text-center">장소</th>
												<th class="text-center">담당자</th>
												<th class="text-center">비고</th>
											</tr>
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
											<col width="20%" />
											<col width="10%" />
											<col width="10%" />
										</colgroup>
										<thead>
											<tr>
												<th class="text-center">일자</th>
												<th class="text-center">활동종류</th>
												<th class="text-center">내역</th>
												<th class="text-center">비고</th>
												<th class="text-center">담당자</th>
												<th class="text-center">장소</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="row2" items="${salesinsopp}">
												<tr class="item1">
													<td>${row2.salesFrdatetime}</td>
													<td>${row2.salesTypeN}</td>
													<td>${row2.salesDesc}</td>
													<td>${row2.salesTitle}</td>
													<td>${row2.userName}</td>
													<td>${row2.salesPlace}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</form>
							</div>
						</div>
					</div>
					<div class="btn_wr text-right mt-3" id="tab_common_bottom">
						<button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/sopp/list.do'">목록</button>
						<button class="btn btn-md btn-danger activeDeleteBtn" onClick="fn_data01delete1()">선택 삭제</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Row end -->
	</div>
	<!--영업기회등록-->
	<script>
		function categorySet(){
			let html = "";
			let categories = "${dto.categories}";
			let categoryArray = categories.split(",");
			
			if(categoryArray[0] !== ""){
				for(let i = 0; i < categoryArray.length; i++){
					html += "<button class=\"btn btn-sm btn-secondary mr-1\" onclick=\"selectDelete(this)\" style=\"line-height: 0;\">" + categoryArray[i] + "</button>";
					saved.categories.push(categoryArray[i]);
				}
			}
			
			$(".categories").html(html);
		}
		
		if($("#cntrctMth").val() == '10248'){
			$('#Maintenance_name').show();
			$('#Maintenance_input').show();
		};
		$("#cntrctMth").on('change', function(){
			if($("#cntrctMth").val() == '10248'){
				$('#Maintenance_name').show();
				$('#Maintenance_input').show();
			}else{
				$('#Maintenance_name').hide();
				$('#Maintenance_input').hide();
			}
		});
		
		$("#maintenance_S").change(function(){
			var dateValue = $(this).val();
			var dateValueArr = dateValue.split("-");
			var dateValueCom = new Date(dateValueArr[0], parseInt(dateValueArr[1])-1, dateValueArr[2]);
			var EdateValue = $("#maintenance_E").val();
			var EdateDateArr = EdateValue.split("-");
			var EdateDateCom = new Date(EdateDateArr[0], parseInt(EdateDateArr[1])-1, EdateDateArr[2]);
			
			if(EdateValue == ""){
				dateValueCom.setDate(dateValueCom.getDate()+1);
			}else if(dateValueCom.getTime() > EdateDateCom.getTime()){
				alert("시작일이 종료일보다 클 수 없습니다.");
				dateValueCom.setDate(dateValueCom.getDate()+1);
			}else{
				return null;
			}
			
			var year = dateValueCom.getFullYear();
			var month = dateValueCom.getMonth()+1;
			var day = dateValueCom.getDate();
			
			if(month < 10){
				month = "0" + month;
			}
			
			if(day < 10){
				day = "0" + day;
			}
			
			$("#maintenance_E").val(year + "-" + month + "-" + day);
		});
		
		$("#maintenance_E").change(function(){
			var SdateValue = $("#maintenance_S").val();
			var SdateValueArr = SdateValue.split("-");
			var SdateValueCom = new Date(SdateValueArr[0], parseInt(SdateValueArr[1])-1, SdateValueArr[2]);
			var thisDateValue = $(this).val();
			var thisDateArr = thisDateValue.split("-");
			var thisDateCom = new Date(thisDateArr[0], parseInt(thisDateArr[1])-1, thisDateArr[2]);
			
			if(SdateValue == ""){
				thisDateCom.setDate(thisDateCom.getDate()-1);
			}else if(SdateValueCom.getTime() > thisDateCom.getTime()){
				alert("종료일이 시작일보다 작을 수 없습니다.");
				thisDateCom.setDate(thisDateCom.getDate()-1);
			}else{
				return null;
			}
			
			var year = thisDateCom.getFullYear();
			var month = thisDateCom.getMonth()+1;
			var day = thisDateCom.getDate();
			
			if(month < 10){
				month = "0" + month;
			}
			
			if(day < 10){
				day = "0" + day;
			}
			
			$("#maintenance_S").val(year + "-" + month + "-" + day);
		});
	
		$("#tablist > li:nth-child(1)").click(function (){
			$("#tab01_bottom").show();
			$("#tab_common_bottom").hide();
		});

		$("#tablist > li:nth-child(n+2)").click(function (){
			$("#tab01_bottom").hide();
			$("#tab_common_bottom").show();
		});

		function fnSetCustmereData(a, b) {
			$("#custmemberNo").val(a);
			$("#custmemberName").val(b);
			$(".modal-backdrop").remove();
			$("#custmemberModal").modal("hide");
		}
		
		function fn_Reloaddata01(url, data){
			$("#inoutlist").empty();
			$("#inoutlistSum").remove();
			$("#inoutlist").load(url, data, function(){
				setTimeout(function(){
				}, 500);
			});
		}

		function fn_Reloaddata02(url, data){
			$("#qutylist").empty();
			$("#qutylistSum").remove();
			$("#qutylist").load(url, data, function(){
				setTimeout(function(){
				}, 500);
			});
		}

		$('#vatBModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		
		$('#vatSModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		
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
		$('#custmemberModal').on('show.bs.modal', function(e) {
			var custNo = $("#custNo").val();
			var url = '${path}/modal/popup.do?popId=custmem&compNo=' + custNo;
			$("#custmemberModalbtn").data("remote",url);

			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		$('#endCustModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});

		/* var soppStatusSelected = '${dto.soppStatus}';
		if (soppStatusSelected != '' && soppStatusSelected != '0') 	$('#soppStatus').val('${dto.soppStatus}').prop("selected",true);
		else $('#soppStatus option:eq(0)').prop("selected",true); */

		var soppTypeSelected = '${dto.soppType}';
		if (soppTypeSelected != '' && soppTypeSelected != '0') $('#soppType').val('${dto.soppType}').prop("selected",true);
		else $('#soppType').val("").prop("selected",true);

		var soppSourceSelected = '${dto.soppSource}';
		if (soppSourceSelected != '' && soppSourceSelected != '0') 	$('#soppSource').val('${dto.soppSource}').prop("selected",true);
		else $('#soppSource').val("").prop("selected",true);

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
			$("#productdataModal1").find(".modal-footer button").trigger('click');
		}
		function fnSetproductdata2(a,b){
			$("#productNo2").val(a);
			$("#data02Title").val(b);
			$("#productdataModal2").find(".modal-footer button").trigger('click');
		}
		function fnSetEndCustData(a, b) {
			$("#endCustNo").val(b);
			$("#endCustName").val(a);
			$("#endCustmemberModalbtn").data('whatever', b);
			$(".modal-backdrop").remove();
			$("#endCustModal").modal("hide");
		}
		
		function fn_soppUpdate(){
			var soppData = {};
			var soppStatus = "${dto.soppStatus}";
			
			soppData.soppNo 		= $("#soppNo").val();
			soppData.soppTitle 		= $("#soppTitle").val();
			if($("#userName").val() != "")  	soppData.userNo 	= Number($("#userNo").val());
			if($("#custName").val() != "")	soppData.custNo 		= Number($("#custNo").val());
			if($("#endCustName").val() != "")	soppData.buyrNo 	= Number($("#endCustNo").val());
			if($("#soppSrate").val() != "")	soppData.soppSrate 		= Number($("#soppSrate").val());
			if($("#soppType").val() != "")	soppData.soppType 		= Number($("#soppType").val());
			if($("#cntrctMth").val() != "")	soppData.cntrctMth 		= Number($("#cntrctMth").val());
			if($("#custmemberName").val() != "") soppData.custMemberNo = Number($("#custmemberNo").val());
			if($("#secondUserName").val() !== "") soppData.secondUserNo = $("#secondUserNo").val();
			
			if($("#soppStatus").val() != ""){
				if($("#soppStatus").val() === "10292"){
					soppData.soppStatus  = 	soppStatus;
				}else{
					soppData.soppStatus  =  $("#soppStatus").val();
				}
			}
			
			if($("#cntrctMth").val() == '10248'){
				if($('#maintenance_S').val() == '' || $('#maintenance_S').val() == null){
					alert("유지보수 시작일을 확인하십시오.");
					return;
				}else if($('#maintenance_E').val() == '' || $('#maintenance_E').val() == null){
					alert("유지보수 마감일을 확인하십시오.");
					return;
				}else{
					soppData.maintenance_S = $('#maintenance_S').val();
					soppData.maintenance_E = $('#maintenance_E').val();	
				}
			}
			
			if($("#soppSource").val() != "") soppData.soppSource 	= $("#soppSource").val();
			if($("#soppTargetDate").val() != "") soppData.soppTargetDate	= $("#soppTargetDate").val();
			if($("#soppTargetAmt").val() != "") soppData.soppTargetAmt 	= $("#soppTargetAmt").val().replace(/[\D\s\._\-]+/g, "");
			if(tinyMCE.get("soppDesc").getContent() != "") soppData.soppDesc 		= tinyMCE.get("soppDesc").getContent();
			if($("#maintenanceTarget").val() != "") soppData.maintenanceTarget = $("#maintenanceTarget").val();
			if(saved.categories.length > 0) soppData.categories = saved.categories.toString();

			if ($("#soppTitle").val() === "") {
				alert("영업기회명을 입력해주세요.");
				$("#soppTitle").focus();
				return;
			} else if($("#custName").val() === ""){
				alert("매출처를 입력해주세요..");
				$("#custName").focus();
				return;
			} else if($("#endCustName").val() === ""){
				alert("엔드유저를 선택해주십시오.");
				$("#endCustName").focus();
				return;
			} else if(saved.categories.length < 1){
				alert("카테고리를 선택해주세요.");
				return;
			} else if(!soppData.cntrctMth){
				alert("계약구분을 선택해주십시오.");
				return;
			} else if(!soppData.soppType){
				alert("판매방식을 선택해주십시오.");
				return;
			} else if($("#secondUserName").val() === ""){
				alert("부(담당자) 입력해주세요.");
				$("#secondUserName").focus();
				return;
			} else{
				$.ajax({ url: "${path}/sopp/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
					data: soppData , // HTTP 요청과 함께 서버로 보낼 데이터
					method: "POST", // HTTP 요청 메소드(GET, POST 등)
					dataType: "json" // 서버에서 보내줄 데이터의 타입
				}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
				.done(function(data) {
					if(data.code == 10001){
						alert("저장 성공");
						var url = '${path}/sopp/list.do';
						location.href = url;
					}else{
						alert("저장 실패");
					}
				}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
				.fail(function(xhr, status, errorThrown) {
					alert("통신 실패");
				});
			}
		}

		function fn_Contreq() {
			var msg = "계약요청을 진행하시겠습니까?";
			var dataLength = "${fn:length(dtodata01)}";
			if (confirm(msg)){
				if ($("#soppTitle").val() === "") {
					alert("영업기회명을 입력하십시오.");
					return;
				} else if($("#custName").val() === ""){
					alert("매출처를 선택해주십시오.");
					return;
				} else if($("#endCustName").val() === ""){
					alert("엔드유저를 선택해주십시오.");
					return;
				} else if($("#cntrctMth").val() === ""){
					alert("계약구분을 선택해주십시오.");
					return;
				} else if($("#soppType").val() === ""){
					alert("판매방식을 선택해주십시오.");
					return;
				} else if($("#soppTargetAmt").val() == 0){
					alert("예상매출을 입력해주십시오.");
					return;
				} else if(dataLength == 0){
					alert("매입매출을 등록해주십시오.");
					return;
				}
				
				var soppData = {};
				soppData.soppNo 		= $("#soppNo").val();
				soppData.soppTargetAmt 	= $("#soppTargetAmt").val().replace(/[\D\s\._\-]+/g, "");
				soppData.soppSrate 		= '100';
				soppData.soppStatus 	= '10182';
				$.ajax({ url: "${path}/sopp/updateSoppStatus.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
					data: soppData , // HTTP 요청과 함께 서버로 보낼 데이터
					method: "POST", // HTTP 요청 메소드(GET, POST 등)
					dataType: "json" // 서버에서 보내줄 데이터의 타입
				}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
					.done(function(data) {
						if(data.code == 10001){
							alert("계약요청 완료");
							var url = '${path}/sopp/list.do';
							location.href = url;
						}else{
							alert("저장 실패");
						}
					}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
					.fail(function(xhr, status, errorThrown) {
						alert("통신 실패");
					});
				}
		}

		function fn_Contfail() {
			var msg = "계약실패건으로 처리하시겠습니까?";
			if (confirm(msg)){
				if ($("#soppTitle").val() === "") {
					alert("영업기회명을 입력하십시오.");
					return;
				} else if($("#custName").val() === ""){
					alert("매출처를 선택해주십시오.");
					return;
				} else if($("#endCustName").val() === ""){
					alert("엔드유저를 선택해주십시오.");
					return;
				} else if($("#cntrctMth").val() === ""){
					alert("계약구분을 선택해주십시오.");
					return;
				} else if($("#soppType").val() === ""){
					alert("판매방식을 선택해주십시오.");
					return;
				}
				var soppData = {};
				soppData.soppNo 		= $("#soppNo").val();
				soppData.soppSrate 		= '0';
				soppData.soppStatus 	= '10185';
				$.ajax({ url: "${path}/sopp/updateSoppStatus.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
					data: soppData , // HTTP 요청과 함께 서버로 보낼 데이터
					method: "POST", // HTTP 요청 메소드(GET, POST 등)
					dataType: "json" // 서버에서 보내줄 데이터의 타입
				}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
					.done(function(data) {
						if(data.code == 10001){
							alert("계약실패 저장 완료");
							var url = '${path}/sopp/list.do';
							location.href = url;
						}else{
							alert("저장 실패");
						}
					}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
					.fail(function(xhr, status, errorThrown) {
						alert("통신 실패");
					});
				}
		}

		function fn_soppDelete(){
			var soppData = {};
			soppData.soppNo 		= $("#soppNo").val();
			$.ajax({ url: "${path}/sopp/delete.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: soppData , // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
				dataType: "json" // 서버에서 보내줄 데이터의 타입
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
					alert("삭제 성공");
					var url = '${path}/sopp/list.do';
					location.href = url;
				}else{
					alert("삭제 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
			.fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});
		}

		function fn_data02delete(soppdataNo) {
			var msg = "선택한 건을 삭제하시겠습니까?";
			if( confirm(msg) ){
				$.ajax({
					url: "${path}/sopp/deletedata02.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
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

		$(document).ready(function(){
			var $input = $("#soppTargetAmt");
			var soppStatus = "${dto.soppStatus}";
			var maintenanceTarget = "${dto.maintenanceTarget}";
			saved.categories = [];
			
			$("#soppStatus").val(soppStatus);
			$("#maintenanceTarget").val(maintenanceTarget);
			
			// 이벤트 시작 ==========================================================================
			// 이벤트시 동작
			/* $input.on("keyup", function (event) {
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
			}); */
			$("#tab_common_bottom").hide();
			
			var lastTab = localStorage.getItem('lastTab');
			
			if (lastTab) {
			  	$('[href="' + lastTab + '"]').tab('show');
			  	localStorage.clear();
			  	
			  	if(lastTab === "#tab02"){
				  	$("#tab_common_bottom").show();
			  	}
			}
			
			categorySet();
		});
	</script>
</div>
<jsp:include page="../body-bottom.jsp"/>