<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<div class="dt-responsive table-responsive">
    <table id="custVatList_DataTable" class="table table-striped table-bordered nowrap">
        <colgroup>
            <col width="10%"/>
            <col width="5%"/>
            <col width="17%"/>
            <col width="7%"/>
            <col width="10%"/>
            <col width="10%"/>
            <col width="10%"/>
            <col width="10%"/>
            <col width="20%"/>
        </colgroup>
        <thead>
        <tr>
            <th class="text-center">등록일</th>
            <th class="text-center">매입/매출</th>
            <th class="text-center">거래처</th>
            <th class="text-center">품명</th>
            <th class="text-center">상태</th>
            <th class="text-center">공급가</th>
            <th class="text-center">세액</th>
            <th class="text-center">합계금액</th>
            <th class="text-center">입/출금 일시</th>
            <th class="text-center">남은 금액(계산서)</th>
        </tr>
        </thead>
        <c:forEach items="${list}" var="list">
            <tr>
            	<td class="text-center">${list.vatIssueDate}</td>
                <td class="text-center vatTyp">
                	<c:if test = "${list.vatType eq 'S'}">매출</c:if> 
                	<c:if test = "${list.vatType eq 'B'}">매입</c:if>
                </td>
                <td class="text-center">
                	<c:if test = "${list.vatType eq 'S'}">${list.vatBuyerName}</c:if> 
                	<c:if test = "${list.vatType eq 'B'}">${list.vatSellerName}</c:if>
               	</td>
                <td class="text-center">${list.vatProductName}</td>
                <td class="text-center">
                	<c:if test = "${list.vatStatus eq 'B1'}">매입발행</c:if>
                	<c:if test = "${list.vatStatus eq 'B3'}">지급처리중</c:if>
                	<c:if test = "${list.vatStatus eq 'B5'}">지급완료</c:if>
                    <c:if test = "${list.vatStatus eq 'S1'}">매출발행</c:if>
                    <c:if test = "${list.vatStatus eq 'S3'}">수금처리중</c:if>
                    <c:if test = "${list.vatStatus eq 'S5'}">수금완료</c:if>
                </td>
                <td class="text-right">
                	<fmt:formatNumber type="number" maxFractionDigits="3" value="${list.vatAmount}" />
                </td>
                <td class="text-right">
                	<fmt:formatNumber type="number" maxFractionDigits="3" value="${list.vatTax}" />
                </td>
                <td class="text-right">
                	<fmt:formatNumber type="number" maxFractionDigits="3" value="${list.vatAmount + list.vatTax}" />
                </td>
                <td class="text-center">${list.baclogTime}</td>
                <td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.remain_data}" /></td>
            </tr>
        </c:forEach>
    </table>
</div>

<script>
    $(function(){
        $('#custVatList_DataTable').DataTable({
            info:false,
            searching: true
        });
    });
</script>
