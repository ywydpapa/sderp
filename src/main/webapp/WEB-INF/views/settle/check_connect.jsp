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
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
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
                </div>
            </div>
        </div>
        <!--Page-header end 페이지 타이틀 -->
    </c:if>
	
	<!--리스트 table-->
    <div class="cnt_wr" id="list-container">
        <div class="row">
            <div class="col-sm-12">
                <div class="card-block table-border-style">
                    <div id="testcreatebactable" class="table-responsive">
                    <input id="reloadpage_num" type="hidden" value="0">
                        <table id="bacTable" class="table table-striped table-bordered nowrap">
                            <thead>
                            <tr>
                                <th class="text-center">계좌번호</th>
                                <th class="text-center">계산서 항목</th>
                                <th class="text-center">계산서 받은금액</th>
                                <th class="text-center">계산서 남은금액</th>
                                <th class="text-center">연결날짜</th>
                                <th class="text-center">계산서 승인번호</th>
                                <th class="text-center">계산서 비고</th>
                            </tr>
                            </thead>
                            
                            <tbody> 	                         
                          	</tbody>
                        
                        </table>
                        <div id="pageDiv" style="float: right;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
 <script>
 		var pageListNum = 15;
		var counter = 0;
	    <!--//리스트 table-->
		$(document).ready(function(){
			var selectData = {};
			var pageCheck = {};
			var bacTable = $("#bacTable tbody");
			var pageDiv = $("#pageDiv");
			var tableHtml = "";
			var pageHtml = "";
			var pageNation = 10;
			var pageFirstBetween = 0;
			
			bacTable.empty();
			pageDiv.empty();
			
			selectData.betFirstNum = pageFirstBetween;
			selectData.betLastNum = pageListNum;
			selectData.compNo = $('#compNo_hidden').val();
			$.ajax({
				url: "${path}/acc/check_link_vatandbac.do",
				method: "get",
				dataType: "json",
				data: selectData,
			})
			.done(function(result){
				for(var i = 0; i < result.data.length; i++){
						tableHtml += "<tr>"
						if(result.data[i].bacNo != null && result.data[i].bacNo != ''){
							tableHtml += "<td style='text-align:center;vertical-align:middle;'>"+result.data[i].bacNo+"</td><td style='text-align:center;vertical-align:middle;'>"
						}else if(result.data[i].bacNo == null || result.data[i].bacNo == ''){
							tableHtml += "<td style='text-align:center;vertical-align:middle;'>미연결</td><td style='text-align:center;vertical-align:middle;'>"
						}
						if(result.data[i].vatProductName != null && result.data[i].vatProductName != ''){
							tableHtml += ""+result.data[i].vatProductName+"</td><td style='text-align:right;vertical-align:middle;'>"
						}else if(result.data[i].vatProductName == null || result.data[i].vatProductName == ''){
							tableHtml += "</td><td style='text-align:right;vertical-align:middle;'>"
						}
						tableHtml += ""+result.data[i].modal_receive_data.toLocaleString("en-US")+"</td><td style='text-align:right;vertical-align:middle;'>"
					 	+ ""+result.data[i].modal_vatmemo+"</td><td style='text-align:right;vertical-align:middle;'>"
					 	if(result.data[i].regDate != null && result.data[i].regDate != ''){
					 		tableHtml += ""+result.data[i].regDate+"</td><td style='text-align:center;vertical-align:middle;'>"
					 	}else if(result.data[i].regDate == null || result.data[i].regDate == ''){
					 		tableHtml += "</td><td style='text-align:center;vertical-align:middle;'>"
					 	}
					 	tableHtml += ""+result.data[i].vatSerial+"</td><td style='text-align:center;vertical-align:middle;'>"
					 	+ ""+result.data[i].vatRemark+"</td>";
				}
				
				bacTable.html(tableHtml);
			})
			var origin_page_Num = (localStorage.getItem("lastpageNum")+1)/100;
			var endpageNum = Math.ceil(origin_page_Num)*10;
			var startpageNum = Math.floor(origin_page_Num)*10;
			counter = Math.floor(origin_page_Num);
			
			$.ajax({
				url: "${path}/acc/check_link_vatandbacCnt.do",
				method: "post",
				data: selectData,
				dataType: "json",
				success:function(data){
					console.log(data.resultCount);
					if(data.resultCount > 0){
						var count = parseInt(data.resultCount/pageListNum);
						var countRe = parseInt(data.resultCount/pageListNum);
						pageHtml = "";
						pageHtml += "<ul class='pagination'><li class='page-item'><a class='page-link' href='#' onClick='pagePrevious(this);'>Previous</a></li>";
						
						if(count > pageNation){
							for(var j = startpageNum+1; j <= endpageNum; j++){
								if(j <= count+1){
									if(j-1 == $('#reloadpage_num').val()){
										pageHtml += "<li class='page-item active' id='"+ j +"'><a class='page-link' href='#' onClick='pageClick(this);'>" + j + "</a></li>";	
									}else{
										pageHtml += "<li class='page-item' id='"+ j +"'><a class='page-link' href='#' onClick='pageClick(this);'>" + j + "</a></li>";	
									}
								}
							}
							pageHtml += "<li class='page-item'><a class='page-link' href='#' onClick='pageNext(this);'>Next</a></li></ul>";
						}else{
							if(countRe > 0){
								countRe = countRe + 1;
							}else{
								countRe = 0;
							}
							
							for(var j = 1; j <= countRe; j++){
								if(j-1 == $('#reloadpage_num').val()){
									pageHtml += "<li class='page-item active'><a class='page-link' href='#' onClick='pageClick(this);'>" + j + "</a></li>";
								}else {
									pageHtml += "<li class='page-item'><a class='page-link' href='#' onClick='pageClick(this);'>" + j + "</a></li>";
								}
							}
						}
						
						pageDiv.html(pageHtml);
					}else{
						pageDiv.empty();
					}
				}
			}); 
			$('#reloadpage_num').val(localStorage.getItem("lastpageNum"));
		});
		//===================================================================================================클릭
		function pageClick(e){
			var selectData = {};
			var pageCheck = {};
			var bacTable = $("#bacTable tbody");
			var pageDiv = $("#pageDiv");
			var tableHtml = "";
			var pageNation = 10;
			var pageSetNum = pageListNum * (parseInt($(e).html()) - 1);
			var pagememoryNum = (pageSetNum/15)
			$('#reloadpage_num').val(pagememoryNum);
			bacTable.html("");

			selectData.betFirstNum = pageSetNum;
			selectData.betLastNum = pageListNum;
			selectData.compNo = $('#compNo_hidden').val();
			
			$.ajax({
				url: "${path}/acc/check_link_vatandbac.do",
				method: "get",
				dataType: "json",
				data: selectData,
			})
			.done(function(result){
				for(var i = 0; i < result.data.length; i++){
						tableHtml += "<tr>"
						if(result.data[i].bacNo != null && result.data[i].bacNo != ''){
							tableHtml += "<td style='text-align:center;vertical-align:middle;'>"+result.data[i].bacNo+"</td><td style='text-align:center;vertical-align:middle;'>"
						}else if(result.data[i].bacNo == null || result.data[i].bacNo == ''){
							tableHtml += "<td style='text-align:center;vertical-align:middle;'>미연결</td><td style='text-align:center;vertical-align:middle;'>"
						}
						if(result.data[i].vatProductName != null && result.data[i].vatProductName != ''){
							tableHtml += ""+result.data[i].vatProductName+"</td><td style='text-align:right;vertical-align:middle;'>"
						}else if(result.data[i].vatProductName == null || result.data[i].vatProductName == ''){
							tableHtml += "</td><td style='text-align:right;vertical-align:middle;'>"
						}
						tableHtml += ""+result.data[i].modal_receive_data.toLocaleString("en-US")+"</td><td style='text-align:right;vertical-align:middle;'>"
					 	+ ""+result.data[i].modal_vatmemo+"</td><td style='text-align:right;vertical-align:middle;'>"
					 	if(result.data[i].regDate != null && result.data[i].regDate != ''){
					 		tableHtml += ""+result.data[i].regDate+"</td><td style='text-align:center;vertical-align:middle;'>"
					 	}else if(result.data[i].regDate == null || result.data[i].regDate == ''){
					 		tableHtml += "</td><td style='text-align:center;vertical-align:middle;'>"
					 	}
					 	tableHtml += ""+result.data[i].vatSerial+"</td><td style='text-align:center;vertical-align:middle;'>"
					 	+ ""+result.data[i].vatRemark+"</td>";
				}
				
				bacTable.html(tableHtml);
			})
			
			//수정 진횅중입니다.
			$.ajax({
				url: "${path}/acc/check_link_vatandbacCnt.do",
				method: "post",
				dataType: "json",
				data: selectData,
				
				success:function(data){
					console.log(data.resultCount);
					if(data.resultCount > 0){
						var count = parseInt(data.resultCount/pageListNum);
						var countRe = parseInt(data.resultCount/pageListNum);
						var hide_next_button = counter*10;
						pageHtml = "";
						pageHtml += "<ul class='pagination'><li class='page-item'><a class='page-link' href='#' onClick='pagePrevious(this);'>Previous</a></li>";
						
						if(count > pageNation){
							for(var j = 1+counter*10; j <= pageNation*(counter+1); j++){
								if(j <= count+1){
									if(j-1 == $('#reloadpage_num').val()){
										pageHtml += "<li class='page-item active' id='"+ j +"'><a class='page-link' href='#' onClick='pageClick(this);'>" + j + "</a></li>";
									}else{
										pageHtml += "<li class='page-item' id='"+ j +"'><a class='page-link' href='#' onClick='pageClick(this);'>" + j + "</a></li>";	
									}
								}
							}
							if(hide_next_button+10 < count){
								pageHtml += "<li class='page-item'><a class='page-link' href='#' onClick='pageNext(this);'>Next</a></li></ul>";
							}
						}else{
							if(countRe > 0){
								countRe = countRe + 1;
							}else{
								countRe = 0;
							}
							
							for(var j = 1; j <= countRe; j++){
								if(j-1 == $('#reloadpage_num').val()){
									pageHtml += "<li class='page-item active'><a class='page-link' href='#' onClick='pageClick(this);'>" + j + "</a></li>";
								}else{
									pageHtml += "<li class='page-item'><a class='page-link' href='#' onClick='pageClick(this);'>" + j + "</a></li>";
								}
							} 
						}
						
						pageDiv.html(pageHtml);
					}else{
						pageDiv.empty();
					}
				}
			}); 
			//수정 진횅중입니다.
		}	
		//===================================================================================================이전
		function pagePrevious(e){
			if(counter != 0){
			counter--;
			var selectData = {};
			var pageCheck = {};
			var bacTable = $("#bacTable tbody");
			var pageDiv = $("#pageDiv");
			var tableHtml = "";
			var pageHtml = "";
			var pageNation = 10;
			var pageFirstBetween = 0;
			bacTable.empty();
			pageDiv.empty();
			
			selectData.betFirstNum = counter*150;
			selectData.betLastNum = pageListNum;
			selectData.compNo = $('#compNo_hidden').val();
			
			$.ajax({
				url: "${path}/acc/check_link_vatandbac.do",
				method: "get",
				dataType: "json",
				data: selectData,
			})
			.done(function(result){
				for(var i = 0; i < result.data.length; i++){
						tableHtml += "<tr>"
						if(result.data[i].bacNo != null && result.data[i].bacNo != ''){
							tableHtml += "<td style='text-align:center;vertical-align:middle;'>"+result.data[i].bacNo+"</td><td style='text-align:center;vertical-align:middle;'>"
						}else if(result.data[i].bacNo == null || result.data[i].bacNo == ''){
							tableHtml += "<td style='text-align:center;vertical-align:middle;'>미연결</td><td style='text-align:center;vertical-align:middle;'>"
						}
						if(result.data[i].vatProductName != null && result.data[i].vatProductName != ''){
							tableHtml += ""+result.data[i].vatProductName+"</td><td style='text-align:right;vertical-align:middle;'>"
						}else if(result.data[i].vatProductName == null || result.data[i].vatProductName == ''){
							tableHtml += "</td><td style='text-align:right;vertical-align:middle;'>"
						}
						tableHtml += ""+result.data[i].modal_receive_data.toLocaleString("en-US")+"</td><td style='text-align:right;vertical-align:middle;'>"
					 	+ ""+result.data[i].modal_vatmemo+"</td><td style='text-align:right;vertical-align:middle;'>"
					 	if(result.data[i].regDate != null && result.data[i].regDate != ''){
					 		tableHtml += ""+result.data[i].regDate+"</td><td style='text-align:center;vertical-align:middle;'>"
					 	}else if(result.data[i].regDate == null || result.data[i].regDate == ''){
					 		tableHtml += "</td><td style='text-align:center;vertical-align:middle;'>"
					 	}
					 	tableHtml += ""+result.data[i].vatSerial+"</td><td style='text-align:center;vertical-align:middle;'>"
					 	+ ""+result.data[i].vatRemark+"</td>";
				}
				
				bacTable.html(tableHtml);
			})
			
			$.ajax({
				url: "${path}/acc/check_link_vatandbacCnt.do",
				method: "post",
				data: selectData,
				dataType: "json",
				success:function(data){
					console.log(data.resultCount);
					if(data.resultCount > 0){
						var count = parseInt(data.resultCount/pageListNum);
						var countRe = parseInt(data.resultCount/pageListNum);
						pageHtml = "";
						pageHtml += "<ul class='pagination'><li class='page-item'><a class='page-link' href='#' onClick='pagePrevious(this);'>Previous</a></li>";
						
						if(count > pageNation){
							for(var j = 1+counter*10; j <= pageNation*(counter+1); j++){
								if(j == 1+counter*10){
									pageHtml += "<li class='page-item active' id='"+ j +"'><a class='page-link' href='#' onClick='pageClick(this);'>" + j + "</a></li>";
								}else{
									pageHtml += "<li class='page-item' id='"+ j +"'><a class='page-link' href='#' onClick='pageClick(this);'>" + j + "</a></li>";
								}
							}
							pageHtml += "<li class='page-item'><a class='page-link' href='#' onClick='pageNext(this);'>Next</a></li></ul>";
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
						
						pageDiv.html(pageHtml);
					}else{
						pageDiv.empty();
					}
				}
			}); 
			
			setTimeout(function(){
				$.LoadingOverlay("hide", true);
			}, 1000);
			}
		}
		//===========================================================================================다음
		function pageNext(e){
			counter++;
			var selectData = {};
			var pageCheck = {};
			var bacTable = $("#bacTable tbody");
			var pageDiv = $("#pageDiv");
			var tableHtml = "";
			var pageHtml = "";
			var pageNation = 10;
			var pageFirstBetween = 0;
			bacTable.empty();
			pageDiv.empty();
			
			selectData.betFirstNum = counter*150;
			selectData.betLastNum = pageListNum;		
			selectData.compNo = $('#compNo_hidden').val();
			
			$.ajax({
				url: "${path}/acc/check_link_vatandbac.do",
				method: "get",
				dataType: "json",
				data: selectData
			})
			.done(function(result){
				for(var i = 0; i < result.data.length; i++){
						tableHtml += "<tr>"
						if(result.data[i].bacNo != null && result.data[i].bacNo != ''){
							tableHtml += "<td style='text-align:center;vertical-align:middle;'>"+result.data[i].bacNo+"</td><td style='text-align:center;vertical-align:middle;'>"
						}else if(result.data[i].bacNo == null || result.data[i].bacNo == ''){
							tableHtml += "<td style='text-align:center;vertical-align:middle;'>미연결</td><td style='text-align:center;vertical-align:middle;'>"
						}
						if(result.data[i].vatProductName != null && result.data[i].vatProductName != ''){
							tableHtml += ""+result.data[i].vatProductName+"</td><td style='text-align:right;vertical-align:middle;'>"
						}else if(result.data[i].vatProductName == null || result.data[i].vatProductName == ''){
							tableHtml += "</td><td style='text-align:right;vertical-align:middle;'>"
						}
						tableHtml += ""+result.data[i].modal_receive_data.toLocaleString("en-US")+"</td><td style='text-align:right;vertical-align:middle;'>"
					 	+ ""+result.data[i].modal_vatmemo+"</td><td style='text-align:right;vertical-align:middle;'>"
					 	if(result.data[i].regDate != null && result.data[i].regDate != ''){
					 		tableHtml += ""+result.data[i].regDate+"</td><td style='text-align:center;vertical-align:middle;'>"
					 	}else if(result.data[i].regDate == null || result.data[i].regDate == ''){
					 		tableHtml += "</td><td style='text-align:center;vertical-align:middle;'>"
					 	}
					 	tableHtml += ""+result.data[i].vatSerial+"</td><td style='text-align:center;vertical-align:middle;'>"
					 	+ ""+result.data[i].vatRemark+"</td>";
				}
				
				bacTable.html(tableHtml);
			})
			
			$.ajax({
				url: "${path}/acc/check_link_vatandbacCnt.do",
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
						pageHtml += "<ul class='pagination'><li class='page-item'><a class='page-link' href='#' onClick='pagePrevious(this);'>Previous</a></li>";
						
						if(count > pageNation){
							for(var j = 1+counter*10; j <= pageNation*(counter+1); j++){
								if(j <= count+1){
									if(j == 1+counter*10){
										pageHtml += "<li class='page-item active' id='"+ j +"'><a class='page-link' href='#' onClick='pageClick(this);'>" + j + "</a></li>";
									}else{
										pageHtml += "<li class='page-item' id='"+ j +"'><a class='page-link' href='#' onClick='pageClick(this);'>" + j + "</a></li>";	
									}
								}
							}
							if(hide_next_button+10 < count){
								pageHtml += "<li class='page-item'><a class='page-link' href='#' onClick='pageNext(this);'>Next</a></li></ul>";
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
						
						pageDiv.html(pageHtml);
					}else{
						pageDiv.empty();
					}
				}
			}); 
			
			setTimeout(function(){
				$.LoadingOverlay("hide", true);
			}, 1000);
		};
		
		var lastTab = localStorage.getItem('lastTab');
		var lastpageNum = localStorage.getItem('lastpageNum');
	        
		if (lastTab) {
			$('[href="'+ lastTab + lastpageNum +'"]').tab('show');
		}
    </script>
<jsp:include page="../body-bottom.jsp"/>