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
					계약 등록
				</div>
			</div>
		</div>
	</div>
</div>
<!--Page-header end 페이지 타이틀 -->

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
												<label> <input type="radio" name="contractType" value="NEW" checked="checked"> <i class="helper"></i>판매계약</label>
											</div>
											<div class="radio radio-inline">
												<label> <input type="radio" name="contractType" value="OLD"> <i class="helper"></i>유지보수</label>
											</div>
										</form>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">계약명</th>
								<td colspan="3">
									<input type="text" class="form-control form-control-sm" id="contTitle" name="contTitle" placeholder="계약명을 입력해 주세요.">
								</td>
							</tr>
							<tr>
								<th scope="row">계약번호</th>
								<td>
									<input type="text" id="contNo" name="contNo" class="form-control " readonly placeholder="자동생성 됩니다..">
								</td>
								<th class="techdDetailCont">영업기회</th>
								<td class="techdDetailCont">
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="soppDTO" id="soppTitle" value="" />
										<input type="hidden" class="form-control" name="soppDTO" id="soppNo" value="" />
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
								<th class="techdDetailCont">계약</th>
								<td class="techdDetailCont">
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="oldContTitle" id="oldContTitle" readonly />
										<input type="hidden" name="oldContNo" id="oldContNo" value="" />
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
								<th scope="row">담당사원</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="userName" id="userName" value="" />
										<input type="hidden" class="form-control" name="userNo" id="userNo" value="" />
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
								<th>거래처</th>
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
							</tr>
							<tr>
								<th>판매방식</th>
								<td>
									<select name="contType" id="contType" class="form-control form-control-sm">
										<option value="">선택</option>
										<option value="10048">조달직판</option>
										<option value="10049">조달간판</option>
										<option value="10050">조달대행</option>
										<option value="10051">직접판매</option>
										<option value="10095">간접판매</option>
										<option value="10252">기타</option>
									</select>
								</td>
								<th>거래처 담당자</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input type="text" id="custmemberName" name="custmemberName" class="form-control " readonly>
										<input type="hidden" id="custmemberNo" name="custmemberNo" class="form-control ">
										<span class="input-group-btn">
											<button class="btn btn-primary sch-company btn-sm" 
												data-remote="${path}/modal/popup.do?popId=custmem&compNo="
												type="button" data-toggle="modal" data-target="#custmemberModal"
												id="custmemberModalbtn" data-whatever="">
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
								<th scope="row">유지보수업체</th>
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
														<button type="button" class="close" data-dismiss="modal"
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
															data-dismiss="modal">Close</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</td>
								<th>공급업체</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="supplyName" id="supplyName" value="" />
										 <input type="hidden" name="supplyNo" id="supplyNo" value="" />
										  <span class="input-group-btn">
											<button class="btn btn-primary sch-partner"
												data-remote="${path}/modal/popup.do?popId=supply"
												type="button" data-toggle="modal" data-target="#supplyModal">
												<i class="icofont icofont-search"></i>
											</button>
										</span>
										<div class="modal fade " id="supplyModal" tabindex="-1"
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
								<th scope="row">발주일자</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input class="form-control form-control-sm col-sm-12" type="date" id="contOrddate" name="contOrddate">
									</div>
								</td>
								<th>공급일자</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input class="form-control form-control-sm col-sm-12" type="date" id="supplyDate" name="supplyDate">
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">검수일자</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input class="form-control form-control-sm col-sm-12" type="date" id="delivDate" name="delivDate">
									</div>
								</td>
								<th scope="row">무상유지보수일자</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input class="form-control form-control-sm col-sm-6 m-r-5" type="date" id="freemaintSdate"> ~ <input class="form-control form-control-sm col-sm-6 m-l-5" type="date" id="freemaintEdate">
									</div>
								</td>
							</tr>
							<tr>
								<th >계약금액</th>
								<td>
									<input type="text" id="contAmt" name="contAmt" class="form-control" style="text-align: right;" >
								</td>
								<th >VAT 포함여부</th>
								<td>
									 <select name="vatYn" id="vatYn" class="form-control form-control-sm">
										<option value="Y" selected>Yes</option>
										<option value="N" >No</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>매출이익</th>
								<td><input style="text-align: right;" type="text"
								id="netprofit" name="netprofit" class="form-control "
								value="<fmt:formatNumber value="${dto.net_profit}" pattern="#,###"/>">
								</td>
								<th scope="row">지역</th>
								<td>
									<select name="contArea" id="contArea" class="form-control form-control-sm">
										<option value="">선택</option>			
										<option value="701">서울</option>			
										<option value="703">인천, 경기</option>			
										<option value="704">충북</option>			
										<option value="705">충남</option>			
										<option value="706">강원도</option>			
										<option value="707">경북</option>			
										<option value="708">경남</option>			
										<option value="709">전북</option>			
										<option value="710">전남</option>			
										<option value="711">제주</option>			
										<option value="712">해외</option>			
										<option value="713">기타</option>			
										<option value="714">세종</option>	    
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">내용</th>
								<td colspan="3">
									<textarea name="contDesc" id="contDesc" rows="8" class="form-control"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
			<div class="btn_wr text-right mt-3">
				<button class="btn btn-md btn-success f-left" onClick="fnSetPage('${path}/cont/list.do')">목록</button>
				<button class="btn btn-md btn-primary" onClick="fn_SaveCont()">계약등록</button>
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
		$('#custmemberModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget) // Button that triggered the modal
			var recipient = button.data('whatever') // Extract info from data-* attributes
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			
			var url = '${path}/modal/popup.do?popId=custmem&compNo=' + recipient;
			button.data("remote",url);
			
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		$('#contModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});

		function fnSetCustData(a, b) {
    		// '${row.custName}','${row.custNo}'
			$("#custName").val(a);
			$("#custNo").val(b);
			$("#custmemberModalbtn").data('whatever', b);
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
		
		function fnSetSoppData(a, b, c, d) {
			// '${row.soppTitle}','${row.soppNo}','${row.userNo}','${row.custNo}'
			$("#soppTitle").val(a);
			$("#soppNo").val(b);
			$(".modal-backdrop").remove();
			$("#soppModal").modal("hide");
		}
		
		function fnSetCustmereData(a,b){
			// '${row.custData03no}','${row.custMname}'
			// 고객담당자번호, 고객성명
			$("#custmemberNo").val(a);
			$("#custmemberName").val(b);
			$(".modal-backdrop").remove();
			$("#custmemberModal").modal("hide");
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
			var contractType					= $("input[name='contractType']:checked").val();	// 신규 영업지원 or 기존계약
			if(contractType == "NEW"){
				contData.soppNo					= $("#soppNo").val();			// 영업기회
				contData.exContNo				= 0;							// 기존계약
			} else {
				contData.soppNo					= 0;							// 영업기회
				contData.exContNo				= $("#oldContNo").val();		// 기존계약
			}
			contData.contTitle 				= $("#contTitle").val(); 		// 계약명
			contData.userNo		 			= $("#userNo").val();			// 담당사원
			contData.net_profit		 		= $("#netprofit").val();		// 매출이익
			contData.custNo 				= $("#custNo").val();			// 거래처
			contData.custmemberNo			= $("#custmemberNo").val();		// 거래처 담당자
			contData.ptncNo 				= $("#ptncNo").val();			// 유지보수업체
			contData.supplyNo 				= $("#supplyNo").val();			// 공급업체
			contData.contOrddate 			= $("#contOrddate").val();		// 발주일자
			contData.supplyDate				= $("#supplyDate").val();		// 공급일자
			contData.delivDate				= $("#delivDate").val();		// 검수일자
			contData.contAmt 				= $("#contAmt").val().replace(/[\D\s\._\-]+/g, "");			// 계약금액
			contData.freemaintSdate 		= $("#freemaintSdate").val();	// 무상유지보수 시작일자
			contData.freemaintEdate 		= $("#freemaintEdate").val();	// 무상유지보수 마감일자
			contData.vatYn					= $("#vatYn").val();			// VAT 포함여부 (기본값 : Y)
			contData.contArea 				= $("#contArea").val();			// 지역				
			contData.contType 				= $("#contType").val();			// 판매방식
			contData.contDesc			 	= $("#contDesc").val();			// 계약내용

			if (!contData.contTitle) {
				alert("계약명 제목을 입력하십시오.");		
				return;
			}  else if (!contData.userNo){
				alert("담당사원을 지정하십시오.");
				return;
			} else if (!contData.soppNo && !contData.exContNo){
				alert("영업기회 또는 기존계약명을 지정하십시오.");
				return;
			} else if (!contData.custNo){
				alert("거래처를 지정하십시오.");
				return;
			} else if (!contData.ptncNo){
				alert("유지보수업체를 지정하십시오.");
				return;
			} else if (!contData.supplyNo){
				alert("공급업체를 지정하십시오.");
				return;
			} else if (!contData.contType){
				alert("유지보수업체를 지정하십시오.");
				return;
			} else if (!contData.supplyNo){
				alert("공급업체를 지정합시오.");
				return;
			} else if (!contData.contOrddate){
				alert("발주 일자를 입력하십시오.");
				return;
			} else if (!contData.supplyDate){
				alert("공급 일자를 입력하십시오.");
				return;
			} else if (!contData.delivDate){
				alert("검수 일자를 입력하십시오.");
				return;
			} else if (!contData.contAmt){
				// 계약 금액 숫자에 대한 유효성 체크 필요(숫자여부, 정수/실수 여부, 최소금액, 최대금액) return 값 true 또는 flase 같은 boolean 타입
				alert("계약 금액를 입력하십시오.");
				return;
			} else if (!contData.contArea){
				alert("지역을 지정하십시오.");
				return;
			} else if (!contData.contType){
				alert("판매방법을 지정하십시오.");
				return;
			}

			$.ajax({ url: "${path}/cont/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
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
		/*
		function fn_UpdateCont() {
			var contData = {};
			contData.contTitle 				= $("#contTitle").val(); 
			contData.contDesc			 	= $("#contDesc").val();
			contData.userNo		 			= $("#userNo").val();
			contData.soppNo					= $("#soppNo").val();
			contData.custNo 				= $("#custNo").val();
			contData.ptncNo 				= $("#ptncNo").val();
			contData.supplyNo 				= $("#supplyNo").val();
			contData.contType 				= $("#contType").val();
			contData.contAmt 				= $("#contAmt").val();
			contData.contArea 				= $("#contArea").val();
			contData.contOrddate 			= $("#contOrddate").val();
			contData.freemaintSdate 		= $("#freemaintSdate").val();
			contData.freemaintEdate 		= $("#freemaintEdate").val();

			$.ajax({ url: "${path}/write.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
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
		*/
		$(document).ready(function() {
			$($(".techdDetailCont")[2]).hide();
			$($(".techdDetailCont")[3]).hide();
			$('input[name=contractType]').on('change', function () {
				fnToggleLayer();
			});
			var $input = $("#contAmt,#netprofit");
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

