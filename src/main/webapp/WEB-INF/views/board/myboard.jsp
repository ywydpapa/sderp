<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${path}/assets/pages/jquery.dataTables.min.js"></script>
<script src="${path}/assets/pages/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript" src="${path}/assets/echart/echarts-all.js"></script>

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
					<option value = "2020">2020</option>
					<option value = "2021" selected>2021</option>
					<option value = "2022">2022</option>
					<option value = "2023">2023</option>
					<option value = "2024">2024</option>
					<option value = "2025">2025</option>
				</select>
				<select class="custom-select mr-sm-2" name="graph1TargetDepartment" id="graph1TargetDepartment" style="float:right;">
					<option value = "all" selected>전체</option>
					<option value = "dept">부서</option>
					<option value = "individual">개인</option>
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
					<option value = "01">01</option>
					<option value = "02">02</option>
					<option value = "03">03</option>
					<option value = "04">04</option>
					<option value = "05">05</option>
					<option value = "06">06</option>
					<option value = "07">07</option>
					<option value = "08">08</option>
					<option value = "09">09</option>
					<option value = "10">10</option>
					<option value = "11">11</option>
					<option value = "12">12</option>
				</select>
				<select class="custom-select mr-sm-1" name="graph2TargetYear" id="graph2TargetYear" style="float:right;">
					<option value = "2020">2020</option>
					<option value = "2021" selected>2021</option>
					<option value = "2022">2022</option>
					<option value = "2023">2023</option>
					<option value = "2024">2024</option>
					<option value = "2025">2025</option>
				</select>
				<select class="custom-select mr-sm-1" name="graph2TargetDepartment" id="graph2TargetDepartment" style="float:left;">
					<option value = "all" selected>전체</option>
					<option value = "dept">부서</option>
					<option value = "individual">개인</option>
				</select>
				<div style="display: inline-block;">
					<h5>월 계획대비 실적</h5>
					<span style="vertical-align: bottom;">${graph2.targetYear}년 ${graph2.targetMonth}월</span>
				</div>
				<!-- <div class="card-header-right">
					<i class="icofont icofont-spinner-alt-5"></i>
				</div> -->
			</div>
			<div class="card-block">
				<div id="myChart02" style="width:400px; height:362px;"></div>
			</div>
		</div>
	</div>
	<div class="col-md-12 col-lg-2">
		<div class="card">
			<div class="card-header">
				<select class="custom-select mr-sm-1" name="graph3TargetYear" id="graph3TargetYear" style="float:right;">
					<option value = "2020">2020</option>
					<option value = "2021" selected>2021</option>
					<option value = "2022">2022</option>
					<option value = "2023">2023</option>
					<option value = "2024">2024</option>
					<option value = "2025">2025</option>
				</select>
				<select class="custom-select mr-sm-1" name="graph3TargetDepartment" id="graph3TargetDepartment" style="float:right;">
					<option value = "all" selected>전체</option>
					<option value = "dept">부서</option>
					<option value = "individual">개인</option>
				</select>
				<div style="display: inline-block;">
					<h5>누적 계획대비 실적</h5>
					<span style="vertical-align: bottom;">${graph3.targetYear}년</span>
				</div>				
				<!-- <div class="card-header-right">
					<i class="icofont icofont-spinner-alt-5"></i>
				</div> -->
			</div>
			<div class="card-block">
				<div id="myChart03" style="width:400px; height:362px;"></div>
			</div>
		</div>
	</div>
	<div class="col-md-12 col-lg-3">
		<div class="card">
			<div class="card-header">
				<h5>판매방법</h5>
				<span>2021년</span>
				<div class="card-header-right">
					<i class="icofont icofont-spinner-alt-5"></i>
				</div>
			</div>
			<div class="card-block">
				<div id="myChart04" style="width:400px; height:400px;"></div>
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
				<table id="soppTable" 
					class="table table-striped table-bordered nowrap">
					<thead>
						<tr >
							<th style="text-align: center">영업기회명</th>
							<th style="text-align: center">거래처명</th>
							<th style="text-align: center">담당자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="row" items="${sopplist}">
							<tr align="center">
								<td><a
									href="javascript:fnSetPage('${path}/sopp/detail/${row.soppNo}')">${row.soppTitle}</a></td>
								<td>${row.soppDesc}</td>
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
				<h5>영업일정</h5>
				<span>영업일정 목록</span>
				<div class="card-header-right">
					<i class="icofont icofont-spinner-alt-5"></i>
				</div>
			</div>
			<div class="card-block">
			<table id="salesTable" class="table table-striped table-bordered nowrap">
					<thead>
						<tr>
							<th style="text-align: center">일정명</th>
							<th style="text-align: center">거래처명</th>
							<th style="text-align: center">담당자</th>
							<th style="text-align: center">장소</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="row" items="${saleslist}">
							<tr align="center">
								<td><a
									href="javascript:fnSetPage('${path}/sales/detail/${row.salesNo}')">${row.salesTitle}</a></td>
								<td>${row.salesDesc}</td>
								<td>${row.userName}</td>
								<td>${row.salesPlace}</td>
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
							<th style="text-align: center">계약명</th>
							<th style="text-align: center">거래처명</th>
							<th style="text-align: center">담당자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="row" items="${contlist}">
							<tr align="center">
								<td><a
									href="javascript:fnSetPage('${path}/cont/detail/${row.contNo}')">${row.contTitle}</a></td>
								<td>${row.contDesc}</td>
								<td>${row.userName}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script>

