﻿<%--
  Created by IntelliJ IDEA.
  User: djkim
  Date: 2022-04-04
  Time: 오전 9:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value ="${pageContext.request.contextPath}"/>
<c:set var="path2" value="${requestScope['javax.servlet.forward.servlet_path']}" />

<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top4.jsp"/>
<div id="main_content">
    <h6 style="font-weight:600;">영업기회 매입매출 현황</h6>
    <hr>
    <div class="cnt_wr" id="list-container">
        <div class="row">
            <div class="col-sm-12">
                <div class="card-block table-border-style">
                    <div class="table-responsive">
                        <table id="estTable" class="table table-striped table-bordered nowrap ">
                            <colgroup>
                                <col width="25%"/>
                                <col width="15%"/>
                                <col width="15%"/>
                                <col width="15%"/>
                                <col width="15%"/>
                                <col width="15%"/>
                            </colgroup>
                            <thead>
                            <tr>
                                <th class="text-center">작성날짜</th>
                                <th class="text-center">기회명</th>
                                <th class="text-center">판매 방식</th>
								<th class="text-center">예상매출</th>
                                <th class="text-center">최근 계약</th>
                                <th class="text-center">매출이익</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="row" items="${costList}">
                                <tr>
                                    <td class="text-center">${row.regDatetime}</td>
                                    <td class="text-center">${row.soppTitle}</td>
                                    <td class="text-right">${row.desc03}</td>
                                    <td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.soppTargetAmt}" /></td>
                                    <td class="text-center"><a href="${path}/cont/detail/${row.soppNo}/${row.contNo}">${row.contTitle}</a></td>
                                    <td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.soppTargetAmt}" /></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../body-bottom.jsp"/>
<script>
    $(function(){
        $('#estTable').DataTable({
            info:false,
            searching: true,
            order: [[ 0, "desc" ]],
        });
    });
</script>