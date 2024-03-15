<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:if test="${empty simple}">
    <!DOCTYPE html>
    <html>
    <jsp:include page="../head.jsp"/>
    <jsp:include page="../body-top.jsp"/>

    <div id="main_content">
</c:if>
<!-- Page-header start 페이지 타이틀-->
<div class="page-header2">
    <div class="row align-items-end">
        <div class="col-lg-12">
            <div class="page-header-title">
                <div class="d-inline">재고등록</div>
            </div>
        </div>
    </div>
</div>
<!--Page-header end 페이지 타이틀 -->
<!--기술지원 대상등록-->
<div class="cnt_wr">
    <div class="row">
        <div class="col-sm-12">
            <div class="card-block table-border-style">
                <div class="table-responsive">
                    <table class="table table-sm bst02">
                        <tbody>
                            <tr>
                                <th scope="row">입/출고선택</th>
                                <td colspan="7">
                                    <div class="form-radio">
                                        <form>
                                            <div class="radio radio-inline">
                                                <label style="margin-top: 10px;">
                                                    <input type="radio" name="storeType" value="IN" checked="checked">
                                                    <i class="helper"></i>입고
                                                </label>
                                            </div>
                                            <div class="radio radio-inline">
                                                <label>
                                                    <input type="radio" name="storeType" value="OUT">
                                                    <i class="helper"></i>출고
                                                </label>
                                            </div>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">장비명</th>
                                <td style="display: flex; align-items: center;">
                                    <div style="margin-right: 5px; width: 100%;">
                                        <select id="productSelect" class="form-control" onchange="productSelectChange(this);" style="height: 30px;">
                                            <option value="select" selected>장비선택</option>
                                            <option value="text">직접입력</option>
                                        </select>
                                    </div>
                                    <div class="productSelectOption" style="width: 100%;">
                                        <select class="form-control" id="productName" data-flag="true" name="productName" onchange="autoCompleteSelect(this);">
                                            <option value="">선택</option>
                                            <c:forEach var="row" items="${listProduct}">
                                                <option data-no="${row.productNo}" value="${row.custName} : ${row.productName}">${row.productName} (${row.custName})</option>
                                            </c:forEach>
                                        </select>
                                        <input type="hidden" name="productNo" id="productNo" value="" />
                                    </div>
                                    <div class="productTextOption" style="display: none; width: 100%;">
                                        <input type="text" id="productName" data-flag="false" class="form-control" />
                                    </div>
                                </td>
                                <th scope="row">계약명</th>
                                <td>
                                    <div class="input-group input-group-sm mb-0">
                                        <select class="form-control" id="contTitle" name="contTitle" onchange="autoCompleteSelect(this);">
                                            <option value="">선택</option>
                                            <c:forEach var="row" items="${listCont}">
                                                <option data-no="${row.contNo}" value="${row.contTitle}">${row.contTitle}</option>
                                            </c:forEach>
                                        </select>
                                        <input type="hidden" name="contNo" id="contNo" value="" />
                                    </div>
                                </td>
                                <th scope="row">납품처</th>
                                <td>
                                    <div class="input-group input-group-sm mb-0">
                                        <select class="form-control" id="custName" name="custName" onchange="autoCompleteSelect(this);">
                                            <option value="">선택</option>
                                            <c:forEach var="row" items="${listCust}">
                                                <option data-no="${row.custNo}" value="${row.custName}">${row.custName}</option>
                                            </c:forEach>
                                        </select>
                                        <input type="hidden" name="custNo" id="custNo" value="" />
                                        <!-- <input type="text" class="form-control" name="custName" id="custName" autocomplete="off" value=""> -->
                                    </div>
                                </td>
                                <th scope="row">위치</th>
                                <td>
                                    <input type="text" class="form-control" id="locationName" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">입고일</th>
                                <td>
                                    <input type="date" class="form-control" id="storeDate" max="9999-12-31"/>
                                </td>
                                <th>출고일</th>
                                <td>
                                    <input type="date" class="form-control" id="releaseDate" max="9999-12-31"/>
                                </td>
                                <th scope="row">발주일</th>
                                <td>
                                    <input type="date" class="form-control" id="orderDate" max="9999-12-31"/>
                                </td>
                                <th scope="row">BKLN시작일</th>
                                <td>
                                    <input type="date" class="form-control" id="bklnDate" max="9999-12-31"/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">비고</th>
                                <td colspan="7">
                                    <input type="text" class="form-control" id="firstDetail" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">재고수량</th>
                                <td>
                                    <input type="text" class="form-control" id="inventoryQty"/>
                                </td>
                                <th scope="row">매입단가</th>
                                <td>
                                    <input type="text" class="form-control" id="purchaseNet" onkeyup="moneyFormatInput(this);" style="text-align: right;"/>
                                </td>
                                <th scope="row">시리얼</th>
                                <td>
                                    <input type="text" class="form-control" id="serial"/>
                                </td>
                                <th scope="row">Auth Code</th>
                                <td>
                                    <input type="text" class="form-control" id="authCode"/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">옵션사항</th>
                                <td colspan="3">
                                    <input type="text" class="form-control" id="options">
                                </td>
                                <th scope="row">비고</th>
                                <td colspan="3">
                                    <input type="text" class="form-control" id="secondDetail">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="btn_wr text-right mt-3">
                <button class="btn btn-md btn-success f-left modal-list-btn"
                        onClick="javascript:location='${path}/techd/techStoreList.do'">목록
                </button>
                <button class="btn btn-md btn-primary" onClick="techStoreWrite()">등록</button>
                <button class="btn btn-md btn-inverse modal-cancel-btn"
                        onClick="javascript:location='${path}/techd/techStoreList.do'">취소
                </button>
            </div>
        </div>
    </div>
