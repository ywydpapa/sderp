<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<table class="table table-sm bst02" id="qutylist">
	<colgroup>
		<col width="5%" />
		<col width="10%" />
		<col width="15%" />
		<col width="10%" />
		<col width="5%" />
		<col width="10%" />
		<col width="10%" />
	</colgroup>
	<thead>
		<tr>
			<th class="text-center">견적일자</th>
			<th class="text-center">견적명</th>
			<th class="text-center">거래처</th>
			<th class="text-center">공급가합계</th>
			<th class="text-center">부가세합계</th>
			<th class="text-center">금액</th>
			<th class="text-center">적요</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="row" items="${estList}">
		<tr>
			<td style="text-align: center;">${row.estDate}</td>
			<td style="text-align: center;">${row.estTitle}</td>
			<td style="text-align: center;">${row.custName}</td>
			<td style="text-align: right;">₩<fmt:formatNumber value="${row.estAmount}" pattern="#,###" /></td>
			<td style="text-align: right;">₩<fmt:formatNumber value="${row.estVat}" pattern="#,###" /></td>
			<td style="text-align: right;">₩<fmt:formatNumber value="${row.estTotal}" pattern="#,###" /></td>
			<td>${row.estDesc}</td>
		</tr>
	</c:forEach>
	<c:forEach var="row" items="${dtodata01}">
		<c:if test="${row.dataType eq '1102'}">
			<tr class="item1" id="${row.soppdataNo}">
				<td data-type="${row.dataType}">
					매출
					(
					<fmt:parseDate value="${row.regDatetime}" var="regDatetime" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate value="${regDatetime}" pattern="yyyy-MM-dd"/>
					)
				</td>
				<td>${row.salesCustNoN}<input hidden value="${row.salesCustNo}"></td>
				<td>${row.dataTitle}<input hidden value="${row.productNo}"></td>
				<td style="text-align: right">₩<fmt:formatNumber value="${row.dataNetprice}" pattern="#,###" /></td>
				<td style="text-align: right"><fmt:formatNumber value="${row.dataQuanty}" pattern="#,###" /></td>
				<td style="text-align: right">₩<fmt:formatNumber value="${row.dataVat}" pattern="#,###" /></td>
				<td style="text-align: right">₩<fmt:formatNumber value="${row.dataAmt}" pattern="#,###" /></td>
				<td style="text-align: right">₩<fmt:formatNumber value="${row.dataTotal}" pattern="#,###" /></td>
				<td>${row.dataRemark}</td>
				<td><button class="btn btn-sm btn-dark" onClick="javascript:fn_data01modify(this)">수정</button></td>
				<td><button class="btn btn-sm btn-danger" onClick="javascript:fn_data01delete(${row.soppdataNo})">삭제</button></td>
			</tr>
		</c:if>
	</c:forEach>
	</tbody>
</table>

<script>
	$(document).ready(function(){
		for (var i = 0; i < product02In.length; i++) {
			product02InSum += (product02In[i] * product02InQuanty[i]);
		}
		for (var i = 0; i < product02Out.length; i++) {
			product02OutSum += (product02Out[i] * product02OutQuanty[i]);
		}
		product02DiffSum = product02OutSum - product02InSum;
		$("#product02InSum").html('₩'+product02InSum.toLocaleString("en-US"));
		$("#product02InSum_table").html('₩'+product02InSum.toLocaleString("en-US"));
		$("#product02OutSum").html('₩'+product02OutSum.toLocaleString("en-US"));
		$("#product02OutSum_table").html('₩'+product02OutSum.toLocaleString("en-US"));
		$("#product02DiffSum").html('₩'+product02DiffSum.toLocaleString("en-US"));

		product02Percent = Math.floor(product02DiffSum / product02OutSum * 100).toFixed(2);
		if(product02Percent == 'NaN'){
			$("#product02Percent").html('0'+'%');
		} else if (product02Percent == '-Infinity'){
			$("#product02Percent").html('0'+'%');
		} else if (product02Percent == 'Infinity'){
			$("#product02Percent").html('0'+'%');
		} else if(product02Percent >= 0){
			$("#product02Percent").html('+'+product02Percent+'%');
		} else if(product02Percent < 0){
			$("#product02Percent").html(product02Percent+'%');
		}
	});
</script>