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
@font-face {font-family:MalgunGothic; src:url(${path}/form/fonts/malgun.ttf);}

body{
	font-family:MalgunGothic, sans-serif;
	font-weight:0;
}

table{
	width:100%; 
	font-size: 10px; 
	margin-bottom: 10px;
}

th, td{
  	padding:1px 1px 4px 2px;
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
	padding:2px 0 2px 30px;
}

#headList tr th:last-child{
	padding:2px 0 2px 0;
	position:absolute;
	left:55%;
}

#totalInfo{
	text-align: left;
	border: 2px solid #000; 
	padding: 5px 0;
}

#totalInfo tr th:first-child{
	padding: 4px 0 4px 30px;
}

#totalInfo tr th:last-child{
	padding: 4px 0 4px 0;
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
	border-right:1px solid #000;
	border-bottom:1px solid #000;
}

#mainTable tbody td{
	border-right:1px solid #000;
}

#mainTable #mainTr td{
	border-bottom:1px solid #000;
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
		<c:choose>
			<c:when test="${empty infoItem}">
				<table id="headList">
					<tr>
						<th>견&ensp;적&ensp;일&ensp;자 : ${detail.estDate}</th>
						<th>상&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;호 : ${comList.comName}</th>
					</tr>
					<tr>
						<th>견&ensp;적&ensp;번&ensp;호 : ${detail.estId}</th>
						<th>대&ensp;표&ensp;이&ensp;사 : ${comList.comBoss} (직인생략)</th>
					</tr>
					<tr>
						<th>사&ensp;&nbsp;&nbsp;업&ensp;&nbsp;&nbsp;명 : ${detail.estTitle}</th>
						<th>주&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;소 : ${comList.comAddress}</th>
					</tr>
					<tr>
						<th>
							수&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;신 :
							<c:choose>
								<c:when test="${empty detail.custBossname}">
									${detail.custName}
								</c:when>
								<c:otherwise>
									${detail.custName}/${detail.custBossname}
								</c:otherwise>
							</c:choose> 
						</th>
						<th>전&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;화 : ${comList.comPhone}</th>
					</tr>
					<tr>
						<th>영&ensp;업&ensp;담&ensp;당 : ${detail.userName}/${detail.userTel}/${detail.userEmail}</th>
						<th>팩&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;스 : ${comList.comFax}</th>
					</tr>
				</table>
				<table id="totalInfo">
					<tr>
						<th>견&ensp;적&ensp;금&ensp;액 : ￦&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;<fmt:formatNumber value="${detail.estTotal}" pattern="#,###" />&ensp;&ensp;(VAT 포함)</th>
						<th>유&ensp;효&ensp;기&ensp;간 : 견적일로 부터 2주</th>
					</tr>
				</table>
			</c:when>
			<c:otherwise>
				<table id="headList">
					<tr>
						<th>견&ensp;적&ensp;일&ensp;자 : ${detail.estDate}</th>
						<th>상&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;호 : ${infoItem.estComName}</th>
					</tr>
					<tr>
						<th>견&ensp;적&ensp;번&ensp;호 : ${detail.estId}</th>
						<th>대&ensp;표&ensp;이&ensp;사 : ${infoItem.estComBoss} (직인생략)</th>
					</tr>
					<tr>
						<th>사&ensp;&nbsp;&nbsp;업&ensp;&nbsp;&nbsp;명 : ${detail.estTitle}</th>
						<th>주&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;소 : ${infoItem.estComAdd}</th>
					</tr>
					<tr>
						<th>
							수&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;신 :
							<c:choose>
								<c:when test="${empty detail.custBossname}">
									${detail.custName}
								</c:when>
								<c:otherwise>
									${detail.custName}/${detail.custBossname}
								</c:otherwise>
							</c:choose> 
						</th>
						<th>전&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;화 : ${infoItem.estComPhone}</th>
					</tr>
					<tr>
						<th>영&ensp;업&ensp;담&ensp;당 : ${detail.userName}/${detail.userTel}/${detail.userEmail}</th>
						<th>팩&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;스 : ${infoItem.estComFax}</th>
					</tr>
				</table>
				<table id="totalInfo">
					<tr>
						<th>견&ensp;적&ensp;금&ensp;액 : ￦&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;<fmt:formatNumber value="${detail.estTotal}" pattern="#,###" />&ensp;&ensp;(VAT 포함)</th>
						<th>유&ensp;효&ensp;기&ensp;간 : 견적일로 부터 ${infoItem.estComTerm}주</th>
					</tr>
				</table>
			</c:otherwise>
		</c:choose>
		
		<table id="mainTable">
			<colgroup>
		        <col width="5%">
		        <col width="10%">
		        <col width="49%">
		        <col width="5%">
		        <col width="7%">
		        <col width="7%">
		        <col width="7%">
		        <col width="10%">
		    </colgroup>
			<thead>
				<tr>
					<th style="border-left:1px solid #000;">No.</th>
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
							<tr style="background-color:#FFFF75; border-bottom:1px solid #000; border-left:1px solid #000; border-right:1px solid #000;">
								<th id="titleNumber" data-number="${titleNum}" style="border-right:1px solid #000;"></th>
								<th></th>
								<th style="border-right:1px solid #000;">${titleList.itemTitle}</th>
								<th style="border-right:1px solid #000;"></th>
								<th style="border-right:1px solid #000;"></th>
								<th style="border-right:1px solid #000;"></th>
								<th style="text-align:right; border-right:1px solid #000;"><fmt:formatNumber value="${titleList.titleTotal}" pattern="#,###" /></th>
								<th></th>
							</tr>
							<c:forEach var="row" items="${list}" varStatus="status">
								<c:if test="${titleList.itemTitle == row.itemTitle}">
									<c:set var="noIndex" value="${noIndex+1}" />
									<c:set var="repSpec" value='${row.productSpec.replaceAll("\\\<.*?\\\>","")}' />
									<tr id="mainTr">
										<td style="text-align:center;">${noIndex}</td>
										<td style="text-align:center; font-weight:700;">${row.itemKinds}</td>
										<td><span style="font-weight:600;">${row.productName}</span><br/>${repSpec.replaceAll("\\n", "<br>")}</td>
										<td style="text-align:center;">${row.productQty}</td>
										<td></td>
										<td style="text-align:right;"><fmt:formatNumber value="${row.productNetprice}" pattern="#,###" /></td>
										<td style="text-align:right;"><fmt:formatNumber value="${row.productTotal}" pattern="#,###" /></td>
										<td style="border-right:1px solid #000;">${row.productRemark}</td>
									</tr>
								</c:if>
								<c:if test="${titleList.itemTitle != row.itemTitle}">
									<c:set var="noIndex" value="0" />
								</c:if>
							</c:forEach>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:set var="rowIndex" value="1" />
						<c:set var="titleIndex" value="0" />
						<c:forEach var="row" items="${list}" varStatus="status">
							<c:set var="repSpec" value='${row.productSpec.replaceAll("\\\<.*?\\\>","")}' />
							<c:if test="${titleList[titleIndex].itemTitle != row.itemTitle}">
								<c:set var="rowIndex" value="${rowIndex+1}" />
								<c:set var="titleIndex" value="${titleIndex+1}" />
							</c:if>
							<c:set var="dataTotal" value="${dataTotal + row.productTotal}" />
							<c:set var="vatTotal" value="${vatTotal + row.productVat}" />
							<c:set var="amountTotal" value="${amountTotal + row.productAmount}" />
							<tr id="mainTr">
								<td class="noTitleTd" style="text-align:center;">${rowIndex}</td>
								<td style="text-align:center; font-weight:700;">${row.itemKinds}</td>
								<td><span style="font-weight:600;">${row.productName}</span><br/>${repSpec.replaceAll("\\n", "<br>")}</td>
								<td style="text-align:center;">${row.productQty}</td>
								<td></td>
								<td style="text-align:right;"><fmt:formatNumber value="${row.productNetprice}" pattern="#,###" /></td>
								<td style="text-align:right;"><fmt:formatNumber value="${row.productTotal}" pattern="#,###" /></td>
								<td style="border-right:1px solid #000;">${row.productRemark}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<tr style="border-top:1px solid #000;">
					<th colspan="6" style="border-right:1px solid #000;">공&ensp;급&ensp;가&ensp;합&ensp;계</th>
					<td style="text-align:right;"><fmt:formatNumber value="${amountTotal}" pattern="#,###" /></td>
					<th></th>
				</tr>
				<tr>
					<th colspan="6" style="border-right:1px solid #000; border-top:1px solid #000; border-bottom:1px solid #000;">부&ensp;가&ensp;가&ensp;치&ensp;세</th>
					<td style="text-align:right; border-top:1px solid #000; border-bottom:1px solid #000;"><fmt:formatNumber value="${vatTotal}" pattern="#,###" /></td>
					<th style="border-top:1px solid #000; border-bottom:1px solid #000;"></th>
				</tr>
				<tr>
					<th colspan="6" style="border-right:1px solid #000;">총&ensp;&ensp;&ensp;&ensp;금&ensp;&ensp;&ensp;&ensp;액</th>
					<td style="text-align:right;"><fmt:formatNumber value="${dataTotal}" pattern="#,###" /></td>
					<th></th>
				</tr>
			</tbody>
		</table>
		<div id="pdfRemarks">
			<h3>Remarks
				<span>${infoItem.estComSpec}</span>
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

