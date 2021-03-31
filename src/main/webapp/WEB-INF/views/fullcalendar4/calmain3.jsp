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
    <script src='${path}/fullcalendar4/core/main.js'></script>
    <script src='${path}/fullcalendar4/daygrid/main.js'></script>
    <script src='${path}/fullcalendar4/interaction/main.js'></script>
    <script src='${path}/fullcalendar4/list/main.js'></script>
    <script src='${path}/fullcalendar4/timegrid/main.js'></script>
    <%-- <script src='${path}/fullcalendar4/moment/main.js'></script> --%>

    <script>
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
	      		$('#eventModal').modal('show');
	    	},
	    	
	     	eventSources: [{
	          url: '${path}/calendar/listEvent.do',
	          color: 'yellow',    // an option!
	          textColor: 'black'  // an option!
	        }],   
	     	                            
	        eventClick: function(info) {
	           info.el.style.borderColor = 'red';
	           $('#eventModal2').modal('show');
	           fnSetDetail('modify', info);
	        },
        });
        calendar.render();
  
    </script>
    
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
				<div>
					<label><input type="radio" name="schedCat" value="770010" onclick="fnSetDetail(this.value)"/>영업일정</label>
					<label><input type="radio" name="schedCat" value="770100" onclick="fnSetDetail(this.value)"/>기술지원</label>
					<label><input type="radio" name="schedCat" value="770800" onclick="fnSetDetail(this.value)"/>기타일정</label>
				</div>
				
				<div id="detail-content">
					
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" tabindex="-1" role="dialog" id="eventModal2" data-backdrop="static">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">일정수정</h4>
			</div>
			<div class="modal-body">		
				<div id="detail-content2">
					
				</div>
			</div>
		</div>
	</div>
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
		var detailContent = $('#detail-content'); 
		
		if(value == '770010') {
			path = '${path}/sales/write.do';
		}else if(value == '770100'){
			path = '${path}/techd/write.do';
		}else if(value == 'modify'){
			var schedType = info.event.extendedProps.schedType;
			if(schedType == '영업일정') {
				path = '${path}/sales/detail/'+info.event.id;	
			}else if(schedType == '기술지원'){
				path = '${path}/techd/detail/'+info.event.id;
			}else if(schedType == '기타일정'){
				path = '${path}/sched/detail/'+info.event.id;
			}
			detailContent = $('#detail-content2');
		}
		
		if(path) {
			detailContent.load(path);			
		}
	}
	
</script>
    