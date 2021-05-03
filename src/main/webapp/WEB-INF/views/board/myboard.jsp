<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<script type="text/javascript" src="${path}/assets/echart/echarts-5.0.2.js"></script>

<div class="row">
	<div class="col-md-12 col-lg-5">
		<div class="card">
			<div class="card-header">
				<div style="display: inline-block;">
					<h5>연간 계획대비 실적</h5>
					<span style="vertical-align: bottom;">${graph1.targetYear}년</span>
				</div>				
				<!-- <div class="card-header-right">
					<i class="icofont icofont-spinner-alt-5"></i>
				</div> -->
				<select class="custom-select mr-sm-2" name="graph1TargetYear" id="graph1TargetYear" style="float:right;">
					<option value = "2020" <c:if test="${graph1.targetYear == 2020}">selected</c:if> >2020</option>
					<option value = "2021" <c:if test="${graph1.targetYear == 2021}">selected</c:if> >2021</option>
					<option value = "2022" <c:if test="${graph1.targetYear == 2022}">selected</c:if> >2022</option>
					<option value = "2023" <c:if test="${graph1.targetYear == 2023}">selected</c:if> >2023</option>
					<option value = "2024" <c:if test="${graph1.targetYear == 2024}">selected</c:if> >2024</option>
					<option value = "2025" <c:if test="${graph1.targetYear == 2025}">selected</c:if> >2025</option>
				</select>
				<select class="custom-select mr-sm-2" name="graph1TargetDepartment" id="graph1TargetDepartment" style="float:right;">
					<option value = "all">전체</option>
					<option value = "dept">부서</option>
					<option value = "individual" selected>개인</option>
				</select>
			</div>
			<div class="card-block">
				<div id="myChart01" style="width:650px; height:400px;"></div>
			</div>
		</div>
	</div>
	<div class="col-md-12 col-lg-2">
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
					<option value = "2020" <c:if test="${graph2.targetYear == 2020}">selected</c:if> >2020</option>
					<option value = "2021" <c:if test="${graph2.targetYear == 2021}">selected</c:if> >2021</option>
					<option value = "2022" <c:if test="${graph2.targetYear == 2022}">selected</c:if> >2022</option>
					<option value = "2023" <c:if test="${graph2.targetYear == 2023}">selected</c:if> >2023</option>
					<option value = "2024" <c:if test="${graph2.targetYear == 2024}">selected</c:if> >2024</option>
					<option value = "2025" <c:if test="${graph2.targetYear == 2025}">selected</c:if> >2025</option>
				</select>
				<select class="custom-select mr-sm-1" name="graph2TargetDepartment" id="graph2TargetDepartment" style="float:right;">
					<option value = "all">전체</option>
					<option value = "dept">부서</option>
					<option value = "individual" selected>개인</option>
				</select>
				<div style="display: inline-block;">
					<h5>월 계획대비 실적</h5>
					<span style="vertical-align: bottom;" id="graph2TargetMiniTitle">${graph2.targetYear}년 ${graph2.targetMonth}월</span>
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
					<%--<div class="col-sm-2"><div class="icon"><i class="fa fa-tags fa-5x" aria-hidden="true"></i></div></div>--%>
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
	<div class="col-md-12 col-lg-2">
		<div class="card">
			<div class="card-header">
				<select class="custom-select mr-sm-1" name="graph3TargetYear" id="graph3TargetYear" style="float:right;">
					<option value = "2020" <c:if test="${graph3.targetYear == 2020}">selected</c:if> >2020</option>
					<option value = "2021" <c:if test="${graph3.targetYear == 2021}">selected</c:if> >2021</option>
					<option value = "2022" <c:if test="${graph3.targetYear == 2022}">selected</c:if> >2022</option>
					<option value = "2023" <c:if test="${graph3.targetYear == 2023}">selected</c:if> >2023</option>
					<option value = "2024" <c:if test="${graph3.targetYear == 2024}">selected</c:if> >2024</option>
					<option value = "2025" <c:if test="${graph3.targetYear == 2025}">selected</c:if> >2025</option>
				</select>
				<select class="custom-select mr-sm-1" name="graph3TargetDepartment" id="graph3TargetDepartment" style="float:right;">
					<option value = "all">전체</option>
					<option value = "dept">부서</option>
					<option value = "individual" selected>개인</option>
				</select>
				<div style="display: inline-block;">
					<h5>누적 계획대비 실적</h5>
					<span style="vertical-align: bottom;" id="graph3TargetMiniTitle">${graph3.targetYear}년</span>
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
					<%--<div class="col-sm-2"><div class="icon"><i class="fa fa-tags fa-5x" aria-hidden="true"></i></div></div>--%>
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
	<div class="col-md-12 col-lg-3">
		<div class="card">
			<div class="card-header">
				<select class="custom-select mr-sm-1" name="graph4TargetMonth" id="graph4TargetMonth" style="float:right;">
					<option value = "01" <c:if test="${graph4.targetMonth == 01}">selected</c:if> >01</option>
					<option value = "02" <c:if test="${graph4.targetMonth == 02}">selected</c:if> >02</option>
					<option value = "03" <c:if test="${graph4.targetMonth == 03}">selected</c:if> >03</option>
					<option value = "04" <c:if test="${graph4.targetMonth == 04}">selected</c:if> >04</option>
					<option value = "05" <c:if test="${graph4.targetMonth == 05}">selected</c:if> >05</option>
					<option value = "06" <c:if test="${graph4.targetMonth == 06}">selected</c:if> >06</option>
					<option value = "07" <c:if test="${graph4.targetMonth == 07}">selected</c:if> >07</option>
					<option value = "08" <c:if test="${graph4.targetMonth == 08}">selected</c:if> >08</option>
					<option value = "09" <c:if test="${graph4.targetMonth == 09}">selected</c:if> >09</option>
					<option value = "10" <c:if test="${graph4.targetMonth == 10}">selected</c:if> >10</option>
					<option value = "11" <c:if test="${graph4.targetMonth == 11}">selected</c:if> >11</option>
					<option value = "12" <c:if test="${graph4.targetMonth == 12}">selected</c:if> >12</option>
				</select>
				<select class="custom-select mr-sm-1" name="graph4TargetYear" id="graph4TargetYear" style="float:right;">
					<option value = "2020" <c:if test="${graph4.targetYear == 2020}">selected</c:if> >2020</option>
					<option value = "2021" <c:if test="${graph4.targetYear == 2021}">selected</c:if> >2021</option>
					<option value = "2022" <c:if test="${graph4.targetYear == 2022}">selected</c:if> >2022</option>
					<option value = "2023" <c:if test="${graph4.targetYear == 2023}">selected</c:if> >2023</option>
					<option value = "2024" <c:if test="${graph4.targetYear == 2024}">selected</c:if> >2024</option>
					<option value = "2025" <c:if test="${graph4.targetYear == 2025}">selected</c:if> >2025</option>
				</select>
				<select class="custom-select mr-sm-1" name="graph4TargetDepartment" id="graph4TargetDepartment" style="float:right;">
					<option value = "all">전체</option>
					<option value = "dept">부서</option>
					<option value = "individual" selected>개인</option>
				</select>
				<div style="display: inline-block;">
					<h5>판매방식</h5>
					<span style="vertical-align: bottom;" id="graph4TargetMiniTitle">${graph4.targetYear}년 ${graph4.targetMonth}월</span>
				</div>
			</div>
			<div class="card-block">
				<div id="myChart04" style="width:350px; height:400px;"></div>
			</div>
		</div>
	</div>
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
						<col width="20%">
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
								<td><a href="javascript:fnSetPage('${path}/sopp/detail/${row.soppNo}')" title="${row.soppTitle}">${row.soppTitle}</a></td>
								<td><span title="${row.custName}">${row.custName}</span></td>
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
						<option value = "dept" selected>부서</option>
						<option value = "individual">개인</option>
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
									<td><a href="javascript:fnSetPage('${path}/sales/detail/${row.salesNo}')" title="${row.salesTitle}">${row.salesTitle}</a></td>
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
						<option value = "dept" selected>부서</option>
						<option value = "individual">개인</option>
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
								<td><a href="javascript:fnSetPage('${path}/techd/detail/${row.techdNo}')" title="${row.techdTitle}">${row.techdTitle}</a></td>
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
				<h5>공지사항</h5>
				<span>사내 공지사항</span>
				<div class="card-header-right">
					<i class="icofont icofont-spinner-alt-5"></i>
				</div>
			</div>
			<div class="card-block">
				<canvas id="barChart" width="400" height="400"></canvas>
			</div>
		</div>
	</div>
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
					<thead>
						<tr>
							<th style="text-align: center">등록일</th>
							<th style="text-align: center">발주일자</th>
							<th style="text-align: center">계약명</th>
							<th style="text-align: center">매출처</th>
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
								<td><a href="javascript:fnSetPage('${path}/cont/detail/${row.contNo}')" title="${row.contTitle}">${row.contTitle}</a></td>
								<td><span title="${row.custName}">${row.custName}</span></td>
								<td>${row.userName}</td>
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
		max-width: 360px;
		overflow: hidden;
	}
	#soppTable > tbody > tr > td:nth-child(3){
		text-overflow: ellipsis;
		max-width: 180px;
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
		max-width: 250px;
		overflow: hidden;
	}
	#contTable > tbody > tr > td:nth-child(4){
		text-overflow: ellipsis;
		max-width: 200px;
		overflow: hidden;
	}
	.pull-left{float:left!important;}
	.pull-right{float:right!important;}
