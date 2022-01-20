<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="${path}/js/jquery.min.js"></script>
<script src="${path}/js/html2pdf.bundle.min.js"></script>
<style>
/* body{
	-webkit-font-smoothing: antialiased;
  	-moz-osx-font-smoothing: auto;
  	font-weight:600;
} */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Outfit:wght@600&display=swap');
@font-face {font-family:MalgunGothic; src:url(${path}/form/fonts/MalgunGothic.TTF);}
body{
	font-family:MalgunGothic, sans-serif;
}

table{
	width:100%; 
	margin:0 auto; 
	font-size: 10px; 
	margin-bottom: 20px;
	vertical-align: middle;
}

#imgLogo #logoLeft{
	margin-top: 60px;
	width:28%;
	height:auto;
}

#imgLogo #logoRight{
	width:70%;
	height:auto;
	position:absolute; 
	top:63px;
	right: 0;
}

#pdfTitle #titlePdf{
	font-family: 'Outfit', sans-serif;
	font-size: 40px;
	text-align:center;
	margin-top: 30px;
	margin-bottom: 20px;
}

#headList{
	text-align:left;
	border: 2px solid #000; 
}

#headList tr th:first-child{
	padding:3px 30px;
}

#headList tr th:last-child{
	padding:3px 0;
	position:absolute;
	left:50%;
}

#totalInfo{
	text-align: left;
	border: 2px solid #000; 
	padding: 10px 0;
}

#totalInfo tr th:first-child{
	padding: 10px 30px;
}

#totalInfo tr th:last-child{
	padding: 10px 0;
	position:absolute;
	left:62%;
}

#pdfRemarks{
	font-size: 10px;
	margin-bottom: 20px;
}

#pdfRemarks h3 span{
	font-size: 10px;
	padding: 0 10px;
}

#pdfBottom img{
	width:60%;
	float:right;
}

#mainTable{
	border: 2px solid #000; 
	border-collapse: collapse;
}

#mainTable thead tr th{
	color: #fff;
	background-color: #990B19;
	border-right:1px solid #444;
	border-bottom:1px solid #444;
}

#mainTable tbody tr td{
	border-right:1px solid #808080;
	border-bottom:1px solid #808080;
}

