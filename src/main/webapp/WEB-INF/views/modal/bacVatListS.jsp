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
        <colgroup>
        	<col width="3%"/>
        	<col width="5%"/>
        	<col width="10%"/>
        	<col width="5%"/>
        	<col width="5%"/>
        	<col width="10%"/>
        	<col width="10%"/>
        	<col width="15%"/>
        </colgroup>
        <thead>
		    <tr>
		    	<th>선택</th>
		    	<th>작성일자</th>
		      	<th>거래처</th>
		      	<th>금액</th>
		      	<th>품명</th>
		      	<th>비고</th>
		      	<th>받은금액</th>
	      		<th>받을금액</th>
	      		<th>남은금액</th>
		      	<th>승인번호</th>
		    </tr>
	    </thead>
	    <tbody>
		    <c:forEach var="row" items="${list}">
		      <tr align="center">
		      	<c:choose>
		      		<c:when test="${row.vatAmount >= 0}">
		      			<td><input type="checkbox" class="form-control" id="checkSerial" data-number="${row.vatSerial}" data-code="${row.modal_vatmemo}"></td>
		      		</c:when>
		      		<c:otherwise>
		      			<td><input type="checkbox" class="form-control" id="checkSerial" data-number="${row.vatSerial}" data-code="${row.modal_vatmemo}" disabled></td>
		      		</c:otherwise>
		      	</c:choose>
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
		        <td><input type="text" class='form-control-sm' id="" style="border: 1px solid #ccc;" onkeyup="inputNumberFormat(this)" value="<fmt:formatNumber value="${row.modal_receive_data}" pattern="#,###" />"  disabled></td>
	      		<td><input type="text" class='form-control-sm' id="" style="border: 1px solid #ccc;" onkeyup="inputNumberFormat(this)" value="${row.modal_vatmemo}"></td>
	        	<td><input type="text" class='form-control-sm' id="modal_vatmemo" style="border: 1px solid #ccc;" onkeyup="inputNumberFormat(this)" value="${row.modal_vatmemo}"  disabled></td>
		        <td>${row.vatSerial}</td>
		        <!-- <a href="javascript:fnvatListS('${row.vatSerial}', '${row.vatSellerCustNo}', '${row.vatAmount}');"></a>  -->
		      </tr>
		    </c:forEach>
	    </tbody>
    </table>
    <div>
  	<button class="btn btn-sm btn-primary waves-effect" onclick="select_total_price()">선택계산</button>
  </div>
    <table id="table_test" class="table table-striped table-bordered nowrap">
  	<thead>
		<tr>
			<th>입금금액</th>
			<th>받을금액</th>
			<th>차액</th>
			<th id="received_price_col"style="display: none;">비고</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="row" items="${list_secound}">
			<input id="difference_price_sub" class='form-control-sm' style="border: 1px solid #ccc;" type="hidden" value="<fmt:formatNumber value="${row.difference_price}" pattern="#,###" />">
			<tr align="center">
				<td><input id="original_price" class='form-control-sm' style="border: 1px solid #ccc;" type="text" value="<fmt:formatNumber value="${row.inAmt}" pattern="#,###" />"></td>
				<td id="test"><input id="received_price" class='form-control-sm' style="border: 1px solid #ccc;" type="text" value="<fmt:formatNumber value="${row.received_price}" pattern="#,###" />"></td>
				<td id="test2"><input id="difference_price" class='form-control-sm' style="border: 1px solid #ccc;" type="text" value="<fmt:formatNumber value="${row.difference_price}" pattern="#,###" />"></td>
				<td><input id="received_price_detail" class='form-control' style="border: 1px solid #ccc; display: none;" type="text" value="${row.difference_memo}"></td>
			</tr>
		</c:forEach>
	</tbody>
  </table>
</div>

