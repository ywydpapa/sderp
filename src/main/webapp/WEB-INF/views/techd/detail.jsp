<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<script type="text/javascript">
var hiddenObject;

if("${dto.soppNo}" == "0") {
	hiddenObject = $('.techdDetailSopp');
}else {
	hiddenObject = $('.techdDetailCont');
}

for(var i = 0; i < hiddenObject.length; i++) {
	hiddenObject[i].hidden = true;
}
</script>

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
							<col width="15%" />
							<col width="35%" />
							<col width="15%" />
							<col width="35%" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">등록구분</th>
								<td colspan="3">
									<div class="form-radio">
										<form>
											<div class="radio radio-inline">
												<label> <input type="radio" name="radio" value="NEW" <c:if test="${dto.soppNo != 0}">checked</c:if> disabled> <i class="helper"></i>신규 영업지원
												</label>
											</div>
											<div class="radio radio-inline">
												<label> <input type="radio" value="ING" name="radio" <c:if test="${dto.contNo != 0}">checked</c:if> disabled> <i class="helper"></i>기존계약 </label>
											</div>
										</form>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">기술지원 요청명</th>
								<td><input type="text" class="form-control form-control-sm" id="techdTitle" name="techdTitle" placeholder="기술지원 요청명을 입력하십시오" value="${dto.techdTitle}" required></td>
								<th scope="row">담당사원</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="userName" readonly
											id="userName" value="${dto.userName}" /> <input type="hidden" name="userNo"
											id="userNo" value="${dto.userNo}" /> <span class="input-group-btn"> 
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
														<button type="button" class="close" onclick="$('#userModal').modal('hide');"
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
															onclick="$('#userModal').modal('hide');">Close</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">거래처</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="custName" readonly
											id="custName" value="${dto.custName}" /> <input type="hidden" name="custNo"
											id="custNo" value="${dto.custNo}" /> <span class="input-group-btn">
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
														<h4 class="modal-title">거래처 검색</h4>
														<button type="button" class="close" onclick="$('#custModal').modal('hide');"
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
															onclick="$('#custModal').modal('hide');">Close</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</td>
								<th scope="row">엔드유저</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="custmemberName"  id="custmemberName" value="${dto.custmemberName}" readonly/> 
										<input type="hidden" name="custmemberNo" id="custmemberNo" value="${dto.custmemberNo}" />
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
														<button type="button" class="close" onclick="$('#custmemberModal').modal('hide');"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<h5>고객 목록</h5>
														<p>거래처를 먼저 입력해주셔야 목록이 보입니다.</p>
													</div>
													<div class="modal-footer">
														<button type="button"
															class="btn btn-default waves-effect "
															onclick="$('#custmemberModal').modal('hide');">Close</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">모델</th>
								<td><input type="text" class="form-control form-control-sm"
									id="techdItemmodel" name="techdItemmodel" placeholder="" value="${dto.techdItemmodel}"></td>
								<th>버전</th>
								<td><input type="text" class="form-control form-control-sm"
									id="techdItemversion" name="techdItemversion" placeholder="" value="${dto.techdItemversion}"></td>
							</tr>
							<tr>
								<th scope="row">장소</th>
								<td><input type="text"
									class="form-control form-control-sm" id="techdPlace" name="techdPlace"
									placeholder="" value="${dto.techdPlace}"></td>
									
								<th scope="row" class="techdDetailSopp">영업기회</th>
								<td class="techdDetailSopp">
									<div class="input-group input-group-sm mb-0">
									<input type="text" class="form-control" name="soppTitle"
										id="soppTitle" value="${dto.soppTitle}" readonly /> <input type="hidden"
										name="soppNo" id="soppNo" value="${dto.soppNo}" /> <span
										class="input-group-btn">
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
													<button type="button"
														class="btn btn-default waves-effect "
														onclick="$('#soppModal').modal('hide');">Close</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								</td>
								<th scope="row" class="techdDetailCont">계약</th>
								<td class="techdDetailCont">
									<div class="input-group input-group-sm mb-0">
									<input type="text" class="form-control" name="contTitle"
										id="contTitle" value="${dto.contTitle}" readonly /> <input type="hidden"
										name="contNo" id="contNo" value="${dto.contNo}" /> <span
										class="input-group-btn">
										<button class="btn btn-primary sch-opportunity2"
											data-remote="${path}/modal/popup.do?popId=cont"
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
													<button type="button" class="close" onclick="$('#contModal').modal('hide');"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<h5>계약 목록</h5>
													<p>Loading!!!</p>
												</div>
												<div class="modal-footer">
													<button type="button"
														class="btn btn-default waves-effect "
														onclick="$('#contModal').modal('hide');">Close</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								</td>
							</tr>
							<tr>
								<th scope="row">지원일자</th>
								<td colspan="3">
									<div class="col-sm-9 f-left m-b-0 p-l-0">
										<div class="input-group input-group-sm mb-0">
											<input class="form-control form-control-sm col-sm-6 m-r-10"
												type="datetime-local" id="techdFrom" name="techdFrom" value="${dto.targetDatefrom}"> 
											<span> ~ </span>
											<input class="form-control form-control-sm col-sm-6 m-r-10"
												type="datetime-local" id="techdTo" name="techdTo" value="${dto.targetDateto}"> 
											</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">지원형태</th>
								<td><select name="techdType" id="techdType" class="form-control form-control-sm">
								<option value=""></option>
								<c:forEach var="rows" items="${sprttype}">
								<option value="${rows.codeNo}" <c:if test="${rows.codeNo == dto.techdType}">selected</c:if>>${rows.desc03}</option>
								</c:forEach>
								
								
								</select></td>
								<th scope="row">진행단계</th>
								<td><select name="techdSteps" id="techdSteps"
									class="form-control form-control-sm">
										<option value=""></option>
								<c:forEach var="rows" items="${sprtstat}">
								<option value="${rows.codeNo}" <c:if test="${rows.codeNo == dto.techdSteps}">selected</c:if>>${rows.desc03}</option>
								</c:forEach>
								</select></td>
							</tr>
							<tr>
								<th scope="row">설명</th>
								<td colspan="3"><textarea name="techdDesc" id="techdDesc" rows="8"
										class="form-control">${dto.techdDesc}</textarea></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="btn_wr text-right mt-3">
				<button class="btn btn-md btn-success f-left modal-list-btn" onClick="javascript:fnSetPage('${path}/techd/list.do')">목록</button>
				<button class="btn btn-md btn-primary" onClick="fn_sprtUpdate()">수정</button>
				<button class="btn btn-md btn-inverse modal-cancel-btn" onClick="javascript:fnSetPage('${path}/techd/list.do')">취소</button>
			</div>
		</div>
	</div>
