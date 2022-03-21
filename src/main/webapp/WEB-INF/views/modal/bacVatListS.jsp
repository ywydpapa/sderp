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
    <table id="vatlistTable" class="table table-striped table-bordered nowrap">
        <thead>
		    <tr>
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
		        <td><a href="javascript:fnvatListS('${row.vatSerial}', '${row.vatSellerCustNo}', '${row.vatAmount}');">${row.vatSerial}</a></td>
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
    	if(confirm("승인번호 : " + a + "\n연결하시겠습니까??")){
  		  var updateData = {};
  		  var bacId = localStorage.getItem("thisId");
  		  var vatSerial = a;
  		  var baclisthideNum = $('#baclisthideNum').val();
  		  
  		  updateData.baclogId = bacId;
  		  updateData.linkDoc = vatSerial;
  		  
  		  $.ajax({
  			 url: "${path}/acc/bacSerialUpdate.do",
  			 method: "post",
  			 data: updateData,
  			 dataType: "json",
  			 success:function(){
			 	alert("연결되었습니다.");
  			 }
  		  });
  		  llocalStorage.setItem('lastTab', $('#baclist_num').val());
		  localStorage.setItem('lastpageNum', $('#reloadpage_num').val());
		  location.href="${path}/acc/bacdetail.do";
  	  }else{
  		  return false;
  	  }
    }
</script>