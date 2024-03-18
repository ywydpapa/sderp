<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top.jsp"/>
<style>
	#listChangeBtn{
		margin-right:3px;		
	}
	
	#tempCustTable{
		display: none;
	}
	
	#custChangeBtn{
		display: none;
	}
	
	#tempCustDelBtn{
		display: none;
	}
</style>

<div id="main_content">
	<script>
	$(function(){
		$('#custTable').DataTable({
			info:false,
			searching: true
		});
	});
	
	$(function(){
		$("#btnAdd").click(function(){
			location.href="${path}/cust/write.do "
		});
	});
	</script>

	<!-- Page-header start 페이지 타이틀-->
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">
						고객/거래처 설정
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Page-header end 페이지 타이틀 -->
	<%
	String userRole = "";
		if ((String) session.getAttribute("userRole") != null) {
			userRole = (String) session.getAttribute("userRole");
		}
	%>
	
	<!--회원리스트 table-->
	<div class="cnt_wr">
		<div class="row">
			<div class="col-sm-12">
				<div class="btn_wr text-right">
					<c:if test="${sessionScope.docRole eq 'S' || sessionScope.docRole eq 'A'}">
						<button class="btn btn-sm btn-info" type="button" id="custChangeBtn" onclick="custChange();">등록업체전환</button>
						<button class="btn btn-sm btn-danger" type="button" id="tempCustDelBtn" onclick="tempCustDelete();">가등록업체삭제</button>
						<button class="btn btn-sm btn-secondary" type="button" id="listChangeBtn" data-type="false" onclick="listChange(this);">가등록리스트</button>
					</c:if>
					<button class="btn btn-sm btn-primary f-right" type="button" id="btnAdd" onClick="javascript:location='${path}/cust/write.do'">거래처등록</button>
				</div>
					<div class="card-block table-border-style">
						<div class="dt-responsive table-responsive">
							<table id="custTable" class="table table-striped table-bordered nowrap">
								<colgroup>
								<col width="12%" />
								<col width="22%" />
								<col width="11%" />
								<col width="15%" />
								<col width="15%" />
								<col width="15%" />
								<col width="10%" />
							</colgroup>
							<thead>
								<tr>
									<th class="text-center">거래처 번호</th>
									<th class="text-center">거래처명</th>
									<th class="text-center">대표자명</th>
									<th class="text-center">사업자번호</th>
									<th class="text-center">거래처이메일</th>
									<th class="text-center">계산서이메일</th>
									<th class="text-center">상세정보</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${list}">
									<tr align="center">
										<td>${row.custNo}</td>
										<td><a href="javascript:location='${path}/cust/detail/${row.custNo}'">${row.custName}</a></td>
										<td>${row.custBossname}</td>
										<td>${row.custVatno}</td>
										<td>${row.custEmail}</td>
										<td>${row.custVatemail}</td>
										<td><a href="javascript:location='${path}/cust/detail/${row.custNo}'">상세정보</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						
						<table id="tempCustTable" class="table table-striped table-bordered nowrap">
							<colgroup>
								<col width="10%" />
								<col width="10%" />
								<col width="30%" />
								<col width="10%" />
								<col width="10%" />
								<col width="10%" />
								<col width="10%" />
								<col width="10%" />
							</colgroup>
							<thead>
								<tr>
									<th class="text-center"><input class="form-control" type="checkbox" onclick="allCheck(this);"></th>
									<th class="text-center">거래처 번호</th>
									<th class="text-center">거래처명</th>
									<th class="text-center">대표자명</th>
									<th class="text-center">사업자번호</th>
									<th class="text-center">거래처이메일</th>
									<th class="text-center">계산서이메일</th>
									<th class="text-center">상세정보</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${tempList}">
									<tr align="center">
										<td class="text-center"><input class="form-control noChecks" type="checkbox" data-no="${row.custNo}"></td>
										<td>${row.custNo}</td>
										<td><a href="javascript:location='${path}/cust/detail/${row.custNo}'">${row.custName}</a></td>
										<td>${row.custBossname}</td>
										<td>${row.custVatno}</td>
										<td>${row.custEmail}</td>
										<td>${row.custVatemail}</td>
										<td><a href="javascript:location='${path}/cust/detail/${row.custNo}'">상세정보</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	function listChange(e){
		let thisEle = $(e);
		let custTable = $("#custTable");
		let tempCustTable = $("#tempCustTable");
		let custChangeBtn = $("#custChangeBtn");
		let tempCustDelBtn = $("#tempCustDelBtn");
		
		if(!thisEle.data("type")){
			thisEle.data("type", true);
			thisEle.removeClass();
			thisEle.attr("class", "btn btn-sm btn-success");
			
			$("#custTable").DataTable().destroy();
			$("#tempCustTable").DataTable({
				info:false,
				searching: true
			});
			
			custTable.hide();
			custChangeBtn.show();
			tempCustDelBtn.show();
			tempCustTable.show();
		}else{
			thisEle.data("type", false);
			thisEle.removeClass();
			thisEle.attr("class", "btn btn-sm btn-secondary");

			$("#tempCustTable").DataTable().destroy();
			$("#custTable").DataTable({
				info:false,
				searching: true
			});
			
			custTable.show();
			custChangeBtn.hide();
			tempCustDelBtn.hide();
			tempCustTable.hide();
		}
	}
	
	function allCheck(e){
		let thisEle = $(e);
		let noChecks = $("#tempCustTable").find("tbody tr td .noChecks");
		
		for(let i = 0; i < noChecks.length; i++){
			let item = $(noChecks[i]);
			
			if(thisEle.is(":checked")){
				item.prop("checked", true);
			}else{
				item.prop("checked", false);
			}
		}
	}
	
	function custChange(){
		if(confirm("전환하시겠습니까??")){
			let noChecks = $("#tempCustTable").find("tbody tr td .noChecks");
			let compNo = "${sessionScope.compNo}";
			
			for(let i = 0; i < noChecks.length; i++){
				let item = $(noChecks[i]);
				
				if(item.is(":checked")){
					$.ajax({
						url: "${path}/cust/tempUpdate.do",
						method: "post",
						data: {
							"custNo": item.data("no"), 
							"compNo": compNo,
						},
						dataType: "json",
					});
				}
			}
			
			alert("전환되었습니다.");
			location.reload();
		}else{
			return false;
		}
	}
	
	function tempCustDelete(){
		if(confirm("삭제하시겠습니까??")){
			let noChecks = $("#tempCustTable").find("tbody tr td .noChecks");
			
			for(let i = 0; i < noChecks.length; i++){
				let item = $(noChecks[i]);
				
				if(item.is(":checked")){
					$.ajax({
						url: "${path}/cust/delete.do",
						method: "post",
						data: {
							"custNo": item.data("no"), 
						},
						dataType: "json",
					});
				}
			}
			
			alert("삭제되었습니다.");
			location.reload();
		}else{
			return false;
		}
	}
</script>
<jsp:include page="../body-bottom.jsp"/>