</div>
<!--//기술지원 대상등록-->


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

function fn_sprtUpdate() {
	var sprtData = {};
//	sprtData.radio				= $("input[name='radio']:checked").val();	// 신규 영업지원 or 기존계약
	sprtData.techdTitle			= $("#techdTitle").val();					// 기술지원 요청명
	sprtData.userNo				= $("#userNo").val() ? $("#userNo").val() : 0;						// 담당사원
	sprtData.custNo				= $("#custNo").val() ? $("#custNo").val() : 0;						// 거래처
	sprtData.custmemberNo		= $("#custmemberNo").val() ? $("#custmemberNo").val() : 0;					// 고객
	sprtData.techdItemmodel		= $("#techdItemmodel").val();				// 모델
	sprtData.techdItemversion	= $("#techdItemversion").val();				// 버전
	sprtData.techdPlace			= $("#techdPlace").val();					// 장소
	sprtData.techdFrom			= $("#techdFrom").val();					// 지원일자 시작
	sprtData.techdTo			= $("#techdTo").val();						// 지원일자 종료
	sprtData.techdType			= $("#techdType").val();					// 지원형태
	sprtData.techdSteps			= $("#techdSteps").val();					// 진행단계
	sprtData.techdDesc			= $("#techdDesc").val();					// 설명
	sprtData.soppNo				= $("#soppNo").val() ? $("#soppNo").val() : 0; // 영업기회번호
	sprtData.contNo				= $("#contNo").val() ? $("#contNo").val() : 0; // 계약번호
	sprtData.techdNo			= "${dto.techdNo}";
	
	$.ajax({ url: "${path}/techd/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				data: sprtData , // HTTP 요청과 함께 서버로 보낼 데이터 
				method: "POST", // HTTP 요청 메소드(GET, POST 등) 
				dataType: "json" // 서버에서 보내줄 데이터의 타입 
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
					alert("저장 성공");
					var eventModal = $('#eventModal');
					if(eventModal[0]) {
						$(".modal-backdrop").remove();
						fnSetPage('${path}/calendar/calmain.do');
						
					}else {
						fnSetPage('${path}/techd/list.do');
					}
				}else{
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) { 
				alert("통신 실패");
			});
}

</script>
