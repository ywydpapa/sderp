<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value ="${pageContext.request.contextPath}"/>
<c:set var="path2" value="${requestScope['javax.servlet.forward.servlet_path']}" />

<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top2.jsp"/>

<div id="main_content">
    <script>
        $(function(){
            $('#contTable').DataTable({
                info:false,
                searching: true,
                order: [[ 0, "desc" ]],
            });
        });
    </script>
    <style>
        a {
            text-decoration:underline;
        }
        #contTable > tbody > tr > td:nth-child(4){
            overflow: hidden;
            text-overflow: ellipsis;
            max-width: 220px;
            white-space: nowrap;
        }
        #contTable > tbody > tr > td:nth-child(5){
            overflow: hidden;
            text-overflow: ellipsis;
            max-width: 220px;
            white-space: nowrap;
        }
    </style>
   <!--리스트 table-->
    <div class="cnt_wr" id="list-container">
        <div class="row">
            <div class="col-sm-12">
                <div class="card-block table-border-style">
                    <div class="table-responsive">
                        <table id="contTable" class="table table-striped table-bordered nowrap ">
                            <colgroup>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="20%"/>
                                <col width="15%"/>
                                <col width="15%"/>
                                <col width="20%"/>
                            </colgroup>
                            <thead>
                            <tr>
                                <th class="text-center">작성일자</th>
                                <th class="text-center">근태종류</th>
                                <th class="text-center">신청자</th>
                                <th class="text-center">신청내용</th>
                                <th class="text-center">시작일</th>
                                <th class="text-center">종료일</th>
                                <th class="text-center">상태</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="row" items="${list}">
                                <tr>
                                    <td>${row.regDate}</td>
                                    <td>
                                        <a href="${path}/gw/attdetail/${row.attendId}"><c:if test="${row.attType eq 1}">월차</c:if>
                                            <c:if test="${row.attType eq 2}">연차</c:if>
                                            <c:if test="${row.attType eq 3}">경조휴가</c:if>
                                            <c:if test="${row.attType eq 4}">휴직</c:if></a>
                                    </td>
                                    <td>${row.userNo}</td>
                                    <td><a href="${path}/gw/attdetail/${row.attendId}">${row.attDesc}</a></td>
                                    <td>${row.attStart}</td>
                                    <td>${row.attEnd}</td>
                                    <td><c:if test="${row.attStatus eq 1}">신청중</c:if>
                                        <c:if test="${row.attStatus eq 3}">반려/보류</c:if>
                                        <c:if test="${row.attStatus eq 5}">승인완료</c:if></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--//리스트 table-->
    <script>

        $(document).ready(function() {
        });
    </script>
</div>
<jsp:include page="../body-bottom.jsp"/>
