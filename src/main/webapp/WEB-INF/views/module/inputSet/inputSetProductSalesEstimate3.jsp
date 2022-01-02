<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<form name="form2" method="post" onsubmit="return false;">
    <table class="table table-sm bst02">
        <tbody>
        <tr>
            <th scope="row">견적목록</th>
        </tr>
        </tbody>
    </table>
    <table class="table table-sm bst02" id="addquty">
        <colgroup>
            <col width="15%" />
            <col width="15%" />
            <col width="15%" />
            <col width="10%" />
            <col width="10%" />
            <col width="15%" />
            <col width="15%" />
            <col width="5%" />
        </colgroup>
        <thead>
        <tr>
            <th class="text-center">거래처</th>
            <th class="text-center">항목</th>
            <th class="text-center">단가</th>
            <th class="text-center">수량</th>
            <th class="text-center">공급가액</th>
            <th class="text-center">부가세액</th>
            <th class="text-center">금액</th>
            <th class="text-center">적용율</th>
            <th class="text-center">삭제</th>
        </tr>
        </thead>
        <tbody>
            <tr class="item1">
                <td>
                    <div class="input-group input-group-sm mb-0">
                        <input type="text" class="form-control" name="product" id="productSalesEstimateCustName" value="" />
                        <input type="hidden" id="productSalesEstimateCustNo" value="" />
                        <input type="hidden" id="soppdataNoEstimate" value="">
                        <span class="input-group-btn">
                            <button class="btn btn-primary sch-company" data-remote="${path}/modal/popup.do?popId=productdataListSalesEstimateCust" type="button" data-toggle="modal" data-target="#productCustModal3">
                                <i class="icofont icofont-search"></i>
                            </button>
                        </span>
                        <!--modal-->
                        <div class="modal fade " id="productCustModal3" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-80size" role="document">
                                <div class="modal-content modal-80size">
                                    <div class="modal-header">
                                        <h4 class="modal-title">매입/매출 거래처 목록</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-success waves-effect" id="custRegSimple2">간편추가</button>
                                    </div>
                                    <div style="display: none; border: solid; width: 80%; margin: auto; margin-bottom: 5px;" id="custRegSimple_div2">
                                        <table>
                                            <colgroup>
                                                <col width="10%">
                                                <col width="75%">
                                                <col width="15%">
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <th>매출처명*</th>
                                                <td><input type="text" value="" id="custRegSimple_custName2" style="width: 100%;"> </td>
                                                <td><button type="button" class="btn-sm btn-dark" id="custRegSimple_custName_check2">중복확인</button></td>
                                            </tr>
                                            <tr>
                                                <th>담당자</th>
                                                <td><input type="text" value="" id="custRegSimple_custMemerName2" style="width: 100%;" placeholder="미입력시 미정으로 세팅됩니다."></td>
                                                <td><button type="button" class="btn-sm btn-success" id="custRegSimple_custName_register2">등록</button></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--//modal-->
                    </div>
                </td>
                <td>
                    <div class="input-group input-group-sm mb-0">
                        <input type="hidden" id="productNo2" value="" />
                        <input type="text" class="form-control" name="product" id="data02Title" value="" />
                        <span class="input-group-btn">
                            <button class="btn btn-primary sch-company" onclick="fn_productdataTableReload2()" type="button" data-toggle="modal" data-target="#productdataModal2">
                                <i class="icofont icofont-search"></i>
                            </button>
                        </span>
                    </div>
                    <!--모달 팝업-->
                    <div class="modal fade" id="productdataModal2" tabindex="-1" role="dialog">
                        <div class="modal-dialog modal-80size" role="document">
                            <div class="modal-content modal-80size">
                                <div class="modal-header">
                                    <h4 class="modal-title">상품목록</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <%--<%@ include file="/WEB-INF/views/modal/productdataList.jsp" %>--%>
                                    <jsp:include page="/WEB-INF/views/modal/productdataListSalesEstimate.jsp" />
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--//모달 팝업-->
                </td>
                <td><input type="text" class="form-control form-control-sm" id="data02Netprice" style="min-width: 80px;" /></td>
                <td><input type="text" class="form-control form-control-sm" id="data02Quanty" style="min-width: 80px;" /></td>
                <td><input type="text" class="form-control form-control-sm" id="data02Amt" style="min-width: 80px;" readonly /></td>
                <td><input type="text" class="form-control form-control-sm" id="data02Vat" style="min-width: 80px;" /></td>
                <td><input type="text" class="form-control form-control-sm" id="data02Total" style="min-width: 80px;" readonly /></td>
                <td><input type="text" class="form-control form-control-sm" id="data02Discount" style="min-width: 80px;" value="<fmt:formatNumber value="1.0" type="percent" />" /></td>
                <td rowspan="2">
                    <button id="data02Addbtn" class="btn btn-success btn-sm" onClick="dataSave();">추가</button>
                    <button id="data02Modbtn" class="btn btn-instagram btn-sm" onClick="javascript:fn_data02Update()">수정</button>
                </td>
            </tr>
            <tr>
            	<td colspan="4">
	            	<textarea rows="5" id="data02Spec" class="form-control form-control-sm" placeholder="spec을 입력해주세요."></textarea>
            	</td>
            	<td colspan="4">
	            	<textarea rows="5" id="data02Remark" class="form-control form-control-sm" placeholder="비고를 입력해주세요."></textarea>
            	</td>
            </tr>
            <tr>
                <td colspan="8">
                    <details>
                        <summary><span style="color: red">등록시 주의사항</span></summary>
                        <p>매입/매출처(거래처)는 모달창을 통해 추가하셔야 됩니다. 삭제는 직접 지우시면 됩니다.</p>
                    </details>
                </td>
            </tr>
        </tbody>
    </table>
	<input type="hidden" id="amountSum" value="0" />
	<input type="hidden" id="vatSum" value="0" />
