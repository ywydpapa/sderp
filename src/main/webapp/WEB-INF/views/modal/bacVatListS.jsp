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
		<div class="page-header2">
			<div class="row align-items-end">
				<div class="col-lg-12">
					<div class="page-header-title" style="float:left;">
						<div style="margin-top:15px;">
							<h6 style="font-weight:600;">매입/매출 검색</h6>
						</div>
					</div>
					<div class="btn_wr" style="float:right;">
						<!-- hide and show -->
						<button class="btn btn-sm btn-success" id="fold_modal" onclick="acordian_action_modal()">펼치기</button>
						<button class="btn btn-sm btn-success" id="fold2_modal" onclick="acordian_action1_modal()" style="display:none;">접기</button>
						<!-- hide and show -->
						<button class="btn btn-sm btn-primary" onClick="javascript:fnListcon_modal()"><i class="icofont icofont-search"></i>검색</button>
					</div>
				</div>
			</div>
		</div>
		<div class="cnt_wr" id="acordian_modal" style="display:none;">
			<div class="row">
				<form id="searchForm_modal" method="post" onsubmit="return false;" class="col-sm-12">
				<div class="col-sm-12">
					<div class="card_box sch_it">
						<div class="form-group row">
							<div class="col-sm-12 col-xl-2">
								<label class="col-form-label">거래처</label>
								<input type="text" class="form-control form-control-sm" id="custName_modal" name="" placeholder="" value="">
							</div>
							<div class="col-sm-12 col-xl-3">
								<label class="col-form-label">기간</label>
								<p class="input_inline">
									<input class="form-control form-control-sm col-xl-6" type="date" max="9999-12-30" pattern="yyyy-" id="regSDate_modal"> ~ <input class="form-control form-control-sm col-xl-6" type="date" max="9999-12-31" id="regEDate_modal">
								</p>
							</div>
						</div>	
					</div>
				</div>
				</form>
			</div>
		</div>

