<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
	<!-- Page-header start 페이지 타이틀-->
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">
						영업활동 등록
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Page-header end 페이지 타이틀 -->
<!--영업활동등록-->
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
								<th scope="row">활동일</th>
								<td colspan="3">
									<div class="input-group input-group-sm mb-0">
										<input id="salesFrdatetime" class="form-control form-control-sm col-sm-3 m-r-10" type="date">
										<select id="startTime" style="width:100px"></select>	 
										~ 
										<input id="salesTodatetime" class="form-control form-control-sm col-sm-3 m-r-10 m-l-10" type="date">
										<select id="endTime" style="width:100px"></select>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">장소</th>
								<td><input type="text" class="form-control form-control-sm"
									id="salesPlace" name="salesPlace" placeholder="장소를 입력하세요"></td>
								<th>활동형태</th>
								<td><select name="salesType" id="salesType" class="form-control form-control-sm">
										<c:forEach var = "salesType" items="${salesType}">
											<option value="${salesType.codeNo}">${salesType.desc03}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<th>담당사원</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="userName" id="userName" value="${sessionScope.userName}" />
										<input type="hidden" class="form-control" name="userNo" id="userNo" value="${sessionScope.userNo}" />
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
								<th scope="row">영업기회</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="soppTitle" id="soppTitle" value="" />
										<input type="hidden" class="form-control" name="soppNo" id="soppNo" value="" />
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
							</tr>
							<tr>
								<th scope="row">거래처</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="custName" id="custName" value="" />
										 <input type="hidden" name="custNo" id="custNo" value="" /> <span class="input-group-btn">
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
										<input type="text" class="form-control" name="ptncName" id="ptncName" value="" />
										 <input type="hidden" name="ptncNo" id="ptncNo" value="" />
										  <span class="input-group-btn">
											<button class="btn btn-primary sch-partner"
												data-remote="${path}/modal/popup.do?popId=ptnc"
												type="button" data-toggle="modal" data-target="#ptncModal">
												<i class="icofont icofont-search"></i>
											</button>
										</span>
										<div class="modal fade " id="ptncModal" tabindex="-1"
											role="dialog">
											<div class="modal-dialog modal-80size" role="document">
												<div class="modal-content modal-80size">
													<div class="modal-header">
														<h4 class="modal-title"></h4>
														<button type="button" class="close" onclick="$('#ptncModal').modal('hide');"
															aria-label="Close">
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
															onclick="$('#ptncModal').modal('hide');">Close</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">제목</th>
								<td colspan="3"><input type="text"
									class="form-control form-control-sm" id="salesTitle" name="salesTitle"
									placeholder=""></td>
							</tr>
							<tr>
								<th scope="row">내용</th>
								<td colspan="3"><textarea name="salesDesc" id="salesDesc" rows="8"
										class="form-control"></textarea></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="btn_wr text-right mt-3">
				<button class="btn btn-md btn-success f-left modal-list-btn" onClick="javascript:fnSetPage('${path}/sales/list.do')">목록</button>
				<button class="btn btn-md btn-primary" onClick="fn_SaveSales()">등록</button>
				<button class="btn btn-md btn-inverse modal-cancel-btn" onClick="javascript:fnSetPage('${path}/sales/list.do')">취소</button>
			</div>
		</div>
	</div>
</div>
<!--//영업활동등록-->


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

		function fn_SaveSales() {
			var salesData = {};
			salesData.salesFrdatetime = setDateHourMinute($("#salesFrdatetime").val(), $("#startTime").val()); 
			salesData.salesTodatetime = setDateHourMinute($("#salesTodatetime").val(), $("#endTime").val());
			salesData.salesTitle 		= $("#salesTitle").val();
			salesData.salesPlace		= $("#salesPlace").val();
		 	salesData.userNo 		= $("#userNo").val();
			salesData.custNo 		= $("#custNo").val() ? $("#custNo").val() : 0;
			salesData.soppNo 		= $("#soppNo").val() ? $("#soppNo").val() : 0;
			salesData.ptncNo 		= $("#ptncNo").val() ? $("#ptncNo").val() : 0;
			salesData.salesType 		= $("#salesType").val();
			salesData.salesDesc 		= $("#salesDesc").val();
			
			if (!salesData.salesFrdatetime){
				alert("영업활동의 시작일을 선택해 주십시오.");
				return;
			}
			else if (!salesData.salesTodatetime){
				alert("영업활동의 종료일을 선택해 주십시오.");
				return;
			}
			else if (!salesData.salesPlace){
				alert("영업장소를 입력해 주십시오.");
				return;
			}
			else if(!salesData.salesType){
				alert("활동형태를 선택해 주십시오.");
			}
			else if (!salesData.userNo){
				alert("담당사원을 선택해 주십시오.");
				return;
			}
			else if (!salesData.custNo && !salesData.ptncNo){
				alert("거래처 또는 엔드유저를 선택해 주십시오.");
				return;
			}
			else if (!salesData.salesTitle) {
				alert("영업활동 제목을 입력해 주십시오.");		
				return;
			}
// 			else if (!salesData.ptncNo){
// 				alert("협력사를 선택해 주십시오.");
// 				return;
// 			}
// 			else if (!salesData.soppNo){
// 				alert("영업기회를 선택해 주십시오.");
// 				return;
// 			}
// 			else if (!salesData.salesDesc){
// 				alert("영업설명을 입력해 주십시오.");
// 				return;
// 			}

			$.ajax({ url: "${path}/sales/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
						data: salesData , // HTTP 요청과 함께 서버로 보낼 데이터 
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
								fnSetPage('${path}/sales/list.do');
							}
						}else{
							alert("저장 실패");
						}
					}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
					.fail(function(xhr, status, errorThrown) { 
						alert("통신 실패");
					});
			}
		
		$(document).ready(function(){
			setTimeComboBox(['#startTime', '#endTime']);
		});

	</script>