</div>

<script>
    function productSelectChange(thisEle){
        let productSelectOption = $(".productSelectOption");
        let productTextOption = $(".productTextOption");

        if($(thisEle).val() === "select"){
            productSelectOption.show();
            productTextOption.hide();
            productSelectOption.children().attr("data-flag", true);
            productTextOption.children().attr("data-flag", false);
        }else{
            productSelectOption.hide();
            productTextOption.show();
            productSelectOption.children().attr("data-flag", false);
            productTextOption.children().attr("data-flag", true);
        }
    }

    function techStoreWrite(){
        if(confirm("등록하시겠습니까??")){
            let datas = {
                "storeType": $("[name=\"storeType\"]:checked").val(),
                "productName": $("#productName[data-flag=\"true\"]").val(),
                "contNo": $("#contNo").val(),
                "custNo": $("#custNo").val(),
                "userNo": "${sessionScope.userNo}",
                "locationName": $("#locationName").val(),
                "firstDetail": $("#firstDetail").val(),
                "inventoryQty": $("#inventoryQty").val(),
                "purchaseNet": $("#purchaseNet").val().replace(/,/g, ""),
                "serial": $("#serial").val(),
                "authCode": $("#authCode").val(),
                "options": $("#options").val(),
                "secondDetail": $("#secondDetail").val(),
                "storeDate": $("#storeDate").val(),
                "releaseDate": $("#releaseDate").val(),
                "orderDate": $("#orderDate").val(),
                "bklnDate": $("#bklnDate").val(),
            }

            $.ajax({
                url: "${path}/techd/techStoreWrite.do",
                method: "post",
                data: datas,
                dataType: "json",
                success: function(){
                    alert("등록되었습니다.");
                    location.href = "${path}/techd/techStoreList.do";
                },
                error: function(error){
                    alert("등록 중 에러가 발생하였습니다.\n" + error);
                    console.log(error);
                    return false;
                }
            })
        }else{
            return false;
        }
    }
</script>

<c:if test="${empty simple}">
    </div>
    <jsp:include page="../body-bottom.jsp"/>
</c:if>