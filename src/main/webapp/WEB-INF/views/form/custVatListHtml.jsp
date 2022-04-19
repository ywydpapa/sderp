<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="${path}/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${path}/assets/css/bootstrap/css/bootstrap.min.css">

<body>
	<div>
		<div style="text-align:center;">
			<h3>거래처 원장</h3>
		</div>
		<div id="tableDiv" style="padding: 20px;">
			<c:set var="dateArray" value="${fn:split('01,02,03,04,05,06,07,08,09,10,11,12', ',')}" />
			<c:forEach var="dateValue" items="${dateArray}">
				<c:choose>
					<c:when test="${dateValue < 10 }">
						<div style="border:1px solid #ccc;">${fn:substring(dateValue, 1, 2)}월</div>
					</c:when>
					<c:otherwise>
						<div style="border:1px solid #ccc;">${dateValue}월</div>
					</c:otherwise>
				</c:choose>
				<table id="vatTable_${dateValue}" class="table table-striped table-bordered nowrap">
					<thead>
						<tr>
							<th style="text-align:center;">일자</th>
							<th style="text-align:center;">적요</th>
							<th style="text-align:center;">세액</th>
							<th style="text-align:center;">공급가액</th>
							<th style="text-align:center;">합계</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="row" items="${custVatList}">
							<c:set var="dateMonth" value="${fn:substring(row.vatIssueDate, 5, 7)}" />
							<c:if test="${(dateValue eq dateMonth)}">
								<tr id="divisionTr">
									<td style="text-align:center;">${row.vatIssueDate}</td>
									<td style="text-align:center;">${row.vatProductName}</td>			
									<td style="text-align:right;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.vatTax}" /></td>	
									<td style="text-align:right;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.vatAmount}" /></td>	
									<td style="text-align:right;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.vatTotal}" /></td>			
								</tr>
								<c:set var="calTotal" value="${calTotal + row.vatTotal}" />
							</c:if>
						</c:forEach>
						<tr>
							<th colspan="4" style="text-align:center;">월 계</th>
							<th style="text-align:right;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${calTotal}" /></th>
						</tr>
					</tbody>
				</table>
			</c:forEach>
		</div>
	</div>
</body>
<script>
	$(document).ready(function(){
		$("[id^='vatTable_']").each(function(index, item){
			if($(item).find("tbody #divisionTr").length == 0){
				$(item).prev().remove();
				$(item).remove();
			}
		});
	});
</script>
</html>