</form>

<script>
	var dataArray = [];
    var dataIndex = 0;
    
    $('#productCustModal3').on('show.bs.modal', function(e) {
        var button = $(e.relatedTarget);
        var modal = $(this);
        modal.find('.modal-body').load(button.data("remote"));
    });

    $("#custRegSimple2").on("click",function (event) {
        if($("#custRegSimple_div2").is(':visible') == false){
            $("#custRegSimple_div2").show();
            $("#custRegSimple2").html("간편등록 취소");
        } else {
            $("#custRegSimple_div2").hide();
            $("#custRegSimple2").html("간편등록");
        }
    });

    $("#custRegSimple_custName_check2").on("click", function (event) {
        var custRegSimple_custName = $("#custRegSimple_custName2").val();
        var obj = new Object();
        obj.custName = custRegSimple_custName;
        $.ajax({
            url: "${path}/cust/custNameCheck", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            data: obj , // HTTP 요청과 함께 서버로 보낼 데이터
            method: "POST", // HTTP 요청 메소드(GET, POST 등)
            dataType: "json" // 서버에서 보내줄 데이터의 타입
        }) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨..
        .done(function(data) {
            console.dir(data);
            if(data.code == 10001){
                console.log("응답 성공");
                var html= "";
                if(data.result1.length > 0){
                    var tempArr = data.result1;
                    html += "같은 결과) \n";
                    for(var i=0; i<tempArr.length; i++){
                        html += "번호 : " + tempArr[i].custNo + " / 매출처 : " + tempArr[i].custName + "\n";
                    }
                }

                if(data.result2.length > 0){
                    var tempArr = data.result2;
                    html += "\n유사 결과) \n";
                    for(var i=0; i<tempArr.length; i++){
                        html += "번호 : " + tempArr[i].custNo + " / 매출처 : " + tempArr[i].custName + "\n";
                    }
                }

                if(data.result1.length == 0 && data.result2.length == 0){
                    html += "일치검색, 유사검색결과가 존재하지 않습니다.\n";
                }

                html += "\n등록하시겠습니까?";
                var result = confirm(html);

                if(result){
                    console.log("등록진행");
                } else {
                    console.log("등록거부");
                }
            }else{
                alert("응답 실패");
            }
        }) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
        .fail(function(xhr, status, errorThrown) {
            alert("통신 실패");
        });
    });

    $("#custRegSimple_custName_register2").on("click", function (event) {
        var custRegSimple_custName = $("#custRegSimple_custName2").val();
        var custRegSimple_custMemerName = $("#custRegSimple_custMemerName2").val();

        var obj = new Object();
        obj.custName = custRegSimple_custName;
        obj.custMemberName = custRegSimple_custMemerName;

        $.ajax({
            url: "${path}/cust/simpleRegister", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            data: obj , // HTTP 요청과 함께 서버로 보낼 데이터
            method: "POST", // HTTP 요청 메소드(GET, POST 등)
            dataType: "json" // 서버에서 보내줄 데이터의 타입
        }) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
            .done(function(result) {
                console.dir(result);
                if(result.code == 10001){
                    alert("저장 성공");
                    $('#productCustModal3').modal('hide');
                    $("#productSalesEstimateCustName").val(result.data.custName);
                    $("#productSalesEstimateCustNo").val(result.data.custNo);
                }else{
                    alert("저장 실패");
                }
            }) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
            .fail(function(xhr, status, errorThrown) {
                alert("통신 실패");
            });
    });
    
	$(document).on("click", "#dataDelBtn", function(){
		dataArray.splice($(this).attr("data-index"), 1);
		$("#qutylist tbody tr").eq($(this).attr("data-index")).remove();
	
		$("#qutylist tbody tr").find("#dataDelBtn").each(function(index, item){
		$(this).attr("data-index", index);
			dataIndex = index+1;
		});
	});

    
    function dataSave(){
    	var temp = {};
    	var productSalesEstimateCustName = $('#productSalesEstimateCustName').val();
    	var productNo = $("#productSalesEstimateCustNo").val();
    	var productName = $("#data02Title").val();
    	var productNetprice = $("#data02Netprice").val().replace(/[\D\s\._\-]+/g, "");
    	var productQty = $("#data02Quanty").val();
    	var productAmount = $("#data02Amt").val().replace(/[\D\s\._\-]+/g, "");
    	var productVat = $("#data02Vat").val().replace(/[\D\s\._\-]+/g, "");
    	var productTotal = $("#data02Total").val().replace(/[\D\s\._\-]+/g, "");
    	var productDis = $("#data02Discount").val().replace("%", "");
    	var productRemark = $("#data02Remark").val();
    	var productSpec = $("#data02Spec").val();
    	var qutylist = $("#qutylist tbody");
		
    	temp.estId = $("#estId").val();
		temp.custNo = $("#custNo").val();
		temp.compNo = $("#compNo").val();
    	temp.productNo = productNo;
    	temp.productName = productName;
    	temp.productNetprice = productNetprice;
    	temp.productQty = productQty;
    	temp.productAmount = productAmount;
    	temp.productVat = productVat;
    	temp.productTotal = productTotal;
    	temp.productDis = productDis;
    	temp.productRemark = productRemark;
    	temp.productSpec = productSpec;
    	
        var productSum = parseInt($("#product02InSum_table").html().replace(/[\D\s\._\-]+/g, "")) + parseInt($("#data02Total").val().replace(/[\D\s\._\-]+/g, ""));
        var amountSum = parseInt(productAmount) + parseInt($("#amountSum").val());
        var vatSum = parseInt(productVat) + parseInt($("#vatSum").val());
        
        $("#product02InSum_table").html("￦"+parseInt(productSum).toLocaleString("en-US"));
        $("#amountSum").val(amountSum);
        $("#vatSum").val(vatSum);
    	
    	dataArray.push(temp);
    	
    	$("#data02Type option:eq(0)").attr("selected","selected");
        $("#soppdataNoEstimate").val("");
        $("#productSalesEstimateCustName").val("");
        $("#productSalesEstimateCustNo").val("");
        $("#productNo2").val("");
        $("#data02Title").val("");
        $("#data02Netprice").val("");
        $("#data02Quanty").val("");
        $("#data02Amt").val("");
        $("#data02Vat").val("");
        $("#data02Total").val("");
        $("#data02Discount").val("100%");
        $("#data02Remark").val("");
        $("#data02Spec").val("");
    	
        qutylist.append("<tr><td style='text-align:center;'>견적</td><td id='salesCustNoN' style='text-align:center;'>"+productSalesEstimateCustName+"</td><td id='dataTitle' style='text-align:center;'>"+productName+"</td><td id='dataNetprice' style='text-align: right'>"+"￦"+parseInt(productNetprice).toLocaleString("en-US")+"</td><td id='dataQuanty' style='text-align: right'>"+productQty+"</td><td id='dataAmt' style='text-align: right'>"+"￦"+parseInt(productAmount).toLocaleString("en-US")+"</td><td id='dataVat' style='text-align: right'>"+"￦"+parseInt(productVat).toLocaleString("en-US")+"</td><td id='dataTotal' style='text-align: right'>"+"￦"+parseInt(productTotal).toLocaleString("en-US")+"</td><td id='dataDiscount' style='text-align: right'>"+ productDis + "%" + "</td><td id='dataRemark'>"+productRemark+"</td><td><button class='btn btn-sm btn-danger' data-index="+dataIndex+" id='dataDelBtn'>삭제</button></td></tr>");    	
        
    	console.log(dataArray);
    	
        dataIndex++;
    }

    function fn_data02Insert() {
    	var data02Data = {};
    	
    	if($("#estId").val() === ""){
    		alert("견적번호를 작성해주세요.");
    		$("#estId").focus();
    	}else if($("#estTitle").val() === ""){
    		alert("견적제목을 입력해주세요.");
    		$("#estTitle").focus();
    	}else if($("#estDate").val() === ""){
    		alert("견적서 작성일자를 선택해주세요.");
    		$("#estDate").focus();
    	}else{
    		data02Data.estId = $("#estId").val();
    		data02Data.estTitle = $("#estTitle").val();
    		data02Data.custNo = $("#custNo").val();
    		data02Data.soppNo = $("#soppNo").val();
    		data02Data.compNo = $("#compNo").val();
    		data02Data.userNo = $("#userNo").val();
            data02Data.estAmount = $("#amountSum").val();
            data02Data.estVat = $("#vatSum").val();
            data02Data.estTotal = $("#product02InSum_table").html().replace(/[\D\s\._\-]+/g, "");
    		data02Data.estDate = $("#estDate").val();
    		
    		$.ajax({
    			url: "${path}/gw/insertEst.do",
    			method: "post",
    			data: data02Data,
    			dataType: "json",
    			success: function(){
					for(var i = 0; i < dataArray.length; i++){
						var JsonArray = JSON.stringify(dataArray[i]);
						console.log(JSON.parse(JsonArray));
		  				$.ajax({
		  					url: "${path}/gw/insertEstitems.do",
		  					method: "post",
		  					data: JSON.parse(JsonArray),
		  					dataType: "json"
		  				});
		 			}
		 			alert("등록되었습니다.");
		 			location.href = "${path}/gw/estwrite.do";
    			}
    		});
    		
    	}
    }

    function fn_data02Update() {
        var data02Data = {};
        data02Data.soppNo 		= $("#soppNo").val();
        data02Data.catNo	 	= '100004';
        data02Data.soppdataNo   = $("#soppdataNoEstimate").val();
        if($("#productSalesEstimateCustName").val() != "") data02Data.salesCustNo = Number($("#productSalesEstimateCustNo").val());
        if($("#data02Title").val() != "") {
            if($("#productNo2").val() != "") data02Data.productNo	= $("#productNo2").val();
            data02Data.dataTitle 	= $("#data02Title").val();
        }
        data02Data.dataType		= $("#data02Type").val();
        data02Data.dataNetprice	= $("#data02Netprice").val().replace(/[\D\s\._\-]+/g, "");
        data02Data.dataQuanty	= $("#data02Quanty").val().replace(/[\D\s\._\-]+/g, "");
        data02Data.dataAmt 		= $("#data02Amt").val().replace(/[\D\s\._\-]+/g, "");
        data02Data.dataVat 		= $("#data02Vat").val().replace(/[\D\s\._\-]+/g, "");
        data02Data.dataTotal 	= $("#data02Total").val().replace(/[\D\s\._\-]+/g, "");
        data02Data.dataDiscount	= $("#data02Discount").val().replace(/[\D\s\._\-]+/g, "")/100;
        data02Data.dataRemark 	= $("#data02Remark").val();

        if(!data02Data.dataQuanty){
            alert("단가를 입력해주십시오.");
            return;
        } else if(!data02Data.dataAmt){
            alert("수량을 입력해주십시오.");
            return;
        } else if (!data02Data.dataTitle){
            alert("상품명을 입력해주십시오.");
            return;
        }

        $.ajax({ url: "${path}/sopp/updatedata01.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            data: data02Data , // HTTP 요청과 함께 서버로 보낼 데이터
            method: "POST", // HTTP 요청 메소드(GET, POST 등)
            dataType: "json" // 서버에서 보내줄 데이터의 타입
        }) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
            .done(function(data) {
                if(data.code == 10001){
                    alert("저장 성공");
                    $("#data02Type option:eq(0)").attr("selected","selected");
                    $("#soppdataNoEstimate").val("");
                    $("#productSalesEstimateCustName").val("");
                    $("#productSalesEstimateCustNo").val("");
                    $("#productNo2").val("");
                    $("#data02Title").val("");
                    $("#data02Netprice").val("");
                    $("#data02Quanty").val("");
                    $("#data02Amt").val("");
                    $("#data02Vat").val("");
                    $("#data02Total").val("");
                    $("#data02Discount").val("100%");
                    $("#data02Remark").val("");

                    $("#data02Addbtn").show();
                    $("#data02Modbtn").hide();

                    var url="${path}/sopp/qutylist/"+$("#soppNo").val();
                    fn_Reloaddata02(url);
                }else{
                    alert("저장 실패");
                }
            }) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
            .fail(function(xhr, status, errorThrown) {
                $(e).addClass("btn-dark");
                $(e).removeClass("btn-warning");
                $(e).html('수정');
                $("#data02Addbtn").show();
                $("#data02Modbtn").hide();
                alert("통신 실패");
            });
    }

    function recall02(){
        var sum12 = parseInt($("#data02Netprice").val().replace(/[\D\s\._\-]+/g, "") || 0 );
        var sum22 = parseInt($("#data02Quanty").val().replace(/[\D\s\._\-]+/g, "") || 0);
        var disc2 = parseFloat($("#data02Discount").val() || 0);
        var sum32 = sum12 * sum22 * (disc2 / 100);
        var vat2 = sum32 * 0.1;
        var Total2 = sum32 + vat2;
        $("#data02Netprice").val(sum12.toLocaleString("en-US"));
        $("#data02Quanty").val(sum22.toLocaleString("en-US"));
        $("#data02Amt").val(sum32.toLocaleString("en-US"));
        $("#data02Vat").val(vat2.toLocaleString("en-US"));
        $("#data02Total").val(Total2.toLocaleString("en-US"));
    }

    $(document).ready(function(){
        $('#data02Netprice,#data02Quanty,#data02Discount').on('keyup',function(){
            recall02();
        });
        $("#data02Modbtn").hide();
    });
</script>
