<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<script type="text/javascript">
if(${!empty dto.soppNo}) {
	$('.techdDetailSopp').show();
	$('.techdDetailCont').hide();
}else {
	$('.techdDetailSopp').hide();
	$('.techdDetailCont').show();
}

$('input[name=contractType]').on('click', function() {
	if ($(this).val() == 'NEW') {
		$('.techdDetailSopp').show();
		$('.techdDetailCont').hide();
	} else {
		$('.techdDetailSopp').hide();
		$('.techdDetailCont').show();
	}
});
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
								<th scope="row" class="requiredTextCss">등록구분<input hidden value="${dto.techdNo}" id="techdNo"></th>
								<td colspan="3">
									<div class="form-radio">
										<form>
											<div class="radio radio-inline">
												<label> <input type="radio" name="contractType" value="NEW" <c:if test="${!empty dto.soppNo}">checked</c:if>> <i class="helper"></i>신규 영업지원
												</label>
											</div>
											<div class="radio radio-inline">
												<label> <input type="radio" name="contractType" value="ING"  <c:if test="${empty dto.soppNo}">checked</c:if>> <i class="helper"></i>유지보수 </label>
											</div>
										</form>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row" class="requiredTextCss">기술지원 요청명</th>
								<td>
									<input type="text" class="form-control form-control-sm" id="techdTitle" name="techdTitle" placeholder="기술지원 요청명을 입력하십시오" value="${dto.techdTitle}" required>
								</td>
								<th scope="row" class="techdDetailSopp requiredTextCss">영업기회</th>
								<td class="techdDetailSopp">
									<jsp:include page="/WEB-INF/views/module/input/inputSopp.jsp"/>
								</td>
								<th scope="row" class="techdDetailCont requiredTextCss">계약</th>
								<td class="techdDetailCont">
									<jsp:include page="/WEB-INF/views/module/input/inputCont.jsp"/>
								</td>
							</tr>
							<tr>
								<th scope="row" class="requiredTextCss">엔드유저</th>
								<td>
									<jsp:include page="/WEB-INF/views/module/input/inputBuyr.jsp"/>
								</td>
								<th scope="row">엔드유저 담당자</th>
								<td>
									<jsp:include page="/WEB-INF/views/module/input/inputBuyrMember.jsp"/>
								</td>
							</tr>
							<tr>
								<th scope="row">모델</th>
								<td>
									<input type="text" class="form-control form-control-sm"	id="techdItemmodel" name="techdItemmodel" placeholder="" value="${dto.techdItemmodel}">
								</td>
								<th>버전</th>
								<td>
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
									<jsp:include page="/WEB-INF/views/module/input/inputActiveUser.jsp"/>
								</td>
							</tr>
							<tr>
								<th scope="row" class="requiredTextCss">지원일자</th>
								<td colspan="3">
									<!-- <div class="col-sm-9 f-left m-b-0 p-l-0"> -->
										<div class="input-group input-group-sm mb-0 mr-1">
											<input class="form-control form-control-sm col-md-4 m-r-10" type="date" id="techdFrom" name="techdFrom" value="${dto.targetDatefrom}" onChange="javascript:inputDate(setDateHourMinute($('#techdFrom').val(), $('#startTime').val()), setDateHourMinute($('#techdTo').val(), $('#endTime').val()))"> 
											<select id="startTime" style="width:100px" onChange="javascript:inputDate(setDateHourMinute($('#techdFrom').val(), $('#startTime').val()), setDateHourMinute($('#techdTo').val(), $('#endTime').val()))"></select>
											<span> ~ </span>
											<input class="form-control form-control-sm col-md-4 m-r-10" type="date" id="techdTo" name="techdTo" value="${dto.targetDateto}" onChange="javascript:inputDate(setDateHourMinute($('#techdFrom').val(), $('#startTime').val()), setDateHourMinute($('#techdTo').val(), $('#endTime').val()))"> 
											<select id="endTime" style="width:100px" onChange="javascript:inputDate(setDateHourMinute($('#techdFrom').val(), $('#startTime').val()), setDateHourMinute($('#techdTo').val(), $('#endTime').val()))"></select>
										</div>
									<!-- </div> -->
								</td>
							</tr>
							<tr>
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
				<c:if test="${dto.userNo eq sessionScope.userNo || sessionScope.userRole eq 'ADMIN'}">
					<button class="btn btn-md btn-danger" onClick="fn_sprtDelete()">삭제</button>
				</c:if>
				<button class="btn btn-md btn-primary" onClick="fn_sprtUpdate()">수정</button>
				<button class="btn btn-md btn-inverse modal-cancel-btn" onClick="javascript:fnSetPage('${path}/techd/list.do')">취소</button>
			</div>
		</div>
	</div>
