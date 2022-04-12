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

<div id="main_content">
	
	<script>
	$(function(){
		$('#vatTable').DataTable({
			info:false,
			searching: true,
			order: [[ 0, "desc" ]],
		});
	});
	</script>
	
    <!--리스트 table-->
    <div class="cnt_wr" id="list-container">
        <div class="row">
            <div class="col-sm-12">
                <div class="card-block table-border-style">
                    <div class="table-responsive">
                        <table id="vatTable" class="table table-striped table-bordered nowrap ">
                            <thead>
	                            <tr>
	                                <th class="text-center">거래처</th>
	                                <th class="text-center">공급가</th>
	                                <th class="text-center">세액</th>
	                                <th class="text-center">합계금액</th>
	                            </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
	    const DEFAULT_NUM = 15;
		const TABLE = $("#vatTable tbody");
		const CLICK_PAGE_NUM = 10;
	    <!--//리스트 table-->
		<!-- hide and show -->
		$(document).ready(function(){
			if(localStorage.getItem("readyPage") == null){
				var page = 1;
				
				pageNation(page, DEFAULT_NUM, null);
			}
		});	
		
		function pageNation(page, DEFAULT_NUM, reData){
			var vatTable = $("#vatTable tbody");
			var compNo = "${sessionScope.compNo}";
			var countData = {};
			var selectData = {};
			var tableHtml = "";
			var pageHtml = "";
			
			vatTable.empty();
			
			countData.compNo = compNo;
			
			$.ajax({
				url: "${path}/acc/custVatListCount.do",
				method: "post",
				data: countData,
				dataType: "json",
				success:function(countResult){
					var count = countResult.resultCount;
					var start = (page - 1) * DEFAULT_NUM;
					var last = DEFAULT_NUM;
					var lastPage = count % DEFAULT_NUM;
					var pageNum = Math.floor(count / DEFAULT_NUM);
					var lastPageNum = (lastPage > 0) ? pageNum + 1 : pageNum;
					var setFirstPage = 0;
					var setLastPage = setFirstPage + 9;
					var activePage = localStorage.getItem("activePage");
					
					if(localStorage.getItem("setFirstPage") != null){
						setFirstPage = localStorage.getItem("setFirstPage");
					}else{
						setFirstPage = page;
					}
					
					if(setLastPage > lastPageNum){
						setLastPage = lastPageNum;
					}
					
					selectData.compNo = compNo;
					
					pageHtml += "<ul class='pagination'><li class='page-item'><a class='page-link' href='#' onClick='pagePrevious(this);'>Previous</a></li>";
					
					for(var i = setFirstPage; i <= setLastPage; i++){
						if(i == activePage){
							pageHtml += "<li class='page-item active' id='page_"+ i +"'><a class='page-link' href='#' data-number='"+ i +"' onClick='pageClick(this);'>" + i + "</a></li>"
						}else{
							pageHtml += "<li class='page-item' id='page_"+ i +"'><a class='page-link' href='#' data-number='"+ i +"' onClick='pageClick(this);'>" + i + "</a></li>"
						}
					}
					
					pageHtml += "<li class='page-item'><a class='page-link' id='pageNextBtn' href='#' onClick='pageNext(this);'>Next</a></li></ul>";
					
					$("#pageDiv").html(pageHtml);
					
					localStorage.setItem("lastPageNum", lastPageNum);
					localStorage.removeItem("activePage");
					
					$.ajax({
						url:"${path}/acc/custVatList.do",
						method: "get",
						data: selectData,
						dataType: "json",
						success:function(data){
							for(var i = 0; i < data.length; i++){
								tableHtml += "<tr><td style='text-align:center;'><a href='${path}/acc/vatHtml/${vlist.vatSerial}/${vlist.vatType}' onClick='javascript:popupVat(this); return false;'>" + data[i].custName + "</a></td>"
								+ "<td style='text-align:right;'>" + parseInt(data[i].sumVatAmount).toLocaleString("en-US") + "</td>"
								+ "<td style='text-align:right;'>" + parseInt(data[i].sumVatTax).toLocaleString("en-US") + "</td>"
								+ "<td style='text-align:right;'>" + parseInt(data[i].sumVatAmount + data[i].sumVatTax).toLocaleString("en-US") + "</td></tr>";
							}
							
							vatTable.html(tableHtml);
						},
						error:function(){
							alert("데이터가 없습니다.");
							return false;
						}
					});
				},
				error:function(){
					alert("카운트에 실패했습니다.");
					return false;
				}
			});
		}
		
		function pageClick(e){
			var page = $(e).attr("data-number");
			var setFirstPage = $(e).parents("ul").find("li:first").next().children().attr("data-number");
			
			localStorage.setItem("activePage", page);
			localStorage.setItem("setFirstPage", setFirstPage);
			pageNation(page, DEFAULT_NUM, localStorage.getItem("cardDisNum"));
		}
		
		function pagePrevious(e){
			var preFirstNum = $(e).parent().next().children().attr("data-number");
			var calFirstNum = parseInt(preFirstNum) - CLICK_PAGE_NUM;
			var calLastNum = 0;
			
			if(calFirstNum < 1){
				calFirstNum = 1;
			}
	
			calLastNum = calFirstNum + 9;
			
			if(calLastNum > localStorage.getItem("lastPageNum")){
				calLastNum = localStorage.getItem("lastPageNum");
			}
				
			pageHtml(calFirstNum, calLastNum);
		}
		
		function pageNext(e){
			var preFirstNum = $(e).parents("ul").find("li:first").next().children().attr("data-number");
			var calFirstNum = parseInt(preFirstNum) + CLICK_PAGE_NUM;
			var calLastNum = calFirstNum + 9;
			
			if(calFirstNum > localStorage.getItem("lastPageNum")){
				calFirstNum = preFirstNum;
			}
			
			if(calLastNum > localStorage.getItem("lastPageNum")){
				calLastNum = localStorage.getItem("lastPageNum");	
			}
			
			pageHtml(calFirstNum, calLastNum);
		}
		
		function pageHtml(start, last){
			var pageHtml = "";
			
			$("#pageDiv").empty();
			
			pageHtml += "<ul class='pagination'><li class='page-item'><a class='page-link' href='#' onClick='pagePrevious(this);'>Previous</a></li>";
			
			for(var i = start; i <= last; i++){
				pageHtml += "<li class='page-item' id='page_"+ i +"'><a class='page-link' href='#' data-number='"+ i +"' onClick='pageClick(this);'>" + i + "</a></li>"
			}
			
			pageHtml += "<li class='page-item'><a class='page-link' href='#' onClick='pageNext(this);'>Next</a></li></ul>";
			
			$("#pageDiv").html(pageHtml);
		}
    </script>
</div>
<jsp:include page="../body-bottom.jsp"/>