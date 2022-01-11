<%--
  Created by IntelliJ IDEA.
  User: djkim
  Date: 2021-12-29
  Time: 오전 11:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<table class="table table-sm bst02" id="qutylist">
    <colgroup>
        <col width="10%" />
        <col width="17.5%" />
        <col width="17.5%" />
        <col width="10%" />
        <col width="10%" />
        <col width="5%" />
        <col width="15%" />
        <col width="5%" />
        <col width="5%" />
    </colgroup>
    <thead>
    <tr>
        <th class="text-center">구분</th>
        <th class="text-center">거래처</th>
        <th class="text-center">항목</th>
        <th class="text-center">단가</th>
        <th class="text-center">수량</th>
        <th class="text-center">공급가액</th>
        <th class="text-center">부가세액</th>
        <th class="text-center">금액</th>
        <th class="text-center">적용율</th>
        <th class="text-center">비고</th>
        <th class="text-center">삭제</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="row" items="${list}">
    	<tr>
    		<td style='text-align:center;'>견적</td>
    		<td id='salesCustNoN' style='text-align:center;'>${row.custName}</td>
    		<td id='dataTitle' style='text-align:center;'>${row.productName}</td>
    		<td id='dataNetprice' style='text-align: right'>₩<fmt:formatNumber value="${row.productNetprice}" pattern="#,###" /></td>
    		<td id='dataQuanty' style='text-align: right'>${row.productQty}</td>
    		<td id='dataAmt' style='text-align: right'>₩<fmt:formatNumber value="${row.productAmount}" pattern="#,###" /></td>
    		<td id='dataVat' style='text-align: right'>₩<fmt:formatNumber value="${row.productVat}" pattern="#,###" /></td>
    		<td id='dataTotal' style='text-align: right'>₩<fmt:formatNumber value="${row.productTotal}" pattern="#,###" /></td>
    		<td id='dataDiscount' style='text-align: right'>${row.productDis}%</td>
    		<td id='dataRemark'>${row.productRemark}</td>
    		<td><button class='btn btn-sm btn-danger'>삭제</button></td>
    	</tr>
    </c:forEach>
    </tbody>
</table>
<br/>
<table class="table table-sm">
    <tr class="item2">
        <td colspan="1" style="text-align: center; background: #80808030;">합계</td>
        <td colspan="11" style="text-align: right; background: #80808030;" id="product02InSum_table">0</td>
    </tr>
    </tbody>
</table>
