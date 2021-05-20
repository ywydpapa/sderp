<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!-- Page-header start 페이지 타이틀-->
<div class="page-header2">
	<div class="row align-items-end">
		<div class="col-lg-12">
			<div class="page-header-title">
				<div class="d-inline">기타일정 등록</div>
			</div>
		</div>
	</div>
</div>
<!--Page-header end 페이지 타이틀 -->

<!--일정등록-->
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
								<th scope="row" class="requiredTextCss">일정일자</th>
								<td colspan="3">
									<div class="input-group input-group-sm mb-0 mr-1">
										<input class="form-control form-control-sm col-md-4 m-r-10" type="date" id="schedSdate" value="" onChange="javascript:inputDate(setDateHourMinute($('#schedSdate').val(), $('#startTime').val()), setDateHourMinute($('#schedEdate').val(), $('#endTime').val()))">
										<select id="startTime" style="width:100px" onChange="javascript:inputDate(setDateHourMinute($('#schedSdate').val(), $('#startTime').val()), setDateHourMinute($('#schedEdate').val(), $('#endTime').val()))"></select>
										<span> ~ </span> 
										<input class="form-control form-control-sm col-md-4 m-r-10" type="date" id="schedEdate" value="" onChange="javascript:inputDate(setDateHourMinute($('#schedSdate').val(), $('#startTime').val()), setDateHourMinute($('#schedEdate').val(), $('#endTime').val()))">
										<select id="endTime" style="width:100px" onChange="javascript:inputDate(setDateHourMinute($('#schedSdate').val(), $('#startTime').val()), setDateHourMinute($('#schedEdate').val(), $('#endTime').val()))"></select>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">장소</th>
								<td><input type="text" class="form-control form-control-sm"
									id="schedPlace" name="schedPlace" placeholder="장소를 입력하세요">
								</td>
								<th scope="row">계약 관련</th>
								<td>
									<jsp:include page="/WEB-INF/views/module/input/inputCont.jsp"/>
								</td>
							</tr>
							<tr>
								<th scope="row">영업기회</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="soppTitle"
											id="soppTitle" value="" readonly /> <input type="hidden"
											name="soppNo" id="soppNo" value="" /> <span
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
								<th scope="row" class="requiredTextCss">담당사원</th>
								<td>
									<jsp:include page="/WEB-INF/views/module/input/inputActiveUser.jsp"/>
								</td>
							</tr>
							<tr>
								<th scope="row">매출처</th>
								<td>
									<jsp:include page="/WEB-INF/views/module/input/inputCust.jsp"/>
								</td>
								<th scope="row">엔드유저</th>
								<td>
									<jsp:include page="/WEB-INF/views/module/input/inputBuyr.jsp"/>
								</td>
							</tr>
							<tr>
								<th scope="row">일정구분</th>
								<td><select name="schedType" id="schedType"
									class="form-control form-control-sm">
										<option value="">기타일정</option>
										<%-- <c:forEach var="schedtype" items="${schedtype}">
											<option value="${schedtype.codeNo}">${schedtype.desc03}</option>
										</c:forEach> --%>
								</select></td>
								<th scope="row">활동형태</th>
								<td>
									<select name="schedCat" id="schedCat" class="form-control form-control-sm">
										<option value="">선택</option>
										<c:forEach var="acttype" items="${acttype}">
											<option value="${acttype.codeNo}">${acttype.desc03}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row" class="requiredTextCss">제목</th>
								<td colspan="3"><input type="text"
									class="form-control form-control-sm" id="schedTitle"
									name="schedTitle" placeholder=""></td>
							</tr>
							<tr>
								<th scope="row">내용</th>
								<td colspan="3"><textarea name="schedDesc" id="schedDesc"
										rows="8" class="form-control"></textarea></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="btn_wr text-right mt-3">
				<button class="btn btn-md btn-success f-left modal-list-btn" onClick="javascript:fnSetPage('${path}/sched/list.do')">목록</button>
				<button class="btn btn-md btn-primary" onClick="fn_SaveSched()">저장</button>
				<button class="btn btn-md btn-inverse modal-cancel-btn" onClick="javascript:fnSetPage('${path}/sched/list.do')">취소</button>
			</div>
		</div>
	</div>
</div>
<!--//일정등록-->

<script>
		$('#soppModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		$('#ptncModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		function fnSetSoppData(a, b) {
			$("#soppNo").val(b);
			$("#soppTitle").val(a);
			$(".modal-backdrop").remove();
			$("#soppModal").modal("hide");
		}
		function fnSetPtncData(a, b) {
			$("#ptncNo").val(b);
			$("#ptncName").val(a);
			$(".modal-backdrop").remove();
			$("#ptncModal").modal("hide");
		}

		function fn_SaveSched() {
			var schedData = {};
			schedData.schedFrom 									= setDateHourMinute($("#schedSdate").val(), $("#startTime").val());
			schedData.schedTo 										= setDateHourMinute($("#schedEdate").val(), $("#endTime").val());
			schedData.schedTitle 									= $("#schedTitle").val();
			schedData.schedPlace									= $("#schedPlace").val();
			schedData.userNo 										= $("#userNo").val();
			if($("#custName").val() != "") schedData.custNo 		= Number($("#custNo").val());
			if($("#soppName").val() != "") schedData.soppNo 		= Number($("#soppNo").val());
			schedData.schedDesc 									= $("#schedDesc").val();
			schedData.schedCat 										= $("#schedCat").val();
			if($("#contName").val() != "") schedData.contNo			= Number($("#contNo").val());
			if($("#buyrName").val() != "") schedData.buyrNo			= Number($("#buyrNo").val());
			console.dir(schedData);
			
			$.ajax({
				url: "${path}/sched/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: schedData , // HTTP 요청과 함께 서버로 보낼 데이터
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
						fnSetPage('${path}/sched/list.do');
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