function chartReady(){
	// 1번째 그래프 ===================================================
	var myChart1 = echarts.init(document.getElementById('myChart01'));	
	// 차트 속성과 데이터를 지정합니다.
	option1 = {
	    tooltip : {
	        trigger: 'axis',
	        axisPointer : {
	            type : 'shadow'
//				type : 'cross'
	        },
	        formatter: function (params){
	        	console.dir(params);
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
	                        show: true, position: 'insideTop'
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
	                        show: true,
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
	                                	if (option1.series[2].data[i] != 0){
	                                    	return option1.series[2].data[i];
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
	            data:[${graph1.overDto.mm01/10.0}, ${graph1.overDto.mm02/10.0}, ${graph1.overDto.mm03/10.0}, ${graph1.overDto.mm04/10.0}, 
	            	${graph1.overDto.mm05/10.0}, ${graph1.overDto.mm06/10.0}, ${graph1.overDto.mm07/10.0}, ${graph1.overDto.mm08/10.0}, 
	            	${graph1.overDto.mm09/10.0}, ${graph1.overDto.mm10/10.0}, ${graph1.overDto.mm11/10.0}, ${graph1.overDto.mm12/10.0}]
	        }
	    ]
	};
	myChart1.setOption(option1);
    // 위에서 설정한 속성을 차트에 반영합니다.

    // 2번째 그래프 ===================================================
	var myChartGauge2 = echarts.init(document.getElementById('myChart02'));
	var option2 = {
          tooltip : {
              formatter: "{b} : {c}%"
          },
          toolbox: {
              show : false,
              feature : {
                  mark : {show: false},
                  restore : {show: false},
                  saveAsImage : {show: false}
                  }
          },
          series : [
              {
                  name:'MonthRatio',
                  type:'gauge',
                  center: ['25%', '35%'],
                  radius: ['00%', '50%'],
                  axisLine: {
                      show: true,
                      lineStyle: {
                          color: [
                              [0.4,'#FC6180'],
                              [0.7,'#4680ff'],
                              [1,'#93BE52']
                          ],
                          width: 10
                      }
                  }  ,
                  title: {
                      show : false,
                      offsetCenter: [0, '120%'],
                      textStyle: {
                          color: '#93BE52',
                          fontSize : 30
                      }
                  }  ,
                  detail: {
                      show : true,
                      backgroundColor: 'rgba(0,0,0,0)',
                      borderWidth: 0,
                      borderColor: '#ccc',
                      width: 80,
                      height: 40,
                      offsetCenter: [0, '40%'],
                      formatter:'{value}%',
                      textStyle: {
                          color: 'auto',
                          fontSize : 25
                      }
                  },

                  data:[{value: ${graph2.data.percent}, name: 'MonthRatio (%)'}]
              }
       ]
	};
	
	function gauge_load_chart2(option2){
//		optionGauge.series[0].data[0].value = (Math.random()*100).toFixed(2) - 0;
		myChartGauge2.setOption(option2,true);
	}
	gauge_load_chart2(option2);
	
	/*
	var timeTicket = setInterval(function (){
		gauge_load_chart(optionGauge);
	},2000000);
	*/
	
	// 3번째 그래프 ===================================================
	var myChartGauge3 = echarts.init(document.getElementById('myChart03'));
	var option3 = {
	        tooltip : {
	            formatter: "{b} : {c}%"
	        },
	        toolbox: {
	            show : false,
	            feature : {
	                mark : {show: false},
	                restore : {show: false},
	                saveAsImage : {show: false}
	                }
	        },
	        series : [
	            {
	                name:'MonthRatio',
	                type:'gauge',
	                center: ['25%', '35%'],
	                radius: ['00%', '50%'],
	                axisLine: {
	                    show: true,
	                    lineStyle: {
	                        color: [
	                            [0.4,'#FC6180'],
	                            [0.7,'#4680ff'],
	                            [1,'#93BE52']
	                        ],
	                        width: 10
	                    }
	                }  ,
	                title: {
	                    show : false,
	                    offsetCenter: [0, '120%'],
	                    textStyle: {
	                        color: '#93BE52',
	                        fontSize : 30
	                    }
	                }  ,
	                detail: {
	                    show : true,
	                    backgroundColor: 'rgba(0,0,0,0)',
	                    borderWidth: 0,
	                    borderColor: '#ccc',
	                    width: 80,
	                    height: 40,
	                    offsetCenter: [0, '40%'],
	                    formatter:'{value}%',
	                    textStyle: {
	                        color: 'auto',
	                        fontSize : 25
	                    }
	                },
	
	                data:[{value:  ${graph3.data.percent}, name: 'MonthRatio (%)'}]
	            }
	     ]
	};
	
	function gauge_load_chart3(option3){
//		optionGauge.series[0].data[0].value = (Math.random()*100).toFixed(2) - 0;
		myChartGauge3.setOption(option3, true);
	}
	gauge_load_chart3(option3);
	
	/*
	var timeTicket = setInterval(function (){
		gauge_load_chart(optionGauge);
	},2000000);
	*/
	
	// 4번째 그래프 ===================================================
	var myChartGauge4 = echarts.init(document.getElementById('myChart04'));
	var option4 = {
		tooltip: {
	        trigger: 'item',
	        formatter: '{a} <br/>{b}: {c} ({d}%)'
	    },
	    legend: {
	        orient: 'horizon',
	        left: 5,
	        data: ['조달직판', '조달간판', '조달대행', '직접판매', '간접판매']
	    },
	    series: [
	        {
	            name: '판매방법',
	            type: 'pie',
	            radius: ['20%', '40%'],
	            avoidLabelOverlap: false,
	            label: {
	                show: false,
	                position: 'center'
	            },
	            emphasis: {
	                label: {
	                    show: true,
	                    fontSize: '20',
	                    fontWeight: 'bold'
	                }
	            },
	            labelLine: {
	                show: false
	            },
	            data: [
	                {value: 335, name: '조달직판'},
	                {value: 110, name: '조달간판'},
	                {value: 134, name: '조달대행'},
	                {value: 135, name: '직접판매'},
	                {value: 148, name: '간접판매'}
	            ]
	        }
	    ]
	};
	myChartGauge4.setOption(option4);
}

/* 
	$(function() {
	});
 */	
	$(document).ready(function(){
		$('#soppTable,#contTable,#salesTable').DataTable({
			info : false,
			filter : false,
			lengthChange : false
		});
		
		chartReady();
	});

</script>