</style>
<script>
var globaloption1, globaloption2, globaloption3, globaloption4;
var globalmyChart1, globalmyChartGauge2, globalmyChartGauge3, globalmyChartGauge4;

function chartReady(){
	// 1번째 그래프 ===================================================
	var myChart1 = echarts.init(document.getElementById('myChart01'));
	globalmyChart1 = myChart1;
	// 차트 속성과 데이터를 지정합니다.
	option1 = {
	    tooltip : {
	        trigger: 'axis',
	        axisPointer : {
	            type : 'shadow'
//				type : 'cross'
	        },
	        formatter: function (params){
	            return params[0].name + '<br/>'
	                   + params[2].seriesName + ' : ' + (params[2].value+params[0].value) + '<br/>'
	                   + params[1].seriesName + ' : ' + (params[1].value) + '<br/>'
	                   + params[0].seriesName + ' : ' + (params[0].value);
	        }
	    },
	    legend: {
	        selectedMode:false,
	        data:['실적(억원)', '목표량(억원)', '초과(억원)']
	    },
	    toolbox: {
	        show : false
	    },
	    calculable : true,
	    xAxis : [
	        {
	            type : 'category',
	            data : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	        }
	    ],
	    yAxis : [
	        {
	            type : 'value',
	            boundaryGap: [0, 0.1]
	        }
	    ],
	    series : [
	        {
	            name:'실적(억원)',
	            type:'bar',
	            stack: 'sum',
	            barCategoryGap: '50%',
	            itemStyle: {
	                normal: {
	                    color: 'rgba(70, 128, 255, 0.54)',
	                    barBorderColor: 'rgba(70, 128, 255, 0.54)',
	                    barBorderWidth: 3,
	                    barBorderRadius:0,
	                    label : {
	                        show: true,
							position: 'insideTop',
							formatter: function (params) {
								for (var i = 0, l = option1.xAxis[0].data.length; i < l; i++) {
									if (option1.xAxis[0].data[i] == params.name) {
										if (option1.series[0].data[i] > 0){
											return option1.series[0].data[i];
										} else {
											return '';
										}
									}
								}
							},
	                    }
	                }
	            },
	            data:[${graph1.salesDto.mm01/10.0}, ${graph1.salesDto.mm02/10.0}, ${graph1.salesDto.mm03/10.0}, ${graph1.salesDto.mm04/10.0}, 
	            	${graph1.salesDto.mm05/10.0}, ${graph1.salesDto.mm06/10.0}, ${graph1.salesDto.mm07/10.0}, ${graph1.salesDto.mm08}, 
	            	${graph1.salesDto.mm09/10.0}, ${graph1.salesDto.mm10/10.0}, ${graph1.salesDto.mm11/10.0}, ${graph1.salesDto.mm12}]
	        },
	        {
	            name:'목표량(억원)',
	            type:'line',
//	            stack: 'sum',
	            itemStyle: {
	                normal: {
	                    color: '#5873c7',
	                    //barBorderColor: '#4680ff',
	                    barBorderWidth: 1,
	                    barBorderRadius:0,
	                    label : {
	                        show: false,
	                        position: 'top',
	                        formatter: function (params) {
	                            for (var i = 0, l = option1.xAxis[0].data.length; i < l; i++) {
	                                if (option1.xAxis[0].data[i] == params.name) {
	                                    //return option.series[0].data[i] + params.value;
	                                    if (option1.series[1].data[i] != 0){
	                                    	return;
	                                    	//return option.series[1].data[i];
	                                    } else {
	                                    	return;
	                                    }
	                                }
	                            }
	                        },
	                        textStyle: {
	                            color: '#4680ff'
	                        }
	                    }
	                }
	            },
	            data:[${graph1.profitDto.mm01/10.0}, ${graph1.profitDto.mm02/10.0}, ${graph1.profitDto.mm03/10.0}, ${graph1.profitDto.mm04/10.0}, 
	            	${graph1.profitDto.mm05/10.0}, ${graph1.profitDto.mm06/10.0}, ${graph1.profitDto.mm07/10.0}, ${graph1.profitDto.mm08/10.0}, 
	            	${graph1.profitDto.mm09/10.0}, ${graph1.profitDto.mm10/10.0}, ${graph1.profitDto.mm11/10.0}, ${graph1.profitDto.mm12/10.0}]
	        },
	        {
	            name:'초과(억원)',
	            type:'bar',
	            stack: 'sum',
	            itemStyle: {
	                normal: {
	                    color: '#fc6180',
	                    barBorderColor: '#4680ff',
	                    barBorderWidth: 3,
	                    barBorderRadius:0,
	                    label : {
	                        show: true,
	                        position: 'top',
	                        formatter: function (params) {
	                            for (var i = 0, l = option1.xAxis[0].data.length; i < l; i++) {
	                                if (option1.xAxis[0].data[i] == params.name) {
	                                	if (option1.series[2].data[i] > 0){
	                                    	return option1.series[2].data[i];
	                                	} else {
	                                		return '';
	                                	}
	                                }
	                            }
	                        },
	                        textStyle: {
	                            color: '#4680ff'
	                        }
	                    }
	                }
	            },
	            data:[${graph1.overDto.mm01/10.0}, ${graph1.overDto.mm02/10.0}, ${graph1.overDto.mm03/10.0}, ${graph1.overDto.mm04/10.0}, 
	            	${graph1.overDto.mm05/10.0}, ${graph1.overDto.mm06/10.0}, ${graph1.overDto.mm07/10.0}, ${graph1.overDto.mm08/10.0}, 
	            	${graph1.overDto.mm09/10.0}, ${graph1.overDto.mm10/10.0}, ${graph1.overDto.mm11/10.0}, ${graph1.overDto.mm12/10.0}]
	        }
	    ]
	};
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
				value: ${graph2.data.percent}
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
				value: ${graph3.data.percent}
			}]
		}]
	};
	
	function gauge_load_chart3(option3){
//		optionGauge.series[0].data[0].value = (Math.random()*100).toFixed(2) - 0;
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
				['product', '판매방식'],
				['조달직판', ${graph4.data[0].contTypeCount}],
				['조달간판', ${graph4.data[1].contTypeCount}],
				['조달대행', ${graph4.data[2].contTypeCount}],
				['직접판매', ${graph4.data[3].contTypeCount}],
				['간접판매', ${graph4.data[4].contTypeCount}],
				['기타', ${graph4.data[5].contTypeCount}],
			]
		},
		xAxis: {type: 'category'},
		yAxis: {gridIndex: 0},
		grid: {top: '55%'},
		series: [
			{type: 'bar', smooth: true, seriesLayoutBy: 'row', emphasis: {focus: 'series'}, label: { show: true, color:'black', formatter: function (params){ return params[0];}}},
			{type: 'bar', smooth: true, seriesLayoutBy: 'row', emphasis: {focus: 'series'}, label: { show: true, color:'black', formatter: function (params){ return params[1];}}},
			{type: 'bar', smooth: true, seriesLayoutBy: 'row', emphasis: {focus: 'series'}, label: { show: true, color:'black', formatter: function (params){ return params[2];}}},
			{type: 'bar', smooth: true, seriesLayoutBy: 'row', emphasis: {focus: 'series'}, label: { show: true, color:'black', formatter: function (params){ return params[3];}}},
			{type: 'bar', smooth: true, seriesLayoutBy: 'row', emphasis: {focus: 'series'}, label: { show: true, color:'black', formatter: function (params){ return params[4];}}},
			{type: 'bar', smooth: true, seriesLayoutBy: 'row', emphasis: {focus: 'series'}, label: { show: true, color:'black', formatter: function (params){ return params[5];}}},
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
					value: '판매방식'
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
		var chart2_month_profitTarget = ${graph2.data.profitTarget} != '' ? ${graph2.data.profitTarget} : 0;
		if(chart2_month_profitTarget != 0){
			chart2_month_profitTarget = '₩'+chart2_month_profitTarget.toLocaleString("en-US");
		}
		var chart2_month_salesTarget = ${graph2.data.salesTarget} != '' ? ${graph2.data.salesTarget} : 0;
		if(chart2_month_salesTarget != 0){
			chart2_month_salesTarget = Math.floor(chart2_month_salesTarget);
			chart2_month_salesTarget = '₩'+chart2_month_salesTarget.toLocaleString("en-US");
		}
		var chart2_month_percent = ${graph2.data.percent} != '' ? ${graph2.data.percent}+'%' : '0%';

		var chart2_month_overTarget = ${graph2.data.overTarget} != '' ? ${graph2.data.overTarget} : 0;
		if(chart2_month_overTarget != 0){
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
		}

		$("#chart2_month_profitTarget").html(chart2_month_profitTarget);
		$("#chart2_month_salesTarget").html(chart2_month_salesTarget);
		$("#chart2_month_overTarget").html(chart2_month_overTarget);
		$("#chart2_month_percent").html(chart2_month_percent);

		// 그래프3 관련 아래 테이블 정보
		var chart3_month_profitTarget = ${graph3.data.profitTarget};
		chart3_month_profitTarget = '₩'+chart3_month_profitTarget.toLocaleString("en-US");

		var chart3_month_salesTarget = ${graph3.data.salesTarget};
		chart3_month_salesTarget = Math.floor(chart3_month_salesTarget);
		chart3_month_salesTarget = '₩'+chart3_month_salesTarget.toLocaleString("en-US");

		var chart3_month_percent = ${graph3.data.percent};
		chart3_month_percent = chart3_month_percent+'%';
		var chart3_month_overTarget = ${graph3.data.overTarget};
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
		$("#graph2TargetDepartment, #graph2TargetYear, #graph2TargetMonth").on("change", function(){
			var graph2TargetDepartment = $("#graph2TargetDepartment").val();
			var graph2TargetYear = $("#graph2TargetYear").val();
			var graph2TargetMonth = $("#graph2TargetMonth").val();
			var obj = new Object();
			obj.targetType = graph2TargetDepartment;
			obj.targetYear = graph2TargetYear;
			obj.targetMonth = graph2TargetMonth;
			var url = "${path}/salesTarget/graph2";
			$.ajax({
				url: url, // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: JSON.stringify(obj) , // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
				contentType:"application/json",
				dataType: "json" // 서버에서 보내줄 데이터의 타입
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
					.done(function(result) {
						if(result.code == 10001){
							globaloption2.series[0].data[0].value = result.data.percent;
							globalmyChartGauge2.setOption(globaloption2,true);
							var graph2TargetMiniTitle = result.targetYear + "년 " + result.targetMonth+"월";
							$("#graph2TargetMiniTitle").text(graph2TargetMiniTitle);
							chart2_month_profitTarget = '₩'+Math.floor(result.data.profitTarget).toLocaleString("en-US");
							chart2_month_salesTarget = '₩'+Math.floor(result.data.salesTarget).toLocaleString("en-US");
							if(result.data.overTarget >= 0) {
								chart2_month_overTarget = '+₩' + Math.floor(result.data.overTarget).toLocaleString("en-US");
								$("#chart2_month_overTarget").removeClass("text-danger");
								$("#chart2_month_overTarget").addClass("text-success");
							} else {
								chart2_month_overTarget = '-₩' + Math.floor(result.data.overTarget*-1).toLocaleString("en-US");
								$("#chart2_month_overTarget").removeClass("text-success");
								$("#chart2_month_overTarget").addClass("text-danger");
							}
							chart2_month_percent = (result.data.percent) + '%';

							$("#chart2_month_profitTarget").html(chart2_month_profitTarget);
							$("#chart2_month_salesTarget").html(chart2_month_salesTarget);
							$("#chart2_month_overTarget").html(chart2_month_overTarget);
							$("#chart2_month_percent").html(chart2_month_percent);
						}else{
							console.dir("AJAX 데이터 로딩 실패");
						}
					}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
					.fail(function(xhr, status, errorThrown) {
						console.dir("AJAX 통신실패");
					});
		});

		$("#graph3TargetDepartment, #graph3TargetYear").on("change", function(){
			var graph3TargetDepartment = $("#graph3TargetDepartment").val();
			var graph3TargetYear = $("#graph3TargetYear").val();
			var obj = new Object();
			obj.targetType = graph3TargetDepartment;
			obj.targetYear = graph3TargetYear;
			var url = "${path}/salesTarget/graph3";
			$.ajax({
				url: url, // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: JSON.stringify(obj) , // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
				contentType:"application/json",
				dataType: "json" // 서버에서 보내줄 데이터의 타입
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
					.done(function(result) {
						if(result.code == 10001){
							globaloption3.series[0].data[0].value = result.data.percent;
							globalmyChartGauge3.setOption(globaloption3,true);
							var graph3TargetMiniTitle = result.targetYear + "년";
							$("#graph3TargetMiniTitle").text(graph3TargetMiniTitle);

							chart3_month_profitTarget = '₩'+Math.floor(result.data.profitTarget).toLocaleString("en-US");
							chart3_month_salesTarget = '₩'+Math.floor(result.data.salesTarget).toLocaleString("en-US");
							if(result.data.overTarget >= 0) {
								chart3_month_overTarget = '+₩' + Math.floor(result.data.overTarget).toLocaleString("en-US");
								$("#chart3_month_overTarget").removeClass("text-danger");
								$("#chart3_month_overTarget").addClass("text-success");
							} else {
								chart3_month_overTarget = '-₩' + Math.floor(result.data.overTarget*-1).toLocaleString("en-US");
								$("#chart3_month_overTarget").removeClass("text-success");
								$("#chart3_month_overTarget").addClass("text-danger");
							}
							chart3_month_percent = (result.data.percent) + '%';

							$("#chart3_month_profitTarget").html(chart3_month_profitTarget);
							$("#chart3_month_salesTarget").html(chart3_month_salesTarget);
							$("#chart3_month_overTarget").html(chart3_month_overTarget);
							$("#chart3_month_percent").html(chart3_month_percent);
						}else{
							console.dir("AJAX 데이터 로딩 실패");
						}
					}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
					.fail(function(xhr, status, errorThrown) {
						console.dir("AJAX 통신실패");
					});
		});

		$("#graph4TargetDepartment, #graph4TargetYear, #graph4TargetMonth").on("change", function(){
			var graph4TargetDepartment = $("#graph4TargetDepartment").val();
			var graph4TargetYear = $("#graph4TargetYear").val();
			var graph4TargetMonth = $("#graph4TargetMonth").val();
			var obj = new Object();
			obj.targetType = graph4TargetDepartment;
			obj.targetYear = graph4TargetYear;
			obj.targetMonth = graph4TargetMonth;
			var url = "${path}/cont/graph4";
			$.ajax({
				url: url, // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: JSON.stringify(obj) , // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
				contentType:"application/json",
				dataType: "json" // 서버에서 보내줄 데이터의 타입
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
					.done(function(result) {
						if(result.code == 10001){
							globaloption4.dataset.source[1][1] = result.data[0].contTypeCount;
							globaloption4.dataset.source[2][1] = result.data[1].contTypeCount;
							globaloption4.dataset.source[3][1] = result.data[2].contTypeCount;
							globaloption4.dataset.source[4][1] = result.data[3].contTypeCount;
							globaloption4.dataset.source[5][1] = result.data[4].contTypeCount;
							globaloption4.dataset.source[6][1] = result.data[5].contTypeCount;
							globalmyChartGauge4.setOption(globaloption4, true);

							var graph4TargetMiniTitle = result.targetYear + "년 " + result.targetMonth+"월";
							$("#graph4TargetMiniTitle").text(graph4TargetMiniTitle);

						}else{
							console.dir("AJAX 데이터 로딩 실패");
						}
					}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
					.fail(function(xhr, status, errorThrown) {
						console.dir("AJAX 통신실패");
					});
		});
	});

</script>
