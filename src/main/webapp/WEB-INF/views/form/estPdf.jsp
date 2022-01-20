<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="${path}/js/jquery.min.js"></script>
<script src="${path}/js/html2pdf.bundle.min.js"></script>
<style>
body{
	-webkit-font-smoothing: antialiased;
  	-moz-osx-font-smoothing: auto;
  	font-weight:600;
}
#imgLogo #logoLeft{
	width:28%;
	height:auto;
}

#imgLogo #logoRight{
	width:70%;
	height:auto;
	position:absolute; 
	top:4px;
	right: 0;
}

#pdfTitle #titlePdf{
	font-size: 48px; 
	text-align:center;
	margin-bottom: 20px;
}

#pdfRemarks{
	font-size: 10px;
}

#pdfBottom img{
	width:30%;
	float:right;
}

table{
	width:100%; 
	margin:0 auto; 
	text-align:center; 
	border: 1px solid #000; 
	font-size: 10px; 
	margin-bottom: 20px;
}

table thead tr th{
	color: #fff;
	background-color: #B52223;
}

table tbody tr td{
	border:1px solid #000;
}

</style>
<body>
	<div class="mainPdf" id="mainPdf">
		<div id="imgLogo">
			<img src="${path}/images/pdf_logo_left.jpg" id="logoLeft" />
			<img src="${path}/images/pdf_logo_right.png" id="logoRight" />
		</div>
		<div id="pdfTitle">
			<div id="titlePdf">QUOTATION</div>
		</div>
		<table>
			<tr>
				<th>견 	적 	일 	자: ${detail.estDate}</th>
				<th>상		호: 주식회사 비전테크</th>
			</tr>
			<tr>
				<th>견	적 	번 	호: ${detail.estId}</th>
				<th>대	표 	이 	사: 이 승 우 (직인생략)</th>
			</tr>
			<tr>
				<th>사	업  	명: ${detail.estTitle}</th>
				<th>주		소: 부산시 해운대구 센텀중앙로 97 센텀스카이비즈 A동 2509호</th>
			</tr>
			<tr>
				<th>수		신: 부산교육청/안강렬 주무관님</th>
				<th>전		화: 051-892-3723</th>
			</tr>
			<tr>
				<th>영	업	담	당: ${detail.userName}</th>
				<th>팩		스: 051-955-3723</th>
			</tr>
		</table>
		<table>
			<tr>
				<th>견	적	금	액: ￦<fmt:formatNumber value="${detail.estTotal}" pattern="#,###" /></th>
				<th>유	효	기	간: 견적일로 부터 2주</th>
			</tr>
		</table>
		<table>
			<thead>
				<tr>
					<th>No.</th>
					<th>구분</th>
					<th>품명/규격</th>
					<th>수량</th>
					<th>소비자가</th>
					<th>공급 단가</th>
					<th>합계</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${param.title == 1}">
						<c:forEach var="titleList" items="${titleList}">
							<c:set var="titleNum" value="${titleNum+1}" />
							<c:set var="dataTotal" value="${dataTotal + titleList.titleTotal}" />
							<tr style="background-color:yellow;">
								<th style="border: 1px solid #000;">${titleNum}</th>
								<th style="border: 1px solid #000;"></th>
								<th style="border: 1px solid #000;">${titleList.itemTitle}</th>
								<th style="border: 1px solid #000;"></th>
								<th style="border: 1px solid #000;"></th>
								<th style="border: 1px solid #000;"></th>
								<th style="border: 1px solid #000;">￦<fmt:formatNumber value="${titleList.titleTotal}" pattern="#,###" /></th>
								<th style="border: 1px solid #000;"></th>
							</tr>
							<c:forEach var="row" items="${list}" varStatus="status">
								<c:if test="${titleList.itemTitle == row.itemTitle}">
									<tr>
										<td>${status.index+1}</td>
										<td>${row.itemKinds}</td>
										<td>${row.productName}</td>
										<td>${row.productQty}</td>
										<td></td>
										<td>￦<fmt:formatNumber value="${row.productNetprice}" pattern="#,###" /></td>
										<td>￦<fmt:formatNumber value="${row.productTotal}" pattern="#,###" /></td>
										<td>${row.productRemark}</td>
									</tr>
								</c:if>
							</c:forEach>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach var="row" items="${list}" varStatus="status">
							<c:set var="dataTotal" value="${dataTotal + row.productTotal}" />
							<tr>
								<td>${status.index+1}</td>
								<td>${row.itemKinds}</td>
								<td>${row.productName}</td>
								<td>${row.productQty}</td>
								<td></td>
								<td>￦<fmt:formatNumber value="${row.productNetprice}" pattern="#,###" /></td>
								<td>￦<fmt:formatNumber value="${row.productTotal}" pattern="#,###" /></td>
								<td>${row.productRemark}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<tr>
					<th colspan="6" style="border:1px solid #000">공급가합계</th>
					<th colspan="2" style="border:1px solid #000">￦<fmt:formatNumber value="${dataTotal}" pattern="#,###" /></th>
				</tr>
			</tbody>
		</table>
		<div id="pdfRemarks">
			<h3>Remarks</h3>
			<h4>결제조건은 검수(납품) 당월 계산서 발행, 익월 결제 입니다.</h4>
			<h4>납기기간은 발주 후 최대 4주 입니다.</h4>
			<h4>설치비용 포함 견적이며 고객사 응용프로그램 사용에 따른 커스터마이징 비용은 미 포함이며 협의 후 포함합니다.</h4>
		</div>
		<div id="pdfBottom">
			<img src="${path}/images/pdf_bottom.png" id="bottomImg" />
		</div>
	</div>
</body>
<script>
function solPdf(){
	var estId = "${detail.estId}";
	var now = new Date();
	var year = now.getFullYear();
	var month = parseInt(now.getMonth())+1;
	
	if(month < 10){
		month = "0" + month;
	}else{
		month = month;
	}
	
	if(now.getDate() < 10){
		var date = "0" + now.getDate();
	}else{
		var date = now.getDate();
	}
	
	var nowDate = year + "-" + month + "-" + date;
	var element = document.getElementById("mainPdf");
	
	html2pdf().from(element).set({
	  margin: 5,
      filename: estId + '(' + nowDate + ')' + '.pdf',
      html2canvas: { scale: 10 },
      jsPDF: {orientation: 'portrait', unit: 'mm', format: 'a4', compressPDF: true}
	}).save();
}

$(document).ready(function(){
	solPdf();
});
</script>
</html>