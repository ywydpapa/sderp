<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<c:if test="${empty simple}">
<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top.jsp"/>

<div id="main_content">
</c:if>
	<!-- Page-header start 페이지 타이틀-->
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">기술지원 상세</div>
				</div>
			</div>
		</div>
	</div>
	<!--Page-header end 페이지 타이틀 -->
	<!--기술지원 대상등록-->
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
									<th scope="row" class="requiredTextCss">등록구분<input hidden value="${dto.techdNo}" id="techdNo"></th>
									<td colspan="3">
										<div class="form-radio">
											<form>
												<div class="radio radio-inline">
													<label style="margin-top: 10px;"> <input type="radio" name="contractType" value="NEW" <c:if test="${dto.cntrctMthN == '판매계약'}">checked</c:if>> <i class="helper"></i>신규 영업지원</label>
												</div>
												<div class="radio radio-inline">
													<label> <input type="radio" name="contractType" value="ING" <c:if test="${dto.cntrctMthN == '유지보수'}">checked</c:if>> <i class="helper"></i>유지보수 </label>
												</div>
											</form>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row" class="requiredTextCss">기술지원 요청명</th>
									<td><input type="text" class="form-control form-control-sm" id="techdTitle" name="techdTitle" placeholder="기술지원 요청명을 입력하십시오" value="${dto.techdTitle}" required></td>
									<th scope="row" class="techdDetailSopp requiredTextCss">영업기회</th>
									<td class="techdDetailSopp">
										<div class="input-group input-group-sm mb-0">
											<select class="form-control" id="soppTitle" name="soppTitle" onchange="autoCompleteSelect(this);">
												<option value="">선택</option>
												<c:forEach var="row" items="${listSopp}">
													<option data-no="${row.soppNo}" value="${row.soppTitle}" <c:if test="${row.soppTitle eq dto.soppTitle}">selected</c:if>>${row.soppTitle}</option>
												</c:forEach>
											</select>
											<input type="hidden" name="soppNo" id="soppNo" value="${dto.soppNo}" />
											<%-- <input type="text" class="form-control" name="soppTitle" id="soppTitle" value="${dto.soppTitle}" autocomplete="off" /> --%>
											<%-- <span class="input-group-btn">
												<button class="btn btn-primary sch-opportunity2" data-remote="${path}/modal/popup.do?popId=sopp" type="button" data-toggle="modal" data-target="#soppModal">
													<i class="icofont icofont-search"></i>
												</button>
											</span>
											<div class="modal fade" id="soppModal" tabindex="-1" role="dialog">
												<div class="modal-dialog modal-80size" role="document">
													<div class="modal-content modal-80size">
														<div class="modal-header">
															<h4 class="modal-title"></h4>
															<button type="button" class="close" onclick="$('#soppModal').modal('hide');"
																	aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<h5>영업기회목록</h5>
															<p>Loading!!!</p>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default waves-effect"	onclick="$('#soppModal').modal('hide');">닫기</button>
														</div>
													</div>
												</div>
											</div> --%>
										</div>
									</td>
									<th scope="row" class="techdDetailCont requiredTextCss">계약</th>
									<td class="techdDetailCont">
										<div class="input-group input-group-sm mb-0">
											<select class="form-control" id="contTitle" name="contTitle" onchange="autoCompleteSelect(this);">
												<option value="">선택</option>
												<c:forEach var="row" items="${listCont}">
													<option data-no="${row.contNo}" value="${row.contTitle}" <c:if test="${row.contTitle eq dto.contTitle}">selected</c:if>>${row.contTitle}</option>
												</c:forEach>
											</select>
											<input type="hidden" name="contNo" id="contNo" value="${dto.contNo}" />
											<%-- <input type="text" class="form-control" name="contTitle" id="contTitle" value="${dto.contTitle}" autocomplete="off" /> --%>
											<%-- <span class="input-group-btn">
												<button class="btn btn-primary sch-opportunity2" data-remote="${path}/modal/popup.do?popId=cont" type="button" data-toggle="modal" data-target="#contModal">
													<i class="icofont icofont-search"></i>
												</button>
											</span>
											<div class="modal fade " id="contModal" tabindex="-1" role="dialog">
												<div class="modal-dialog modal-80size" role="document">
													<div class="modal-content modal-80size">
														<div class="modal-header">
															<h4 class="modal-title"></h4>
															<button type="button" class="close" onclick="$('#contModal').modal('hide');" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<h5>계약 목록</h5>
															<p>Loading!!!</p>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default waves-effect"	onclick="$('#contModal').modal('hide');">닫기</button>
														</div>
													</div>
												</div>
											</div> --%>
										</div>
									</td>
									
									<th scope="row" class="requiredTextCss">엔드유저</th>
									<td>
										<div class="input-group input-group-sm mb-0">
											<select class="form-control" id="endCustName" name="endCustName" onchange="autoCompleteSelect(this);">
												<option value="">선택</option>
												<c:forEach var="row" items="${listCust}">
													<option data-no="${row.custNo}" value="${row.custName}" <c:if test="${row.custNo eq dto.endCustNo}">selected</c:if>>${row.custName}</option>
												</c:forEach>
											</select>
											<input type="hidden" name="endCustNo" id="endCustNo" value="${dto.endCustNo}" />
											<%-- <input type="text" class="form-control" name="endCustName" id="endCustName" value="${dto.endCustName}" autocomplete="off"/> --%> 
											<%-- <span class="input-group-btn">
												<button class="btn btn-primary sch-company" data-remote="${path}/modal/popup.do?popId=cust" type="button" data-toggle="modal" data-target="#custModal">
													<i class="icofont icofont-search"></i>
												</button>
											</span>
											<div class="modal fade " id="custModal" tabindex="-1" role="dialog">
												<div class="modal-dialog modal-80size" role="document">
													<div class="modal-content modal-80size">
														<div class="modal-header">
															<h4 class="modal-title">거래처 검색</h4>
															<button type="button" class="close" onclick="$('#custModal').modal('hide');" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<h5>거래처목록</h5>
															<p>Loading!!!</p>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default waves-effect"	onclick="$('#custModal').modal('hide');">닫기</button>
														</div>
													</div>
												</div>
											</div> --%>
										</div>
									</td>
									
									<th scope="row">엔드유저 담당자</th>
									<td>
										<div class="input-group input-group-sm mb-0">
											<select class="form-control" id="custmemberName" name="custmemberName" onchange="autoCompleteSelect(this);">
												<option value="">선택</option>
												<c:forEach var="row" items="${listCustMember}">
													<option data-no="${row.custData03no}" value="${row.custMname}" <c:if test="${row.custMname eq dto.custmemberName}">selected</c:if>>${row.custMname}</option>
												</c:forEach>
											</select>
											<input type="hidden" name="custmemberNo" id="custmemberNo" value="${dto.custmemberNo}" />
											<%-- <input type="text" class="form-control" name="custmemberName"  id="custmemberName" value="${dto.custmemberName}" autocomplete="off"/> --%>
											<%-- <span class="input-group-btn">
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
															<button type="button" class="close" onclick="$('#custmemberModal').modal('hide');"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<h5>엔드유저 담당자 목록</h5>
															<p>엔드유저(거래처)를 먼저 입력해주셔야 목록이 보입니다.</p>
														</div>
														<div class="modal-footer">
															<button type="button"
																class="btn btn-default waves-effect "
																onclick="$('#custmemberModal').modal('hide');">닫기</button>
														</div>
													</div>
												</div>
											</div> --%>
										</div>
									</td>	
								</tr>
								<tr>
									<th scope="row">모델</th>
									<td colspan="7">
										<input type="text" class="form-control form-control-sm"	id="techdItemmodel" name="techdItemmodel" placeholder="" value="${dto.techdItemmodel}">
									</td>
								</tr>
								<tr>
									<th>버전</th>
									<td colspan="7">
										<input type="text" class="form-control form-control-sm"	id="techdItemversion" name="techdItemversion" placeholder="" value="${dto.techdItemversion}">
									</td>
								</tr>
								<tr>
									<th scope="row">장소</th>
									<td>
										<input type="text" class="form-control form-control-sm" id="techdPlace" name="techdPlace" placeholder="" value="${dto.techdPlace}">
									</td>
									<th scope="row" class="requiredTextCss">담당사원</th>
									<td>
										<div class="input-group input-group-sm mb-0">
											<input type="text" class="form-control" name="userName" readonly id="userName" data-completeSet="true" value="${dto.userName}" />
											<input type="hidden" name="userNo" id="userNo" value="${dto.userNo}" />
											<%-- <span class="input-group-btn">
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
															<h4 class="modal-title">담당사원 검색</h4>
															<button type="button" class="close" onclick="$('#userModal').modal('hide');" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<h5>사용자목록</h5>
															<p>Loading!!!</p>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default waves-effect" onclick="$('#userModal').modal('hide');">닫기</button>
														</div>
													</div>
												</div>
											</div> --%>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row" class="requiredTextCss">지원일자</th>
									<td colspan="3">
										<!-- <div class="col-sm-9 f-left m-b-0 p-l-0"> -->
											<div class="input-group input-group-sm mb-0 mr-1">
												<input class="form-control form-control-sm col-md-4 m-r-10" type="date" max="9999-12-30" id="techdFrom" name="techdFrom" value="${dto.targetDatefrom}" onChange="javascript:inputDate(setDateHourMinute($('#techdFrom').val(), $('#startTime').val()), setDateHourMinute($('#techdTo').val(), $('#endTime').val()),this)">
												<select id="startTime" style="width:100px" onChange="javascript:inputDate(setDateHourMinute($('#techdFrom').val(), $('#startTime').val()), setDateHourMinute($('#techdTo').val(), $('#endTime').val()),this)"></select>
												<span style="line-height:30px;">&nbsp;~&nbsp;</span>
												<input class="form-control form-control-sm col-md-4 m-r-10" type="date" max="9999-12-31" id="techdTo" name="techdTo" value="${dto.targetDateto}" onChange="javascript:inputDate(setDateHourMinute($('#techdFrom').val(), $('#startTime').val()), setDateHourMinute($('#techdTo').val(), $('#endTime').val()),this)">
												<select id="endTime" style="width:100px" onChange="javascript:inputDate(setDateHourMinute($('#techdFrom').val(), $('#startTime').val()), setDateHourMinute($('#techdTo').val(), $('#endTime').val()),this)"></select>
											</div>
										<!-- </div> -->
									</td>
									
									<th scope="row">지원형태</th>
									<td><select name="techdType" id="techdType" class="form-control form-control-sm">
									<option value="">선택</option>
									<c:forEach var="rows" items="${sprttype}">
									<option value="${rows.codeNo}" <c:if test="${rows.codeNo == dto.techdType}">selected</c:if>>${rows.desc03}</option>
									</c:forEach>


									</select></td>
									<th scope="row">진행단계</th>
									<td><select name="techdSteps" id="techdSteps"
										class="form-control form-control-sm">
											<option value="">선택</option>
									<c:forEach var="rows" items="${sprtstat}">
									<option value="${rows.codeNo}" <c:if test="${rows.codeNo == dto.techdSteps}">selected</c:if>>${rows.desc03}</option>
									</c:forEach>
									</select></td>
								</tr>
								
								<!-- table new  -->
								<tr>
									<th scope="row">설명</th>
									<td colspan="7"><textarea name="techdDesc" id="techdDesc" class="form-control">${dto.techdDesc}</textarea></td>
								</tr>
								<!-- table new  -->
								
							</tbody>
						</table>
					</div>
				</div>
				<div class="btn_wr text-right mt-3">
					<button class="btn btn-md btn-success f-left modal-list-btn" onClick="javascript:location='${path}/techd/list.do'">목록</button>
					<c:if test="${dto.userNo eq sessionScope.userNo || sessionScope.userRole eq 'ADMIN'}">
						<button class="btn btn-md btn-danger" onClick="fn_sprtDelete()">삭제</button>
						<button class="btn btn-md btn-primary" onClick="fn_sprtUpdate()">수정</button>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<!--기술지원 대상등록-->

	<script type="text/javascript" src="${path}/js/image.js"></script>
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

	$('#custmemberModal').on('show.bs.modal', function(e) {
		var custNo = $("#custNo").val();
		var url = '${path}/modal/popup.do?popId=custmem&compNo=' + custNo;
		$("#custmemberModalbtn").data("remote",url);

		var button = $(e.relatedTarget);
		var modal = $(this);
		modal.find('.modal-body').load(button.data("remote"));
	});

	$('#soppModal').on('show.bs.modal', function(e) {
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
		$("#custNo").val(b);
		$("#custName").val(a);
		$(".modal-backdrop").remove();
		$("#custModal").modal("hide");
		/*
		$("#custmemberModalbtn").attr('disabled', false);
		$("#custmemberModalbtn").removeClass("btn-danger");
		$("#custmemberModalbtn").addClass("btn-primary");
		// 고객검색 아이콘을 danger
		*/
	}

	function fnSetUserData(a, b) {
		$("#userName").val(b);
		$("#userNo").val(a);
		$(".modal-backdrop").remove();
		$("#userModal").modal("hide");
	}

	function fnSetCustmereData(a, b) {
		$("#custmemberNo").val(a);
		$("#custmemberName").val(b);
		$(".modal-backdrop").remove();
		$("#custmemberModal").modal("hide");
	}

	function fnSetSoppData(a, b) {
		$("#soppNo").val(b);
		$("#soppTitle").val(a);
		$(".modal-backdrop").remove();
		$("#soppModal").modal("hide");
	}

	function fnSetContData(a, b) {
		$("#contNo").val(b);
		$("#contTitle").val(a);
		$(".modal-backdrop").remove();
		$("#contModal").modal("hide");
	}


	async function fn_sprtUpdate() {
		if($("#techdTitle").val() === ""){
			alert("기술지원 요청명을 입력하십시오.");
			$("#techdTitle").focus();
			return false;
		} else if($("#techdFrom").val() === "" || $("#techdTo").val() === ""){
			alert("지원일자를 선택하십시오.");
			return false;
		} else if($("#endCustName").val() === ""){
			alert("엔드유저를 선택하십시오.");
			$("#endCustName").focus();
			return false;
		} else if ($("[name=\"contractType\"]:checked").val() === "NEW" && $("#soppTitle").val() === ""){
			alert("영업기회을 입력하십시오.");
			$("#soppTitle").focus();
			return false;
		} else if ($("[name=\"contractType\"]:checked").val() === "ING" && $("#contTitle").val() == ""){
			alert("계약을 입력하십시오.");
			$("#contTitle").focus();
			return false;
		}else{
			var sprtData = {};
			var contractType					= $("input[name='contractType']:checked").val();	// 신규 영업지원 or 기존계약
			if(contractType == 'NEW'){
				sprtData.soppNo					= Number($("#soppNo").val());			// 영업기회
				sprtData.contNo					= 0;							// 기존계약
				sprtData.cntrctMth				= Number(${contractType[0].codeNo});
			} else if (contractType == 'ING'){
				sprtData.soppNo					= 0;							// 영업기회
				sprtData.contNo					= Number($("#contNo").val());			// 기존계약
				sprtData.cntrctMth				= Number(${contractType[1].codeNo});
			}
			sprtData.techdTitle			= $("#techdTitle").val();					// 기술지원 요청명
			sprtData.userNo				= $("#userNo").val() ? Number($("#userNo").val()) : 0;						// 담당사원
			sprtData.custNo				= $("#endCustNo").val() ? Number($("#endCustNo").val()) : 0;						// 거래처
			sprtData.custmemberNo		= $("#custmemberNo").val() ? Number($("#custmemberNo").val()) : 0;					// 고객
			sprtData.techdItemmodel		= $("#techdItemmodel").val();				// 모델
			sprtData.techdItemversion	= $("#techdItemversion").val();				// 버전
			sprtData.techdPlace			= $("#techdPlace").val();					// 장소
			sprtData.techdFrom			= setDateHourMinute($("#techdFrom").val(), $("#startTime").val());					// 지원일자 시작
			sprtData.techdTo			= setDateHourMinute($("#techdTo").val(), $("#endTime").val());						// 지원일자 종료
			sprtData.techdType			= $("#techdType").val();					// 지원형태
			sprtData.techdSteps			= $("#techdSteps").val();	 // 진행단계
			sprtData.endCustNo 			= $("#endCustNo").val() ? Number($("#endCustNo").val()) : 0;	
			
			if ($("textarea").attr("style") === "display: none;") {
				var content = tinyMCE.get("techdDesc").getContent();
				sprtData.techdDesc = await uploadImage(content, "${path}");
			} else {
				sprtData.techdDesc = $("#techdDesc").val();
			}
			sprtData.techdNo			= Number($("#techdNo").val());
		
			$.ajax({
				url: "${path}/techd/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: sprtData , // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
				dataType: "json", // 서버에서 보내줄 데이터의 타입
				success: function(data) {
					if(data.code == 10001){
						alert("저장 성공");
						var eventModal = $('#eventModal');
						if(eventModal[0]) {
							$(".modal-backdrop").remove();
							var url ='${path}/calendar/calmain.do';
							location.href = url;
						}else {
							var url = '${path}/techd/list.do';
							location.href = url;
						}
					}else{
						alert("저장 실패");
					}
				}, // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
				error: function(xhr, status, errorThrown) {
					alert("통신 실패", xhr, status, errorThrown);
				},
			});
		}
	}

	//TODO: 해당 techdDesc에 이미지가 있는지 확인하여 있다면 해당 이미지를 DB에서 삭제하는 로직이 필요
	function fn_sprtDelete() {
		var sprtData = {};
		sprtData.techdNo = $("#techdNo").val();
		$.ajax({
			url: "${path}/techd/delete.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
			data: sprtData , // HTTP 요청과 함께 서버로 보낼 데이터
			method: "POST", // HTTP 요청 메소드(GET, POST 등)
			dataType: "json" // 서버에서 보내줄 데이터의 타입
		}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨..
		.done(function(data) {
			if(data.code == 10001){
				alert("삭제 성공");
				var eventModal = $('#eventModal');
				if(eventModal[0]) {
					$(".modal-backdrop").remove();
					var url ='${path}/calendar/calmain.do';
					location.href = url;
				}else {
					var url = '${path}/techd/list.do';
					location.href = url;
				}
			}else{
				alert("삭제 실패");
			}
		}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
		.fail(function(xhr, status, errorThrown) {
			alert("통신 실패");
		});
	}

	$(document).ready(function(){
		var contractType					= $("input[name='contractType']:checked").val();	// 신규 영업지원 or 기존계약
		if(contractType == 'NEW'){
			$('.techdDetailSopp').show();
			$('.techdDetailCont').hide();
		} else if(contractType == 'ING'){
			$('.techdDetailSopp').hide();
			$('.techdDetailCont').show();
		}

		$('input[name=contractType]').change(function() {
			if ($(this).val() == 'NEW') {
				$('.techdDetailSopp').show();
				$('.techdDetailCont').hide();
			} else {
				$('.techdDetailSopp').hide();
				$('.techdDetailCont').show();
			}
		});

		setTimeComboBox(['#startTime', '#endTime']);
		var startDate = '${dto.targetDatefrom}'.split("T")[0];
		var startTimelocal = '${dto.targetDatefrom}'.split("T")[1].substring(0, 5);
		var endDate = '${dto.targetDateto}'.split("T")[0];
		var endTimelocal = '${dto.targetDateto}'.split("T")[1].substring(0, 5);

		$('#techdFrom').val(startDate);
		$('#startTime').val(startTimelocal);
		$('#techdTo').val(endDate);
		$('#endTime').val(endTimelocal);

		Sdate = startDate;
		startTime = startTimelocal;
		Edate = endDate;
		endTime = endTimelocal;
	});

	</script>
<c:if test="${empty simple}">
</div>
<jsp:include page="../body-bottom.jsp"/>
</c:if>