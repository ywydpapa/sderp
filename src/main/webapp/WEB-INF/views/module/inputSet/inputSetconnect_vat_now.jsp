<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!-- listusercontribution -->
<form name="form2" method="post" onsubmit="return false;">
	<div>
		<div>
			<span style="font-weight: 600;">계산서 연결현황</span>
			<input type="hidden" id="sessionCustNo" value="${sessionCust.custNo}" />
			<input type="hidden" id="listusercontributionCnt" value="${listusercontributionCnt}" />
			
			<table class="table table-sm bst02" id="billProTable">
				<thead>
					<tr>
						<th class="text-center">일자</th>
						<th class="text-center">발행번호</th>
						<th class="text-center">품목</th>
						<th class="text-center">합계 금액</th>
						<th class="text-center">상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${data}">
						<tr>
							<td class="text-center">${row.vatIssuDate}</td>
			    			<td class="text-center">${row.vatSerial}</td>
			    			<td class="text-center">${row.vatStandard}</td>
			    			<td class="text-right">${row.vatTax + row.Amount}</td>
			    			<c:if test="${row.vatStatus == S1}">
			    				<td class="text-right">수금 진행중</td>
			    			</c:if>
							<c:if test="${row.vatStatus == S3}">
			    				<td class="text-right">부분 수금</td>
			    			</c:if>
			    			<c:if test="${row.vatStatus == S5}">
			    				<td class="text-right">수금 완료</td>
			    			</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>
	</div>
</form>
