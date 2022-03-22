<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<form name="form2" method="post" onsubmit="return false;">
	<div style="width:100%;">
		<div style="float:right; margin-bottom:10px;">
			<button type="button" class="btn btn-primary" id="bodyAddBtn">추가하기</button>
		</div>
		<div style="float:right; margin-right:10px; margin-top:5px;">
			<input type="text" class="form-control" id="addNum" placeholder="만들 갯수 입력(ex:5)" value="1" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
		</div>
	</div>
    <table class="table table-sm bst02" id="billTableFirst" style="margin-bottom: 1%;">
    	<colgroup>
            <col width="3%" />
            <col width="5%" />
            <col width="25%" />
            <col width="15%" />
            <col width="25%" />
            <col width="9%" />
            <col width="9%" />
            <col width="9%" />
        </colgroup>
        <thead>
	        <tr>
	        	<th class="text-center">번호</th>
	            <th class="text-center">발행요청일</th>
	            <th class="text-center">승인번호</th>
	            <th class="text-center">거래처</th>
	            <th class="text-center">품목명</th>
	            <th class="text-center">공급가</th>
	            <th class="text-center">세액</th>
	            <th class="text-center">합계금액</th>
	            
	        </tr>
        </thead>
        <tbody></tbody>
    </table>
    <table class="table table-sm bst02" id="billTableSecond">
    	<colgroup>
           	<col width="3%" />
           	<col width="5%" />
           	<col width="5%" />
           	<col width="5%" />
            <col width="10%" />
            <col width="16%" />
            <col width="30%" />
            <col width="30%" />
        </colgroup>
        <thead>
	        <tr>
	        	<th class="text-center">번호</th>
	        	<th class="text-center">발행일</th>
	        	<th class="text-center">거래일</th>
	        	<th class="text-center">전송일자</th>
	        	<th class="text-center">발급유형</th>
	            <th class="text-center">상대처 이메일</th>
	            <th class="text-center">품목비고</th>
	            <th class="text-center">메모</th>
	        </tr>
        </thead>
        <tbody></tbody>
    </table>
    <div class="text-right mt-3">
		<button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/cont/list.do'">계약목록</button>
		<button type="button" class="btn btn-md btn-primary" onclick="fn_billItemInsert();">생성하기</button>
	</div>
    <div class="modal fade " id="billCustModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-80size" role="document">
            <div class="modal-content modal-80size">
                <div class="modal-header">
                    <h4 class="modal-title">거래처 목록</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</form>

