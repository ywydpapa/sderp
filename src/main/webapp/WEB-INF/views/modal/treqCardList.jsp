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
  <table id="cardlistTable" class="table table-striped table-bordered nowrap" style="width:100%; overflow:hidden;">
    <thead>
    <tr>
    	<th>선택</th>
    	<th>일자</th>
      	<th>승인번호</th>
      	<th>카드번호</th>
      	<th>가맹점</th>
      	<th>승인금액</th>
      	<th>환율</th>
      	<th>적요</th>
    </tr>
    </thead>
    <tbody>
	    <c:forEach var="row" items="${list}">
	      	<tr>
	      		<td align="center" style="vertical-align:middle;"><input type="checkbox" class="form-control" id="cardCheckSerial" name="cardCheckSerial" data-id="${row.appSerial}"></td>
	        	<td align="center" style="vertical-align:middle;">${row.appDate}</td>
	        	<td align="center" style="vertical-align:middle;">${row.appSerial}</td>
	        	<td align="center" style="vertical-align:middle;">${row.cardSerial}</td>
	        	<td align="left" style="vertical-align:middle;">${row.appContents}</td>
	        	<td align="right" style="vertical-align:middle;"><fmt:formatNumber value="${row.appAmount}" pattern="#,###" /></td>
	        	<td align="right" style="vertical-align:middle;">${row.appExchange}</td>
	        	<td align="center"><input type="text" class="form-control" id="cardRemarks" style="width:auto;"></td>
	      	</tr>
	    </c:forEach>
    </tbody>
  </table>
</div>

<script>
  $(function(){
    $('#cardlistTable').DataTable({
      info:false,
      searching: true
    });
  });
  
  function fnvatListB(a, b, c) {
	  $("#vatBdiv").find("#vatSerial").val(a);
	  $("#vatBdiv").find("#vatSellerCustNo").val(b);
	  $("#vatBdiv").find("#vatAmount").val(c);      
      $(".modal-backdrop").remove();
      $("#vatBModal").modal("hide");
  }
</script>