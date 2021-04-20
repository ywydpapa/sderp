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

<script>
$(function(){
	var obj = new Object();
    var schedTable = $('#schedTable').DataTable({
		order: [[ 2, "desc" ]],
		paging : true, // 페이지 처리 여부
		ordering : true, // 컬럼 클릭 시 오더링을 적용 여부
		// info : true, // 페이지 상태에 대한 정보 여부
		filter : true, // 검색창 여부
		// lengthChange : true, // 블록 단위 변경 기능 여부
		// stateSave : false,
		pageLength: 20, // 한 페이지에 기본으로 보열줄 항목 수
		pagingType : "full_numbers",
		bPaginate: true,
		bLengthChange: true,
		lengthMenu: [[20, 40, 60, 80, 100], [20, 40, 60, 80, 100]], // 리스트 항목을 구성할 옵션들
		bProcessing: true,
		bServerSide: true,
		sAjaxSource : "${path}/sched/list/data",
		sServerMethod : "POST",
		fnServerParams : function (data){
			data.push({"name":"userName", "value" : $("#userName").val()});
			data.push({"name":"soppTitle", "value" : $("#soppTitle").val()});
			data.push({"name":"custNo", "value" : $("#custNo").val()});
			data.push({"name":"custmemberNo", "value" : $("#custmemberNo").val()});
			data.push({"name":"contNo", "value" : $("#contNo").val()});
			data.push({"name":"schedCat", "value" : $("#schedCat option:selected").val()});
			data.push({"name":"userName", "value" : $("#userName").val()});
			if($("#schedFrom").val() != "" && $("#schedTo").val() != ""){
				data.push({"name":"schedFrom", "value" : $("#schedFrom").val()});
				data.push({"name":"schedTo", "value" : $("#schedTo").val()});
			} else {
				data.push({"name":"schedFrom", "value" : ""});
				data.push({"name":"schedTo", "value" : ""});
			}
			console.dir();
			data.push({"name":"columns","value":this.columns});
		},
		// TODO 아래 주석은 서버로 부터 성공시 data 확인하는 용도
		/*
		fnServerData: function ( sSource, aoData, fnCallback, oSettings ) {
			oSettings.jqXHR = $.ajax({
				"dataType": 'json',
				"type": "POST",
				"url": sSource,
				"data": aoData,
				"success": function (data) {
					console.dir(data);
					return data.aaData;
				}
			});
		},
		*/
		columnDefs :[
			{
				defaultContent : "-",
				targets : "_all"
			},
			{
				targets : [1],
				render : function ( data, type, row, meta ) {
					return '<a href="javascript:fnSetDetailLink(\''+row.schedTypeN+'\','+row.schedNo+')" title="'+data+'">'+data+'</a>';
				}
			}
		],	// ajax로 데이터가 날아오면서 list를 뿌려주는데 각 컬럼에서 만약 값이 없으면 오류대처
		columns : [
			{data: "schedTypeN", column : '일정구분'},
			{data: "schedTitle", column : '일정제목'},
			{data: "schedFrom", column : '일정'},
			{
				data: "custName",
				column : '고객사',
				render : function ( data, type, row ) {
					if(data == null || data == undefined) {
						return '';
					} else {
						return '<span title="'+data+'">'+data+'</span>';
					}
				},
			},
			{
				data: "userName",
				column : '담당자',
				render : function ( data, type, row ) {
					if(data == null || data == undefined) {
						return '';
					} else {
						return data;
					}
				},
			},
			{
				data: "schedPlace",
				column : '장소',
				render : function ( data, type, row ) {
					if(data == null || data == undefined) {
						return '';
					} else {
						return '<span title="'+data+'">'+data+'</span>';
					}
				},
			},
			{
				data: "schedCatN",
				column : '활동형태',
				render : function ( data, type, row ) {
					if(data == null || data == undefined) {
						return '';
					} else {
						return data;
					}
				},
			},
			{
				data: "schedDesc",
				column : '일정설명',
				render : function ( data, type, row ) {
					if(data == null || data == undefined) {
						return '';
					} else {
						return '<span title="'+data+'">'+data+'</span>';
					}
				},
			}
		],
		oLanguage: {
			sZeroRecords : "일치하는 데이터가 존재하지 않습니다.",
			sInfo : "현재 _START_ - _END_ / _TOTAL_건",
			slengthMenu: "페이지당 _MENU_ 개씩 보기",
			sInfoEmpty: "데이터 없음",
			sInfoFiltered: "( _MAX_건의 데이터에서 필터링됨 )",
			sSearch : "내부검색 : ",
			sProcessing : '데이터 불러오는중...',
			oPaginate: {
				sFirst : '처음으로',
				sLast : '마지막으로',
				sPrevious: "이전",
				sNext: "다음"
			}
		},
		// docs : https://legacy.datatables.net/usage/i18n

    });

    $('#schedTable_filter input').unbind();
    $('#schedTable_filter input').bind('keyup', function (e){
    	if(e.keyCode == 13){
    		schedTable.search(this.value).draw();
		}
	});
});
</script>
<style>
	a {
		text-decoration:underline;
	}
	#schedTable > tbody > tr > td:nth-child(2){
		overflow: hidden;
		text-overflow: ellipsis;
		max-width: 170px;
		white-space: nowrap;
	}
	#schedTable > tbody > tr > td:nth-child(4){
		overflow: hidden;
		text-overflow: ellipsis;
		max-width: 150px;
		white-space: nowrap;
	}
	#schedTable > tbody > tr > td:nth-child(8){
		overflow: hidden;
		text-overflow: ellipsis;
		max-width: 300px;
		white-space: nowrap;
	}