</div>
<!--//기술지원 대상등록-->


<script>
function fn_sprtUpdate() {
	var sprtData = {};
	var contractType					= $("input[name='contractType']:checked").val();					// 신규 영업지원 or 기존계약
	if(contractType == 'NEW'){
		sprtData.soppNo					= $("#soppNo").val();												// 영업기회
		sprtData.cntrctMth				= ${contractType[0].codeNo};
	} else if (contractType == 'ING'){
		sprtData.contNo					= $("#contNo").val();												// 기존계약
		sprtData.cntrctMth				= ${contractType[1].codeNo};
	}
	sprtData.techdTitle					= $("#techdTitle").val();											// 기술지원 요청명
	sprtData.userNo						= $("#userNo").val() ? $("#userNo").val() : 0;						// 담당사원
	sprtData.custNo						= $("#buyrNo").val() ? $("#buyrNo").val() : 0;						// 엔드유저
	if($("#buyrMemberName") != '')		sprtData.custMemberNo	= $("#buyrMemberNo").val();			// 엔드유저 담당자
	sprtData.techdItemmodel				= $("#techdItemmodel").val();										// 모델
	sprtData.techdItemversion			= $("#techdItemversion").val();										// 버전
	sprtData.techdPlace					= $("#techdPlace").val();											// 장소
	sprtData.techdFrom					= setDateHourMinute($("#techdFrom").val(), $("#startTime").val());	// 지원일자 시작
	sprtData.techdTo					= setDateHourMinute($("#techdTo").val(), $("#endTime").val());		// 지원일자 종료
	sprtData.techdType					= $("#techdType").val();											// 지원형태
	sprtData.techdSteps					= $("#techdSteps").val();											// 진행단계
	sprtData.techdDesc					= $("#techdDesc").val();											// 설명
	sprtData.techdNo					= $("#techdNo").val();

	if(!sprtData.techdTitle){
		alert("기술지원 요청명을 입력하십시오.!!");
		return;
	} else if(!sprtData.custNo){
		alert("엔드유저를 입력하십시오.!!");
		return;
	}

	if(contractType == 'NEW'){
		if(!sprtData.soppNo){
			alert("영업기회를 입력하십시오.!!");
			return;
		}
	} else if (contractType == 'ING'){
		if(!sprtData.contNo){
			alert("계약명를 입력하십시오.!!");
			return;
		}
	}
	
	$.ajax({
		url: "${path}/techd/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
		data: sprtData , // HTTP 요청과 함께 서버로 보낼 데이터
		method: "POST", // HTTP 요청 메소드(GET, POST 등)
		dataType: "json" // 서버에서 보내줄 데이터의 타입
	}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨..
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
				fnSetPage('${path}/calendar/calmain.do');

			}else {
				fnSetPage('${path}/techd/list.do');
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
	setTimeComboBox(['#startTime', '#endTime']);
	var startDate = '${dto.targetDatefrom}'.split("T")[0];
	var startTime = '${dto.targetDatefrom}'.split("T")[1].substring(0, 5);
	var endDate = '${dto.targetDateto}'.split("T")[0];
	var endTime = '${dto.targetDateto}'.split("T")[1].substring(0, 5);
	
	$('#techdFrom').val(startDate);
	$('#startTime').val(startTime);
	$('#techdTo').val(endDate);
	$('#endTime').val(endTime);
});

</script>
