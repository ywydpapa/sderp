<%--
  Created by IntelliJ IDEA.
  User: djkim
  Date: 2022-01-20
  Time: 오전 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<c:set var="path2" value="${requestScope['javax.servlet.forward.servlet_path']}" />

<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top3.jsp"/>
<style>
	table > tbody > tr > td > div{
		display: flex;
		align-items: center;
		white-space: break-spaces;
		height: 4vh;
	}
</style>
<div id="main_content">
    <c:if test="${preserveSearchCondition != 'Y'}">
        <!-- Page-header start 페이지 타이틀-->
        <div class="page-header2">
        <input id="compNo_hidden" type="hidden" value="${sessionScope.compNo}">
            <div class="row align-items-end">
                <div class="col-lg-12">
                    <div class="page-header-title" style="float:left;">
                        <div style="margin-top:15px;">
                            <h6 style="font-weight:600;">계좌 계산서 연결 확인</h6>
                        </div>
                    </div>
                    <div class="btn_wr" style="float:right;">
						<!-- hide and show -->
						<button class="btn btn-sm btn-success" id="fold"
							onclick="acordian_action()">펼치기</button>
						<button class="btn btn-sm btn-success" id="fold2"
							onclick="acordian_action1()" style="display: none;">접기</button>
						<button class="btn btn-sm btn-inverse" onClick="searchReset();"><i class="icofont icofont-spinner-alt-3"></i>초기화</button>
						<button class="btn btn-sm btn-primary" onClick="searchSubmit();"><i class="icofont icofont-search" id="search"></i>검색</button>
					</div>
                </div>
            </div>
        </div>
        <!--Page-header end 페이지 타이틀 -->
        
        <div class="cnt_wr" id="acordian" style="display:none;">
			<div class="row">
					<div class="col-sm-12">
						<div class="card_box sch_it">
							<div class="form-group row">
								<div class="col-sm-12 col-xl-2">
									<label class="col-form-label">계좌번호</label>
									<input type="text" class="form-control form-control-sm" id="bacNo" data-completeSet="true" name="" placeholder="" value="${param.contTitle}">
								</div>
								<div class="col-sm-12 col-xl-2">
									<label class="col-form-label">계산서항목</label>
									<input type="text" class="form-control form-control-sm" id="vatProductName" data-completeSet="true" name="" placeholder="" value="${param.contTitle}">
								</div>
								<div class="col-sm-12 col-xl-2">
									<label class="col-form-label">승인번호</label>
									<input type="text" class="form-control form-control-sm" id="vatSerial" data-completeSet="true" name="" placeholder="" value="${param.contTitle}">
								</div>
								<div class="col-sm-12 col-xl-2">
									<label class="col-form-label">고객사</label>
									<div class="input-group input-group-sm mb-0">
										<select class="form-control" id="custName" name="custName" onchange="autoCompleteSelect(this);">
											<option value="">선택</option>
											<c:forEach var="row" items="${listCust}">
												<option data-no="${row.custNo}" value="${row.custNo}">${row.custName}</option>
											</c:forEach>
										</select>
										<input type="hidden" name="custNo" id="custNo" value="" />
									</div>
								</div>
								<div class="col-sm-12 col-xl-2">
									<label class="col-form-label">연결날짜</label>
									<div class="ms-selectable sales_date">
									<p class="input_inline">
										<input class="form-control form-control-sm col-xl-6" type="date" max="9999-12-30" id="regDateFrom" > ~ <input class="form-control form-control-sm col-xl-6" type="date" max="9999-12-31" id="regDateTo" >
									</div>
								</div>
								<div class="col-sm-12 col-xl-2">
									<label class="col-form-label">비고</label>
									<input type="text" class="form-control form-control-sm" id="vatRemark" data-completeSet="true" name="" placeholder="" value="${param.contTitle}">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	    </c:if>
	
	<!--리스트 table-->
    
