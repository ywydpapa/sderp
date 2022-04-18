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

<style>
	#vatTable thead tr th{
		text-align: center;
	}
</style>

<body>
	<div>
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
							<th>일자</th>
							<th>거래처</th>
							<th>계산서번호</th>
							<th>세액</th>
							<th>공급가액</th>
							<th>합계</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="row" items="${custVatList}">
							<c:set var="dateMonth" value="${fn:substring(row.vatIssueDate, 5, 7)}" />
							<c:if test="${(dateValue eq dateMonth)}">
								<tr>
									<td style="text-align:center;">${row.vatIssueDate}</td>
									<td style="text-align:center;">${row.custName}</td>
									<td style="text-align:center;">${row.vatSerial}</td>			
									<td style="text-align:right;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.vatTax}" /></td>	
									<td style="text-align:right;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.vatAmount}" /></td>	
									<td style="text-align:right;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.vatTotal}" /></td>			
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</c:forEach>
		</div>
	</div>
</body>
<script>
	$(document).ready(function(){
		$("[id^='vatTable_']").each(function(index, item){
			console.log($(item).find("tbody tr").length);
			if($(item).find("tbody tr").length == 0){
				$(item).find("tbody").html("<tr><th colspan='6' style='text-align:center;'>조회된 데이터가 없습니다.</th></tr>");
			}
		});
	});
</script>
</html>