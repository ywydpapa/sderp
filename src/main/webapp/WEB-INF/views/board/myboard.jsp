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
				<h5>상반기 계획대비 실적</h5>
				<span>2021년 03월</span>
				<div class="card-header-right">
					<i class="icofont icofont-spinner-alt-5"></i>
				</div>
			</div>
			<div class="card-block">
				<div id="myChart01" style="width:650px; height:400px;"></div>
			</div>
		</div>
	</div>
	<div class="col-md-12 col-lg-2">
		<div class="card">
			<div class="card-header">
				<h5>월 계획대비 실적</h5>
				<span>2021년 03월</span>
				<div class="card-header-right">
					<i class="icofont icofont-spinner-alt-5"></i>
				</div>
			</div>
			<div class="card-block">
				<div id="myChart02" style="width:400px; height:400px;"></div>
			</div>
		</div>
	</div>
	<div class="col-md-12 col-lg-2">
		<div class="card">
			<div class="card-header">
				<h5>누적 계획대비 실적</h5>
				<span>2021년</span>
				<div class="card-header-right">
					<i class="icofont icofont-spinner-alt-5"></i>
				</div>
			</div>
			<div class="card-block">
				<div id="myChart03" style="width:400px; height:400px;"></div>
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
 var myChart = echarts.init(document.getElementById('myChart01'));

    // 차트 속성과 데이터를 지정합니다.
 option = {
    tooltip : {
        trigger: 'axis',
        axisPointer : {
            type : 'shadow'
        },
        formatter: function (params){
            return params[0].name + '<br/>'
                   + params[0].seriesName + ' : ' + (params[1].value + params[0].value) + '<br/>'
                   + params[1].seriesName + ' : ' + (params[1].value);
        }
    },
    legend: {
        selectedMode:false,
        data:['실적', '목표']
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
            name:'실적',
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
            data:[260, 200, 220, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        },
        {
            name:'목표',
            type:'bar',
            stack: 'sum',
            itemStyle: {
                normal: {
                    color: '#fff',
                    barBorderColor: '#4680ff',
                    barBorderWidth: 3,
                    barBorderRadius:0,
                    label : {
                        show: true,
                        position: 'top',
                        formatter: function (params) {
                            for (var i = 0, l = option.xAxis[0].data.length; i < l; i++) {
                                if (option.xAxis[0].data[i] == params.name) {
                                    return option.series[0].data[i] + params.value;
                                }
                            }
                        },
                        textStyle: {
                            color: '#4680ff'
                        }
                    }
                }
            },
            data:[40, 110, 90, 350,350, 350, 350,350, 350, 350,350, 350]
        }
    ]
};
  myChart.setOption(option);
    // 위에서 설정한 속성을 차트에 반영합니다.

  var myChartGauge = echarts.init(document.getElementById('myChart02'));
  var optionGauge = {
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

                  data:[{value: 50, name: 'MonthRatio (%)'}]
              }
       ]
};

gauge_load_chart(optionGauge);
var timeTicket = setInterval(function (){
gauge_load_chart(optionGauge);
},2000000);
function gauge_load_chart(optionGauge){
optionGauge.series[0].data[0].value = (Math.random()*100).toFixed(2) - 0;
myChartGauge.setOption(optionGauge,true);
}

var myChartGauge = echarts.init(document.getElementById('myChart03'));
var optionGauge = {
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

                data:[{value: 50, name: 'MonthRatio (%)'}]
            }
     ]
};

gauge_load_chart(optionGauge);
var timeTicket = setInterval(function (){
gauge_load_chart(optionGauge);
},2000000);
function gauge_load_chart(optionGauge){
optionGauge.series[0].data[0].value = (Math.random()*100).toFixed(2) - 0;
myChartGauge.setOption(optionGauge,true);
}

var myChart = echarts.init(document.getElementById('myChart04'));
var option = {
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
	
myChart.setOption(option);

	}

	$(function() {
		$('#soppTable,#contTable,#salesTable').DataTable({
			info : false,
			filter : false,
			lengthChange : false
		});
	});
	
	$(document).ready(function(){
		chartReady();
	});

</script>
