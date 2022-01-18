<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>견적서 출력</title>
</head>
<body>
	<div class="mainPdf">
		<div id="imgLogo">
			<img src="${path}/images/pdf_logo_left.jpg" style="width:28.5%; height:90px;" />
			<img src="${path}/images/pdf_logo_right.png" style="position:absolute; right:0; top:19px; width:68.5%; height:60px;" />
		</div>
		<div id="pdfTitle">
			<div style="font-size: 100px; font-weight:600; text-align:center;">QUOTATION</div>
		</div>
		<table style="width:100%; margin:0 auto; text-align:center; border-top: 1px solid #000; border-bottom: 1px solid #000; font-size: 22px; margin-bottom: 20px;">
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
		<table style="width:100%; margin:0 auto; text-align:center; border-top: 1px solid #000; border-bottom: 1px solid #000; font-size: 22px; margin-bottom: 20px;">
			<tr>
				<th>견	적	금	액: ￦<fmt:formatNumber value="${detail.estTotal}" pattern="#,###" /></th>
				<th>유	효	기	간: 견적일로 부터 2주</th>
			</tr>
		</table>
		<table style="width:100%; margin:0 auto; text-align:center; border-top: 1px solid #000; border-bottom: 1px solid #000; font-size: 22px;">
			<thead>
				<th>No.</th>
				<th>구분</th>
				<th>품명/규격</th>
				<th>수량</th>
				<th>소비자가</th>
				<th>공급 단가</th>
				<th>합계</th>
				<th>비고</th>
			</thead>
			<tbody>
				<c:forEach var="row" items="${list}">
					<c:set var="smallIndex" value="${smallIndex + 1}" />
					<tr>
						<td>${smallIndex}</td>
						<td>견적</td>
						<td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>