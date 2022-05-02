<%@ page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top.jsp"/>
<head>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
</head>
<div id="main_content">
	<input type="hidden" value="${sessionScope.compNo}" id="demo_graph"/>
	<input type="hidden" value="${userRole}" id="demo_userRole">
	<script type="text/javascript" src="${path}/assets/echart/echarts-5.0.2.js"></script>
	<%
		Calendar calendar = Calendar.getInstance();
		int month = calendar.get(Calendar.MONTH)+1;
		String monthStr = "";
		String monthStr_minus_one = "";
		if(month < 10){
			monthStr = "0"+ String.valueOf(month);
			monthStr_minus_one = "0" + String.valueOf(month-1);
		} else {
			monthStr = String.valueOf(month);
			monthStr_minus_one = String.valueOf(month-1);
		}
	%>

	<div class="row" >
		<c:if test="${userRole ne 'CUSER'}">
			<!-- 4번째 그래프 -->
			<div class="col-md-6">
				<div class="card" style="width: 100%; height: auto;">
					<div class="card-header">
							<div style="display: inline-block;">
								<h5>매출 추이</h5>
								<span style="vertical-align: bottom;">2022년</span>
							</div>
							<select class="custom-select mr-sm-2" name="graph1TargetYear1" id="graph1TargetYear1" style="float:right;">
							<option value = "2022" selected>2022</option>
								<!-- <option value = "2021">2021</option>
								<option value = "2020">2020</option> -->
							</select>
						</div>
					<div class="defalut_gra">
						<canvas id="myChart" width="800" height="400"></canvas>
					</div>
				</div>
			</div>
		<!-- 4번째 그래프 -->
		<!-- 1번째 그래프 -->
			<div class="col-md-3" style="min-width: auto; min-height: 94%;">
				<div class="card" style="width: auto; height: 94%; ">
					<div class="card-header" style="padding: 25px 12px;">
						<select class="custom-select mr-sm-1" name="graph2TargetMonth1"
							id="graph2TargetMonth1" style="float: right;">
							<option value="<%=monthStr%>"><%=monthStr%></option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select> 
						<select class="custom-select mr-sm-1" name="graph2TargetYear" id="graph2TargetYear" style="float: right;">
							<option value="2022">2022</option>
						</select> 
						<!-- <select class="custom-select mr-sm-1" name="graph2TargetDepartment" id="graph2TargetDepartment" style="float: right;">
							<option value="all" selected>전체</option>
						</select> -->
						<div style="display: inline-block;">
							<h5>월 계획대비 실적</h5>
							<span style="vertical-align: bottom;" id="graph2TargetMiniTitle">2022년
							</span>
						</div>
					</div>
					<div class="defalut_gra">
						<div class="mbo-title ky-box ky-box-default">
							<div class="col-sm-12">
								<div class="ky-box-content text-right">
									<small>목표</small>
									<span id="chart2_month_profitTarget1">₩0</span>
								</div>
								<div class="ky-box-content text-right">
									<small>매출</small>
									<span id="chart2_month_salesTarget1">₩0</span>
								</div>
								<div class="ky-box-content text-right">
									<small>달성률</small>
									<span class="text-danger" id="chart2_month_percent1">0%</span>
								</div>
								<div class="ky-box-content text-right" style="border-top:1px solid #8C8C8C" id="0_month_text"><span class="" id="chart2_month_overTarget1">+₩0</span></div>
							</div>
						</div>
						<canvas id="myChartdoughnut" width="90" height="40"></canvas>
					</div>
				</div>
			</div>
			<!-- 1번째 그래프 -->
			
			<!-- 2번째 그래프 -->
			<div class="col-md-3" style="min-width: auto; min-height: 94%;">
				<div class="card" style="width: auto; height: 94%; ">
					<div class="card-header">
						<!-- <select class="custom-select mr-sm-1" name="graph3TargetYear" id="graph3TargetYear" style="float:right;">
							<option value = "2022" >2022</option>
						</select>
						<select class="custom-select mr-sm-1" name="graph3TargetDepartment" id="graph3TargetDepartment" style="float:right;">
							<option value = "" selected>전체</option>
						</select> -->
						<div style="display: inline-block;">
							<h5>누적 계획대비 실적</h5>
							<span style="vertical-align: bottom;" id="graph3TargetMiniTitle">2022년</span>
						</div>
					</div>
					<div class="defalut_gra">
						<div class="mbo-title ky-box ky-box-default">
							<div class="col-sm-12">
								<div class="ky-box-content text-right">
									<small>목표</small>
									<span id="chart3_month_profitTarget1">₩0</span>
								</div>
								<div class="ky-box-content text-right">
									<small>매출</small>
									<span id="chart3_month_salesTarget1">₩0</span>
								</div>
								<div class="ky-box-content text-right">
									<small>달성률</small>
									<span class="text-danger" id="chart3_month_percent1">0%</span>
								</div>
								<div class="ky-box-content text-right" style="border-top:1px solid #8C8C8C" id="0_year_text"><span class="" id="chart3_month_overTarget1">+₩0</span></div>
							</div>
						</div>
						<canvas id="myChartdoughnut1" width="90" height="40"></canvas>
					</div>
				</div>
			</div>
			<!-- 2번째 그래프 -->
			<%-- 
			<div class="col-md-12 col-lg-5" style="min-width: 697.08px; min-height: 545px;">
				<div class="card">
					<div class="card-header">
						<div style="display: inline-block;">
							<h5>연간 계획대비 실적</h5>
							<span style="vertical-align: bottom;">2022년</span>
						</div>
						<!-- <div class="card-header-right">
							<i class="icofont icofont-spinner-alt-5"></i>
						</div> -->
						<select class="custom-select mr-sm-2" name="graph1TargetYear" id="graph1TargetYear" style="float:right;">
							<option value = "2022" <c:if test="${graph1.targetYear == 2022}">selected</c:if> >2022</option>
						</select>
						<select class="custom-select mr-sm-2" name="graph1TargetDepartment" id="graph1TargetDepartment" style="float:right;">
							<option value = "all" selected>전체</option>
							
							<option value = "dept" disabled>부서</option>
							<option value = "individual" disabled>개인</option>
							
						</select>
					</div>
					<div class="card-block">
						<div id="myChart01" style="width:650px; height:400px;"></div>
					</div>
				</div>
			</div>
			<div class="col-md-12 col-lg-2" style="min-width: 278.83px; min-height: 545px;">
				<div class="card">
					<div class="card-header" style="padding:25px 12px;">
						<select class="custom-select mr-sm-1" name="graph2TargetMonth" id="graph2TargetMonth" style="float:right;">
							<option value = "01" <c:if test="${graph2.targetMonth == 01}">selected</c:if> >01</option>
							<option value = "02" <c:if test="${graph2.targetMonth == 02}">selected</c:if> >02</option>
							<option value = "03" <c:if test="${graph2.targetMonth == 03}">selected</c:if> >03</option>
							<option value = "04" <c:if test="${graph2.targetMonth == 04}">selected</c:if> >04</option>
							<option value = "05" <c:if test="${graph2.targetMonth == 05}">selected</c:if> >05</option>
							<option value = "06" <c:if test="${graph2.targetMonth == 06}">selected</c:if> >06</option>
							<option value = "07" <c:if test="${graph2.targetMonth == 07}">selected</c:if> >07</option>
							<option value = "08" <c:if test="${graph2.targetMonth == 08}">selected</c:if> >08</option>
							<option value = "09" <c:if test="${graph2.targetMonth == 09}">selected</c:if> >09</option>
							<option value = "10" <c:if test="${graph2.targetMonth == 10}">selected</c:if> >10</option>
							<option value = "11" <c:if test="${graph2.targetMonth == 11}">selected</c:if> >11</option>
							<option value = "12" <c:if test="${graph2.targetMonth == 12}">selected</c:if> >12</option>
						</select>
						<select class="custom-select mr-sm-1" name="graph2TargetYear" id="graph2TargetYear" style="float:right;">
							<option value = "2022" <c:if test="${graph2.targetYear == 2022}">selected</c:if> >2022</option>
						</select>
						<select class="custom-select mr-sm-1" name="graph2TargetDepartment" id="graph2TargetDepartment" style="float:right;">
							<option value = "all" selected>전체</option>
							
							<option value = "dept" disabled>부서</option>
							<option value = "individual" disabled>개인</option>
							

						</select>
						<div style="display: inline-block;">
							<h5>월 계획대비 실적</h5>
							<span style="vertical-align: bottom;" id="graph2TargetMiniTitle">2022년 <%=monthStr%>월</span>
						</div>
						<!-- <div class="card-header-right">
							<i class="icofont icofont-spinner-alt-5"></i>
						</div> -->
					</div>
					<div class="card-block">
						<div id="myChart02" style="width:270px; height:350px;"></div>
					</div>
					<div class="chart2">
						<div class="mbo-title ky-box ky-box-default">
							<div class="col-sm-2"><div class="icon"><i class="fa fa-tags fa-5x" aria-hidden="true"></i></div></div>
							<div class="col-sm-12">
								<div class="ky-box-content text-right">
									<small>목표</small>
									<span id="chart2_month_profitTarget">₩0</span>
								</div>
								<div class="ky-box-content text-right">
									<small>매출</small>
									<span id="chart2_month_salesTarget">₩0</span>
								</div>
								<div class="ky-box-content text-right">
									<small>달성률</small>
									<span class="text-danger" id="chart2_month_percent">0%</span>
								</div>
								<div class="ky-box-content text-right" style="border-top:1px solid #8C8C8C" id="0_month_text"><span class="" id="chart2_month_overTarget">+₩0</span></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-12 col-lg-2" style="min-width: 278.83px; min-height: 545px;">
				<div class="card">
					<div class="card-header">
						<select class="custom-select mr-sm-1" name="graph3TargetYear" id="graph3TargetYear" style="float:right;">
							<option value = "2022" <c:if test="${graph3.targetYear == 2022}">selected</c:if> >2022</option>
						</select>
						<select class="custom-select mr-sm-1" name="graph3TargetDepartment" id="graph3TargetDepartment" style="float:right;">
							<option value = "all" selected>전체</option>
							
							<option value = "dept" disabled>부서</option>
							<option value = "individual" disabled>개인</option>
							
						</select>
						<div style="display: inline-block;">
							<h5>누적 계획대비 실적</h5>
							<span style="vertical-align: bottom;" id="graph3TargetMiniTitle">2022년</span>
						</div>
						<!-- <div class="card-header-right">
							<i class="icofont icofont-spinner-alt-5"></i>
						</div> -->
					</div>
					<div class="card-block">
						<div id="myChart03" style="width:270px; height:350px;"></div>
					</div>
					<div class="chart3">
						<div class="mbo-title ky-box ky-box-default">
							<div class="col-sm-2"><div class="icon"><i class="fa fa-tags fa-5x" aria-hidden="true"></i></div></div>
							<div class="col-sm-12">
								<div class="ky-box-content text-right">
									<small>목표</small>
									<span id="chart3_month_profitTarget">₩0</span>
								</div>
								<div class="ky-box-content text-right">
									<small>매출</small>
									<span id="chart3_month_salesTarget">₩0</span>
								</div>
								<div class="ky-box-content text-right">
									<small>달성률</small>
									<span class="text-danger" id="chart3_month_percent">0%</span>
								</div>
								<div class="ky-box-content text-right" style="border-top:1px solid #8C8C8C" id="0_year_text"><span class="" id="chart3_month_overTarget">+₩0</span></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-12 col-lg-3" style="min-width: 418.25px; min-height: 545px;">
				<div class="card">
					<div class="card-header">
						<select class="custom-select mr-sm-1" name="graph4TargetYear" id="graph4TargetYear" style="float:right;">
							<option value = "2022" <c:if test="${graph4.targetYear == 2022}">selected</c:if> >2022</option>
						</select>
						<select class="custom-select mr-sm-1" name="graph4TargetDepartment" id="graph4TargetDepartment" style="float:right;">
							<option value = "all" selected>전체</option>
							
							<option value = "dept" disabled>부서</option>
							<option value = "individual" disabled>개인</option>
							
						</select>
						<div style="display: inline-block;">
							<h5>누적 판매방식별 실적</h5>
							<span style="vertical-align: bottom;" id="graph4TargetMiniTitle">2022년</span>
						</div>
					</div>
					<div class="card-block">
						<div id="myChart04" style="width:350px; height:400px;"></div>
					</div>
				</div>
			</div> --%>
		</c:if>
		<div class="col-md-12 col-lg-6">
			<div class="card">
				<div class="card-header">
					<h5>영업기회현황</h5>
					<span>부서별/개인별 영업기회현황</span>
					<div class="card-header-right">
						<i class="icofont icofont-spinner-alt-5"></i>
					</div>
				</div>
				<div class="card-block">
					<table id="soppTable" class="table table-striped table-bordered nowrap">
						<colgroup>
							<col width="4%">
							<col width="2%">
							<col width="20%">
							<col width="4%">
							<col width="15%">
							<col width="4%">
						</colgroup>
						<thead>
							<tr >
								<th style="text-align: center">등록/수정일</th>
								<th style="text-align: center">판매방식</th>
								<th style="text-align: center">영업기회명</th>
								<th style="text-align: center">매출처</th>
								<th style="text-align: center">예상매출액</th>
								<th style="text-align: center">담당자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="row" items="${sopplist}">
								<tr align="center">
									<td>
										<fmt:parseDate value="${row.modDatetime}" var="modDatetime" pattern="yyyy-MM-dd HH:mm:ss"/>
										<fmt:formatDate value="${modDatetime}" pattern="yyyy-MM-dd"/>
									</td>
									<td>${row.soppTypeN}</td>
									<td><a href="${path}/sopp/detail/${row.soppNo}" title="${row.soppTitle}">${row.soppTitle}</a></td>
									<td id="text_overflow"><span title="${row.custName}">${row.custName}</span></td>
									<td style="text-align: right"><fmt:formatNumber value="${row.soppTargetAmt}" pattern="#,###"/></td>
									<td>${row.userName}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<c:if test="${saleslist != null}">
			<div class="col-md-12 col-lg-6">
				<div class="card">
					<div class="card-header">
						<div style="display: inline-block;">
							<h5>일정</h5>
							<span>영업일정 목록</span>
						</div>
						<select class="custom-select mr-sm-2" name="" id="salesTableSelect" style="margin-top: -32px; margin-left: 22px;">
							<option value = "all">전체</option>
							<%--
							<option value = "dept" selected>부서</option>
							<option value = "individual">개인</option>
							--%>
						</select>
					</div>
					<div class="card-block">
						<table id="salesTable" class="table table-striped table-bordered nowrap">
							<thead>
								<tr>
									<th style="text-align: center">등록일</th>
									<th style="text-align: center">영업일정</th>
									<th style="text-align: center">일정명</th>
									<th style="text-align: center">매출처</th>
									<th style="text-align: center">담당자</th>
									<th style="text-align: center">장소</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${saleslist}">
									<tr align="center">
										<td>
											<fmt:parseDate value="${row.regDatetime}" var="regDatetime" pattern="yyyy-MM-dd HH:mm:ss"/>
											<fmt:formatDate value="${regDatetime}" pattern="yyyy-MM-dd"/>
										</td>
										<td>
											<fmt:parseDate value="${row.salesFrdatetime}" var="salesFrdatetime" pattern="yyyy-MM-dd HH:mm:ss"/>
											<fmt:formatDate value="${salesFrdatetime}" pattern="yyyy-MM-dd"/>
										</td>
										<td><a href="${path}/sales/detail/${row.salesNo}" title="${row.salesTitle}">${row.salesTitle}</a></td>
										<td><span title="${row.custName}">${row.custName}</span></td>
										<td>${row.userName}</td>
										<td><span title="${row.salesPlace}">${row.salesPlace}</span></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${techdlist != null}">
			<div class="col-md-12 col-lg-6">
				<div class="card">
					<div class="card-header">
						<div style="display: inline-block;">
							<h5>일정</h5>
							<span>기술지원일정 목록</span>
						</div>
						<select class="custom-select mr-sm-2" name="" id="techdTableSelect" style="margin-top: -32px; margin-left: 22px;">
							<option value = "all">전체</option>
							<%--
							<option value = "dept" selected>부서</option>
							<option value = "individual">개인</option>
							--%>
						</select>
					</div>
					<div class="card-block">
						<table id="techdTable" class="table table-striped table-bordered nowrap">
							<thead>
							<tr>
								<th style="text-align: center">등록일</th>
								<th style="text-align: center">지원일정</th>
								<th style="text-align: center">일정명</th>
								<th style="text-align: center">매출처</th>
								<th style="text-align: center">담당자</th>
								<th style="text-align: center">장소</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach var="row" items="${techdlist}">
								<tr align="center">
									<td>
										<fmt:parseDate value="${row.regdatetime}" var="regdatetime" pattern="yyyy-MM-dd HH:mm:ss"/>
										<fmt:formatDate value="${regdatetime}" pattern="yyyy-MM-dd"/>
									</td>
									<td>
										<fmt:parseDate value="${row.techdFrom}" var="techdfromdatetime" pattern="yyyy-MM-dd HH:mm:ss"/>
										<fmt:formatDate value="${techdfromdatetime}" pattern="yyyy-MM-dd"/>
									</td>
									<td><a href="${path}/techd/detail/${row.techdNo}" title="${row.techdTitle}">${row.techdTitle}</a></td>
									<td><span title="${row.custName}">${row.custName}</span></td>
									<td>${row.userName}</td>
									<td><span title="${row.techdPlace}">${row.techdPlace}</span></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</c:if>
		<div class="col-md-12 col-lg-6">
			<div class="card">
				<div class="card-header">
					<h5>계약현황</h5>
					<span>계약현황</span>
					<div class="card-header-right">
						<i class="icofont icofont-spinner-alt-5"></i>
					</div>
				</div>
				<div class="card-block">
					<table id="contTable" class="table table-striped table-bordered nowrap">
						<colgroup>
							<col width="4%">
							<col width="2%">
							<col width="20%">
							<col width="10%">
							<col width="15%">
							<col width="4%">
						</colgroup>
						<thead>
							<tr>
								<th style="text-align: center">등록일</th>
								<th style="text-align: center">발주일자</th>
								<th style="text-align: center">계약명</th>
								<th style="text-align: center">매출처</th>
								<th style="text-align: center">계약금액</th>
								<th style="text-align: center">담당자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="row" items="${contlist}">
								<tr align="center">
									<td>
										<fmt:parseDate value="${row.regDatetime}" var="regDatetime" pattern="yyyy-MM-dd HH:mm:ss"/>
										<fmt:formatDate value="${regDatetime}" pattern="yyyy-MM-dd"/>
									</td>
									<td>${row.contOrddate}</td>
									<td><a href="${path}/cont/detail/${row.contNo}/${row.soppNo}" title="${row.contTitle}">${row.contTitle}</a></td>
									<td><span title="${row.custName}">${row.custName}</span></td>
									<td style="text-align: right"><fmt:formatNumber value="${row.contAmt}" pattern="#,###"/></td>
									<td>${row.userName}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="col-md-12 col-lg-6">
			<div class="card">
				<div class="card-header">
					<h5>공지사항</h5>
					<span>사내 공지사항</span>
					<div class="card-header-right">
						<i class="icofont icofont-spinner-alt-5"></i>
					</div>
				</div>
				<div class="card-block">
					<table id="contTable" class="table table-striped table-bordered nowrap">
						<thead>
							<tr>
								<th style="text-align: center">번호</th>
								<th style="text-align: center">제목</th>
								<th style="text-align: center">작성자</th>
								<th style="text-align: center">등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="row" items="${noticelist}">
								<tr align="center">
									<td>${row.row_num}</td>
									<td><a href="${path }/notice/detail/${row.notiNo }">${row.notiTitle}</a></td>
									<td>${row.userName}</td>
									<td>${row.regDatetime}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<style>
		.chart2, .chart3{
			padding-bottom: 33px;
			margin-left: 6px;
			margin-top: -148px;
			width: 95%;
		}
		.ky-box-default {
			background-color: #ebebeb;
			color: #5e5e5e;
		}
		.ky-box {
			border-radius: 5px;
		}
		.ky-box-content > span{
			font-size: 20px !important;
			font: bold;
		}
		.mbo-title {
			padding: 1px 0px 5px 0px;
		}
		#soppTable > tbody > tr > td:nth-child(2){
			text-overflow: ellipsis;
			max-width: 200px;
			overflow: hidden;
		}
		#soppTable > tbody > tr > td:nth-child(3){
			text-overflow: ellipsis;
			max-width: 50px;
			overflow: hidden;
		}
		#salesTable > tbody > tr > td:nth-child(1){
			text-overflow: ellipsis;
			max-width: 150px;
			overflow: hidden;
		}
		#salesTable > tbody > tr > td:nth-child(2){
			text-overflow: ellipsis;
			max-width: 150px;
			overflow: hidden;
		}
		#salesTable > tbody > tr > td:nth-child(3){
			text-overflow: ellipsis;
			max-width: 180px;
			overflow: hidden;
		}
		#salesTable > tbody > tr > td:nth-child(4){
			text-overflow: ellipsis;
			max-width: 180px;
			overflow: hidden;
		}

		#techdTable > tbody > tr > td:nth-child(2){
			text-overflow: ellipsis;
			max-width: 360px;
			overflow: hidden;
		}
		#techdTable > tbody > tr > td:nth-child(3){
			text-overflow: ellipsis;
			max-width: 180px;
			overflow: hidden;
		}
		#techdTable > tbody > tr > td:nth-child(1){
			text-overflow: ellipsis;
			max-width: 150px;
			overflow: hidden;
		}
		#techdTable > tbody > tr > td:nth-child(2){
			text-overflow: ellipsis;
			max-width: 150px;
			overflow: hidden;
		}
		#techdTable > tbody > tr > td:nth-child(3){
			text-overflow: ellipsis;
			max-width: 180px;
			overflow: hidden;
		}
		#techdTable > tbody > tr > td:nth-child(4){
			text-overflow: ellipsis;
			max-width: 180px;
			overflow: hidden;
		}

		#contTable > tbody > tr > td:nth-child(3){
			text-overflow: ellipsis;
			max-width: 50px;
			overflow: hidden;
		}
		#contTable > tbody > tr > td:nth-child(4){
			text-overflow: ellipsis;
			max-width: 50px;
			overflow: hidden;
		}
		.pull-left{float:left!important;}
		.pull-right{float:right!important;}
		#text_overflow {
			text-overflow: ellipsis;
			max-width: 100px;
			overflow: hidden;
		}
		.chart2, .chart3{
			padding-bottom: 33px;
			margin-left: 6px;
			margin-top: -148px;
			width: 95%;
		}
		.ky-box-default {
			background-color: #ebebeb;
			color: #5e5e5e;
		}
		.ky-box {
			border-radius: 5px;
		}
		.ky-box-content > span{
			font-size: 20px !important;
			font: bold;
		}
		.text-test > span{
			font-size: 20px !important;
		    color: #5e5e5e;
		}
		.mbo-title {
			padding: 1px 0px 5px 0px;
		}
		.pull-left{float:left!important;}
		.pull-right{float:right!important;}
		.defalut_gra {
			width: 95%;
			margin-left: 2.5%;
		}
	</style>
	<script>
	$(document).ready(function(){
		if($('#demo_graph').val() == 100002 && $('#demo_userRole').val() == "ADMIN"){
			$.LoadingOverlay("show", true);
			
			//해당 월별 목표 매출액
			var sum01 = 0;
			var sum02 = 0;
			var sum03 = 0;
			var sum04 = 0;
			var sum05 = 0;
			var sum06 = 0;
			var sum07 = 0;
			var sum08 = 0;
			var sum09 = 0;
			var sum10 = 0;
			var sum11 = 0;
			var sum12 = 0;
			//해당 월 누적 매출액
			var stacksum01 = 0;
			var stacksum02 = 0;
			var stacksum03 = 0;
			var stacksum04 = 0;
			var stacksum05 = 0;
			var stacksum06 = 0;
			var stacksum07 = 0;
			var stacksum08 = 0;
			var stacksum09 = 0;
			var stacksum10 = 0;
			var stacksum11 = 0;
			//계산서 발행번호가 나왔고 완료건 데이터(완료가 된건만 나오게.(B5)) => 매출건
			var conpletevaclist01 = 0;
			var conpletevaclist02 = 0;
			var conpletevaclist03 = 0;
			var conpletevaclist04 = 0;
			var conpletevaclist05 = 0;
			var conpletevaclist06 = 0;
			var conpletevaclist07 = 0;
			var conpletevaclist08 = 0;
			var conpletevaclist09 = 0;
			var conpletevaclist10 = 0;
			var conpletevaclist11 = 0;
			var conpletevaclist12 = 0;
			//위 건 누적 매출 데이터
			var convacstack01 =0;
			var convacstack02 =0;
			var convacstack03 =0;
			var convacstack04 =0;
			var convacstack05 =0;
			var convacstack06 =0;
			var convacstack07 =0;
			var convacstack08 =0;
			var convacstack09 =0;
			var convacstack10 =0;
			var convacstack11 =0;
			
			// 실시간 데이터 반영 그래프 4번 데이터
			$.ajax({
				url: "${path}/salesTarget/gradata.do", 
				method: "POST",
				dataType: "json",
			})
			.done(function(result){
				var janlength = result.data.length;
				var janlength01 = result.data01.length;
				var janlength02 = result.data02.length;
				var janlength03 = result.data03.length;
				var janlength04 = result.data04.length;
				var janlength05 = result.data05.length;
				var janlength06 = result.data06.length;
				var janlength07 = result.data07.length;
				var janlength08 = result.data08.length;
				var janlength09 = result.data09.length;
				var janlength10 = result.data10.length;
				var janlength11 = result.data11.length;
				var janlength12 = result.data12.length;
						
				for(var i=0;i<janlength;i++){
					sum01 += result.data[i].mm01;
				}
				for(var i=0;i<janlength;i++){
					sum02 += result.data[i].mm02;
				}
				for(var i=0;i<janlength;i++){
					sum03 += result.data[i].mm03;
				}
				for(var i=0;i<janlength;i++){
					sum04 += result.data[i].mm04;
				}
				for(var i=0;i<janlength;i++){
					sum05 += result.data[i].mm05;
				}
				for(var i=0;i<janlength;i++){
					sum06 += result.data[i].mm06;
				}
				for(var i=0;i<janlength;i++){
					sum07 += result.data[i].mm07;
				}
				for(var i=0;i<janlength;i++){
					sum08 += result.data[i].mm08;
				}
				for(var i=0;i<janlength;i++){
					sum09 += result.data[i].mm09;
				}
				for(var i=0;i<janlength;i++){
					sum10 += result.data[i].mm10;
				}
				for(var i=0;i<janlength;i++){
					sum11 += result.data[i].mm11;
				}
				for(var i=0;i<janlength;i++){
					sum12 += result.data[i].mm12;
				}
				stacksum01 = sum01 + sum02;
				stacksum02 = stacksum01 + sum03;
				stacksum03 = stacksum02 + sum04;
				stacksum04 = stacksum03 + sum05;
				stacksum05 = stacksum04 + sum06;
				stacksum06 = stacksum05 + sum07;
				stacksum07 = stacksum06 + sum08;
				stacksum08 = stacksum07 + sum09;
				stacksum09 = stacksum08 + sum10;
				stacksum10 = stacksum09 + sum11;
				stacksum11 = stacksum10 + sum12;
								
				for(var i=0;i<janlength01;i++){
					conpletevaclist01 += (result.data01[i].vatTax + result.data01[i].vatAmount);
				}
				for(var i=0;i<janlength02;i++){
					conpletevaclist02 += (result.data02[i].vatTax + result.data02[i].vatAmount);
				}
				for(var i=0;i<janlength03;i++){
					conpletevaclist03 += (result.data03[i].vatTax + result.data03[i].vatAmount);
				}
				for(var i=0;i<janlength04;i++){
					conpletevaclist04 += (result.data04[i].vatTax + result.data04[i].vatAmount);
				}
				for(var i=0;i<janlength05;i++){
					conpletevaclist05 += (result.data05[i].vatTax + result.data05[i].vatAmount);
				}
				for(var i=0;i<janlength06;i++){
					conpletevaclist06 += (result.data06[i].vatTax + result.data06[i].vatAmount);
				}
				for(var i=0;i<janlength07;i++){
					conpletevaclist07 += (result.data07[i].vatTax + result.data07[i].vatAmount);
				}
				for(var i=0;i<janlength08;i++){
					conpletevaclist08 += (result.data08[i].vatTax + result.data08[i].vatAmount);
				}
				for(var i=0;i<janlength09;i++){
					conpletevaclist09 += (result.data09[i].vatTax + result.data09[i].vatAmount);
				}
				for(var i=0;i<janlength10;i++){
					conpletevaclist10 += (result.data10[i].vatTax + result.data10[i].vatAmount);
				}
				for(var i=0;i<janlength11;i++){
					conpletevaclist11 += (result.data11[i].vatTax + result.data11[i].vatAmount);
				}
				for(var i=0;i<janlength12;i++){
					conpletevaclist12 += (result.data12[i].vatTax + result.data12[i].vatAmount);
				}
								
				//계산서 완료건에 대한 누적 매출 data
				convacstack01 = conpletevaclist01 + conpletevaclist02; 
				convacstack02 = convacstack01 + conpletevaclist03;
				convacstack03 = convacstack02 + conpletevaclist04;
				convacstack04 = convacstack03 + conpletevaclist05;
				convacstack05 = convacstack04 + conpletevaclist06;
				convacstack06 = convacstack05 + conpletevaclist07;
				convacstack07 = convacstack06 + conpletevaclist08;
				convacstack08 = convacstack07 + conpletevaclist09;
				convacstack09 = convacstack08 + conpletevaclist10;
				convacstack10 = convacstack09 + conpletevaclist11;
				convacstack11 = convacstack10 + conpletevaclist12;
								
				//+2번째 관련 아래 테이블 정보
				var chart3_month_profitTarget1 = 0;
				chart3_month_profitTarget1 = '₩'+stacksum11.toLocaleString("en-US");
				
				var chart3_month_salesTarget1 = 0;
				chart3_month_salesTarget1 = Math.floor(chart3_month_salesTarget1);
				chart3_month_salesTarget1 = '₩'+convacstack11.toLocaleString("en-US");

				var onepersenttarget = stacksum11/100;
				var priceonepersenttarget = (convacstack11/onepersenttarget).toFixed(2);
				var livepersent = 100 - priceonepersenttarget;
				var chart3minusprice = stacksum11 - convacstack11;
				
				var chart3_month_percent1 = priceonepersenttarget;
				
				chart3_month_percent1 = chart3_month_percent1+'%';
				var chart3_month_overTarget1 = convacstack11 - stacksum11;
				chart3_month_overTarget1 = Math.floor(chart3_month_overTarget1);
				if(chart3_month_overTarget1 > 0){
					chart3_month_overTarget1 = '+₩' + chart3minusprice.toLocaleString("en-US");
					$("#chart3_month_overTarget1").removeClass("text-danger");
					$("#chart3_month_overTarget1").addClass("text-success");
				} else if(chart3_month_overTarget1 < 0){
					chart3_month_overTarget1 = '-₩' + (chart3minusprice).toLocaleString("en-US");
					$("#chart3_month_overTarget1").removeClass("text-success");
					$("#chart3_month_overTarget1").addClass("text-danger");
				}
				$("#chart3_month_profitTarget1").html(chart3_month_profitTarget1);
				$("#chart3_month_salesTarget1").html(chart3_month_salesTarget1);
				$("#chart3_month_overTarget1").html(chart3_month_overTarget1);
				$("#chart3_month_percent1").html(chart3_month_percent1);
				//+2번째 관련 아래 테이블 정보

					//1번 그래프(월 계획대비 실적)
					var month = date.getMonth() + 1;
				
			 		$.ajax({
						url: "${path}/salesTarget/gradata.do/" + month, 
						method: "POST",
						dataType: "json",
					})
					.done(function(result){
						var sum = 0;
						var sumlength = result.datanomal.length;
						for(var i=0;i<sumlength;i++){
							sum += result.datanomal[i].price;
						}
						var MonthvatTotal = 0;
						var MonthvatTotallength = result.data.length;
						for(var i=0;i<MonthvatTotallength;i++){
							MonthvatTotal += result.data[i].vatTax + result.data[i].vatAmount;
						}
						var testtest = sum/100;
						var test0314 = (MonthvatTotal/testtest).toFixed(2);
						var test0314test = 100 - test0314
						var TotalmountM = sum - MonthvatTotal;
						
						$("#chart2_month_profitTarget1").html('₩'+sum.toLocaleString("en-US"));
						$("#chart2_month_salesTarget1").html('₩'+MonthvatTotal.toLocaleString("en-US"));
						
						//달성률이 100%이상이라면 색상변경 
						if(test0314 >= 100){
							$("#chart2_month_percent1").html(test0314+'%');	
							$("#chart2_month_percent1").removeClass("text-danger");
							$("#chart2_month_percent1").addClass("text-success");
						}else{
							$("#chart2_month_percent1").html(test0314+'%');
							$("#chart2_month_percent1").removeClass("text-success");
							$("#chart2_month_percent1").addClass("text-danger");
						}
						//달성률이 100%이상이라면 색상변경 
						
						//목표금액을 매출이 넘었다면 색상 변경
						var overOrgin = MonthvatTotal - sum;
						if(overOrgin >= 0) {
							overOrgin = '+₩' + overOrgin.toLocaleString("en-US");
							$("#chart2_month_overTarget1").removeClass("text-danger");
							$("#chart2_month_overTarget1").addClass("text-success");
						} else {
							overOrgin = '-₩' + overOrgin.toLocaleString("en-US");
							$("#chart2_month_overTarget1").removeClass("text-success");
							$("#chart2_month_overTarget1").addClass("text-danger");
						}
						//목표금액을 매출이 넘었다면 색상 변경
						
						$("#chart2_month_overTarget1").html(overOrgin);
						
						//달성률이 100%이상일때 그래프 미달성률 0%로 만들기
						if(test0314 >= 100){
							test0314test = 0;
						}
						//달성률이 100%이상일때 그래프 미달성률 0%로 만들기
						
						const ctx1 = document.getElementById('myChartdoughnut').getContext('2d');
						window.myChartdoughnut = new Chart(ctx1, {
							 type: 'doughnut',
							    data: {
							    	labels: ['달성률', '미달성률'],
							        datasets: [{
							            data: [test0314, test0314test],
							            backgroundColor: [
							            	'rgba(54, 162, 235, 1)',
							                'rgba(255, 99, 132, 1)'
							            ]
							        }]
							    },
							    options: {
							        scales: {
							            y: {
							                beginAtZero: true
							            }
							        }
							    }
							})
						});
						//1번 그래프(월 계획대비 실적)
						
						//2번 그래프(누적 계획대비 실적)
						const ctx2 = document.getElementById('myChartdoughnut1').getContext('2d');
						window.myChartdoughnut1 = new Chart(ctx2, {
							type: 'doughnut',
					    	data: {
						       	labels: ['달성률', '미달성률'],
						       	datasets: [{
							    	data: [priceonepersenttarget, livepersent],
							        backgroundColor: [
							        	'rgba(54, 162, 235, 1)',
							            'rgba(255, 99, 132, 1)'
						            ]
						        }]
							},
						    options: {
							       scales: {
						           y: {
						 	             beginAtZero: true
						              }
					           }
						    }
						})
						//2번 그래프(누적 계획대비 실적)
						
						//4번 그래프(연간 계획대비 실적)
						var myChart1 = echarts.init(document.getElementById('myChart'));
						globalmyChart1 = myChart1;
						option1 = {
							tooltip : {
								trigger: 'axis',
								axisPointer:{
									type:'cross',
									crossStyle: {
										color: '#999'
									}
								}
							},
							legend: {
								data:["월별목표", "월별매출", "누적목표", "누적매출"]
							},
							xAxis : [
								{
									type : 'category',
									splitLine : {
										show:true
									},
									axisPointer: {
										type: 'shadow'
									},
									data : ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
								},
								{
									type : 'category',
									axisLine : {
										show:true
									},
									axisLabel : {
										show:false
									},
									data : ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
								}
							],
							yAxis : [
								{
									type: 'value',
									name: '월별(억원)',
									position: 'left',
									axisLine: {
										show: true,
										lineStyle: {
											color: '#999'
										}
									},
									axisLabel: {
										formatter: function (data) {
											return Math.floor(data/10000000)
										}
									}
								},
								{
									type: 'value',
									name: '누적(억원)',
									position: 'right',
									axisLine: {
										show: true,
										lineStyle: {
											color: '#999'
										}
									},
									axisLabel: {
										formatter: function (data) {
											return Math.floor(data/10000000)
										}
									}
								}
							],
							series : [
								{
									name: '월별목표',
									type: 'bar',
									data: [sum01, sum02, sum03, sum04, sum05, sum06, sum07, sum08, sum09, sum10, sum11, sum12]
								},
								{
									name: '월별매출',
									type: 'bar',
									data: [conpletevaclist01, conpletevaclist02, conpletevaclist03, conpletevaclist04, conpletevaclist05, conpletevaclist06, conpletevaclist07, conpletevaclist08, conpletevaclist09, conpletevaclist10, conpletevaclist11, conpletevaclist12]
								},
								{
									name: '누적목표',
									type: 'line',
									yAxisIndex: 1,
									data: [sum01, stacksum01, stacksum02, stacksum03, stacksum04, stacksum05, stacksum06, stacksum07, stacksum08, stacksum09, stacksum10, stacksum11]
								},
								{
									name: '누적매출',
									type: 'line',
									yAxisIndex: 1,
									data: [conpletevaclist01, convacstack01, convacstack02, convacstack03, convacstack04, convacstack05, convacstack06, convacstack07, convacstack08, convacstack09, convacstack10, convacstack11]
								}
							]
						}
						myChart1.setOption(option1);
						globaloption1 = option1;
						//4번 그래프(얀간 계획대비 실적)
						
						//5번 그래프(월간 실적)
						var month = date.getMonth() + 1;
						$.ajax({
							url: "${path}/salesTarget/user_chart.do/" + month, 
							method: "POST",
							dataType: "json",
						})
						.done(function(result){
							var user = new Array();
							var user_target = new Array();
							var user1 = result.data[0].userName;
							var user2 = result.data[1].userName;
							var user3 = result.data[2].userName;
							var user4 = result.data[3].userName;
							var user5 = result.data[4].userName;
							var user6 = result.data[5].userName;
							var user1_target = result.data[0].month_target;
							var user2_target = result.data[1].month_target;
							var user3_target = result.data[2].month_target;
							var user4_target = result.data[3].month_target;
							var user5_target = result.data[4].month_target;
							var user6_target = result.data[5].month_target;
							var user_now_graph1 = result.data[0].test;
							var user_now_graph2 = result.data[1].test;
							var user_now_graph3 = result.data[2].test;
							var user_now_graph4 = result.data[3].test;
							var user_now_graph5 = result.data[4].test;
							var user_now_graph6 = result.data[5].test;
							
							/* for(var i = 0; i < result.data.length; i++){
								user.push(result.data[i].userName);
								user_target.push(result.data[i].month_target);
							} */

								var user_chart = echarts.init(document.getElementById('user_chart'));
								user_chart_main = user_chart;
								option = {
									tooltip : {
										trigger: 'axis',
										axisPointer:{
											type:'cross',
											crossStyle: {
												color: '#999'
											}
										}
									},
									legend: {
										data:["월별목표", "월별매출"]
									},
									xAxis : [
										{
											type : 'category',
											splitLine : {
												show:true
											},
											axisPointer: {
												type: 'shadow'
											},
											data : [user1, user2, user3, user4, user5, user6]
										},
										{
											type : 'category',
											axisLine : {
												show:true
											},
											axisLabel : {
												show:false
											},
											data : ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
										}
									],
									yAxis : [
										{
											type: 'value',
											name: '월별(억원)',
											position: 'left',
											axisLine: {
												show: true,
												lineStyle: {
													color: '#999'
												}
											},
											axisLabel: {
												formatter: function (data) {
													return Math.floor(data/10000000)
												}
											}
										},
										{
											type: 'value',
											name: '누적(억원)',
											position: 'right',
											axisLine: {
												show: true,
												lineStyle: {
													color: '#999'
												}
											},
											axisLabel: {
												formatter: function (data) {
													return Math.floor(data/10000000)
												}
											}
										}
									],
									series : [
										{
											name: '월별목표',
											type: 'bar',
											data: [user1_target, user2_target, user3_target, user4_target, user5_target, user6_target]
										},
										{
											name: '월별매출',
											type: 'bar',
											data: [user_now_graph1, user_now_graph2, user_now_graph3, user_now_graph4, user_now_graph5, user_now_graph6]
										}
									]
								}
								user_chart.setOption(option);
								user_chart_main = option;
							})
						
						})
						//5번 그래프(월간 실적)
						
					//3번 그래프(전월 대비)
					var date = new Date();
					var month = date.getMonth() + 1;
					var last_month = date.getMonth();
					if(last_month == 12){
						month = 1;
					}
					var STR_month = month + "월"
					var STR_last_month = last_month + "월"
					
					$.ajax({
						url: "${path}/salesTarget/cnt_mouth_data.do/" + month + "/" +  last_month,
						method: "POST",
						dataType: "json",
					})
					.done(function(result){
						const ctx3 = document.getElementById('bar_chart').getContext('2d');
						window.bar_chart = new Chart(ctx3, {
							type: 'bar',
					    	data: {
						       	labels: [STR_last_month, STR_month],
						       	datasets: [{
							    	data: [result.data_last[0].count, result.data[0].count],
							        backgroundColor: [
							        	'rgba(54, 162, 235, 1)',
							            'rgba(255, 99, 132, 1)'
						            ]
						        }]
							},
						    options: {
								scales: {
									y: {
							            beginAtZero: true
						            }
								},
							 	legend: {
									display: false,
								},
						    }
						})	
						
					});
					//3월 그래프(전월 대비)
		
					//+1번째 그래프 관련 아래 테이블 정보 및 change event
					$("#graph2TargetMonth1").on("change", function(){
						var graph2TargetMonth1 = Number($("#graph2TargetMonth1").val());
			
						 $.ajax({
							url: "${path}/salesTarget/gradata.do/" + graph2TargetMonth1, 
							method: "POST",
							dataType: "json",
						 })
							.done(function(result){
								var sum = 0;
								var sumlength = result.datanomal.length;
								for(var i=0;i<sumlength;i++){
									sum += result.datanomal[i].price;
								}
								var MonthvatTotal = 0;
								var MonthvatTotallength = result.data.length;
								for(var i=0;i<MonthvatTotallength;i++){
									MonthvatTotal += result.data[i].vatTax + result.data[i].vatAmount;
								}
								var testtest = sum/100;
								var test0314 = (MonthvatTotal/testtest).toFixed(2);
								var test0314test = 100 - test0314
								var TotalmountM = sum - MonthvatTotal;
								
								$("#chart2_month_profitTarget1").html('₩'+sum.toLocaleString("en-US"));
								$("#chart2_month_salesTarget1").html('₩'+MonthvatTotal.toLocaleString("en-US"));
								if(test0314 >= 100){
									$("#chart2_month_percent1").html(test0314+'%');	
									$("#chart2_month_percent1").removeClass("text-danger");
									$("#chart2_month_percent1").addClass("text-success");
								}else{
									$("#chart2_month_percent1").html(test0314+'%');
									$("#chart2_month_percent1").removeClass("text-success");
									$("#chart2_month_percent1").addClass("text-danger");
								}
								var overOrgin = MonthvatTotal - sum;
								if(overOrgin >= 0) {
									overOrgin = '+₩' + overOrgin.toLocaleString("en-US");
									$("#chart2_month_overTarget1").removeClass("text-danger");
									$("#chart2_month_overTarget1").addClass("text-success");
								} else {
									overOrgin = '-₩' + overOrgin.toLocaleString("en-US");
									$("#chart2_month_overTarget1").removeClass("text-success");
									$("#chart2_month_overTarget1").addClass("text-danger");
								}
								$("#chart2_month_overTarget1").html(overOrgin);
								//달성률이 100%이상일때 그래프 미달성률 0%로 만들기
								if(test0314 >= 100){
									test0314test = 0;
								}
								//달성률이 100%이상일때 그래프 미달성률 0%로 만들기
								const ctx1 = document.getElementById('myChartdoughnut').getContext('2d');
								if(window.myChartdoughnut != undefined){
									window.myChartdoughnut.destroy();
								}
								window.myChartdoughnut = new Chart(ctx1, {
									type: 'doughnut',
									data: {
									    labels: ['달성률', '미달성률'],
									    datasets: [{
								  	    	data: [test0314, test0314test],
									        backgroundColor: [
									        	'rgba(54, 162, 235, 1)',
									            'rgba(255, 99, 132, 1)'
									        ]
									    }]
									},
									options: {
									    scales: {
									        y: {
									            beginAtZero: true
							          		}
									    }
									}
								})
							})
						})
						//+1번째 그래프 관련 아래 테이블 정보 및 change event
						
						//+5번째 그래프 관련 아래 테이블 정보 및 change event
						$("#myChart_user_mounth").on("change", function(){
							var mounth = $("#myChart_user_mounth").val();
							$.ajax({
								url: "${path}/salesTarget/user_chart.do/" + mounth,
								method: "POST",
								dataType: "json",
							})
							.done(function(result){
								var user = new Array();
								var user_target = new Array();
								var user1 = result.data[0].userName;
								var user2 = result.data[1].userName;
								var user3 = result.data[2].userName;
								var user4 = result.data[3].userName;
								var user5 = result.data[4].userName;
								var user6 = result.data[5].userName;
								var user1_target = result.data[0].month_target;
								var user2_target = result.data[1].month_target;
								var user3_target = result.data[2].month_target;
								var user4_target = result.data[3].month_target;
								var user5_target = result.data[4].month_target;
								var user6_target = result.data[5].month_target;
								var user_now_graph1 = result.data[0].test;
								var user_now_graph2 = result.data[1].test;
								var user_now_graph3 = result.data[2].test;
								var user_now_graph4 = result.data[3].test;
								var user_now_graph5 = result.data[4].test;
								var user_now_graph6 = result.data[5].test;
								
								/* for(var i = 0; i < result.data.length; i++){
									user.push(result.data[i].userName);
									user_target.push(result.data[i].month_target);
								} */

									var user_chart = echarts.init(document.getElementById('user_chart'));
									user_chart_main = user_chart;
									option = {
										tooltip : {
											trigger: 'axis',
											axisPointer:{
												type:'cross',
												crossStyle: {
													color: '#999'
												}
											}
										},
										legend: {
											data:["월별목표", "월별매출"]
										},
										xAxis : [
											{
												type : 'category',
												splitLine : {
													show:true
												},
												axisPointer: {
													type: 'shadow'
												},
												data : [user1, user2, user3, user4, user5, user6]
											},
											{
												type : 'category',
												axisLine : {
													show:true
												},
												axisLabel : {
													show:false
												},
												data : ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
											}
										],
										yAxis : [
											{
												type: 'value',
												name: '월별(억원)',
												position: 'left',
												axisLine: {
													show: true,
													lineStyle: {
														color: '#999'
													}
												},
												axisLabel: {
													formatter: function (data) {
														return Math.floor(data/10000000)
													}
												}
											},
											{
												type: 'value',
												name: '누적(억원)',
												position: 'right',
												axisLine: {
													show: true,
													lineStyle: {
														color: '#999'
													}
												},
												axisLabel: {
													formatter: function (data) {
														return Math.floor(data/10000000)
													}
												}
											}
										],
										series : [
											{
												name: '월별목표',
												type: 'bar',
												data: [user1_target, user2_target, user3_target, user4_target, user5_target, user6_target]
											},
											{
												name: '월별매출',
												type: 'bar',
												data: [user_now_graph1, user_now_graph2, user_now_graph3, user_now_graph4, user_now_graph5, user_now_graph6]
											}
										]
									}
									user_chart.setOption(option);
									user_chart_main = option;
							})
						});
						//+5번째 그래프 관련 아래 테이블 정보 및 change event
						setTimeout(function(){
							$.LoadingOverlay("hide", true);
						}, 4000);
	}else{
					var myChart1 = echarts.init(document.getElementById('myChart'));
					globalmyChart1 = myChart1;
					option1 = {
						tooltip : {
							trigger: 'axis',
							axisPointer:{
								type:'cross',
								crossStyle: {
									color: '#999'
								}
							}
						},
						legend: {
							data:["월별목표", "월별매출", "누적목표", "누적매출"]
						},
						xAxis : [
							{
								type : 'category',
								splitLine : {
									show:true
								},
								axisPointer: {
									type: 'shadow'
								},
								data : ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
							},
							{
								type : 'category',
								axisLine : {
									show:true
								},
								axisLabel : {
									show:false
								},
								data : ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
							}
						],
						yAxis : [
							{
								type: 'value',
								name: '월별(억원)',
								position: 'left',
								axisLine: {
									show: true,
									lineStyle: {
										color: '#999'
									}
								},
								axisLabel: {
									formatter: function (data) {
										return Math.floor(data/10000000)
									}
								}
							},
							{
								type: 'value',
								name: '누적(억원)',
								position: 'right',
								axisLine: {
									show: true,
									lineStyle: {
										color: '#999'
									}
								},
								axisLabel: {
									formatter: function (data) {
										return Math.floor(data/10000000)
									}
								}
							}
						],
						series : [
							{
								name: '월별목표',
								type: 'bar',
								data: ['1000000', '1000000', '1000000', '1000000', '1000000', '1000000', '1000000', '1000000', '1000000', '1000000', '1000000', '1000000']
							},
							{
								name: '월별매출',
								type: 'bar',
								data: ['200000', '200000', '200000', '200000', '0', '0', '0', '0', '0', '0', '0', '0']
							},
							{
								name: '누적목표',
								type: 'line',
								yAxisIndex: 1,
								data: ['1000000', '2000000', '3000000', '4000000', '5000000', '6000000', '7000000', '8000000', '9000000', '10000000', '11000000', '12000000']
							},
							{
								name: '누적매출',
								type: 'line',
								yAxisIndex: 1,
								data: ['200000', '400000', '600000', '800000', '800000', '800000', '800000', '800000', '800000', '800000', '800000', '800000']
							}
						]
					}
					myChart1.setOption(option1);
					globaloption1 = option1;
					//4번 그래프(얀간 계획대비 실적)

					setTimeout(function(){
						$.LoadingOverlay("hide", true);
					}, 500);
		}
		
	});
	<%-- var salesJson = {
					'0' : ${graph1.sales[0]},
					'1' : ${graph1.sales[1]},
					'2' : ${graph1.sales[2]},
					'3' : ${graph1.sales[3]},
					'4' : ${graph1.sales[4]},
					'5' : ${graph1.sales[5]},
					'6' : ${graph1.sales[6]},
					'7' : ${graph1.sales[7]},
					'8' : ${graph1.sales[8]},
					'9' : ${graph1.sales[9]},
					'10' : ${graph1.sales[10]},
					'11' : ${graph1.sales[11]}
				}
				var salesOrginJson = {
					'0' : Math.floor(${graph1.salesOrgin[0]}),
					'1' : Math.floor(${graph1.salesOrgin[1]}),
					'2' : Math.floor(${graph1.salesOrgin[2]}),
					'3' : Math.floor(${graph1.salesOrgin[3]}),
					'4' : Math.floor(${graph1.salesOrgin[4]}),
					'5' : Math.floor(${graph1.salesOrgin[5]}),
					'6' : Math.floor(${graph1.salesOrgin[6]}),
					'7' : Math.floor(${graph1.salesOrgin[7]}),
					'8' : Math.floor(${graph1.salesOrgin[8]}),
					'9' : Math.floor(${graph1.salesOrgin[9]}),
					'10' : Math.floor(${graph1.salesOrgin[10]}),
					'11' : Math.floor(${graph1.salesOrgin[11]}),
				}

				var salesOrginStackJson = {
					'0' : Math.floor(salesOrginJson[0]),
					'1' : Math.floor(salesOrginJson[0] + salesOrginJson[1]),
					'2' : Math.floor(salesOrginJson[0] + salesOrginJson[1] + salesOrginJson[2]),
					'3' : Math.floor(salesOrginJson[0] + salesOrginJson[1] + salesOrginJson[2] + salesOrginJson[3]),
					'4' : Math.floor(salesOrginJson[0] + salesOrginJson[1] + salesOrginJson[2] + salesOrginJson[3] + salesOrginJson[4]),
					'5' : Math.floor(salesOrginJson[0] + salesOrginJson[1] + salesOrginJson[2] + salesOrginJson[3] + salesOrginJson[4] + salesOrginJson[5]),
					'6' : Math.floor(salesOrginJson[0] + salesOrginJson[1] + salesOrginJson[2] + salesOrginJson[3] + salesOrginJson[4] + salesOrginJson[5] + salesOrginJson[6]),
					'7' : Math.floor(salesOrginJson[0] + salesOrginJson[1] + salesOrginJson[2] + salesOrginJson[3] + salesOrginJson[4] + salesOrginJson[5] + salesOrginJson[6] + salesOrginJson[7]),
					'8' : Math.floor(salesOrginJson[0] + salesOrginJson[1] + salesOrginJson[2] + salesOrginJson[3] + salesOrginJson[4] + salesOrginJson[5] + salesOrginJson[6] + salesOrginJson[7] + salesOrginJson[8]),
					'9' : Math.floor(salesOrginJson[0] + salesOrginJson[1] + salesOrginJson[2] + salesOrginJson[3] + salesOrginJson[4] + salesOrginJson[5] + salesOrginJson[6] + salesOrginJson[7] + salesOrginJson[8] + salesOrginJson[9]),
					'10' : Math.floor(salesOrginJson[0] + salesOrginJson[1] + salesOrginJson[2] + salesOrginJson[3] + salesOrginJson[4] + salesOrginJson[5] + salesOrginJson[6] + salesOrginJson[7] + salesOrginJson[8] + salesOrginJson[9] + salesOrginJson[10]),
					'11' : Math.floor(salesOrginJson[0] + salesOrginJson[1] + salesOrginJson[2] + salesOrginJson[3] + salesOrginJson[4] + salesOrginJson[5] + salesOrginJson[6] + salesOrginJson[7] + salesOrginJson[8] + salesOrginJson[9] + salesOrginJson[10] + salesOrginJson[11])
				}

				var salesOrginYearJson = {
					'0' : salesOrginJson[0] + salesOrginJson[1] + salesOrginJson[2] + salesOrginJson[3] + salesOrginJson[4] + salesOrginJson[5] + salesOrginJson[6]
							+ salesOrginJson[7] + salesOrginJson[8] + salesOrginJson[9] + salesOrginJson[10] + salesOrginJson[11]
				}
				var profitJson = {
					'0' : ${graph1.profit[0]},
					'1' : ${graph1.profit[1]},
					'2' : ${graph1.profit[2]},
					'3' : ${graph1.profit[3]},
					'4' : ${graph1.profit[4]},
					'5' : ${graph1.profit[5]},
					'6' : ${graph1.profit[6]},
					'7' : ${graph1.profit[7]},
					'8' : ${graph1.profit[8]},
					'9' : ${graph1.profit[9]},
					'10' : ${graph1.profit[10]},
					'11' : ${graph1.profit[11]}
				}
				//그래프1의 정의 그리고 그 옆에 profitOrgin 이 친구는 어디서 정의되어진 놈인가?
						
				var profitOrginJson = {
					'0' : ${graph1.profitOrgin[0]},
					'1' : ${graph1.profitOrgin[1]},
					'2' : ${graph1.profitOrgin[2]},
					'3' : ${graph1.profitOrgin[3]},
					'4' : ${graph1.profitOrgin[4]},
					'5' : ${graph1.profitOrgin[5]},
					'6' : ${graph1.profitOrgin[6]},
					'7' : ${graph1.profitOrgin[7]},
					'8' : ${graph1.profitOrgin[8]},
					'9' : ${graph1.profitOrgin[9]},
					'10' : ${graph1.profitOrgin[10]},
					'11' : ${graph1.profitOrgin[11]}
				}
				var profitOrginStackJson = {
					'0' : profitOrginJson[0],
					'1' : profitOrginJson[0] + profitOrginJson[1],
					'2' : profitOrginJson[0] + profitOrginJson[1] + profitOrginJson[2],
					'3' : profitOrginJson[0] + profitOrginJson[1] + profitOrginJson[2] + profitOrginJson[3],
					'4' : profitOrginJson[0] + profitOrginJson[1] + profitOrginJson[2] + profitOrginJson[3] + profitOrginJson[4],
					'5' : profitOrginJson[0] + profitOrginJson[1] + profitOrginJson[2] + profitOrginJson[3] + profitOrginJson[4] + profitOrginJson[5],
					'6' : profitOrginJson[0] + profitOrginJson[1] + profitOrginJson[2] + profitOrginJson[3] + profitOrginJson[4] + profitOrginJson[5] + profitOrginJson[6],
					'7' : profitOrginJson[0] + profitOrginJson[1] + profitOrginJson[2] + profitOrginJson[3] + profitOrginJson[4] + profitOrginJson[5] + profitOrginJson[6] + profitOrginJson[7],
					'8' : profitOrginJson[0] + profitOrginJson[1] + profitOrginJson[2] + profitOrginJson[3] + profitOrginJson[4] + profitOrginJson[5] + profitOrginJson[6] + profitOrginJson[7] + profitOrginJson[8],
					'9' : profitOrginJson[0] + profitOrginJson[1] + profitOrginJson[2] + profitOrginJson[3] + profitOrginJson[4] + profitOrginJson[5] + profitOrginJson[6] + profitOrginJson[7] + profitOrginJson[8] + profitOrginJson[9],
					'10' : profitOrginJson[0] + profitOrginJson[1] + profitOrginJson[2] + profitOrginJson[3] + profitOrginJson[4] + profitOrginJson[5] + profitOrginJson[6] + profitOrginJson[7] + profitOrginJson[8] + profitOrginJson[9] + profitOrginJson[10],
					'11' : profitOrginJson[0] + profitOrginJson[1] + profitOrginJson[2] + profitOrginJson[3] + profitOrginJson[4] + profitOrginJson[5] + profitOrginJson[6] + profitOrginJson[7] + profitOrginJson[8] + profitOrginJson[9] + profitOrginJson[10] + profitOrginJson[11]
				}

				var profitOrginYearJson = {
					'0' : profitOrginJson[0] + profitOrginJson[1] + profitOrginJson[2] + profitOrginJson[3] + profitOrginJson[4] + profitOrginJson[5] + profitOrginJson[6]
							+ profitOrginJson[7] + profitOrginJson[8] + profitOrginJson[9] + profitOrginJson[10] + profitOrginJson[11]
				}

				var percentJson = {
					'0' : ${graph1.percent[0]},
					'1' : ${graph1.percent[1]},
					'2' : ${graph1.percent[2]},
					'3' : ${graph1.percent[3]},
					'4' : ${graph1.percent[4]},
					'5' : ${graph1.percent[5]},
					'6' : ${graph1.percent[6]},
					'7' : ${graph1.percent[7]},
					'8' : ${graph1.percent[8]},
					'9' : ${graph1.percent[9]},
					'10' : ${graph1.percent[10]},
					'11' : ${graph1.percent[11]}
				}

				var overJson = {
					'0' : ${graph1.over[0]},
					'1' : ${graph1.over[1]},
					'2' : ${graph1.over[2]},
					'3' : ${graph1.over[3]},
					'4' : ${graph1.over[4]},
					'5' : ${graph1.over[5]},
					'6' : ${graph1.over[6]},
					'7' : ${graph1.over[7]},
					'8' : ${graph1.over[8]},
					'9' : ${graph1.over[9]},
					'10' : ${graph1.over[10]},
					'11' : ${graph1.over[11]}
				}

				var overOrginJson = {
					'0' : ${graph1.overOrgin[0]},
					'1' : ${graph1.overOrgin[1]},
					'2' : ${graph1.overOrgin[2]},
					'3' : ${graph1.overOrgin[3]},
					'4' : ${graph1.overOrgin[4]},
					'5' : ${graph1.overOrgin[5]},
					'6' : ${graph1.overOrgin[6]},
					'7' : ${graph1.overOrgin[7]},
					'8' : ${graph1.overOrgin[8]},
					'9' : ${graph1.overOrgin[9]},
					'10' : ${graph1.overOrgin[10]},
					'11' : ${graph1.overOrgin[11]}
				}
				var cnt01_OrginJson = {
					'0' : ${graph1.cnt01[0]},
					'1' : ${graph1.cnt01[1]},
					'2' : ${graph1.cnt01[2]},
					'3' : ${graph1.cnt01[3]},
					'4' : ${graph1.cnt01[4]},
					'5' : ${graph1.cnt01[5]},
					'6' : ${graph1.cnt01[6]},
					'7' : ${graph1.cnt01[7]},
					'8' : ${graph1.cnt01[8]},
					'9' : ${graph1.cnt01[9]},
					'10' : ${graph1.cnt01[10]},
					'11' : ${graph1.cnt01[11]}
				}
				var cnt01Sum_OrginJson = {
					'0' : ${graph1.cnt01Sum[0]},
					'1' : ${graph1.cnt01Sum[1]},
					'2' : ${graph1.cnt01Sum[2]},
					'3' : ${graph1.cnt01Sum[3]},
					'4' : ${graph1.cnt01Sum[4]},
					'5' : ${graph1.cnt01Sum[5]},
					'6' : ${graph1.cnt01Sum[6]},
					'7' : ${graph1.cnt01Sum[7]},
					'8' : ${graph1.cnt01Sum[8]},
					'9' : ${graph1.cnt01Sum[9]},
					'10' : ${graph1.cnt01Sum[10]},
					'11' : ${graph1.cnt01Sum[11]}
				}
				var cnt02_OrginJson = {
					'0' : ${graph1.cnt02[0]},
					'1' : ${graph1.cnt02[1]},
					'2' : ${graph1.cnt02[2]},
					'3' : ${graph1.cnt02[3]},
					'4' : ${graph1.cnt02[4]},
					'5' : ${graph1.cnt02[5]},
					'6' : ${graph1.cnt02[6]},
					'7' : ${graph1.cnt02[7]},
					'8' : ${graph1.cnt02[8]},
					'9' : ${graph1.cnt02[9]},
					'10' : ${graph1.cnt02[10]},
					'11' : ${graph1.cnt02[11]}
				}
				var cnt02Sum_OrginJson = {
					'0' : ${graph1.cnt02Sum[0]},
					'1' : ${graph1.cnt02Sum[1]},
					'2' : ${graph1.cnt02Sum[2]},
					'3' : ${graph1.cnt02Sum[3]},
					'4' : ${graph1.cnt02Sum[4]},
					'5' : ${graph1.cnt02Sum[5]},
					'6' : ${graph1.cnt02Sum[6]},
					'7' : ${graph1.cnt02Sum[7]},
					'8' : ${graph1.cnt02Sum[8]},
					'9' : ${graph1.cnt02Sum[9]},
					'10' : ${graph1.cnt02Sum[10]},
					'11' : ${graph1.cnt02Sum[11]}
				}

				var cnt03_OrginJson = {
					'0' : ${graph1.cnt03[0]},
					'1' : ${graph1.cnt03[1]},
					'2' : ${graph1.cnt03[2]},
					'3' : ${graph1.cnt03[3]},
					'4' : ${graph1.cnt03[4]},
					'5' : ${graph1.cnt03[5]},
					'6' : ${graph1.cnt03[6]},
					'7' : ${graph1.cnt03[7]},
					'8' : ${graph1.cnt03[8]},
					'9' : ${graph1.cnt03[9]},
					'10' : ${graph1.cnt03[10]},
					'11' : ${graph1.cnt03[11]}
				}
				var cnt03Sum_OrginJson = {
					'0' : ${graph1.cnt03Sum[0]},
					'1' : ${graph1.cnt03Sum[1]},
					'2' : ${graph1.cnt03Sum[2]},
					'3' : ${graph1.cnt03Sum[3]},
					'4' : ${graph1.cnt03Sum[4]},
					'5' : ${graph1.cnt03Sum[5]},
					'6' : ${graph1.cnt03Sum[6]},
					'7' : ${graph1.cnt03Sum[7]},
					'8' : ${graph1.cnt03Sum[8]},
					'9' : ${graph1.cnt03Sum[9]},
					'10' : ${graph1.cnt03Sum[10]},
					'11' : ${graph1.cnt03Sum[11]}
				}

				var cnt04_OrginJson = {
					'0' : ${graph1.cnt04[0]},
					'1' : ${graph1.cnt04[1]},
					'2' : ${graph1.cnt04[2]},
					'3' : ${graph1.cnt04[3]},
					'4' : ${graph1.cnt04[4]},
					'5' : ${graph1.cnt04[5]},
					'6' : ${graph1.cnt04[6]},
					'7' : ${graph1.cnt04[7]},
					'8' : ${graph1.cnt04[8]},
					'9' : ${graph1.cnt04[9]},
					'10' : ${graph1.cnt04[10]},
					'11' : ${graph1.cnt04[11]}
				}
				var cnt04Sum_OrginJson = {
					'0' : ${graph1.cnt04Sum[0]},
					'1' : ${graph1.cnt04Sum[1]},
					'2' : ${graph1.cnt04Sum[2]},
					'3' : ${graph1.cnt04Sum[3]},
					'4' : ${graph1.cnt04Sum[4]},
					'5' : ${graph1.cnt04Sum[5]},
					'6' : ${graph1.cnt04Sum[6]},
					'7' : ${graph1.cnt04Sum[7]},
					'8' : ${graph1.cnt04Sum[8]},
					'9' : ${graph1.cnt04Sum[9]},
					'10' : ${graph1.cnt04Sum[10]},
					'11' : ${graph1.cnt04Sum[11]}
				}

				var cnt05_OrginJson = {
					'0' : ${graph1.cnt05[0]},
					'1' : ${graph1.cnt05[1]},
					'2' : ${graph1.cnt05[2]},
					'3' : ${graph1.cnt05[3]},
					'4' : ${graph1.cnt05[4]},
					'5' : ${graph1.cnt05[5]},
					'6' : ${graph1.cnt05[6]},
					'7' : ${graph1.cnt05[7]},
					'8' : ${graph1.cnt05[8]},
					'9' : ${graph1.cnt05[9]},
					'10' : ${graph1.cnt05[10]},
					'11' : ${graph1.cnt05[11]}
				}
				var cnt05Sum_OrginJson = {
					'0' : ${graph1.cnt05Sum[0]},
					'1' : ${graph1.cnt05Sum[1]},
					'2' : ${graph1.cnt05Sum[2]},
					'3' : ${graph1.cnt05Sum[3]},
					'4' : ${graph1.cnt05Sum[4]},
					'5' : ${graph1.cnt05Sum[5]},
					'6' : ${graph1.cnt05Sum[6]},
					'7' : ${graph1.cnt05Sum[7]},
					'8' : ${graph1.cnt05Sum[8]},
					'9' : ${graph1.cnt05Sum[9]},
					'10' : ${graph1.cnt05Sum[10]},
					'11' : ${graph1.cnt05Sum[11]}
				}

				var cnt06_OrginJson = {
					'0' : ${graph1.cnt06[0]},
					'1' : ${graph1.cnt06[1]},
					'2' : ${graph1.cnt06[2]},
					'3' : ${graph1.cnt06[3]},
					'4' : ${graph1.cnt06[4]},
					'5' : ${graph1.cnt06[5]},
					'6' : ${graph1.cnt06[6]},
					'7' : ${graph1.cnt06[7]},
					'8' : ${graph1.cnt06[8]},
					'9' : ${graph1.cnt06[9]},
					'10' : ${graph1.cnt06[10]},
					'11' : ${graph1.cnt06[11]}
				}
				var cnt06Sum_OrginJson = {
					'0' : ${graph1.cnt06Sum[0]},
					'1' : ${graph1.cnt06Sum[1]},
					'2' : ${graph1.cnt06Sum[2]},
					'3' : ${graph1.cnt06Sum[3]},
					'4' : ${graph1.cnt06Sum[4]},
					'5' : ${graph1.cnt06Sum[5]},
					'6' : ${graph1.cnt06Sum[6]},
					'7' : ${graph1.cnt06Sum[7]},
					'8' : ${graph1.cnt06Sum[8]},
					'9' : ${graph1.cnt06Sum[9]},
					'10' : ${graph1.cnt06Sum[10]},
					'11' : ${graph1.cnt06Sum[11]}
				}

				var globaloption1, globaloption2, globaloption3, globaloption4;
				var globalmyChart1, globalmyChartGauge2, globalmyChartGauge3, globalmyChartGauge4;
				var now = new Date();
				var colors = ['#5470C6', '#91CC75', '#EE6666'];

				function chartReady(){
					// 1번째 그래프 ===================================================
					var myChart1 = echarts.init(document.getElementById('myChart01'));
					globalmyChart1 = myChart1;
					// 차트 속성과 데이터를 지정합니다.
					option1 = {
						tooltip : {
							trigger: 'axis',
							axisPointer:{
								type:'cross',
								crossStyle: {
									color: '#999'
								}
							}
						},
						legend: {
							data:["월별목표", "월별매출", "누적목표", "누적매출"]
						},
						xAxis : [
							{
								type : 'category',
								splitLine : {
									show:true
								},
								axisPointer: {
									type: 'shadow'
								},
								data : ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
							},
							{
								type : 'category',
								axisLine : {
									show:true
								},
								axisLabel : {
									show:false
								},
								data : ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
							}
						],
						yAxis : [
							{
								type: 'value',
								name: '월별(억원)',
								position: 'left',
								axisLine: {
									show: true,
									lineStyle: {
										color: colors[0]
									}
								},
								axisLabel: {
									formatter: function (data) {
										return Math.floor(data/10000000)
									}
								}
							},
							{
								type: 'value',
								name: '누적(억원)',
								position: 'right',
								axisLine: {
									show: true,
									lineStyle: {
										color: colors[0]
									}
								},
								axisLabel: {
									formatter: function (data) {
										return Math.floor(data/10000000)
									}
								}
							}
						],
						series : [
							{
								name: '월별목표',
								type: 'bar',
								data: [profitOrginJson[0], profitOrginJson[1], profitOrginJson[2], profitOrginJson[3], profitOrginJson[4], profitOrginJson[5], profitOrginJson[6], profitOrginJson[7], profitOrginJson[8], profitOrginJson[9], profitOrginJson[10], profitOrginJson[11]]
							},
							{
								name: '월별매출',
								type: 'bar',
								data: [salesOrginJson[0], salesOrginJson[1], salesOrginJson[2], salesOrginJson[3], salesOrginJson[4], salesOrginJson[5], salesOrginJson[6], salesOrginJson[7], salesOrginJson[8], salesOrginJson[9], salesOrginJson[10], salesOrginJson[11]]
							},
							{
								name: '누적목표',
								type: 'line',
								yAxisIndex: 1,
								data: [profitOrginStackJson[0], profitOrginStackJson[1], profitOrginStackJson[2], profitOrginStackJson[3], profitOrginStackJson[4], profitOrginStackJson[5], profitOrginStackJson[6], profitOrginStackJson[7], profitOrginStackJson[8], profitOrginStackJson[9], profitOrginStackJson[10], profitOrginStackJson[11]]
							},
							{
								name: '누적매출',
								type: 'line',
								yAxisIndex: 1,
								data: [salesOrginStackJson[0], salesOrginStackJson[1], salesOrginStackJson[2], salesOrginStackJson[3], salesOrginStackJson[4], salesOrginStackJson[5], salesOrginStackJson[6], salesOrginStackJson[7], salesOrginStackJson[8], salesOrginStackJson[9], salesOrginStackJson[10], salesOrginStackJson[11]]
							}
						]
					}
					myChart1.setOption(option1);
					globaloption1 = option1;
					// 위에서 설정한 속성을 차트에 반영합니다.

					// 2번째 그래프 ===================================================

					var myChartGauge2 = echarts.init(document.getElementById('myChart02'));
					globalmyChartGauge2 = myChartGauge2;
					var option2 = {
						series: [{
							type: 'gauge',
							center: ['39%', '30%'],
							startAngle: 225,
							endAngle: -45,
							min: 0,
							max: 100,
							splitNumber: 10,
							axisLine: {
								lineStyle: {
									width: 3,
									color: [
										[0.4,'#FC6180'],
										[0.7,'#4680ff'],
										[1,'#93BE52']
									]
								}
							},
							pointer: {
								itemStyle: {
									color: 'auto'
								}
							},
							axisTick: {
								length: 3,
								lineStyle: {
									color: 'auto',
									width: 1
								}
							},
							splitLine: {
								length: 7,
								lineStyle: {
									color: 'auto',
									width: 3
								}
							},
							axisLabel: {
								show : true,
							},
							title: {
								offsetCenter: [0, '-20%'],
								fontSize: 30
							},
							detail: {
								show : true,
								backgroundColor: 'rgba(0,0,0,0)',
								borderWidth: 0,
								borderColor: '#ccc',
								fontSize: 20,
								offsetCenter: [0, '70%'],
								valueAnimation: true,
								formatter: function (value) {
									return value + '%';
								},
								color: 'auto'
							},
							data: [{
								value: percentJson[now.getMonth()]
							}]
						}]
					};

					function gauge_load_chart2(option2){
						myChartGauge2.setOption(option2,true);
					}
					gauge_load_chart2(option2);
					globaloption2 = option2;

					/*
					var timeTicket = setInterval(function (){
						gauge_load_chart(optionGauge);
					},2000000);
					*/

					// 3번째 그래프 ===================================================

					var myChartGauge3 = echarts.init(document.getElementById('myChart03'));
					globalmyChartGauge3 = myChartGauge3;
					var option3 = {
						series: [{
							type: 'gauge',
							center: ['39%', '30%'],
							startAngle: 225,
							endAngle: -45,
							min: 0,
							max: 100,
							splitNumber: 10,
							axisLine: {
								lineStyle: {
									width: 3,
									color: [
										[0.4,'#FC6180'],
										[0.7,'#4680ff'],
										[1,'#93BE52']
									]
								}
							},
							pointer: {

								itemStyle: {
									color: 'auto'
								}
							},
							axisTick: {
								length: 3,
								lineStyle: {
									color: 'auto',
									width: 1
								}
							},
							splitLine: {
								length: 7,
								lineStyle: {
									color: 'auto',
									width: 3
								}
							},
							axisLabel: {
								show : true,
							},
							title: {
								offsetCenter: [0, '-20%'],
								fontSize: 30
							},
							detail: {
								show : true,
								backgroundColor: 'rgba(0,0,0,0)',
								borderWidth: 0,
								borderColor: '#ccc',
								fontSize: 20,
								offsetCenter: [0, '70%'],
								valueAnimation: true,
								formatter: function (value) {
									return value + '%';
								},
								color: 'auto'
							},
							data: [{
								value: ((salesOrginYearJson[0] / profitOrginYearJson[0])*100).toFixed(2)
							}]
						}]
					};

					function gauge_load_chart3(option3){
						myChartGauge3.setOption(option3, true);
					}
					gauge_load_chart3(option3);
					globaloption3 = option3;

					/*
					var timeTicket = setInterval(function (){
						gauge_load_chart(optionGauge);
					},2000000);
					*/

					// 4번째 그래프 ===================================================

					var myChartGauge4 = echarts.init(document.getElementById('myChart04'));
					globalmyChartGauge4 = myChartGauge4;
					var option4 = {
						legend: {},
						tooltip: {
							trigger: 'axis',
							showContent: false
						},
						dataset: {
							source: [
								['product', '판매방식(억원)'],
								['조달직판', Math.floor(cnt01Sum_OrginJson[0]+cnt01Sum_OrginJson[1]+cnt01Sum_OrginJson[2]+cnt01Sum_OrginJson[3]+cnt01Sum_OrginJson[4]+cnt01Sum_OrginJson[5]+cnt01Sum_OrginJson[6]+cnt01Sum_OrginJson[7]+cnt01Sum_OrginJson[8]+cnt01Sum_OrginJson[9]+cnt01Sum_OrginJson[10]+cnt01Sum_OrginJson[11])],
								['조달간판', Math.floor(cnt02Sum_OrginJson[0]+cnt02Sum_OrginJson[1]+cnt02Sum_OrginJson[2]+cnt02Sum_OrginJson[3]+cnt02Sum_OrginJson[4]+cnt02Sum_OrginJson[5]+cnt02Sum_OrginJson[6]+cnt02Sum_OrginJson[7]+cnt02Sum_OrginJson[8]+cnt02Sum_OrginJson[9]+cnt02Sum_OrginJson[10]+cnt02Sum_OrginJson[11])],
								['조달대행', Math.floor(cnt03Sum_OrginJson[0]+cnt03Sum_OrginJson[1]+cnt03Sum_OrginJson[2]+cnt03Sum_OrginJson[3]+cnt03Sum_OrginJson[4]+cnt03Sum_OrginJson[5]+cnt03Sum_OrginJson[6]+cnt03Sum_OrginJson[7]+cnt03Sum_OrginJson[8]+cnt03Sum_OrginJson[9]+cnt03Sum_OrginJson[10]+cnt03Sum_OrginJson[11])],
								['직접판매', Math.floor(cnt04Sum_OrginJson[0]+cnt04Sum_OrginJson[1]+cnt04Sum_OrginJson[2]+cnt04Sum_OrginJson[3]+cnt04Sum_OrginJson[4]+cnt04Sum_OrginJson[5]+cnt04Sum_OrginJson[6]+cnt04Sum_OrginJson[7]+cnt04Sum_OrginJson[8]+cnt04Sum_OrginJson[9]+cnt04Sum_OrginJson[10]+cnt04Sum_OrginJson[11])],
								['간접판매', Math.floor(cnt05Sum_OrginJson[0]+cnt05Sum_OrginJson[1]+cnt05Sum_OrginJson[2]+cnt05Sum_OrginJson[3]+cnt05Sum_OrginJson[4]+cnt05Sum_OrginJson[5]+cnt05Sum_OrginJson[6]+cnt05Sum_OrginJson[7]+cnt05Sum_OrginJson[8]+cnt05Sum_OrginJson[9]+cnt05Sum_OrginJson[10]+cnt05Sum_OrginJson[11])],
								['기타', Math.floor(cnt06Sum_OrginJson[0]+cnt06Sum_OrginJson[1]+cnt06Sum_OrginJson[2]+cnt06Sum_OrginJson[3]+cnt06Sum_OrginJson[4]+cnt06Sum_OrginJson[5]+cnt06Sum_OrginJson[6]+cnt06Sum_OrginJson[7]+cnt06Sum_OrginJson[8]+cnt06Sum_OrginJson[9]+cnt06Sum_OrginJson[10]+cnt06Sum_OrginJson[11])],
							]
						},
						xAxis: {type: 'category'},
						yAxis: {
							type: 'value',
							show : false
						},
						grid: {top: '55%'},
						series: [
							{
								type: 'bar', smooth: true, seriesLayoutBy: 'row', emphasis: {focus: 'series'},
								label: {
									show: true,
									color:'black',
									formatter: function (params){
										return (params.data[1]/100000000).toFixed(2);
									}
								}
							},
							{
								type: 'bar', smooth: true, seriesLayoutBy: 'row', emphasis: {focus: 'series'},
								label: {
									show: true,
									color:'black',
									formatter: function (params){
										return (params.data[2]/100000000).toFixed(2);
									}
								}
							},
							{
								type: 'bar', smooth: true, seriesLayoutBy: 'row', emphasis: {focus: 'series'},
								label: {
									show: true,
									color:'black',
									formatter: function (params){
										return (params.data[3]/100000000).toFixed(2);
									}
								}
							},
							{
								type: 'bar', smooth: true, seriesLayoutBy: 'row', emphasis: {focus: 'series'},
								label: {
									show: true,
									color:'black',
									formatter: function (params){
										return (params.data[4]/100000000).toFixed(2);
									}
								}
							},
							{
								type: 'bar', smooth: true, seriesLayoutBy: 'row', emphasis: {focus: 'series'},
								label: {
									show: true,
									color:'black',
									formatter: function (params){
										return (params.data[5]/100000000).toFixed(2);
									}
								}
							},
							{
								type: 'bar', smooth: true, seriesLayoutBy: 'row', emphasis: {focus: 'series'},
								label: {
									show: true,
									color:'black',
									formatter: function (params){
										return (params.data[6]/100000000).toFixed(2);
									}
								}
							},
							{
								type: 'pie',
								id: 'pie',
								radius: '30%',
								center: ['50%', '35%'],
								emphasis: {focus: 'data'},
								label: {
									formatter: '{d}%'
								},
								encode: {
									itemName: 'product',
									value: '판매방식(억원)'
								}
							}
						]
					};

					myChartGauge4.setOption(option4);
					globaloption4 = option4;
				}

					$(document).ready(function(){
						<c:if test="${saleslist != null}">
							$('#salesTable').DataTable({
								info : false,
								filter : false,
								lengthChange : false,
								order: [[ 0, "desc" ]],
								//dom: '<"pull-right"f><"pull-right"l>tip'
								pageLength: 20, // 한 페이지에 기본으로 보열줄 항목 수
							});
						</c:if>
						<c:if test="${techdlist != null}">
							$('#techdTable').DataTable({
								info : false,
								filter : false,
								lengthChange : false,
								order: [[ 0, "desc" ]],
								//dom: '<"pull-right"f><"pull-right"l>tip'
								pageLength: 20, // 한 페이지에 기본으로 보열줄 항목 수
							});
						</c:if>

						$('#contTable').DataTable({
							info : false,
							filter : false,
							lengthChange : false,
							order: [[ 0, "desc" ]],
							//dom: '<"pull-right"f><"pull-right"l>tip'
							pageLength: 20, // 한 페이지에 기본으로 보열줄 항목 수
						});
						$('#soppTable').DataTable({
							info : false,
							filter : false,
							lengthChange : false,
							pageLength: 20, // 한 페이지에 기본으로 보열줄 항목 수
						});

						chartReady();

						// 그래프2 관련 아래 테이블 정보

						var chart2_month_profitTarget = profitOrginJson[now.getMonth()] != '' ? profitOrginJson[now.getMonth()] : 0;
						if(chart2_month_profitTarget != 0){
							chart2_month_profitTarget = '₩'+chart2_month_profitTarget.toLocaleString("en-US");
						}
						var chart2_month_salesTarget = salesOrginJson[now.getMonth()] != '' ? salesOrginJson[now.getMonth()] : 0;
						if(chart2_month_salesTarget != 0){
							chart2_month_salesTarget = Math.floor(chart2_month_salesTarget);
							chart2_month_salesTarget = '₩'+chart2_month_salesTarget.toLocaleString("en-US");
						}
						var chart2_month_percent = percentJson[now.getMonth()] != '' ? percentJson[now.getMonth()]+'%' : '0%';

						var chart2_month_overTarget = salesOrginJson[now.getMonth()] - profitOrginJson[now.getMonth()];
						chart2_month_overTarget = Math.floor(chart2_month_overTarget);
						if(chart2_month_overTarget > 0){
							chart2_month_overTarget = '+₩' + chart2_month_overTarget.toLocaleString("en-US");
							$("#chart2_month_overTarget").removeClass("text-danger");
							$("#chart2_month_overTarget").addClass("text-success");
						} if(chart2_month_overTarget < 0){
							chart2_month_overTarget = '-₩' + (chart2_month_overTarget*-1).toLocaleString("en-US");
							$("#chart2_month_overTarget").removeClass("text-success");
							$("#chart2_month_overTarget").addClass("text-danger");
						}

						$("#chart2_month_profitTarget").html(chart2_month_profitTarget);
						$("#chart2_month_salesTarget").html(chart2_month_salesTarget);
						$("#chart2_month_overTarget").html(chart2_month_overTarget);
						$("#chart2_month_percent").html(chart2_month_percent);


						// 그래프3 관련 아래 테이블 정보

						var chart3_month_profitTarget = profitOrginYearJson[0];
						chart3_month_profitTarget = '₩'+chart3_month_profitTarget.toLocaleString("en-US");

						var chart3_month_salesTarget = salesOrginYearJson[0];
						chart3_month_salesTarget = Math.floor(chart3_month_salesTarget);
						chart3_month_salesTarget = '₩'+chart3_month_salesTarget.toLocaleString("en-US");

						var chart3_month_percent = ((salesOrginYearJson[0] / profitOrginYearJson[0])*100).toFixed(2);
						chart3_month_percent = chart3_month_percent+'%';
						var chart3_month_overTarget = salesOrginYearJson[0] - profitOrginYearJson[0];
						chart3_month_overTarget = Math.floor(chart3_month_overTarget);
						if(chart3_month_overTarget > 0){
							chart3_month_overTarget = '+₩' + chart3_month_overTarget.toLocaleString("en-US");
							$("#chart3_month_overTarget").removeClass("text-danger");
							$("#chart3_month_overTarget").addClass("text-success");
						} else if(chart3_month_overTarget < 0){
							chart3_month_overTarget = '-₩' + (chart3_month_overTarget*-1).toLocaleString("en-US");
							$("#chart3_month_overTarget").removeClass("text-success");
							$("#chart3_month_overTarget").addClass("text-danger");
						}


						$("#chart3_month_profitTarget").html(chart3_month_profitTarget);
						$("#chart3_month_salesTarget").html(chart3_month_salesTarget);
						$("#chart3_month_overTarget").html(chart3_month_overTarget);
						$("#chart3_month_percent").html(chart3_month_percent);

						// change 이벤트 시작
						$("#graph2TargetMonth").on("change", function(){
							var graph2TargetMonth = Number($("#graph2TargetMonth").val());
							globaloption2.series[0].data[0].value = percentJson[graph2TargetMonth-1];
							globalmyChartGauge2.setOption(globaloption2,true);

							$("#chart2_month_profitTarget").html('₩'+Math.floor(profitOrginJson[graph2TargetMonth-1]).toLocaleString("en-US"));
							$("#chart2_month_salesTarget").html('₩'+Math.floor(salesOrginJson[graph2TargetMonth-1]).toLocaleString("en-US"));
							$("#chart2_month_percent").html(percentJson[graph2TargetMonth-1]+'%');
							var overOrgin =  salesOrginJson[graph2TargetMonth-1] - profitOrginJson[graph2TargetMonth-1];
							if(overOrgin >= 0) {
								overOrgin = '+₩' + Math.floor(overOrgin).toLocaleString("en-US");
								$("#chart2_month_overTarget").removeClass("text-danger");
								$("#chart2_month_overTarget").addClass("text-success");
							} else {
								overOrgin = '-₩' + Math.floor(overOrgin*-1).toLocaleString("en-US");
								$("#chart2_month_overTarget").removeClass("text-success");
								$("#chart2_month_overTarget").addClass("text-danger");
							}
							$("#chart2_month_overTarget").html(overOrgin);
						});

						 $("#graph2TargetMonth").val('<%=monthStr%>');
					}); --%>
	</script>
</div>
<jsp:include page="../body-bottom.jsp"/>