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
      <th>승인번호</th>
      <th>업체명</th>
      <th>공급가액</th>
      <th>비고</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="row" items="${list}">
      <tr align="center">
        <td><a href="javascript:fnvatListB('${row.vatSerial}', '${row.vatSellerCustNo}', '${row.vatAmount}');">${row.vatSerial}</a></td>
        <c:choose>
	        <c:when test="${empty row.custName}">
	           <td>미등록업체</td>
	        </c:when>
	        <c:otherwise>
	          	<td>${row.custName}</td>
	        </c:otherwise>
        </c:choose>
        <td>₩<fmt:formatNumber value="${row.vatAmount}" pattern="#,###" /></td>
        <td class="text-left">${row.vatRemark}</td>
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
  
  function fnvatListB(a, b, c) {
	  if(confirm("승인번호 : " + a + "\n연결하시겠습니까??")){
		  var updateData = {};
		  var bacId = localStorage.getItem("thisId");
		  var vatSerial = a;
		  
		  updateData.baclogId = bacId;
		  updateData.linkDoc = vatSerial;
		  
		  $.ajax({
			 url: "${path}/acc/bacSerialUpdate.do",
			 method: "post",
			 data: updateData,
			 dataType: "json",
			 success:function(){
				 localStorage.clear();
				 alert("연결되었습니다.");
				 location.reload();
			 }
		  });
	  }else{
		  return false;
	  }
  }
</script>