function romanize(num) {
    if (isNaN(num))
        return NaN;
    var digits = String(+num).split(""),
        key = ["","C","CC","CCC","CD","D","DC","DCC","DCCC","CM",
               "","X","XX","XXX","XL","L","LX","LXX","LXXX","XC",
               "","I","II","III","IV","V","VI","VII","VIII","IX"],
        roman = "",
        i = 3;
    while (i--)
        roman = (key[+digits.pop() + (i * 10)] || "") + roman;
    return Array(+digits.join("") + 1).join("M") + roman;
}

$(document).ready(function(){
	var temp = [];
	var dataTemp = {};
	
	if($("#mainTable tbody tr").find("#titleNumber")){
		$("#mainTable tbody tr").find("#titleNumber").each(function(index, item){
			$(this).html(romanize($(this).attr("data-number")));
		});
	}
	
	if($("#mainTable tbody tr").find(".noTitleTd")){
		$("#mainTable tbody tr").find(".noTitleTd").each(function(index, item){
			var rows = $(".noTitleTd:contains('" + $(this).text() + "')");
	        if (rows.length > 1) {
	            rows.eq(0).attr("rowspan", rows.length);
	            rows.not(":eq(0)").remove();
	        }
		});
	}
	
	solPdf();
});
</script>
</html>