</style>
<body>
	<div class="mainPdf" id="mainPdf">
		<div id="imgLogo">
			<img src="${path}/images/pdf_logo_left.jpg" id="logoLeft" />
			<img src="${path}/images/pdf_logo_right.png" id="logoRight" />
		</div>
		<div id="pdfTitle">
			<div id="titlePdf">QUOTATION</div>
		</div>
		<table id="headList">
			<tr>
				<th>견&ensp;적&ensp;일&ensp;자 : ${detail.estDate}</th>
				<th>상&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;호 : 주식회사 비전테크</th>
			</tr>
			<tr>
				<th>견&ensp;적&ensp;번&ensp;호 : ${detail.estId}</th>
				<th>대&ensp;표&ensp;이&ensp;사 : 이 승 우 (직인생략)</th>
			</tr>
			<tr>
				<th>사&ensp;&nbsp;&nbsp;업&ensp;&nbsp;&nbsp;명 : ${detail.estTitle}</th>
				<th>주&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;소 : 부산시 해운대구 센텀중앙로 97 센텀스카이비즈 A동 2509호</th>
			</tr>
			<tr>
				<th>수&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;신 : 부산교육청/안강렬 주무관님</th>
				<th>전&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;화 : 051-892-3723</th>
			</tr>
			<tr>
				<th>영&ensp;업&ensp;담&ensp;당 : ${detail.userName}</th>
				<th>팩&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;스 : 051-955-3723</th>
			</tr>
		</table>
		<table id="totalInfo">
			<tr>
				<th>견	적	금	액 : ￦&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;<fmt:formatNumber value="${detail.estTotal}" pattern="#,###" />&ensp;&ensp;(VAT 포함)</th>
				<th>유	효	기	간 : 견적일로 부터 2주</th>
			</tr>
		</table>
		<table id="mainTable">
			<thead>
				<tr>
					<th>No.</th>
					<th>구분</th>
					<th>품 명 / 규 격</th>
					<th>수량</th>
					<th>소비자가</th>
					<th>공급 단가</th>
					<th>합계</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${param.title == 1}">
						<c:forEach var="titleList" items="${titleList}">
							<c:set var="titleNum" value="${titleNum+1}" />
							<c:set var="dataTotal" value="${dataTotal + titleList.titleTotal}" />
							<c:set var="vatTotal" value="${vatTotal + titleList.vatTotal}" />
							<c:set var="amountTotal" value="${amountTotal + titleList.amountTotal}" />
							<tr style="background-color:yellow; border-bottom:1px solid #808080; border-left:1px solid #000; border-right:1px solid #000;">
								<th style="border-right:1px solid #808080;">${titleNum}</th>
								<th></th>
								<th style="border-right:1px solid #808080;">${titleList.itemTitle}</th>
								<th style="border-right:1px solid #808080;"></th>
								<th style="border-right:1px solid #808080;"></th>
								<th style="border-right:1px solid #808080;"></th>
								<th style="text-align:right; border-right:1px solid #808080;"><fmt:formatNumber value="${titleList.titleTotal}" pattern="#,###" /></th>
								<th></th>
							</tr>
							<c:forEach var="row" items="${list}" varStatus="status">
								<c:if test="${titleList.itemTitle == row.itemTitle}">
									<c:set var="noIndex" value="${noIndex+1}" />
									<tr>
										<td style="text-align:center;">${noIndex}</td>
										<td style="text-align:center; font-weight:700;">${row.itemKinds}</td>
										<td><h4>${row.productName}</h4>${row.productSpec}</td>
										<td style="text-align:center;">${row.productQty}</td>
										<td></td>
										<td style="text-align:right;"><fmt:formatNumber value="${row.productNetprice}" pattern="#,###" /></td>
										<td style="text-align:right;"><fmt:formatNumber value="${row.productTotal}" pattern="#,###" /></td>
										<td>${row.productRemark}</td>
									</tr>
								</c:if>
								<c:if test="${titleList.itemTitle != row.itemTitle}">
									<c:set var="noIndex" value="0" />
								</c:if>
							</c:forEach>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach var="row" items="${list}" varStatus="status">
							<c:set var="dataTotal" value="${dataTotal + row.productTotal}" />
							<c:set var="vatTotal" value="${vatTotal + row.productVat}" />
							<c:set var="amountTotal" value="${amountTotal + row.productAmount}" />
							<tr>
								<td style="text-align:center;">${status.index+1}</td>
								<td style="text-align:center; font-weight:700;">${row.itemKinds}</td>
								<td><h4>${row.productName}</h4>${row.productSpec}</td>
								<td style="text-align:center;">${row.productQty}</td>
								<td></td>
								<td style="text-align:right;"><fmt:formatNumber value="${row.productNetprice}" pattern="#,###" /></td>
								<td style="text-align:right;"><fmt:formatNumber value="${row.productTotal}" pattern="#,###" /></td>
								<td>${row.productRemark}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<tr style="border-top:1px solid #000;">
					<th colspan="6" style="border-right:1px solid #808080;">공&ensp;급&ensp;가&ensp;합&ensp;계</th>
					<td style="border-right:1px solid #808080; text-align:right;"><fmt:formatNumber value="${amountTotal}" pattern="#,###" /></td>
					<th></th>
				</tr>
				<tr>
					<th colspan="6" style="border-right:1px solid #808080; border-top:1px solid #808080; border-bottom:1px solid #808080;">부&ensp;가&ensp;가&ensp;치&ensp;세</th>
					<td style="border-right:1px solid #808080;text-align:right;"><fmt:formatNumber value="${vatTotal}" pattern="#,###" /></td>
					<th style="border-top:1px solid #808080; border-bottom:1px solid #808080;"></th>
				</tr>
				<tr>
					<th colspan="6" style="border-right:1px solid #808080;">총&ensp;&ensp;&ensp;&ensp;금&ensp;&ensp;&ensp;&ensp;액</th>
					<td style="border-right:1px solid #808080; text-align:right;"><fmt:formatNumber value="${dataTotal}" pattern="#,###" /></td>
					<th></th>
				</tr>
			</tbody>
		</table>
		<div id="pdfRemarks">
			<h3>Remarks<br>
				<span>결제조건은 검수(납품) 당월 계산서 발행, 익월 결제 입니다.</span><br/>
				<span>납기기간은 발주 후 최대 4주 입니다.</span><br/>
				<span>설치비용 포함 견적이며 고객사 응용프로그램 사용에 따른 커스터마이징 비용은 미 포함이며 협의 후 포함합니다.</span>
			</h3>
			
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
      html2canvas: { scale: 10 },
      jsPDF: {orientation: 'portrait', unit: 'mm', format: 'a4', compressPDF: true}
	}).save();
}

$(document).ready(function(){
	solPdf();
});
</script>
</html>