</style>

	<c:if test="${preserveSearchCondition != 'Y'}">
		<div class="page-header2">
			<div class="row align-items-end">
				<div class="col-lg-12">
					<div class="page-header-title">
						<div class="d-inline">
							일정조회
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--Page-header end 페이지 타이틀 -->
		<!--일정조회-->
	<div class="cnt_wr">
		<div class="row">
			<form id="searchForm" method="post" onsubmit="return false;" class="col-sm-12">
				<div class="card_box sch_it">
					<div class="btn_wr text-right">
						<button class="btn btn-sm btn-inverse" onClick="javascript:fnClearall()">
							<i class="icofont icofont-spinner-alt-3"></i>초기화
						</button>
						<button class="btn btn-sm btn-primary" onClick="javascript:fnListcon()">
							<i class="icofont icofont-search"></i>검색
						</button>
						<button class="btn btn-sm btn-outline"
							onClick="javascript:fnSetPage('${path}/sales/write.do')">
							<i class="icofont icofont-pencil-alt-2"></i>등록
						</button>
					</div>
					<div class="form-group row">
						<div class="col-sm-12 col-xl-3">
							<label class="col-form-label" for="userName">담당사원</label>
							<div class="input-group input-group-sm mb-0">
								<input type="text" class="form-control" name="userName"
									id="userName" value="" readonly /> <input type="hidden"
									name="userNo" id="userNo" value="" /> <span
									class="input-group-btn">
									<button class="btn btn-primary sch-company"
										data-remote="${path}/modal/popup.do?popId=user" type="button"
										data-toggle="modal" data-target="#userModal">
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
												<button type="button" class="btn btn-default waves-effect "
													data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-12 col-xl-3">
							<label class="col-form-label" for="soppTitle">영업기회</label>
							<div class="input-group input-group-sm mb-0">
								<input type="text" class="form-control" name="soppTitle"
									id="soppTitle" value="" readonly /> <input type="hidden"
									name="soppNo" id="soppNo" value="" /> <span
									class="input-group-btn">
									<button class="btn btn-primary sch-company"
										data-remote="${path}/modal/popup.do?popId=sopp" type="button"
										data-toggle="modal" data-target="#soppModal">
										<i class="icofont icofont-search"></i>
									</button>
								</span>
								<div class="modal fade " id="soppModal" tabindex="-1"
									role="dialog">
									<div class="modal-dialog modal-80size" role="document">
										<div class="modal-content modal-80size">
											<div class="modal-header">
												<h4 class="modal-title">영업기회 검색</h4>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<h5>영업기회 목록</h5>
												<p>Loading!!!</p>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default waves-effect "
													data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-12 col-xl-3">
							<label class="col-form-label" for="custName">거래처</label>
							<div class="input-group input-group-sm mb-0">
								<input type="text" class="form-control" name="custName"
									id="custName" value="" readonly /> <input type="hidden"
									name="custNo" id="custNo" value="" /> <span
									class="input-group-btn">
									<button class="btn btn-primary sch-company"
										data-remote="${path}/modal/popup.do?popId=cust" type="button"
										data-toggle="modal" data-target="#custModal">
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
												<button type="button" class="btn btn-default waves-effect "
													data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-12 col-xl-3">
								<label class="col-form-label" for="custmemberName">엔드유저</label>
								<div class="input-group input-group-sm mb-0">
									<input type="text" class="form-control" name="custmemberName"
										id="custmemberName" value="" readonly /> <input type="hidden"
										name="custmemberNo" id="custmemberNo" value="" /> <span
										class="input-group-btn">
										<button class="btn btn-primary sch-company"
											data-remote="${path}/modal/popup.do?popId=custmem&compNo=" type="button"
											data-toggle="modal" data-target="#custmemberModal">
											<i class="icofont icofont-search"></i>
										</button>
									</span>
									<div class="modal fade " id="custmemberModal" tabindex="-1"
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
													<h5>고객목록</h5>
													<p>거래처를 먼저 입력해주셔야 목록이 보입니다.</p>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default waves-effect "
														data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-12 col-xl-3">
								<label class="col-form-label" for="custmemberName">계약</label>
								<div class="input-group input-group-sm mb-0">
									<input type="text" class="form-control" name="contTitle"
										id="contTitle" value="" readonly /> <input type="hidden"
										name="contNo" id="contNo" value="" /> <span
										class="input-group-btn">
										<button class="btn btn-primary sch-company"
											data-remote="${path}/modal/popup.do?popId=cont" type="button"
											data-toggle="modal" data-target="#contModal">
											<i class="icofont icofont-search"></i>
										</button>
									</span>
									<div class="modal fade " id="contModal" tabindex="-1"
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
													<h5>계약목록</h5>
													<p>Loading!!!</p>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default waves-effect "
														data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						<div class="col-sm-12 col-xl-3">
							<label class="col-form-label" for="co_name">활동형태</label> <select
								name="select" class="form-control form-control-sm" id="schedCat">
								<option value>선택</option>
								<c:forEach var ="listschedcat" items="${listschedcat}">
									<option value = "${listschedcat.codeNo}">${listschedcat.desc03}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-sm-12 col-xl-6">
							<label class="col-form-label" for="co_name">활동일</label>
							<p class="input_inline">
								<input class="form-control form-control-sm col-xl-6" type="date" id="schedFrom" onChange="javascript:inputDate($('#schedFrom').val(), $('#schedTo').val())">
								~ <input class="form-control form-control-sm col-xl-6"
									type="date" id="schedTo" onChange="javascript:inputDate($('#schedFrom').val(), $('#schedTo').val())">
							</p>
						</div>
					</div>
				</div>
			</div>
			</form>
			<div class="col-sm-12">
		</div>
	</div>
	</c:if>
	<!-- Page-header start 페이지 타이틀-->
