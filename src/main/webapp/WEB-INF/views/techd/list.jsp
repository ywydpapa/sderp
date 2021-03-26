<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
	<!-- Page-header start 페이지 타이틀-->
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">
						기술지원 조회
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Page-header end 페이지 타이틀 -->


	<!--기술지원 대상조회-->
	<div class="cnt_wr">
		<div class="row">
			<div class="col-sm-12">
				<div class="card_box sch_it">
					<div class="btn_wr text-right">
						<button class="btn btn-sm btn-inverse"><i class="icofont icofont-spinner-alt-3"></i>초기화</button>
						<button class="btn btn-sm btn-primary"><i class="icofont icofont-search"></i>검색</button>
      					<button class="btn btn-sm btn-outline"onClick="javascript:fnSetPage('${path}/techd/write.do')"><i class="icofont icofont-pencil-alt-2"></i>등록</button>
								
					</div>
					<div class="form-group row">
						<div class="col-sm-12 col-xl-3">
							<label class="col-form-label" for="co_name">담당사원</label>
							<div class="input-group input-group-sm">
								<input type="text" id="" name="" class="form-control " readonly>
								<span class="input-group-btn">
									<button class="btn btn-primary sch-company btn-sm" type="button"><i class="icofont icofont-search"></i></button>
								</span>
							</div>
						</div>
						<div class="col-sm-12 col-xl-3">
							<label class="col-form-label" for="co_name">거래처</label>
							<div class="input-group input-group-sm">
								<input type="text" id="" name="" class="form-control " readonly>
								<span class="input-group-btn">
									<button class="btn btn-primary sch-company btn-sm" type="button"><i class="icofont icofont-search"></i></button>
								</span>
							</div>
						</div>
						<div class="col-sm-12 col-xl-3">
							<label class="col-form-label" for="co_name">고객</label>
							<div class="input-group input-group-sm">
								<input type="text" id="" name="" class="form-control " readonly>
								<span class="input-group-btn">
									<button class="btn btn-primary sch-company btn-sm" type="button"><i class="icofont icofont-search"></i></button>
								</span>
							</div>
						</div>
						<div class="col-sm-12 col-xl-3">
							<label class="col-form-label" for="co_name">진행단계</label>
							<select name="select" class="form-control form-control-sm">
								<option value="opt1">선택</option>
								<option value="01">접수</option>
								<option value="02">접수완료</option>			
								<option value="03">접수취소</option>			
								<option value="04">접수보류</option>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-12 col-xl-6">
							<label class="col-form-label" for="co_name">등록일</label>
							<p class="input_inline"><input class="form-control form-control-sm col-xl-6" type="date"> ~ <input class="form-control form-control-sm col-xl-6" type="date">
							</p>
						</div>
						<div class="col-sm-12 col-xl-6">
							<label class="col-form-label" for="co_name">기술지원요청내용</label>
							<input type="text" class="form-control form-control-sm" id="" name="" placeholder="">
						</div>
					</div>
				</div>	
			</div>
		</div>
	</div>
	<!--//기술지원 대상조회-->

	 <!--리스트 table-->
	<div class="cnt_wr">
		<div class="row">
			<div class="col-sm-12">
				<div class="card-block table-border-style">
					<div class="table-responsive">
						<table class="table table-sm bst01">
							<colgroup>
								<col width="1%"/>
								<col width="30%"/>
								<col width="24%"/>
								<col width="15%"/>
								<col width="15%"/>
								<col width="15%"/>
							</colgroup>							
							<thead>
								<tr>
									<th><input class="border-checkbox" type="checkbox" id="checkbox0"></th>
									<th>요청명</th>
									<th>거래처</th>
									<th>진행단계</th>
									<th>담당사원</th>
									<th>등록일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${list}">
								<tr>
									<th scope="row"><input class="border-checkbox" type="checkbox" id="checkbox0"></th>
									<td><a href="javascript:fnSetPage('${path}/techd/detail/${row.techdNo}')">${row.techdNo}</a></td>							
									<td>${row.techdTitle}</td>
									<td>${row.custName}</td>
									<td>${row.techdSteps}</td>
									<td>${row.userName}</td> 
									<td>${row.regdatetime}</td>
								</tr>
							</c:forEach>		
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--//리스트 table-->

	
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
		function fnSetCustData(a, b) {
			$("#co_name").val(a);
			$("#co_no").val(b);
			$(".modal-backdrop").remove();
			$("#custModal").modal("hide");
		}
		function fnSetUserData(a, b) {
			$("#userNo").val(a);
			$("#userId").val(b);
			$(".modal-backdrop").remove();
			$("#userModal").modal("hide");
		}
	</script>
		