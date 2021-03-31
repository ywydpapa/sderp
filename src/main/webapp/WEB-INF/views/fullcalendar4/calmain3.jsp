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
	      	dateClick:function (dateInfo) {
	      		newEvent(dateInfo);
	    	},
	    	
	     	eventSources: [{
	          url: '${path}/calendar/listEvent.do',
	          color: 'yellow',    // an option!
	          textColor: 'black'  // an option!
	        }],   
	     	                            
	        eventClick: function(info) {
	       /*     alert('Event: ' + info.event.title);
	           alert('Start: ' + info.event.start);
	           alert('End: ' + info.event.end); */
	           info.el.style.borderColor = 'red';
	           $('#eventModal2').modal();
	           fnSetDetail('detail', info);
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
				<!-- <div class="modal-footer modalBtnContainer-addEvent">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="save-event">저장</button>
				</div>

				<div class="modal-footer modalBtnContainer-modifyEvent">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
					<button type="button" class="btn btn-primary" id="updateEvent">저장</button>
				</div> -->
			<!-- /.modal-content -->
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

	var eventModal = $('#eventModal');
	var schedAllday = $('#schedAllday');
	var schedPlace = $('#schedPlace');
	var schedTitle = $('#schedTitle');
	var schedFrom = $('#schedFrom');
	var schedTo = $('#schedTo');
	var schedCat = $('#schedCat');
	var schedColor = $('#schedColor');
	var schedDesc = $('#schedDesc');
	var soppNo = $('#soppNo');
	var addBtnContainer = $('.modalBtnContainer-addEvent');
	var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');

	/* ****************
	 *  새로운 일정 생성
	 * ************** */
	var newEvent = function(dateInfo) {
		//modalTitle.html('새로운 일정등록');
		schedTitle.val('');
		/* schedFrom.val(start);
		schedTo.val(end); */
		schedDesc.val('');
		addBtnContainer.show();
		modifyBtnContainer.hide();
		eventModal.modal('show');

		//새로운 일정 저장버튼 클릭
		$('#save-event').unbind();
		$('#save-event').on('click', function() {
					var schedData = {};
					schedData.schedPlace = $("#schedPlace").val();
					schedData.soppNo = $("#soppNo").val();
					schedData.contNo = $("#contNo").val();
					schedData.schedDesc = $("#schedDesc").val();
					schedData.schedType = $("#schedType").val();
					schedData.userNo = $("#userNo").val();
					schedData.schedFrom = $("#schedFrom").val();
					schedData.schedTo = $("#schedTo").val();
					schedData.schedTitle = $("#schedTitle").val();
					schedData.schedColor = $("#schedColor").val();
					schedData.custNo = $("#custNo").val();
					schedData.schedCat = $("#schedCat").val();
					console.log(schedData);
					
					schedData.contNo = 0;
					schedData.custNo = 10001;
					schedData.soppNo = 10000021;
					schedData.userNo = 10027;

					if (schedData.schedFrom > schedData.schedTo) {
						alert('끝나는 날짜가 앞설 수 없습니다.');
						return false;
					}

					if (schedData.schedTitle === '') {
						alert('일정명은 필수입니다.');
						return false;
					}

					var realEndDay;

					if (schedAllday.is(':checked')) {
						schedData.schedFrom = moment(schedData.schedFrom)
								.format('YYYY-MM-DD HH:mm');
						//render시 날짜표기수정
						schedData.schedTo = moment(schedData.schedTo).add(1,
								'days').format('YYYY-MM-DD HH:mm');
						//DB에 넣을때(선택)
						realEndDay = moment(schedData.schedTo).format(
								'YYYY-MM-DD HH:mm');
						schedData.schedAllday = true;
					}

					$.ajax({
						url : "${path}/sched/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
						data : schedData, // HTTP 요청과 함께 서버로 보낼 데이터 
						method : "POST", // HTTP 요청 메소드(GET, POST 등) 
						async : false,
						dataType : "json" // 서버에서 보내줄 데이터의 타입 
					}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
					.done(function(data) {
						if (data.code == 10001) {
							alert("저장 성공");
							location.reload(true);
							location.href = location.href;
							history.go(0);
						} else {
							alert("저장 실패");
						}
					}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
					.fail(function(xhr, status, errorThrown) {
						alert("통신 실패");
					});
					eventModal.find('input, textarea').val('');
					schedAllday.prop('checked', false);
					eventModal.modal('hide');
					//새로운 일정 저장
				});
	};
	
	function fnSetDetail(value, info) {
		var path;
		var detailContent = $('#detail-content'); 
		
		if(value == '770010') {
			path = '${path}/sales/write.do';
		}else if(value == '770100'){
			path = '${path}/techd/write.do';
		}else if(value == 'detail'){
			path = '${path}/sched/detail/'+info.event.id;
			detailContent = $('#detail-content2');
		}
		
		if(path) {
			detailContent.load(path);			
		}
	}
	
</script>
    