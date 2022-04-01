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
  <table id="vatlistTable" class="table table-striped table-bordered nowrap" style="width:100%; overflow:hidden;">
    <thead>
	    <tr>
	    	<td style="vertical-align:middle; width:5%;"><input type="checkbox" class="form-control" id="cardAllCheck" name="cardAllCheck" onclick="allCheck(this);"></td>
	    	<th>일자</th>
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
	      	<td><input type="date" class="form-control" value="${row.vatIssueDate}" max="9999-12-31" id="cardDate_bacB" style="width:auto;"></td>
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
	        <!-- <a href="javascript:fnvatListB('${row.vatSerial}', '${row.vatSellerCustNo}', '${row.vatAmount}');"></a>  -->
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
		  localStorage.setItem('lastTab', $('#baclist_num').val());
		  localStorage.setItem('lastpageNum', $('#reloadpage_num').val());
		  location.href="${path}/acc/bacdetail.do";
	  }else{
		  return false;
	  }
  }
  
  function checkConnect(){
	  if(confirm("선택하신 번호 연결하시겠습니까??")){
		  var listTable = $("#vatlistTable tbody tr td");
		  var bacId = localStorage.getItem("thisId");
		  var compNo = "${sessionScope.compNo}";
		  
		  listTable.find("#checkSerial").each(function(index, item){
			  if($(item).is(":checked") === true){
				  var insertData = {};
				  
				  insertData.compNo = compNo;
				  insertData.baclogId = bacId;
				  insertData.linkType = "VAT";
				  insertData.linkDocno = $(item).attr("data-number");
				  
				  $.ajax({
					 url: "${path}/acc/bacCheckConnect.do",
					 method: "post",
					 data: insertData,
					 async: false,
					 dataType: "json"
				  });
			  }
		  });
		  
		  alert("연결되었습니다.");
		  localStorage.setItem('lastTab', $('#baclist_num').val());
		  localStorage.setItem('lastpageNum', $('#reloadpage_num').val());
		  location.href="${path}/acc/bacdetail.do";
	  }
  }
  function allCheck(e){
	  if($(e).is(":checked") === true){
		  $("#vatlistTable tbody tr td").find("#checkSerial").each(function(index, item){
			  $(item).prop("checked", true);
		  });
	  }else{
		  $("#vatlistTable tbody tr td").find("#checkSerial").each(function(index, item){
			  $(item).prop("checked", false);
		  });
	  }
  }
</script>