<div class="dt-responsive table-responsive">
<input type="hidden" id="baclogId_NUM" value="${baclogId}">
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
	    </tbody>
    </table>
    <div id="pageDiv_modal" style="float: right;"></div>
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
	tableHtml += "<input id='received_price' class='form-control' style='border: 1px solid #ccc;' type='text' value='"+sum_modal.toLocaleString("en-US")+"'/>"
	tableHtml2 += "<input id='difference_price' class='form-control' style='border: 1px solid #ccc;' type='text' value='"+difference_price_sub.toLocaleString("en-US")+"'/>"
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
    
    //test===========================================================================================================================================================================================
    	
    	//document.ready pagenation
  		var pageListNum = 15;
   		var counter = 0;
	    <!--//리스트 table-->
		$(document).ready(function(){
			
			var selectData = {};
			var pageCheck = {};
			var vatlistTable = $("#vatlistTable tbody");
			var table_test = $("#table_test tbody");
			var pageDiv_modal = $("#pageDiv_modal");
			var tableHtml = "";
			var table_sub_Html = "";
			var pageHtml = "";
			var pageNation = 10;
			var pageFirstBetween = 0;

				selectData.betFirstNum = pageFirstBetween;
				selectData.betLastNum = pageListNum;
				selectData.baclogId = $('#baclogId_NUM').val();
				
				$.ajax({
					url: "${path}/acc/modalVatS.do",
					method: "get",
					data: selectData,
					dataType: "json",
				})
				.done(function(result){
					if(result.data.length > 0){
						for(var i = 0; i < result.data.length; i++){
							
							tableHtml += "<tr><td style='text-align:center;vertical-align:middle;'><input type='checkbox' class='form-control' id='checkSerial' data-number='" + result.data[i].vatSerial + "' data-code='" + result.data[i].modal_vatmemo + "'></td><td style='text-align:center;vertical-align:middle;'>" 
							+ result.data[i].vatIssueDate + "</td>";
							
							if(result.data[i].custName == '' || result.data[i].custName == null || result.data[i].custName == 'null'){
								tableHtml += "<td style='text-align:right;vertical-align:middle;'>미등록업체</td>"
							}else {
								tableHtml += "<td style='text-align:right;vertical-align:middle;'>" + result.data[i].custName + "</td>"
							}
							tableHtml += "<td style='text-align:right;vertical-align:middle;'>"
						 	+ result.data[i].test.toLocaleString("en-US") + "</td><td style='text-align:right;vertical-align:middle;'>"
						 	+ result.data[i].vatProductName + "</td><td style='text-align:center;vertical-align:middle;'>"
						 	+ result.data[i].vatRemark + "</td><td style='text-align:center;vertical-align:middle;'><input type='text' class='form-control-sm' id='' style='border: 1px solid #ccc;' onkeyup='inputNumberFormat(this)' value='"
						 	+ result.data[i].modal_receive_data.toLocaleString("en-US") + "'></td><td style='text-align:center;vertical-align:middle;'><input type='text' class='form-control-sm' id='' style='border: 1px solid #ccc;' onkeyup='inputNumberFormat(this)' value='"
						 	+ result.data[i].modal_vatmemo + "'></td><td style='text-align:center;vertical-align:middle;'><input type='text' class='form-control-sm' id='modal_vatmemo' style='border: 1px solid #ccc;' onkeyup='inputNumberFormat(this)' value='"
						 	+ result.data[i].modal_vatmemo + "' disabled></td><td style='text-align:right;vertical-align:middle;'>"
						 	+ result.data[i].vatSerial + "</td></tr>";
							
						}
						vatlistTable.html(tableHtml);
					}else{
						vatlistTable.html("");
					}
					if(result.data_secound.length > 0){
						for(var i = 0; i < result.data_secound.length; i++){
							table_sub_Html += "<input id='difference_price_sub' class='form-control-sm' style='border: 1px solid #ccc;' type='hidden' value='" + result.data_secound[i].difference_price.toLocaleString("en-US") + "'>"
							+ "<tr><td><input id='original_price' class='form-control' style='border: 1px solid #ccc;' type='text' value='" + result.data_secound[i].inAmt.toLocaleString("en-US") + "'></td>";
							if(result.data_secound[i].received_price == '' || result.data_secound[i].received_price == null || result.data_secound[i].received_price == 'null'){
								table_sub_Html += "<td id='test'><input id='received_price' class='form-control' style='border: 1px solid #ccc;' type='text' value='0'></td>"
							}else {
								table_sub_Html += "<td id='test'><input id='received_price' class='form-control' style='border: 1px solid #ccc;' type='text' value='" + result.data_secound[i].received_price + "'></td>"
							}
							table_sub_Html += "<td id='test2'><input id='difference_price' class='form-control' style='border: 1px solid #ccc;' type='text' value='" + result.data_secound[i].difference_price.toLocaleString("en-US") + "'></td>"
							if(result.data_secound[i].difference_memo == '' || result.data_secound[i].difference_memo == null || result.data_secound[i].difference_memo == 'null'){
								table_sub_Html += "<td><input id='received_price_detail' class='form-control' style='border: 1px solid #ccc; display: none;' type='text' value=''></td></tr>";
							}else {
								table_sub_Html += "<td><input id='received_price_detail' class='form-control' style='border: 1px solid #ccc; display: none;' type='text' value='" + result.data_secound[i].difference_memo + "'></td></tr>";
							}
						}
						table_test.html(table_sub_Html);
					}else{
						table_test.html("");
					}
					
				})
				var origin_page_Num = (localStorage.getItem("lastpageNum")+1)/100;
				var endpageNum = Math.ceil(origin_page_Num)*10;
				var startpageNum = Math.floor(origin_page_Num)*10;
				counter = Math.floor(origin_page_Num);
				
				$.ajax({
					url: "${path}/acc/modalVatSCnt.do",
					method: "post",
					dataType: "json",
					success:function(data){
						if(data.resultCount > 0){
							var count = parseInt(data.resultCount/pageListNum);
							var countRe = parseInt(data.resultCount/pageListNum);

							pageHtml = "";
							pageHtml += "<ul class='pagination'><li class='page-item'><a class='page-link' href='#' onClick='pagePrevious_sub(this);'>Previous</a></li>";
							
							 if(count > pageNation){
								for(var j = startpageNum+1; j <= endpageNum; j++){
									if(j <= count+1){
										pageHtml += "<li class='page-item' id='"+ j +"'><a class='page-link' href='#' onClick='pageClick_sub(this);'>" + j + "</a></li>";	
									}
								}
								pageHtml += "<li class='page-item'><a class='page-link' href='#' onClick='pageNext_sub(this);'>Next</a></li></ul>";
							}else{
								if(countRe > 0){
									countRe = countRe + 1;
								}else{
									countRe = 0;
								}
								
								for(var j = 1; j <= countRe; j++){
									pageHtml += "<li class='page-item'><a class='page-link' href='#' onClick='pageClick_sub(this);'>" + j + "</a></li>";
								}
							} 
							
							pageDiv_modal.html(pageHtml);
						}else{
							pageDiv_modal.empty();
						}
					}
				}); 
			});
			//document.ready pagenation	
		
  			//페이지 클릭이벤트
  			function pageClick_sub(e){
			var selectData = {};
			var pageCheck = {};
			var vatlistTable = $("#vatlistTable tbody");
			var pageDiv_modal = $("#pageDiv_modal");
			var tableHtml = "";
			var pageNation = 10;
			var pageSetNum = pageListNum * (parseInt($(e).html()) - 1);
			var pagememoryNum = (pageSetNum/15)
			vatlistTable.html("");

			if($('#custName_modal').val() != '' || $('#custName_modal').val() != null){
				selectData.custName_modal = $('#custName_modal').val();
			}
			if($('#regSDate_modal').val() != '' || $('#regSDate_modal').val() != null){
				selectData.regSDate_modal = $('#regSDate_modal').val();
			}
			if($('#regEDate_modal').val() != '' || $('#regEDate_modal').val() != null){
				selectData.regEDate_modal = $('#regEDate_modal').val();
			}
			
			selectData.betFirstNum = pageSetNum;
			selectData.betLastNum = pageListNum;
			selectData.compNo = $('#compNo_hidden').val();
			
			$.ajax({
				url: "${path}/acc/modalVatS.do",
				method: "get",
				dataType: "json",
				data: selectData,
			})
			.done(function(result){
				if(result.data.length > 0){
					for(var i = 0; i < result.data.length; i++){
						
						tableHtml += "<tr><td style='text-align:center;vertical-align:middle;'><input type='checkbox' class='form-control' id='checkSerial' data-number='" + result.data[i].vatSerial + "' data-code='" + result.data[i].modal_vatmemo + "'></td><td style='text-align:center;vertical-align:middle;'>" 
						+ result.data[i].vatIssueDate + "</td>";
						
						if(result.data[i].custName == '' || result.data[i].custName == null || result.data[i].custName == 'null'){
							tableHtml += "<td style='text-align:right;vertical-align:middle;'>미등록업체</td>"
						}else {
							tableHtml += "<td style='text-align:right;vertical-align:middle;'>" + result.data[i].custName + "</td>"
						}
						tableHtml += "<td style='text-align:right;vertical-align:middle;'>"
					 	+ result.data[i].test.toLocaleString("en-US") + "</td><td style='text-align:right;vertical-align:middle;'>"
					 	+ result.data[i].vatProductName + "</td><td style='text-align:center;vertical-align:middle;'>"
					 	+ result.data[i].vatRemark + "</td><td style='text-align:center;vertical-align:middle;'><input type='text' class='form-control-sm' id='' style='border: 1px solid #ccc;' onkeyup='inputNumberFormat(this)' value='"
					 	+ result.data[i].modal_receive_data.toLocaleString("en-US") + "'></td><td style='text-align:center;vertical-align:middle;'><input type='text' class='form-control-sm' id='' style='border: 1px solid #ccc;' onkeyup='inputNumberFormat(this)' value='"
					 	+ result.data[i].modal_vatmemo + "'></td><td style='text-align:center;vertical-align:middle;'><input type='text' class='form-control-sm' id='modal_vatmemo' style='border: 1px solid #ccc;' onkeyup='inputNumberFormat(this)' value='"
					 	+ result.data[i].modal_vatmemo + "' disabled></td><td style='text-align:right;vertical-align:middle;'>"
					 	+ result.data[i].vatSerial + "</td></tr>";
						
					}
					vatlistTable.html(tableHtml);
				}else{
					vatlistTable.html("");
				}
				
				vatlistTable.html(tableHtml);
			})
			
			$.ajax({
				url: "${path}/acc/modalVatSCnt.do",
				method: "post",
				data: selectData,
				dataType: "json",
				
				success:function(data){
					console.log(data.resultCount);
					if(data.resultCount > 0){
						var count = parseInt(data.resultCount/pageListNum);
						var countRe = parseInt(data.resultCount/pageListNum);
						var hide_next_button = counter*10;
						pageHtml = "";
						pageHtml += "<ul class='pagination'><li class='page-item'><a class='page-link' href='#' onClick='pagePrevious_sub(this);'>Previous</a></li>";
						
						if(count > pageNation){
							for(var j = 1+counter*10; j <= pageNation*(counter+1); j++){
								if(j <= count+1){
									pageHtml += "<li class='page-item' id='"+ j +"'><a class='page-link' href='#' onClick='pageClick_sub(this);'>" + j + "</a></li>";	
								}
							}
							if(hide_next_button+10 < count){
								pageHtml += "<li class='page-item'><a class='page-link' href='#' onClick='pageNext_sub(this);'>Next</a></li></ul>";
							}
						}else{
							if(countRe > 0){
								countRe = countRe + 1;
							}else{
								countRe = 0;
							}
							
							for(var j = 1; j <= countRe; j++){
								pageHtml += "<li class='page-item'><a class='page-link' href='#' onClick='pageClick_sub(this);'>" + j + "</a></li>";
							} 
						}
						
						pageDiv_modal.html(pageHtml);
					}else{
						pageDiv_modal.empty();
					}
				}
			}); 
		}	
  		//페이지 클릭이벤트
  			
		//페이지 pre 이벤트
  		function pagePrevious_sub(e){
			if(counter != 0){
			counter--;
			var selectData = {};
			var pageCheck = {};
			var vatlistTable = $("#vatlistTable tbody");
			var pageDiv_modal = $("#pageDiv_modal");
			var tableHtml = "";
			var pageHtml = "";
			var pageNation = 10;
			var pageFirstBetween = 0;
			vatlistTable.empty();
			pageDiv_modal.empty();
			
			if($('#custName_modal').val() != '' || $('#custName_modal').val() != null){
				selectData.custName_modal = $('#custName_modal').val();
			}
			if($('#regSDate_modal').val() != '' || $('#regSDate_modal').val() != null){
				selectData.regSDate_modal = $('#regSDate_modal').val();
			}
			if($('#regEDate_modal').val() != '' || $('#regEDate_modal').val() != null){
				selectData.regEDate_modal = $('#regEDate_modal').val();
			}
			
			selectData.betFirstNum = counter*150;
			selectData.betLastNum = pageListNum;
			selectData.compNo = $('#compNo_hidden').val();
			
			$.ajax({
				url: "${path}/acc/modalVatS.do",
				method: "get",
				dataType: "json",
				data: selectData,
			})
			.done(function(result){
				if(result.data.length > 0){
					for(var i = 0; i < result.data.length; i++){
						
						tableHtml += "<tr><td style='text-align:center;vertical-align:middle;'><input type='checkbox' class='form-control' id='checkSerial' data-number='" + result.data[i].vatSerial + "' data-code='" + result.data[i].modal_vatmemo + "'></td><td style='text-align:center;vertical-align:middle;'>" 
						+ result.data[i].vatIssueDate + "</td>";
						
						if(result.data[i].custName == '' || result.data[i].custName == null || result.data[i].custName == 'null'){
							tableHtml += "<td style='text-align:right;vertical-align:middle;'>미등록업체</td>"
						}else {
							tableHtml += "<td style='text-align:right;vertical-align:middle;'>" + result.data[i].custName + "</td>"
						}
						tableHtml += "<td style='text-align:right;vertical-align:middle;'>"
					 	+ result.data[i].test.toLocaleString("en-US") + "</td><td style='text-align:right;vertical-align:middle;'>"
					 	+ result.data[i].vatProductName + "</td><td style='text-align:center;vertical-align:middle;'>"
					 	+ result.data[i].vatRemark + "</td><td style='text-align:center;vertical-align:middle;'><input type='text' class='form-control-sm' id='' style='border: 1px solid #ccc;' onkeyup='inputNumberFormat(this)' value='"
					 	+ result.data[i].modal_receive_data.toLocaleString("en-US") + "'></td><td style='text-align:center;vertical-align:middle;'><input type='text' class='form-control-sm' id='' style='border: 1px solid #ccc;' onkeyup='inputNumberFormat(this)' value='"
					 	+ result.data[i].modal_vatmemo + "'></td><td style='text-align:center;vertical-align:middle;'><input type='text' class='form-control-sm' id='modal_vatmemo' style='border: 1px solid #ccc;' onkeyup='inputNumberFormat(this)' value='"
					 	+ result.data[i].modal_vatmemo + "' disabled></td><td style='text-align:right;vertical-align:middle;'>"
					 	+ result.data[i].vatSerial + "</td></tr>";
						
					}
					vatlistTable.html(tableHtml);
				}else{
					vatlistTable.html("");
				}
				
			})
			
			$.ajax({
				url: "${path}/acc/modalVatSCnt.do",
				method: "post",
				data: selectData,
				dataType: "json",
				success:function(data){
					console.log(data.resultCount);
					if(data.resultCount > 0){
						var count = parseInt(data.resultCount/pageListNum);
						var countRe = parseInt(data.resultCount/pageListNum);
						pageHtml = "";
						pageHtml += "<ul class='pagination'><li class='page-item'><a class='page-link' href='#' onClick='pagePrevious_sub(this);'>Previous</a></li>";
						
						if(count > pageNation){
							for(var j = 1+counter*10; j <= pageNation*(counter+1); j++){
								if(j == 1+counter*10){
									pageHtml += "<li class='page-item active' id='"+ j +"'><a class='page-link' href='#' onClick='pageClick_sub(this);'>" + j + "</a></li>";
								}else{
									pageHtml += "<li class='page-item' id='"+ j +"'><a class='page-link' href='#' onClick='pageClick_sub(this);'>" + j + "</a></li>";
								}
							}
							pageHtml += "<li class='page-item'><a class='page-link' href='#' onClick='pageNext_sub(this);'>Next</a></li></ul>";
						}else{
							if(countRe > 0){
								countRe = countRe + 1;
							}else{
								countRe = 0;
							}
							
							for(var j = 1; j <= countRe; j++){
								pageHtml += "<li class='page-item'><a class='page-link' href='#' onClick='pageClick_sub(this);'>" + j + "</a></li>";
							}
						}
						
						pageDiv_modal.html(pageHtml);
					}else{
						pageDiv_modal.empty();
					}
				}
			}); 
			
			setTimeout(function(){
				$.LoadingOverlay("hide", true);
			}, 1000);
			}
		}	
		//페이지 pre 이벤트
  		
		
		//페이지 next 이벤트
		function pageNext_sub(e){
			counter++;
			var selectData = {};
			var pageCheck = {};
			var vatlistTable = $("#vatlistTable tbody");
			var pageDiv_modal = $("#pageDiv_modal");
			var tableHtml = "";
			var pageHtml = "";
			var pageNation = 10;
			var pageFirstBetween = 0;
			vatlistTable.empty();
			pageDiv_modal.empty();
			
			if($('#custName_modal').val() != '' || $('#custName_modal').val() != null){
				selectData.custName_modal = $('#custName_modal').val();
			}
			if($('#regSDate_modal').val() != '' || $('#regSDate_modal').val() != null){
				selectData.regSDate_modal = $('#regSDate_modal').val();
			}
			if($('#regEDate_modal').val() != '' || $('#regEDate_modal').val() != null){
				selectData.regEDate_modal = $('#regEDate_modal').val();
			}
			
			selectData.betFirstNum = counter*150;
			selectData.betLastNum = pageListNum;		
			selectData.compNo = $('#compNo_hidden').val();
			
			$.ajax({
				url: "${path}/acc/modalVatS.do",
				method: "get",
				dataType: "json",
				data: selectData
			})
			.done(function(result){
				if(result.data.length > 0){
					for(var i = 0; i < result.data.length; i++){
						
						tableHtml += "<tr><td style='text-align:center;vertical-align:middle;'><input type='checkbox' class='form-control' id='checkSerial' data-number='" + result.data[i].vatSerial + "' data-code='" + result.data[i].modal_vatmemo + "'></td><td style='text-align:center;vertical-align:middle;'>" 
						+ result.data[i].vatIssueDate + "</td>";
						
						if(result.data[i].custName == '' || result.data[i].custName == null || result.data[i].custName == 'null'){
							tableHtml += "<td style='text-align:right;vertical-align:middle;'>미등록업체</td>"
						}else {
							tableHtml += "<td style='text-align:right;vertical-align:middle;'>" + result.data[i].custName + "</td>"
						}
						tableHtml += "<td style='text-align:right;vertical-align:middle;'>"
					 	+ result.data[i].test.toLocaleString("en-US") + "</td><td style='text-align:right;vertical-align:middle;'>"
					 	+ result.data[i].vatProductName + "</td><td style='text-align:center;vertical-align:middle;'>"
					 	+ result.data[i].vatRemark + "</td><td style='text-align:center;vertical-align:middle;'><input type='text' class='form-control-sm' id='' style='border: 1px solid #ccc;' onkeyup='inputNumberFormat(this)' value='"
					 	+ result.data[i].modal_receive_data.toLocaleString("en-US") + "'></td><td style='text-align:center;vertical-align:middle;'><input type='text' class='form-control-sm' id='' style='border: 1px solid #ccc;' onkeyup='inputNumberFormat(this)' value='"
					 	+ result.data[i].modal_vatmemo + "'></td><td style='text-align:center;vertical-align:middle;'><input type='text' class='form-control-sm' id='modal_vatmemo' style='border: 1px solid #ccc;' onkeyup='inputNumberFormat(this)' value='"
					 	+ result.data[i].modal_vatmemo + "' disabled></td><td style='text-align:right;vertical-align:middle;'>"
					 	+ result.data[i].vatSerial + "</td></tr>";
						
					}
					vatlistTable.html(tableHtml);
				}else{
					vatlistTable.html("");
				}
			})
			
			$.ajax({
				url: "${path}/acc/modalVatSCnt.do",
				method: "post",
				data: selectData,
				dataType: "json",
				success:function(data){
					console.log(data.resultCount);
					if(data.resultCount > 0){
						var count = parseInt(data.resultCount/pageListNum);
						var countRe = parseInt(data.resultCount/pageListNum);
						var hide_next_button = counter*10
						pageHtml = "";
						pageHtml += "<ul class='pagination'><li class='page-item'><a class='page-link' href='#' onClick='pagePrevious_sub(this);'>Previous</a></li>";
						
						if(count > pageNation){
							for(var j = 1+counter*10; j <= pageNation*(counter+1); j++){
								if(j <= count+1){
									if(j == 1+counter*10){
										pageHtml += "<li class='page-item active' id='"+ j +"'><a class='page-link' href='#' onClick='pageClick_sub(this);'>" + j + "</a></li>";
									}else{
										pageHtml += "<li class='page-item' id='"+ j +"'><a class='page-link' href='#' onClick='pageClick_sub(this);'>" + j + "</a></li>";	
									}
								}
							}
							if(hide_next_button+10 < count){
								pageHtml += "<li class='page-item'><a class='page-link' href='#' onClick='pageNext_sub(this);'>Next</a></li></ul>";
							}
						}else{
							if(countRe > 0){
								countRe = countRe + 1;
							}else{
								countRe = 0;
							}
							
							for(var j = 1; j <= countRe; j++){
								pageHtml += "<li class='page-item'><a class='page-link' href='#' onClick='pageClick(this);'>" + j + "</a></li>";
							}
						}
						
						pageDiv_modal.html(pageHtml);
					}else{
						pageDiv_modal.empty();
					}
				}
			}); 
			
			setTimeout(function(){
				$.LoadingOverlay("hide", true);
			}, 1000);
		};
		//페이지 next 이벤트
		
		//검색 시 페이지네이션
		function fnListcon_modal(){
			counter = 0;
			var selectData = {};
			var pageCheck = {};
			var vatlistTable = $("#vatlistTable tbody");
			var table_test = $("#table_test tbody");
			var pageDiv_modal = $("#pageDiv_modal");
			var tableHtml = "";
			var table_sub_Html = "";
			var pageHtml = "";
			var pageNation = 10;
			var pageFirstBetween = 0;
				
				if($('#custName_modal').val() != '' || $('#custName_modal').val() != null){
					selectData.custName_modal = $('#custName_modal').val();
				}
				if($('#regSDate_modal').val() != '' || $('#regSDate_modal').val() != null){
					selectData.regSDate_modal = $('#regSDate_modal').val();
				}
				if($('#regEDate_modal').val() != '' || $('#regEDate_modal').val() != null){
					selectData.regEDate_modal = $('#regEDate_modal').val();
				}
				
				selectData.betFirstNum = pageFirstBetween;
				selectData.betLastNum = pageListNum;
				selectData.baclogId = $('#baclogId_NUM').val();
				
				$.ajax({
					url: "${path}/acc/modalVatS.do",
					method: "get",
					data: selectData,
					dataType: "json",
				})
				.done(function(result){
					if(result.data.length > 0){
						for(var i = 0; i < result.data.length; i++){
							
							tableHtml += "<tr><td style='text-align:center;vertical-align:middle;'><input type='checkbox' class='form-control' id='checkSerial' data-number='" + result.data[i].vatSerial + "' data-code='" + result.data[i].modal_vatmemo + "'></td><td style='text-align:center;vertical-align:middle;'>" 
							+ result.data[i].vatIssueDate + "</td>";
							
							if(result.data[i].custName == '' || result.data[i].custName == null || result.data[i].custName == 'null'){
								tableHtml += "<td style='text-align:right;vertical-align:middle;'>미등록업체</td>"
							}else {
								tableHtml += "<td style='text-align:right;vertical-align:middle;'>" + result.data[i].custName + "</td>"
							}
							tableHtml += "<td style='text-align:right;vertical-align:middle;'>"
						 	+ result.data[i].test.toLocaleString("en-US") + "</td><td style='text-align:right;vertical-align:middle;'>"
						 	+ result.data[i].vatProductName + "</td><td style='text-align:center;vertical-align:middle;'>"
						 	+ result.data[i].vatRemark + "</td><td style='text-align:center;vertical-align:middle;'><input type='text' class='form-control-sm' id='' style='border: 1px solid #ccc;' onkeyup='inputNumberFormat(this)' value='"
						 	+ result.data[i].modal_receive_data.toLocaleString("en-US") + "'></td><td style='text-align:center;vertical-align:middle;'><input type='text' class='form-control-sm' id='' style='border: 1px solid #ccc;' onkeyup='inputNumberFormat(this)' value='"
						 	+ result.data[i].modal_vatmemo + "'></td><td style='text-align:center;vertical-align:middle;'><input type='text' class='form-control-sm' id='modal_vatmemo' style='border: 1px solid #ccc;' onkeyup='inputNumberFormat(this)' value='"
						 	+ result.data[i].modal_vatmemo + "' disabled></td><td style='text-align:right;vertical-align:middle;'>"
						 	+ result.data[i].vatSerial + "</td></tr>";
							
						}
						vatlistTable.html(tableHtml);
					}else{
						vatlistTable.html("");
					}
					if(result.data_secound.length > 0){
						for(var i = 0; i < result.data_secound.length; i++){
							table_sub_Html += "<input id='difference_price_sub' class='form-control-sm' style='border: 1px solid #ccc;' type='hidden' value='" + result.data_secound[i].difference_price.toLocaleString("en-US") + "'>"
							+ "<tr><td><input id='original_price' class='form-control' style='border: 1px solid #ccc;' type='text' value='" + result.data_secound[i].outAmt.toLocaleString("en-US") + "'></td>";
							if(result.data_secound[i].received_price == '' || result.data_secound[i].received_price == null || result.data_secound[i].received_price == 'null'){
								table_sub_Html += "<td id='test'><input id='received_price' class='form-control' style='border: 1px solid #ccc;' type='text' value='0'></td>"
							}else {
								table_sub_Html += "<td id='test'><input id='received_price' class='form-control' style='border: 1px solid #ccc;' type='text' value='" + result.data_secound[i].received_price + "'></td>"
							}
							table_sub_Html += "<td id='test2'><input id='difference_price' class='form-control' style='border: 1px solid #ccc;' type='text' value='" + result.data_secound[i].difference_price.toLocaleString("en-US") + "'></td>"
							if(result.data_secound[i].difference_memo == '' || result.data_secound[i].difference_memo == null || result.data_secound[i].difference_memo == 'null'){
								table_sub_Html += "<td><input id='received_price_detail' class='form-control' style='border: 1px solid #ccc; display: none;' type='text' value=''></td></tr>";
							}else {
								table_sub_Html += "<td><input id='received_price_detail' class='form-control' style='border: 1px solid #ccc; display: none;' type='text' value='" + result.data_secound[i].difference_memo + "'></td></tr>";
							}
						}
						table_test.html(table_sub_Html);
					}else{
						table_test.html("");
					}
					
				})
				var origin_page_Num = (localStorage.getItem("lastpageNum")+1)/100;
				var endpageNum = Math.ceil(origin_page_Num)*10;
				var startpageNum = Math.floor(origin_page_Num)*10;
				counter = Math.floor(origin_page_Num);
				
				$.ajax({
					url: "${path}/acc/modalVatSCnt.do",
					method: "post",
					data: selectData,
					dataType: "json",
					success:function(data){
						if(data.resultCount > 0){
							var count = parseInt(data.resultCount/pageListNum);
							var countRe = parseInt(data.resultCount/pageListNum);

							pageHtml = "";
							pageHtml += "<ul class='pagination'><li class='page-item'><a class='page-link' href='#' onClick='pagePrevious_sub(this);'>Previous</a></li>";
							
							 if(count > pageNation){
								for(var j = startpageNum+1; j <= endpageNum; j++){
									if(j <= count+1){
										pageHtml += "<li class='page-item' id='"+ j +"'><a class='page-link' href='#' onClick='pageClick_sub(this);'>" + j + "</a></li>";	
									}
								}
								pageHtml += "<li class='page-item'><a class='page-link' href='#' onClick='pageNext_sub(this);'>Next</a></li></ul>";
							}else{
								if(countRe > 0){
									countRe = countRe + 1;
								}else{
									countRe = 0;
								}
								
								for(var j = 1; j <= countRe; j++){
									pageHtml += "<li class='page-item'><a class='page-link' href='#' onClick='pageClick_sub(this);'>" + j + "</a></li>";
								}
							} 
							
							pageDiv_modal.html(pageHtml);
						}else{
							pageDiv_modal.empty();
						}
					}
				}); 
		}
		//검색 시 페이지네이션
		
		//모달 검색 아코디언
  		function acordian_action_modal(){
		if($("#acordian_modal").css("display") == "none"){
		    $("#acordian_modal").show();
		    $("#fold_modal").hide();
		    $("#fold2_modal").show();

		} else {
		    $("#acordian_modal").hide();
		    $("#fold_modal").show();
		}
		}
		function acordian_action1_modal(){
			if($("#acordian_modal").css("display") != "none"){
			    $("#acordian_modal").hide();
			    $("#fold_modal").show();
			    $("#fold2_modal").hide();
	
			} else {
			    $("#acordian_modal").show();
			    $("#fold_modal").hide();
			}
		}
		//모달 검색 아코디언
		
		//모달 date 세팅
		$("#regSDate_modal").change(function(){
			var dateValue = $(this).val();
			var dateValueArr = dateValue.split("-");
			var dateValueCom = new Date(dateValueArr[0], parseInt(dateValueArr[1])-1, dateValueArr[2]);
			var EdateValue = $("#regEDate_modal").val();
			var EdateDateArr = EdateValue.split("-");
			var EdateDateCom = new Date(EdateDateArr[0], parseInt(EdateDateArr[1])-1, EdateDateArr[2]);
			
			
			if(EdateValue == ""){
				dateValueCom.setDate(dateValueCom.getDate()+1);
			}else if(dateValueCom.getTime() > EdateDateCom.getTime()){
				alert("시작일이 종료일보다 클 수 없습니다.");
				dateValueCom.setDate(dateValueCom.getDate()+1);
			}else{
				return null;
			}
			
			var year = dateValueCom.getFullYear();
			var month = dateValueCom.getMonth()+1;
			var day = dateValueCom.getDate();
			
			if(month < 10){
				month = "0" + month;
			}
			
			console.log(month);
			if(day < 10){
				day = "0" + day;
			}
			
			$("#regEDate_modal").val(year + "-" + month + "-" + day);
		});
		$("#regEDate_modal_modal").change(function(){
			var SdateValue = $("#regSDate_modal").val();
			var SdateValueArr = SdateValue.split("-");
			var SdateValueCom = new Date(SdateValueArr[0], parseInt(SdateValueArr[1])-1, SdateValueArr[2]);
			var thisDateValue = $(this).val();
			var thisDateArr = thisDateValue.split("-");
			var thisDateCom = new Date(thisDateArr[0], parseInt(thisDateArr[1])-1, thisDateArr[2]);
			
			if(SdateValue == ""){
				thisDateCom.setDate(thisDateCom.getDate()-1);
			}else if(SdateValueCom.getTime() > thisDateCom.getTime()){
				alert("종료일이 시작일보다 작을 수 없습니다.");
				thisDateCom.setDate(thisDateCom.getDate()-1);
			}else{
				return null;
			}
			
			var year = thisDateCom.getFullYear();
			var month = thisDateCom.getMonth()+1;
			var day = thisDateCom.getDate();
			
			if(month < 10){
				month = "0" + month;
			}
			
			if(day < 10){
				day = "0" + day;
			}
			
			$("#regSDate_modal").val(year + "-" + month + "-" + day);
		});
		//모달 date 세팅
		
		var lastTab = localStorage.getItem('lastTab');
		var lastpageNum = localStorage.getItem('lastpageNum');
	        
		if (lastTab) {
			$('[href="'+ lastTab + lastpageNum +'"]').tab('show');
		}
    
</script>
<style>
	.modal-content {
    width: 100%;
}
</style>