<script>
    $(document).ready(function(){
    	var nowDate = new Date();
    	var tableBodyFirst = $("#billTableFirst tbody");
		var tableBodySecond = $("#billTableSecond tbody");
		
    	nowDate = nowDate.toISOString().slice(0, 10);
    	
    	$("#bodyAddBtn").click(function(){
    		var number = $("#addNum").val();
    		var bodyHtmlFirst = "";
    		var bodyHtmlSecond = "";

    		if(number < 1){
    			alert("갯수가 1보다 작을 수 없습니다.");
    			return false;
    		}else{
    			tableBodyFirst.empty();
    			tableBodySecond.empty();
	    		
	    		for(var i = 1; i <= number; i++){
	    			bodyHtmlFirst += "<tr><td class='text-center'>" + i + "</td>"
	    			+ "<td><input type='date' class='form-control' max='9999-12-30' id='billBodyDate_" + i + "' name='billBodyDate_" + i + "' value='" + nowDate + "'></td>"
	    			+ "<td><input type='text' class='form-control form-control-sm' id='billBodySerial_" + i + "' style='min-width: 80px;' /></td>"
	    			+ "<td><div class='input-group input-group-sm mb-0'><input type='text' class='form-control' name='custName_" + i + "' id='custName_" + i + "' readonly><input type='hidden' id='custNo_" + i + "'/><input type='hidden' id='custVatNo_" + i + "'/>" 
	    			+ "<span class='input-group-btn'><button class='btn btn-primary sch-company' data-remote='${path}/modal/popup.do?popId=billCust' type='button' data-index='" + i + "' id='custModalBtn' data-toggle='modal' data-target='#billCustModal'><i class='icofont icofont-search'></i></button></span></div></td>"
	    			+ "<td><input type='text' class='form-control form-control-sm' id='billBodyProductName_" + i + "' style='min-width: 80px;' /></td>"
	    			+ "<td><input type='text' class='form-control form-control-sm billBodyAmt' id='billBodyAmt_" + i + "' style='min-width: 80px;' value='0' /></td>"
	    			+ "<td><input type='text' class='form-control form-control-sm billBodyTax' id='billBodyTax_" + i + "' style='min-width: 80px;' value='0' /></td>"
	    			+ "<td><input type='text' class='form-control form-control-sm billBodyTotal' name='billBodyTotal' id='billBodyTotal_" + i + "' data-index='" + i + "' style='min-width: 80px;' value='0' readonly/></td></tr>";
	    			
	    			bodyHtmlSecond += "<tr><td class='text-center'>" + i + "</td>"
	    			+ "<td><input type='date' class='form-control' max='9999-12-30' id='billBodyIssueDate_" + i + "' name='billBodyIssueDate_" + i + "' value='" + nowDate + "'></td>"
	    			+ "<td><input type='date' class='form-control' max='9999-12-30' id='billBodyTradeDate_" + i + "' name='billBodyTradeDate_" + i + "' value='" + nowDate + "'></td>"
	    			+ "<td><input type='date' class='form-control' max='9999-12-30' id='billBodyTransDate_" + i + "' name='billBodyTransDate_" + i + "' value='" + nowDate + "'></td>"
	    			+ "<td><select class='form-control form-control-sm' id='billBodyIssueType_" + i + "' style='min-width: 80px;'><option value='자체발급'>자체발급</option><option value='ASP발급'>ASP발급</option><option value='인터넷발급'>인터넷발급</option><option value='겸용서식발급'>겸용서식발급</option></select></td>"
	    			+ "<td><input type='text' class='form-control form-control-sm' id='billBodyEmail_" + i + "' style='min-width: 80px;' /></td>"
	    			+ "<td><input type='text' class='form-control form-control-sm' id='billBodyHistory_" + i + "' style='min-width: 80px;' /></td>"
	    			+ "<td><input type='text' class='form-control form-control-sm' id='billBodyMemo_" + i + "' style='min-width: 80px;' /></td></tr>";
	    		}
	    		
	    		tableBodyFirst.html(bodyHtmlFirst);
	    		tableBodySecond.html(bodyHtmlSecond);
    		}
    	});
    });
    
    $("#billTableFirst tbody tr td").find(".billBodyAmt").change(function(){
    	console.log("실행");
    });
    
    $('#billCustModal').on('show.bs.modal', function(e) {
		var button = $(e.relatedTarget);
		localStorage.setItem("getItemIndex", button.attr("data-index"));
		var modal = $(this);
		modal.find('.modal-body').load(button.data("remote"));
	});
    
    function fn_billItemInsert() {
    	var pathname = $(location).attr('pathname');
    	var compNo = "${sessionScope.compNo}";
    	var billTableFirst = $("#billTableFirst tbody tr");
    	var billTableSecond = $("#billTableSecond tbody tr");
    	var insertData = [];
    	
    	for(var i = 1; i <= billTableFirst.length; i++){
	    	var temp = {};
			
	    	temp.compNo = compNo;
	    	temp.vatBuyerCustNo = billTableFirst.find("td #custNo_" + i).val();
	    	temp.vatSellerCustNo = "103771"; //비전테크로 임시 저장
	    	temp.vatStatus = "T1";
	    	temp.vatNo = billTableFirst.find("td #custVatNo_" + i).val();
	    	temp.vatSerial = billTableFirst.find("td #billBodySerial_" + i).val();
	    	temp.vatType = "T";
	    	temp.vatProductName = billTableFirst.find("td #billBodyProductName_" + i).val();
	    	temp.vatTax = billTableFirst.find("td #billBodyTax_" + i).val();
	    	temp.vatAmount = billTableFirst.find("td #billBodyAmt_" + i).val();
	    	
	    	insertData.push(temp);
    	}
    	
    	for(var i = 0; i < billTableSecond.length; i++){
    		var index = i + 1;
    		insertData[i].vatIssueDate = billTableSecond.find("td #billBodyIssueDate_" + index).val();
    		insertData[i].vatTradeDate = billTableSecond.find("td #billBodyTradeDate_" + index).val();
    		insertData[i].vatTransDate = billTableSecond.find("td #billBodyTransDate_" + index).val();
    		insertData[i].vatIssueType = billTableSecond.find("td #billBodyIssueType_" + index).val();
    		insertData[i].vatEmail = billTableSecond.find("td #billBodyEmail_" + index).val();
    		insertData[i].vatRemark = billTableSecond.find("td #billBodyHistory_" + index).val();
    		insertData[i].vatMemo = billTableSecond.find("td #billBodyMemo_" + index).val();
    		
    		var JsonArray = JSON.stringify(insertData[i]);
    		
    		$.ajax({
    			url: "${path}/acc/billInsert.do",
    			method: "post",
    			data: JSON.parse(JsonArray),
    			async: false,
    			dataType: "json",
    		});
    	}
    	
    	localStorage.setItem('lastTab', "#tab07");
    	alert("완료되었습니다.");
    	location.href = pathname;
    }
    
    
</script>