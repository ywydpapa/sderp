<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
    <link href='${path}/fullcalendar4/core/main.css' rel='stylesheet' />
    <link href='${path}/fullcalendar4/daygrid/main.css' rel='stylesheet' />
    <link href='${path}/fullcalendar4/bootstrap/main.css' rel='stylesheet' />
    <link href='${path}/assets/css/font-awesome.min.css' rel="stylesheet" type="text/css">
    <script src='${path}/fullcalendar4/core/main.js'></script>
    <script src='${path}/fullcalendar4/daygrid/main.js'></script>
    <script src='${path}/fullcalendar4/interaction/main.js'></script>
    <script src='${path}/fullcalendar4/list/main.js'></script>
    <script src='${path}/fullcalendar4/timegrid/main.js'></script>
    <%-- <script src='${path}/fullcalendar4/moment/main.js'></script> --%>

	<style>
		#organizationChartView {
			min-width: 200px;
			background-color: #fff;
			display: none;
			position: absolute;
			z-index: 9999;
			padding: 5px 5px 10px 5px;
			border : 2px solid #efefef;
		}
		
		input[type=checkbox] {
		    margin: 4px 0 0 0;
		}
		
		.fa-caret-down, .fa-caret-right {
    		cursor: pointer;
		}
		
		
	</style>
    
  <!-- Modal body Start -->
<div class="modal fade" tabindex="-1" role="dialog" id="eventModal" data-backdrop="static">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">일정추가</h4>
			</div>
			<div class="modal-body">
				<div class="eventModalRadioGroup">
					<div class="form-radio">
						<form>
							<div class="radio radio-inline">
								<label><input type="radio" name="schedCat" value="770010" onclick="fnSetDetail(this.value)"/><i class="helper"></i>영업일정</label>
							</div>
							<div class="radio radio-inline">
								<label><input type="radio" name="schedCat" value="770100" onclick="fnSetDetail(this.value)"/><i class="helper"></i>기술지원</label>
							</div>
							<div class="radio radio-inline">
								<label><input type="radio" name="schedCat" value="770800" onclick="fnSetDetail(this.value)"/><i class="helper"></i>기타일정</label>
							</div>
						</form>
					</div>
					<!-- <label><input type="radio" name="schedCat" value="770010" onclick="fnSetDetail(this.value)"/>영업일정</label>
					<label><input type="radio" name="schedCat" value="770100" onclick="fnSetDetail(this.value)"/>기술지원</label>
					<label><input type="radio" name="schedCat" value="770800" onclick="fnSetDetail(this.value)"/>기타일정</label> -->
				</div>
				
				<div id="detail-content">
					
				</div>
			</div>
		</div>
	</div>
</div>
<div>
	<div style="float:left; margin:0px 5px">
		<input type="text" id="organizationChartOpen" class="form-control" value="조직도" style="width:200px; cursor:pointer" readonly/>
		<div id="organizationChartView">
			<!-- <ul class="fa-ul">
				<li>
					<i class="fa-li fa fa-caret-down" onclick="fnCaretClick(this)"></i>
					<input type="checkbox" onchange="fnOrganizationCheck(this)"/>
					소프트코어
					<ul class="fa-ul">
						<li>
							<input type="checkbox" class="organization-checkbox"/>
							영업1팀
						</li>
						<li>
							<input type="checkbox" class="organization-checkbox"/>
							영업2팀
						</li>
					</ul>
				</li>
			</ul> -->
		</div>
	</div>
	<input type="button" onclick="fnSearchCalendar()" value="검색">
</div>
<div id='calendar'></div>
				
