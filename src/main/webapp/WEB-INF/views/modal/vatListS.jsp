﻿<%--
  Created by IntelliJ IDEA.
  User: djkim
  Date: 2022-02-04
  Time: 오후 12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<div class="dt-responsive table-responsive">
    <table id="vatlistTable" class="table table-striped table-bordered nowrap">
        <thead>
        <tr>
            <th>승인번호</th>
            <th>업체명</th>
            <th>공급가액</th>
            <th>비고</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="row" items="${list}">
            <tr align="center">
                <td><a href="javascript:fnvatListS('${row.vatSerial}', '${row.vatSellerCustNo}', '${row.vatAmount}');">${row.vatSerial}</a></td>
                <td>${row.vatSellerCustNo}</td>
                <td>${row.vatAmount}</td>
                <td>${row.vatRemark}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script>
    $(function(){
        $('#vatlistTable').DataTable({
            info:false,
            searching: true
        });
    });
    
    function fnvatListS(a, b, c) {
        $("#vatSdiv").find("#vatSerial").val(a);
        $("#vatSdiv").find("#vatSellerCustNo").val(b);
        $("#vatSdiv").find("#vatAmount").val(c);      
        $(".modal-backdrop").remove();
        $("#vatSModal").modal("hide");
    }
</script>