</div>
<table id="bacTable" class="table table-striped table-borded w-100">
	   <colgroup>
	   		<col width="8%">
	   		<col width="10%">
	   		<col width="20%">
	   		<col width="5%">
	   		<col width="5%">
	   		<col width="10%">
	   		<col width="15%">
	   		<col width="20%">
	   </colgroup>
       <thead>
	        <tr>
	            <th class="text-center">계좌번호</th>
	            <th class="text-center">고객사</th>
	            <th class="text-center">계산서 항목</th>
	            <th class="text-center">계산서 받은금액</th>
	            <th class="text-center">계산서 남은금액</th>
	            <th class="text-center">연결날짜</th>
	            <th class="text-center">계산서 승인번호</th>
	            <th class="text-center">계산서 비고</th>
	        </tr>
       </thead>
       <tbody>
       		<%-- <c:forEach var="row" items="${list}">
       			<tr>
       				<c:if test="${row.bacNo ne 'NULL' && row.bacNo ne ''}">
       					<td style="text-align:center;vertical-align:middle;white-space: break-spaces;">${row.bacNo}</td>
       				</c:if>
       				<c:if test="${row.bacNo eq 'NULL' || row.bacNo eq ''}">
       					<td style="text-align:center;vertical-align:middle;white-space: break-spaces;">미연결</td>
       				</c:if>
	       			<td style="text-align:center;vertical-align:middle;white-space: break-spaces;">${row.custName}</td>
       				<c:if test="${row.vatProductName ne 'NULL' && row.vatProductName ne ''}">
       					<td style="text-align:center;vertical-align:middle;white-space: break-spaces;">${row.vatProductName}</td>
       				</c:if>
       				<c:if test="${row.vatProductName eq 'NULL' || row.vatProductName eq ''}">
       					<td style="text-align:center;vertical-align:middle;white-space: break-spaces;"></td>
       				</c:if>
	       			<td style="text-align:right;vertical-align:middle;white-space: break-spaces;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.modal_receive_data}" /></td>
	       			<td style="text-align:right;vertical-align:middle;white-space: break-spaces;">${row.modal_vatmemo}</td>
       				<c:if test="${row.regDate ne 'NULL' && row.regDate ne ''}">
       					<td style="text-align:center;vertical-align:middle;white-space: break-spaces;">${row.regDate}</td>
       				</c:if>
       				<c:if test="${row.regDate eq 'NULL' || row.regDate eq ''}">lo
       					<td style="text-align:center;vertical-align:middle;white-space: break-spaces;"></td>
       				</c:if>
	       			<td style="text-align:center;vertical-align:middle;white-space: break-spaces;">${row.vatSerial}</td>
	       			<td style="text-align:center;vertical-align:middle;white-space: break-spaces;">${row.vatRemark}</td>
       			</tr>
       		</c:forEach> --%>
       </tbody>
   	</table>
 	<script>
		$(document).ready(function(){
			let dataArr = [];
			let datas;
			
			console.log(localStorage.getItem("searchDatas"));
			if(localStorage.getItem("searchDatas") !== null){
				datas = JSON.parse(localStorage.getItem("searchDatas"));
				
				for(let key in datas){
					if(key === "custNo"){
						$("#custName").val(datas[key]).trigger("change");
					}else{
						$("#" + key).val(datas[key]);
					}
				}
				
				$("#acordian").show();
				localStorage.removeItem("searchDatas");
			}else{
				datas = {};
			}
			
			var table = $('#bacTable').DataTable({
				"scrollX": true,
				"lengthChange" : false, 
                "pageLength": 20,
				"pagingType": "simple_numbers",
				"stateSave": true,
                "info": false,
                "destroy":true,
                "processing": true,
                "serverSide": true,
                "ajax": {
                    "url": '${path}/acc/check_connect_json.do',
                    "type": 'get',
                    "contentType": "text/plain",
                    "dataType": 'json',
                    "data": datas,
                },
                "columns": [
                	{
                		"data": "bacNo",
                		"render": function(data, type, row){
                			if(data === null){
    	            			data = "<div style=\"justify-content: center;\">미연결</div>";
                			}else{
                				data = "<div style=\"justify-content: center;\">" + data + "</div>";
                			}
                            return data;
                		}
                	},
                	{
                		"data": "custName",
                		"render": function(data, type, row){
                			data = "<div style=\"justify-content: center;\">" + data + "</div>";
                            return data;
                		}
                	},
                	{
                		"data": "vatProductName",
                		"render": function(data, type, row){
                			data = "<div>" + data + "</div>";
                            return data;
                		}
                	},
                	{
                		"data": "modal_receive_data",
                		"render": function(data, type, row){
                			data = "<div style=\"justify-content: right;\">" + data.toLocaleString("en-US") + "</div>";
                            return data;
                		}
                	},
                	{
                		"data": "modal_vatmemo",
                		"render": function(data, type, row){
                			data = "<div style=\"justify-content: right;\">" + data.toLocaleString("en-US") + "</div>";
                            return data;
                		}
                	},
                	{
                		"data": "linkRegDate",
                		"render": function(data, type, row){
                			data = "<div style=\"justify-content: center;\">" + data + "</div>";
                            return data;
                		}
                	},
                	{
                		"data": "vatSerial",
                		"render": function(data, type, row){
                			data = "<div style=\"justify-content: center;\">" + data + "</div>";
                            return data;
                		}
                	},
                	{
                		"data": "vatRemark",
                		"render": function(data, type, row){
                			data = "<div>" + data + "</div>";
                            return data;
                		}
                	},
                ],
            });
		});
		
		$("#regDateFrom").change(function(){
			var dateValue = $(this).val();
			var dateValueArr = dateValue.split("-");
			var dateValueCom = new Date(dateValueArr[0], parseInt(dateValueArr[1])-1, dateValueArr[2]);
			var EdateValue = $("#regDateTo").val();
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
			
			if(day < 10){
				day = "0" + day;
			}
			
			$("#regDateTo").val(year + "-" + month + "-" + day);
		});
		
		$("#regDateTo").change(function(){
			var SdateValue = $("#regDateFrom").val();
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
			
			$("#regDateFrom").val(year + "-" + month + "-" + day);
		});
		
		function acordian_action(){
			if($("#acordian").css("display") == "none"){
			    $("#acordian").show();
			    $("#fold").hide();
			    $("#fold2").show();
			} else {
			    $("#acordian").hide();
			    $("#fold").show();
			}
		}
		function acordian_action1(){
			if($("#acordian").css("display") != "none"){
			    $("#acordian").hide();
			    $("#fold").show();
			    $("#fold2").hide();
			} else {
			    $("#acordian").show();
			    $("#fold").hide();
			}
		}
		
		function searchReset(){
			$(".card_box").find("input, select").val("").trigger("change");
		}
		
		function searchSubmit(){
			let datas = {};
			
			if($("#bacNo").val() !== ""){
				datas.bacNo = $("#bacNo").val();
			}
			
			if($("#vatProductName").val() !== ""){
				datas.vatProductName = $("#vatProductName").val();
			}
			
			if($("#vatSerial").val() !== ""){
				datas.vatSerial = $("#vatSerial").val();
			}
			
			if($("#custNo").val() !== ""){
				datas.custNo = $("#custNo").val();
			}
			
			if($("#regDateFrom").val() !== ""){
				datas.regDateFrom = $("#regDateFrom").val();
				datas.regDateTo = $("#regDateTo").val();
			}
			
			if($("#vatRemark").val() !== ""){
				datas.vatRemark = $("#vatRemark").val();
			}
			
			localStorage.setItem("searchDatas", JSON.stringify(datas));
			location.reload();
		}
    </script>
<jsp:include page="../body-bottom.jsp"/>