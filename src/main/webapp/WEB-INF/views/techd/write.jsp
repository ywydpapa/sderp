<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<script type="text/javascript">
$(function () {
	$('.techdDetailCont').hide();
});
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
				<div class="d-inline">기술지원 등록</div>
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
								<th scope="row" class="requiredTextCss">등록구분</th>
								<td colspan="3">
									<div class="form-radio">
										<form>
											<div class="radio radio-inline">
												<label>
													<input type="radio" name="contractType" value="NEW" checked="checked">
													<i class="helper"></i>
													신규영업지원
												</label>
											</div>
											<div class="radio radio-inline">
												<label>
													<input type="radio" name="contractType" value="ING">
													<i class="helper"></i>
													유지보수
												</label>
											</div>
										</form>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row" class="requiredTextCss">기술지원 요청명</th>
								<td>
									<input type="text" class="form-control form-control-sm" id="techdTitle" name="techdTitle" placeholder="기술지원 요청명을 입력하십시오" required>
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
									<input type="text" class="form-control form-control-sm" id="techdItemmodel" name="techdItemmodel" placeholder="">
								</td>
								<th>버전</th>
								<td>
									<input type="text" class="form-control form-control-sm" id="techdItemversion" name="techdItemversion" placeholder="">
								</td>
							</tr>
							<tr>
								<th scope="row">장소</th>
								<td><input type="text" class="form-control form-control-sm" id="techdPlace" name="techdPlace" placeholder=""></td>
								<th scope="row" class="requiredTextCss">담당사원</th>
								<td>
									<jsp:include page="/WEB-INF/views/module/input/inputActiveUser.jsp"/>
								</td>
							</tr>
							<tr>
								<th scope="row" class="requiredTextCss">지원일자</th>
								<td colspan="3">
									<jsp:include page="/WEB-INF/views/module/input/inputSchedule.jsp"/>
								</td>
							</tr>
							<tr>
								<th scope="row">지원형태</th>
								<td>
									<select name="techdType" id="techdType" class="form-control form-control-sm">
										<option value="">선택</option>
										<c:forEach var="rows" items="${sprttype}">
											<option value="${rows.codeNo}">${rows.desc03}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">진행단계</th>
								<td>
									<select name="techdSteps" id="techdSteps" class="form-control form-control-sm">
										<option value="">선택</option>
										<c:forEach var="rows" items="${sprtstat}">
											<option value="${rows.codeNo}">${rows.desc03}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">설명</th>
								<td colspan="3"><textarea name="techdDesc" id="techdDesc" rows="8" class="form-control"></textarea></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="btn_wr text-right mt-3">
				<button class="btn btn-md btn-success f-left modal-list-btn" onClick="javascript:fnSetPage('${path}/techd/list.do')">목록</button>
				<button class="btn btn-md btn-primary" onClick="fn_sprtInsert()">저장</button>
				<button class="btn btn-md btn-inverse modal-cancel-btn" onClick="javascript:fnSetPage('${path}/techd/list.do')">취소</button>
			</div>
		</div>
	</div>
</div>
<!--//기술지원 대상등록-->


<script>
	function fn_sprtInsert() {
		var sprtData = {};
		var contractType					= $("input[name='contractType']:checked").val();	// 신규 영업지원 or 기존계약
		if(contractType == 'NEW'){
			sprtData.soppNo					= $("#soppNo").val();				// 영업기회
			sprtData.cntrctMth				= ${contractType[0].codeNo};
		} else if (contractType == 'ING'){
			sprtData.contNo					= $("#contNo").val();				// 기존계약
			sprtData.cntrctMth				= ${contractType[1].codeNo};
		}
		sprtData.techdTitle			= $("#techdTitle").val();											// 기술지원 요청명
		sprtData.userNo				= $("#userNo").val() ? $("#userNo").val() : 0;						// 담당사원
		sprtData.custNo				= $("#buyrNo").val() ? $("#buyrNo").val() : 0;						// 엔드유저
		sprtData.custMemberNo		= $("#buyrMemberNo").val() ? $("#buyrMemberNo").val() : 0;			// 엔드유저 담당자
		sprtData.techdItemmodel		= $("#techdItemmodel").val();										// 모델
		sprtData.techdItemversion	= $("#techdItemversion").val();										// 버전
		sprtData.techdPlace			= $("#techdPlace").val();											// 장소
		sprtData.techdFrom			= setDateHourMinute($("#schedFrom").val(), $("#startTime").val());	// 지원일자 시작
		sprtData.techdTo			= setDateHourMinute($("#schedTo").val(), $("#endTime").val());		// 지원일자 종료
		sprtData.techdType			= $("#techdType").val();											// 지원형태
		sprtData.techdSteps			= $("#techdSteps").val();											// 진행단계
		sprtData.techdDesc			= $("#techdDesc").val();											// 설명

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
			url: "${path}/techd/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
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

	setTimeComboBox(['#startTime', '#endTime']);
</script>