<!--일정조회-->
<!--회원리스트 table-->
<div class="cnt_wr" id="list-container">
	<div class="row">
		<div class="col-sm-12">
			<div class="card-block table-border-style">
				<div class="table-responsive">
					<table id="schedTable" class="table table-striped table-bordered nowrap">
						<thead>
							<tr>
								<th>일정구분</th>
								<th>일정제목</th>
								<th>일정</th>
								<th>고객사</th>
								<th>담당자</th>
								<th>장소</th>
								<th>활동형태</th>
								<th>일정설명</th>
							</tr>
						</thead>
						<%--<tbody>
							<c:forEach var="row" items="${list}">
								<tr>
									<td>${row.schedTypeN}</td>
									<td><a href="javascript:fnSetDetailLink('${row.schedTypeN}', '${row.schedNo}')">${row.schedTitle}</a></td>
									<td>
										<fmt:parseDate value="${row.schedFrom}" var="schedFrom" pattern="yyyy-MM-dd HH:mm:ss"/>
										<fmt:formatDate value="${schedFrom}" pattern="yyyy-MM-dd"/>
										<span> ~ </span>
										<fmt:parseDate value="${row.schedTo}" var="schedTo" pattern="yyyy-MM-dd HH:mm:ss"/>
										<fmt:formatDate value="${schedTo}" pattern="yyyy-MM-dd"/>
									</td>
									<td title="${row.custName}">${row.custName}</td>
									<td>${row.userName}</td>
									<td>${row.schedPlace}</td>
									<td>${row.schedCatN}</td>
									<td title="${row.schedDesc}">${row.schedDesc}</td>
								</tr>
							</c:forEach>
						</tbody>--%>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<!--//table-->

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
		$('#soppModal').on('show.bs.modal', function(e) {
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
		}
    	function fnSetUserData(a, b) {
			$("#userName").val(b);
			$("#userNo").val(a);
			$(".modal-backdrop").remove();
			$("#userModal").modal("hide");
		}
    	function fnSetSoppData(a, b) {
			$("#soppNo").val(b);
			$("#soppTitle").val(a);
			$(".modal-backdrop").remove();
			$("#soppModal").modal("hide");
		}
    	function fnSetCustmereData(a, b) {
    		$("#custmemberNo").val(a);
    		$("#custmemberName").val(b);
    		$(".modal-backdrop").remove();
    		$("#custmemberModal").modal("hide");
    	}
    	function fnSetContData(a, b) {
			$("#contNo").val(b);
			$("#contTitle").val(a);
			$(".modal-backdrop").remove();
			$("#contModal").modal("hide");
		}
    	
    	
    	function fnListcon() {
    		var schedData = {};
    		schedData.userNo = $("#userNo").val() ? $("#userNo").val() : 0;
    		schedData.soppNo = $("#soppNo").val() ? $("#soppNo").val() : 0;
    		schedData.custNo = $("#custNo").val() ? $("#custNo").val() : 0;
    		schedData.custmemberNo = $("#custmemberNo").val() ? $("#custmemberNo").val() : 0;
    		schedData.contNo = $("#contNo").val() ? $("#contNo").val() : 0;
    		schedData.schedCat = $("#schedCat").val() ? $("#schedCat").val() : null;
    		schedData.schedFrom = $("#schedFrom").val() ? $("#schedFrom").val() : null;
    		schedData.schedTo = $("#schedTo").val() ? $("#schedTo").val() : null;
    		
    		fnSetList('${path}/sched/listcon.do', schedData);
    	}
    	
    	function fnSetDetailLink(schedTypeN, schedNo) {
    		var typePath;
   
    		if(schedTypeN == '영업일정') {
    			typePath = 'sales'; 			
    		}else if(schedTypeN == '기술지원') {
    			typePath = 'techd';
    		}else if(schedTypeN == '기타일정') {
    			typePath = 'sched';
    		}
    		
    		fnSetPage('${path}/' + typePath + '/detail/' + schedNo);
    	}
</script>
