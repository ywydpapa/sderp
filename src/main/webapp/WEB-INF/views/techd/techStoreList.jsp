<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top.jsp"/>

<div id="main_content">
    <script>
        $(function(){
            $('#storeTable').DataTable({
                info:false,
                searching: true,
                ordering: true,
            });
        });
    </script>
    <style>
        #storeTable tbody tr:hover{
            background-color: #EAEAEA;
            cursor: pointer;
        }
    </style>
    <!-- Page-header start 페이지 타이틀-->
    <div class="page-header2">
        <div class="row align-items-end">
            <div class="col-lg-12">
                <div class="page-header-title" style="float:left;">
                    <div style="margin-top:15px;">
                        <h6 style="font-weight:600;">재고조회</h6>
                    </div>
                </div>
                <div class="btn_wr" style="float:right;">
                    <button class="btn btn-sm btn-success" id="fold" onclick="acordian_action()">펼치기</button>
                    <button class="btn btn-sm btn-success" id="fold2" onclick="acordian_action1()" style="display: none;">접기</button>
                    <button class="btn btn-sm btn-inverse" onClick="javascript:fnClearall()"><i class="icofont icofont-spinner-alt-3"></i>초기화</button>
                    <button class="btn btn-sm btn-primary" onClick="javascript:fnListcon()"><i class="icofont icofont-search" id="search"></i>검색</button>
                    <button class="btn btn-sm btn-outline" onClick="javascript:location='${path}/techd/techStoreWriteForm.do'"><i class="icofont icofont-pencil-alt-2"></i>재고등록</button>
                </div>
            </div>
        </div>
    </div>
    <!--Page-header end 페이지 타이틀 -->

    <!--계약조회-->
    <div class="cnt_wr" id="acordian" style="display:none;">
        <div class="row">
            <form id="searchForm" method="post" onsubmit="return false;" class="col-sm-12">
                <div class="col-sm-12">
                    <div class="card_box sch_it">
                        <div class="form-group row" style="clear:both;">
                            <div class="col-sm-12 col-xl-2">
                                <label class="col-form-label">장비명</label>
                                <div class="input-group input-group-sm mb-0">
                                    <input type="text" class="form-control" name="productName" id="productName" data-completeSet="true" value="${param.productName}" />
                                </div>
                            </div>
                            <div class="col-sm-12 col-xl-2">
                                <label class="col-form-label">계약명</label>
                                <div class="input-group input-group-sm mb-0">
                                    <select class="form-control" id="contTitle" name="contTitle" onchange="autoCompleteSelect(this);">
                                        <option value="">선택</option>
                                        <c:forEach var="row" items="${listCont}">
                                            <option data-no="${row.contNo}" value="${row.contTitle}" <c:if test="${row.contTitle eq param.contTitle}">selected</c:if>>${row.contTitle}</option>
                                        </c:forEach>
                                    </select>
                                    <input type="hidden" name="contNo" id="contNo" value="${param.contNo}" />
                                </div>
                            </div>
                            <div class="col-sm-12 col-xl-2">
                                <label class="col-form-label">납품처</label>
                                <div class="input-group input-group-sm mb-0">
                                    <select class="form-control" id="custName" name="custName" onchange="autoCompleteSelect(this);">
                                        <option value="">선택</option>
                                        <c:forEach var="row" items="${listCust}">
                                            <option data-no="${row.custNo}" value="${row.custName}">${row.custName}</option>
                                        </c:forEach>
                                    </select>
                                    <input type="hidden" name="custNo" id="custNo" value="${param.custNo}" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!--//계약조회-->
    <!--리스트 table-->
    <div class="cnt_wr" id="list-container">
        <div class="row">
            <div class="col-sm-12">
                <div class="card-block table-border-style">
                    <div class="table-responsive">
                        <table id="storeTable" class="table table-striped table-bordered nowrap ">
                            <%--<colgroup>
                                <col width="5%"/>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="30%"/>
                                <col width="10%"/>
                                <col width="5%"/>
                                <col width="5%"/>
                                <col width="5%"/>
                                <col width="20%"/>
                            </colgroup>--%>
                            <thead>
                                <tr>
                                    <th class="text-center">장비명</th>
                                    <th class="text-center">계약명</th>
                                    <th class="text-center">시리얼</th>
                                    <th class="text-center">입고일</th>
                                    <th class="text-center">BKLN 시작일</th>
                                    <th class="text-center">출고일</th>
                                    <th class="text-center">납품처</th>
                                    <th class="text-center">발주일</th>
                                    <th class="text-center">장비위치</th>
                                    <th class="text-center">옵션사항</th>
                                    <th class="text-center">매입단가</th>
                                    <th class="text-center">비고</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="row" items="${listStore}">
                                    <tr onclick="location.href='${path}/techd/techStoreDetail.do/${row.storeNo}'">
                                        <td class="text-center">${row.productName}</td>
                                        <td class="text-center">${row.contTitle}</td>
                                        <td class="text-center">${row.serial}</td>
                                        <td class="text-center">${row.storeDate}</td>
                                        <td class="text-center">${row.bklnDate}</td>
                                        <td class="text-center">${row.releaseDate}</td>
                                        <td class="text-center">${row.custName}</td>
                                        <td class="text-center">${row.orderDate}</td>
                                        <td class="text-center">${row.locationName}</td>
                                        <td class="text-center">${row.options}</td>
                                        <td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.purchaseNet}" /></td>
                                        <td>${row.firstDetail}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function acordian_action(){
            if($("#acordian").css("display") == "none"){
                $("#acordian").show();
                $("#fold").hide();
                $("#fold2").show();

            } else {
                $("#acordian").hide();
                $("#fold").show();
            }
        }
        function acordian_action1(){
            if($("#acordian").css("display") != "none"){
                $("#acordian").hide();
                $("#fold").show();
                $("#fold2").hide();

            } else {
                $("#acordian").show();
                $("#fold").hide();
            }
        }

        $("#vatSdate").change(function(){
            var dateValue = $(this).val();
            var dateValueArr = dateValue.split("-");
            var dateValueCom = new Date(dateValueArr[0], parseInt(dateValueArr[1])-1, dateValueArr[2]);
            var EdateValue = $("#vatEdate").val();
            var EdateDateArr = EdateValue.split("-");
            var EdateDateCom = new Date(EdateDateArr[0], parseInt(EdateDateArr[1])-1, EdateDateArr[2]);

            if(EdateValue == ""){
                dateValueCom.setDate(dateValueCom.getDate()+1);
            }else if(dateValueCom.getTime() > EdateDateCom.getTime()){
                alert("시작일이 종료일보다 클 수 없습니다.");
                dateValueCom.setDate(dateValueCom.getDate()+1);
            }else{
                return null;
            }

            var year = dateValueCom.getFullYear();
            var month = dateValueCom.getMonth()+1;
            var day = dateValueCom.getDate();

            if(day < 10){
                day = "0" + day;
            }

            $("#vatEdate").val(year + "-" + month + "-" + day);
        });

        $("#vatEdate").change(function(){
            var SdateValue = $("#vatSdate").val();
            var SdateValueArr = SdateValue.split("-");
            var SdateValueCom = new Date(SdateValueArr[0], parseInt(SdateValueArr[1])-1, SdateValueArr[2]);
            var thisDateValue = $(this).val();
            var thisDateArr = thisDateValue.split("-");
            var thisDateCom = new Date(thisDateArr[0], parseInt(thisDateArr[1])-1, thisDateArr[2]);

            if(SdateValue == ""){
                thisDateCom.setDate(thisDateCom.getDate()-1);
            }else if(SdateValueCom.getTime() > thisDateCom.getTime()){
                alert("종료일이 시작일보다 작을 수 없습니다.");
                thisDateCom.setDate(thisDateCom.getDate()-1);
            }else{
                return null;
            }

            var year = thisDateCom.getFullYear();
            var month = thisDateCom.getMonth()+1;
            var day = thisDateCom.getDate();

            if(day < 10){
                day = "0" + day;
            }

            $("#vatSdate").val(year + "-" + month + "-" + day);
        });

        function fnListcon() {
            var estData = {};
            estData.productName = $("#productName").val() ? $("#productName").val() : null;
            estData.custNo = $("#custNo").val() ? Number($("#custNo").val()) : 0;
            estData.custName = $("#custName").val() ? $("#custName").val() : null;
            estData.contNo = $("#contNo").val() ? Number($("#contNo").val()) : 0;
            estData.contTitle = $("#contTitle").val() ? $("#contTitle").val() : null;
            var param = "?";
            var paramFirst = true;
            for (variable in estData) {
                console.log("key: " + variable + ", value: " + estData[variable]);
                if(estData[variable] != null && estData[variable] != 0) {
                    if(paramFirst){
                        param = param + variable + "=" + estData[variable];
                        paramFirst = false;
                    } else {
                        param = param + "&" + variable + "=" + estData[variable];
                    }
                }
            }

            if(param == "?"){
                param = "";
            }

            localStorage.setItem("productName", estData.productName);
            localStorage.setItem("custNo", estData.custNo);
            localStorage.setItem("custName", $("#custName").val());
            localStorage.setItem("contNo", estData.contNo);
            localStorage.setItem("contTitle", $("#contTitle").val());

            if(document.querySelector('#acordian').style.cssText == "display: none;"){
                var testAco1 = document.querySelector('#acordian').style.cssText;
                localStorage.setItem('lastAco1', testAco1);
            }else {
                var testAco2 = document.querySelector('#acordian').style.cssText;
                localStorage.setItem('lastAco2', testAco2);
            }

            var url = '${path}/techd/techStoreList.do'+param;
            location.href = url;
        }

        $(document).ready(function() {
            if(window.location.search.toString().startsWith('?')){
                if('${param.custNo}' == ''){
                    $("#custNo").val("");
                    $("#custName").val("");
                } else {
                    $("#custNo").val(localStorage.getItem("custNo"));
                    $("#custName").val(localStorage.getItem("custName"));
                }

                if('${param.contNo}' == ''){
                    $("#contNo").val("");
                    $("#contTItle").val("");
                } else {
                    $("#contNo").val(localStorage.getItem("custNo"));
                    $("#contTItle").val(localStorage.getItem("custName"));
                }
            }

            var lastAco1 = localStorage.getItem('lastAco1');
            var lastAco2 = localStorage.getItem('lastAco2');
            if(lastAco1 == null && lastAco2 != null) {
                $("#acordian").css("display", "block");
            }
            localStorage.clear();
        });
    </script>
</div>
<jsp:include page="../body-bottom.jsp"/>
