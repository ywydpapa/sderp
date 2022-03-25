<%--
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
    <table id="bac_connect_table" class="table table-striped table-bordered nowrap">
        <thead>
		    <tr>
		    	<th>선택</th>
		    	<th>작성일자</th>
		      	<th>거래처</th>
		      	<th>금액</th>
		      	<th>품명</th>
		      	<th>비고</th>
		      	<th>승인번호</th>
		    </tr>
	    </thead>
	    <tbody>
		    <c:forEach var="row" items="${list}">
		      <tr align="center">
		      	<td><input type="checkbox" class="form-control" id="checkSerial" data-number="${row.vatSerial}"></td>
		      	<td>${row.vatIssueDate}</td>
		        <c:choose>
			        <c:when test="${empty row.custName}">
			           <td>미등록업체</td>
			        </c:when>
			        <c:otherwise>
			          	<td>${row.custName}</td>
			        </c:otherwise>
		        </c:choose>
		        <td>₩<fmt:formatNumber value="${row.vatAmount + row.vatTax}" pattern="#,###" /></td>
		        <td>${row.vatProductName}</td>
		        <td class="text-left">${row.vatRemark}</td>
		        <td>${row.vatSerial}</td>
		      </tr>
		    </c:forEach>
		    <c:forEach var="row" items="${secound_list}">
		    	<tr>
		    	<td><input type="checkbox" class="form-control" id="checkSerial" data-number="${row.vatSerial}"></td>
		      	<td>${row.vatIssueDate}</td>
		        <c:choose>
			        <c:when test="${empty row.custName}">
			           <td>미등록업체</td>
			        </c:when>
			        <c:otherwise>
			          	<td>${row.custName}</td>
			        </c:otherwise>
		        </c:choose>
		        <td>₩<fmt:formatNumber value="${row.vatAmount + row.vatTax}" pattern="#,###" /></td>
		        <td>${row.vatProductName}</td>
		        <td class="text-left">${row.vatRemark}</td>
		        <td>${row.vatSerial}</td>
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
function cancelconnect(){
	if(confirm("선택하신 번호 연결취소하시겠습니까??")){
			var listTable = $("#bac_connect_listModal tbody tr td");
			var bacId = localStorage.getItem("thisId");
			var compNo = "${sessionScope.compNo}";

			listTable.find("#checkSerial").each(function(index, item){
		  		if($(item).is(":checked") === true){
		  			var deleteData = {};
			  		  
		  			deleteData.compNo = compNo;
		  			deleteData.baclogId = bacId;
		  			deleteData.linkDocno = $(item).attr("data-number");
		  			
		  			$.ajax({
		  				url: "${path}/acc/connect_link_check_cancel.do",
		  				method: "post",
		  				data: deleteData,
		  				async: false,
		  				dataType: "json"
		  			});
		  		}
		  	});
			localStorage.setItem('lastTab', $('#baclist_num').val());
			localStorage.setItem('lastpageNum', $('#reloadpage_num').val());
			location.href="${path}/acc/bacdetail.do";
	}
}
</script>