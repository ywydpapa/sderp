<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<div class="dt-responsive table-responsive">
	<table id="soppDataTable" class="table table-striped table-bordered nowrap">
		<thead>
			<tr>
				<th>영업기회번호</th>
				<th>영업기회명</th>
				<th>거래처명</th>
				<th>담당자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="row" items="${list}">
				<tr align="center">
					<td>${row.soppNo}</td>
					<td><a href="javascript:fnSetSoppData('${row.soppTitle}','${row.soppNo}','${row.userNo}','${row.custNo}');" onmouseover="javascript:mouse_over('${row.soppNo}');" onmouseout="mouse_out()" title="${row.soppTitle}">${row.soppTitle}</a></td>
					<td title="${row.custName}">${row.custName}</td>
					<td>${row.userName}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<table>
		<colgroup>
			<col width="25%" />
			<col width="45%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr>
				<th class="text-center">영업기회명</th>
				<th class="text-center">예상매출</th>
				<th class="text-center">매출예정일</th>
			</tr>
		</thead>
	<tbody id="ItemFilelist">
		
	</tbody>
	</table>
	
	<table>
		<colgroup>
			<col width="25%" />
			<col width="45%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr>
				<th class="text-center">매입항목</th>
				<th class="text-center">매입금액</th>
				<th class="text-center">매입처</th>
			</tr>
		</thead>
	<tbody id="ItemFilelist2">
		
	</tbody>
	</table>
	
</div>
<style>
	#soppTable > tbody > tr > td:nth-child(1){
		max-width: 75px;
	}
	#soppTable > tbody > tr > td:nth-child(2){
		text-overflow: ellipsis;
		max-width: 250px;
		overflow: hidden;
	}
	#soppTable > tbody > tr > td:nth-child(3){
		text-overflow: ellipsis;
		max-width: 150px;
		overflow: hidden;
	}
	#soppTable > tbody > tr > td:nth-child(4){
		text-overflow: ellipsis;
		max-width: 70px;
		overflow: hidden;
	}
</style>
<script>
$(function(){
    $('#soppDataTable').DataTable({
    	info:false,
		searching: true
    });
});

function mouse_over(soppNo){
	
	$.ajax({ url: "${path}/sopp/hovermodaldetail/" + soppNo, // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
		method: "GET", // HTTP 요청 메소드(GET, POST 등) 
		dataType: "json" // 서버에서 보내줄 데이터의 타입 
	}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
	.done(function(result){
	if(result.data.soppTargetDate != null){
		var html = html + '<tr class="item1">' +
									'<td>'+result.data.soppTitle+'</td>' +
									'<td>'+result.data.soppTargetAmt+'</td>' +
									'<td>'+result.data.soppTargetDate+'</td>' +
								  '</tr>';
	}
	if(result.data.soppTargetDate == null){
		var html = html + '<tr class="item1">' +
									'<td>'+result.data.soppTitle+'</td>' +
									'<td>'+result.data.soppTargetAmt+'</td>' +
									'<td>'+'미정'+'</td>' +
								  '</tr>';
	}
	if(result.data2.length > 0 ){
		for(var i=0; i<result.data2.length; i++){
			var html2 = html2 + '<tr class="item2">' +
						'<td>'+result.data2[i].dataTitle+'</td>' +
						'<td>'+result.data2[i].dataTotal+'</td>' +
						'<td>'+result.data2[i].salesCustNoN+'</td>' +
			 		 '</tr>';
		}
	}
	$("#ItemFilelist").html(html);
	$("#ItemFilelist2").html(html2);
	})
}

function mouse_out(){
	$("#ItemFilelist").empty();
	$("#ItemFilelist2").empty();
}

</script>