<script>
	$('#soppModal').on('show.bs.modal', function(e) {
		var button = $(e.relatedTarget);
		var modal = $(this);
		modal.find('.modal-body').load(button.data("remote"));
	});
	$('#contModal').on('show.bs.modal', function(e) {
		var button = $(e.relatedTarget);
		var modal = $(this);
		modal.find('.modal-body').load(button.data("remote"));
	});
	function fnSetSoppData(a, b, c, d) {
		$("#soppNo").val(b);
		$("#soppTitle").val(a);
		$("#userNo").val(c);
		$("#custNo").val(d);
		$("#soppModal").modal("hide");
	}
	function fnSetContData(a, b) {
		$("#contNo").val(b);
		$("#contTitle").val(a);
		$("#contModal").modal("hide");
	}

	function fnSetDetail(value, info) {
		var path;
		
		if(value == '770010') {
			path = '${path}/sales/write.do';
		}else if(value == '770100'){
			path = '${path}/techd/write.do';
		}else if(value == '770800'){
			path = '${path}/sched/write.do';
		}else if(value == 'modify'){
			var schedType = info.event.extendedProps.schedType;
			if(schedType == '영업일정') {
				path = '${path}/sales/detail/'+info.event.id;	
			}else if(schedType == '기술지원'){
				path = '${path}/techd/detail/'+info.event.id;
			}else if(schedType == '기타일정'){
				path = '${path}/sched/detail/'+info.event.id;
			}
		}
		
		if(path) {
			$('#detail-content').load(path, function() {
				$('.modal-list-btn').hide();
				$('.modal-cancel-btn').hide();
			});			
		}
	}
	
	function setCalendar(event, organizationList) {
		var organizationList = organizationList;
		if(event != 'search') {
			organizationList = ["${sessionScope.orgId}"];
		}
		
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
		  	header : {
	 			left:   '',
	  			center: 'title',
	  			right:  'prevYear prev today next nextYear'
	      	},
	       	plugins: [ 'dayGrid','interaction','timeGrid','list' ],
	       	locale                    : 'ko',    
	       	timezone                  : "local", 
	       	firstDay                  : 0, 
	       	weekNumbers               : false,
	       	selectable                : true,
	       	weekNumberCalculation     : "ISO",
	       	nextDayThreshold          : "09:00:00",
	       	allDaySlot                : true,
	       	displayEventTime          : false,
	       	displayEventEnd           : true,
	       	eventLimit                : true,
	       	views                     : { 
	       	                                month : { eventLimit : 3 }
	       	                            },
	      	dateClick:function (info) {
	      		$('#detail-content').empty();
	      		$('.eventModalRadioGroup').show();
	      		$('#eventModal').modal('show');
	    	},
	    	
	     	eventSources: [{
	          url: '${path}/calendar/listEvent.do',
	          //color: 'yellow',    // an option!
	          textColor: 'black',  // an option!
	          method: 'POST',
	          extraParams: {
	        	  organizationList : organizationList
	          }
	        }],   
	     	                            
	        eventClick: function(info) {
	        	$('#detail-content').empty();
				$('.eventModalRadioGroup').hide();
				$('#eventModal').modal('show');
				fnSetDetail('modify', info);
	        },
	        eventRender : function(info) {
	        	info.el.style.backgroundColor = info.event.extendedProps.color;
	        	info.el.style.borderColor = info.event.extendedProps.color;
	        }
        });
        calendar.render();
	}
	
	function fnSearchCalendar() {
		var organizationCheckbox = $('.organization-checkbox');
		var organizationList = [];
		
		for(var i = 0; i < organizationCheckbox.length; i++) {
			if(organizationCheckbox[i].checked) {
				organizationList.push(organizationCheckbox[i].value);
			}
		}
		if(organizationList.length == 0) {
			organizationList.push('empty');
		}
		
		$('#calendar').empty();
		setCalendar('search', organizationList);
	}
	
	
	$(document).ready(function() {
		setCalendar();
		setOrganizationList();
	    $('#organizationChartOpen').on('click', function() {
			if ($('#organizationChartView').is(":visible")) {
			    $('#organizationChartView').hide();
			} else {
			    $('#organizationChartView').show();
			}
	    });
	});
	
	function fnOrganizationCheck(companyCheckbox) {
		var organizations = $('.organization-checkbox');
		$('.organization-checkbox').each(function(index, item){
			item.checked = companyCheckbox.checked;
		});
	}
	
	function setOrganizationList() {
		$.ajax({
			url : "${path}/calendar/organization.do",
			method : "POST",
		}).done(function(data){
			var organizationList = data.organizationList;
			var companyList = data.companyList;
			var userCompanyNo = "${sessionScope.compNo}";
			var companyName;
			
			for(var i = 0; i < companyList.length; i++) {
				if(companyList[i].compNo == userCompanyNo) {
					companyName = companyList[i].compName;
					break;
				}
			}
			
			$('#organizationChartView')
			.append(
				'<ul class="fa-ul">' + 
					'<li>' +
						'<i class="fa-li fa fa-caret-down" id="caret1" onclick="fnCaretClick(this)"></i>' +
						'<label><input type="checkbox" onchange="fnOrganizationCheck(this)"/>' + companyName + '</label>' +
						'<ul class="fa-ul organizationList-ul">' +
						'</ul>' +
					'</li>' +
				'</ul>'
			);
			
			for(var i = 0; i < organizationList.length; i++) {
				$('.organizationList-ul')
				.append(
					'<li>' + 
						'<label><input type="checkbox" class="organization-checkbox" value=' + organizationList[i].org_id + '>' + organizationList[i].org_title +'</label>' +
					'</li>'
				);
			}
			
		});
	}
	
	
	
</script>
    