<script>
function select_total_price() {
	var tableHtml = "";
	var tableHtml2 = "";
	var sum_modal = 0;
	var listTable = $("#vatlistTable tbody tr td");
	var select_total_price_Data = {};
	var original_price = $('#original_price').val();
	var origin_received_price = parseInt($('#received_price').val().replace(/,/g, ""));
	/* if(origin_received_price != '' && origin_received_price != null && $('#received_price').val() != ''){
		sum_modal += origin_received_price;
	} */
	
	listTable.find("#checkSerial").each(function(index, item){
		  if($(item).is(":checked") === true){
			//받을 금액
			//받을 금액
			sum_modal += parseInt($(item).parent().next().next().next().next().next().next().next().children().first().val().replace(/,/g, ""));
		  }
		  //받을 금액의 총합.
	})
	
	
	$('#test').empty();
	$('#test2').empty();
	var cal_price = original_price.replace(/,/g, "") - sum_modal;
	var difference_price_sub = parseInt($('#difference_price_sub').val().replace(/,/g, "")) - sum_modal;
	tableHtml += "<input id='received_price' class='form-control-sm' style='border: 1px solid #ccc;' type='text' value='"+sum_modal.toLocaleString("en-US")+"'/>"
	tableHtml2 += "<input id='difference_price' class='form-control-sm' style='border: 1px solid #ccc;' type='text' value='"+difference_price_sub.toLocaleString("en-US")+"'/>"
	$('#test').html(tableHtml);
	$('#test2').html(tableHtml2);
	
	if(cal_price == 0){
		$('#received_price_detail').hide();
		$('#received_price_col').hide();
	}else if(cal_price != 0) {
		$('#received_price_detail').show();
		$('#received_price_col').show();
	}
}


function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}

function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}

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
  		  localStorage.setItem('lastTab', $('#baclist_num').val());
		  localStorage.setItem('lastpageNum', $('#reloadpage_num').val());
		  location.href="${path}/acc/bacdetail.do";
  	  }else{
  		  return false;
  	  }
    }
    
    function checkConnect(){
    	select_total_price();
		  	if(confirm("차액은 "+$('#difference_price').val()+"원 입니다. 연결하시겠습니까??")){
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
				  		//swc_vat의 modal_vatmemo modal_vatmemo - modal_receive_data
						  //-> 받은 금액
						  
					  	  insertData.modal_receive_data_sole = parseInt($(item).parent().next().next().next().next().next().next().next().children().first().val().replace(/,/g, ""))
						  //-> 남은 금액
						  insertData.modal_vatmemo = parseInt($(item).parent().next().next().next().next().next().next().next().next().children().first().val().replace(/,/g, "")) - parseInt($(item).parent().next().next().next().next().next().next().next().children().first().val().replace(/,/g, ""))
						  insertData.modal_vatmemo_secound = (parseInt($(item).parent().next().next().next().next().next().next().next().next().children().first().val().replace(/,/g, "")) - parseInt($(item).parent().next().next().next().next().next().next().next().children().first().val().replace(/,/g, "")));
	
						  //-> 받을 금액과 받은 금액 합
						  insertData.modal_receive_data = parseInt($(item).parent().next().next().next().next().next().next().children().first().val().replace(/,/g, "")) + parseInt($(item).parent().next().next().next().next().next().next().next().children().first().val().replace(/,/g, ""));  
	
						  //swc_bacledger의 차액, 차액에 대한 메모
						  insertData.difference_price = parseInt($('#difference_price').val().replace(/,/g, ""))
						  insertData.difference_memo = $('#received_price_detail').val()
				  		
			  			$.ajax({
			  				url: "${path}/acc/bacCheckConnect.do",
			  				method: "post",
			  				data: insertData,
			  				async: false,
			  				dataType: "json"
			  			});
			  			//modal_vatmemo
			  		 	$.ajax({
			  				url: "${path}/acc/bacCheckConnect_modal_update.do",
			  				method: "post",
			  				data: insertData,
			  				async: false,
			  				dataType: "json"
			  			}); 
			  		 	$.ajax({
			  				url: "${path}/acc/bacCheckConnect_modal_baclogId_memo.do",
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
<style>
	.modal-content {
    width: 100%;
}
</style>