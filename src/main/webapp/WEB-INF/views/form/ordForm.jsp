<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="${path}/js/jquery.min.js"></script>
<script src="${path}/js/html2pdf.bundle.min.js"></script>
<style>
    #imgLogo #logoLeft{
        width:28%;
        height:auto;
    }

    #imgLogo #logoRight{
        width:70%;
        height:auto;
        position:absolute;
        top:6px;
        right: 0;
    }

    #pdfTitle #titlePdf{
        font-size: 24px;
        font-weight:600;
        text-align:center;
        margin-bottom: 20px;
    }

    #pdfRemarks{
        font-size: 10px;
    }

    #pdfBottom img{
        width:30%;
        float:right;
    }

    table{
        width:100%;
        margin:0 auto;
        text-align:center;
        border: 1px solid #000;
        font-size: 10px;
        margin-bottom: 20px;
    }

    table thead tr th{
        color: #fff;
        background-color: #B52223;
    }

    table tbody tr td{
        border:1px solid #000;
    }

</style>
<body>
<div class="mainPdf" id="mainPdf">
    <div id="imgLogo">
        <img src="${path}/images/pdf_logo_left.jpg" id="logoLeft" />
    </div>
    <div id="pdfTitle">
        <div id="titlePdf">발 주 서</div>
    </div>
    <table>
        <tr>
            <th>발주 업체명  귀중</th>
            <th>아래 내용과 같이 발주 합니다. </th>
        </tr>
        <tr>
            <th>발 주 일 자: ${detail.estDate}</th>
        </tr>
        <tr>
            <th>상        호   주식회사 비전테크</th>
            <th>대 표 이 사    이 승 우 (직인생략)</th>
        </tr>
        <tr>
            <th>상 호 : </th>
            <th>주		소: 부산시 해운대구 센텀중앙로 97 센텀스카이비즈 A동 2509호</th>
        </tr>
        <tr>
            <th>발주 금액 ￦<fmt:formatNumber value="${detail.estTotal}" pattern="#,###" /> VAT 별도</th>
            <th>전		화: 051-892-3723</th>
        </tr>
    </table>
    <table>
        <thead>
        <th>No.</th>
        <th>품명/규격</th>
        <th>내역</th>
        <th>수량</th>
        <th>공급가</th>
        <th>비고</th>
        </thead>
        <tbody>
        <c:forEach var="row" items="${list}">
            <c:set var="smallIndex" value="${smallIndex + 1}" />
            <c:set var="dataTotal" value="${dataTotal + row.productTotal}" />
            <tr>
                <td>${smallIndex}</td>
                <td>${row.productName}</td>
                <td>${row.productQty}</td>
                <td>￦<fmt:formatNumber value="${row.productNetprice}" pattern="#,###" /></td>
                <td>${row.productRemark}</td>
            </tr>
        </c:forEach>
        <tr>
            <th colspan="6" style="border:1px solid #000">공급가합계 VAT 별도</th>
            <th colspan="2" style="border:1px solid #000">￦<fmt:formatNumber value="${dataTotal}" pattern="#,###" /></th>
        </tr>
        </tbody>
    </table>
    <div id="pdfRemarks">
        <h3>추가 사항</h3>
        <h4></h4>
        <h4></h4>
        <h4></h4>
    </div>
    <div id="pdfBottom">
        <img src="${path}/images/pdf_bottom.png" id="bottomImg" />
    </div>
</div>
</body>
<script>
    function solPdf(){
        var estId = "${detail.estId}";
        var now = new Date();
        var year = now.getFullYear();
        var month = parseInt(now.getMonth())+1;

        if(month < 10){
            month = "0" + month;
        }else{
            month = month;
        }

        if(now.getDate() < 10){
            var date = "0" + now.getDate();
        }else{
            var date = now.getDate();
        }

        var nowDate = year + "-" + month + "-" + date;
        var element = document.getElementById("mainPdf");

        html2pdf().from(element).set({
            margin: 5,
            filename: estId + '(' + nowDate + ')' + '.pdf',
            html2canvas: { scale: 1 },
            jsPDF: {orientation: 'landscape', unit: 'mm', format: 'a4', compressPDF: true}
        }).save();
    }

    $(document).ready(function(){
        solPdf();
    });
</script>
</html>