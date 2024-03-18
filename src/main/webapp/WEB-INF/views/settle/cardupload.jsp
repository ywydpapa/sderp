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
<script src="${path}/js/jquery.table2excel.js"></script>
<script type="text/javascript" src="https://unpkg.com/xlsx@0.15.1/dist/xlsx.full.min.js"></script>
<style>
	#cardTable > thead > tr > th,
	#cardTable > tbody > tr > td{
		text-align: center;
	}
</style>

<div id="main_content">

    <c:if test="${preserveSearchCondition != 'Y'}">
        <!-- Page-header start 페이지 타이틀-->
        <div class="page-header2">
            <div class="row align-items-end">
                <div class="col-lg-12">
                    <div class="page-header-title" style="float:left;">
                        <div style="margin-top:15px;">
                            <h6 style="font-weight:600;">카드내역 읽어오기 </h6>
                        </div>
                    </div>
                    <div class="btn_wr" style="float:right;">
                    	<%--<button class="btn btn-sm btn-danger" onClick="downloadCSV();">내보내기</button>--%>
                    	<button class="btn btn-sm btn-danger" data-toggle="modal" data-target="#fileUploadModal">읽어오기</button>
						<div class="modal fade " id="fileUploadModal" tabindex="-1" role="dialog">
							<div class="modal-dialog modal-80size" role="document">
								<div class="modal-content modal-80size">
									<div class="modal-header">
										<h4 class="modal-title">EXCEL 파일 등록</h4>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<form id="uploadForm">
											<input type="file" name="file" id="fileUpload" accept=".xls,.xlsx,.xlsm" onchange="readFile(this)"/>
										</form>
										<br> 파일 설명<input type="text" class="form-control" id="fileDesc" />
									</div>
									<div class="modal-footer">
										<!-- <button type="button" class="btn btn-default waves-effect" onclick="uploadFile()">등록</button> -->
										<button type="button" class="btn btn-default waves-effect" data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>
                        <!-- hide and show -->
                        <button id="chkBtn" class="btn btn-sm btn-success" onClick="javascript:fnCheckCardlist()">내역 검토</button>
                        <button id="regBtn" class="btn btn-sm btn-primary submitBtn" onClick="javascript:fnRegCardlist()" style="display:none;">카드내역 등록</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- <div id="dvCSV">
		</div> -->
        <!--Page-header end 페이지 타이틀 -->
        <!--영업활동조회-->
        <div class="cnt_wr" id="acordian" style="display:none;">
            <div class="row">
                <form id="searchForm" method="post" onsubmit="return false;" class="col-sm-12">
                    <div class="col-sm-12">
                        <div class="card_box sch_it">
                            <div class="form-group row">
                                <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label" for="userName">담당사원</label>
                                    <div class="input-group input-group-sm mb-0">
                                        <input type="text" class="form-control" name="userName"
                                               id="userName" value="" readonly /> <input type="hidden"
                                                                                         name="userNo" id="userNo" value="" /> <span
                                            class="input-group-btn">
										<button class="btn btn-primary sch-company"
                                                data-remote="${path}/modal/popup.do?popId=user" type="button"
                                                data-toggle="modal" data-target="#userModal">
											<i class="icofont icofont-search"></i>
										</button>
									</span>
                                        <div class="modal fade " id="userModal" tabindex="-1"
                                             role="dialog">
                                            <div class="modal-dialog modal-80size" role="document">
                                                <div class="modal-content modal-80size">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title"></h4>
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <h5>사용자목록</h5>
                                                        <p>Loading!!!</p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default waves-effect "
                                                                data-dismiss="modal">닫기</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label" for="soppTitle">영업기회</label>
                                    <div class="input-group input-group-sm mb-0">
                                        <input type="text" class="form-control" name="soppTitle"
                                               id="soppTitle" value="" readonly /> <input
                                            type="hidden" name="soppNo" id="soppNo"
                                            value="" /> <span class="input-group-btn">
											<button class="btn btn-primary sch-company"
                                                    data-remote="${path}/modal/popup.do?popId=sopp"
                                                    type="button" data-toggle="modal"
                                                    data-target="#soppModal">
												<i class="icofont icofont-search"></i>
											</button>
										</span>
                                        <div class="modal fade " id="soppModal" tabindex="-1"
                                             role="dialog">
                                            <div class="modal-dialog modal-80size" role="document">
                                                <div class="modal-content modal-80size">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title">영업기회 검색</h4>
                                                        <button type="button" class="close"
                                                                data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <h5>영업기회 목록</h5>
                                                        <p>Loading!!!</p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button"
                                                                class="btn btn-default waves-effect "
                                                                data-dismiss="modal">닫기</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label" for="custName">매출처</label>
                                    <div class="input-group input-group-sm mb-0">
                                        <input type="text" class="form-control" name="custName"
                                               id="custName" value="" readonly /> <input
                                            type="hidden" name="custNo" id="custNo"
                                            value="" /> <span class="input-group-btn">
												<button class="btn btn-primary sch-company"
                                                        data-remote="${path}/modal/popup.do?popId=cust"
                                                        type="button" data-toggle="modal"
                                                        data-target="#custModal">
													<i class="icofont icofont-search"></i>
												</button>
											</span>
                                        <div class="modal fade " id="custModal" tabindex="-1"
                                             role="dialog">
                                            <div class="modal-dialog modal-80size" role="document">
                                                <div class="modal-content modal-80size">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title">매출처검색</h4>
                                                        <button type="button" class="close"
                                                                data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <h5>매출처목록</h5>
                                                        <p>Loading!!!</p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button"
                                                                class="btn btn-default waves-effect "
                                                                data-dismiss="modal">닫기</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label" for="salesType">처리 상태</label>
                                    <select name="select" class="form-control form-control-sm" id="salesType">
                                        <option value>선택</option>
                                        <c:forEach var = "acttype" items="${acttype}">
                                            <option value="${acttype.codeNo}">${acttype.desc03}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label">발행일</label>
                                    <p class="input_inline"><input class="form-control form-control-sm col-xl-6" type="date" id="salesFrdatetime"> ~ <input class="form-control form-control-sm col-xl-6" type="date" id="salesTodatetime">
                                    </p>
                                </div>
                                <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label">거래일</label>
                                    <p class="input_inline"><input class="form-control form-control-sm col-xl-6" type="date" id="regSDate"> ~ <input class="form-control form-control-sm col-xl-6" type="date" id="regEDate">
                                    </p>
                                </div>
                            </div>

                        </div>
                    </div>

                </form>
            </div>
        </div>
        <!--//영업활동조회-->
    </c:if>

    <!--리스트 table-->
    <div class="cnt_wr" id="list-container">
        <div class="row">
            <div class="col-sm-12">
                <div class="card-block table-border-style">
                    <div class="table-responsive" id="excel_data">
                    	<table id="cardTable" class="w-100 table table-striped table-bordered">
                    		<thead>
                    			<tr>
                    				<th>카드번호</th>
                    				<th>승인일자</th>
                    				<th>승인번호</th>
                    				<th>가맹점명</th>
                    				<th>승인금액</th>
                    				<th><input type="checkbox" id="allCheck" onclick="allCheck(this);" disabled></th>
                    			</tr>
                    		</thead>
                    		<tbody>
                    		</tbody>
                    	</table>
                        <!-- <table id="cardTable" class="table table-striped table-bordered nowrap ">
                        </table> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--//리스트 table-->

    <!-- hide and show -->
    <script>
    	let bnkXls = {};
    	
    	function allCheck(e){
    		let thisEle = $(e);
    		let checks = thisEle.parents("thead").next().find("tr td input");
    		
    		if(thisEle.is(":checked")){
	    		for(let i = 0; i < checks.length; i++){
	    			let item = $(checks[i]);
					item.attr("checked", true);	    			
	    		}
    		}else{
    			for(let i = 0; i < checks.length; i++){
	    			let item = $(checks[i]);
					item.attr("checked", false);	    			
	    		}
    		}
    	}
    	
	    function readFile(el) {
	    	let file = el.files[0];
	    	console.log("STEP 1 : Read xls file");
	    	if (file === null) return null;
	    	else bnkXls.readXlsFile(file);
	    }	
	    
	    function processAccData(data) {
	    	let cardTable = $("#cardTable tbody");
	    	let html = "";
	    	
	    	for(let i = 0; i < data.detail.length; i++){
	    		html += "<tr><td class=\"cardSerial\">" + data.detail[i][1] + "</td>";
	    		html += "<td class=\"appDate\">" + data.detail[i][0] + "</td>";
	    		html += "<td class=\"appSerial\">" + data.detail[i][2] + "</td>";
	    		html += "<td class=\"appContents\">" + data.detail[i][3] + "</td>";
	    		html += "<td class=\"appAmount\">" + data.detail[i][4] + "</td>";
	    		html += "<td><input class=\"cardchecked\" type=\"checkbox\" disabled></td></tr>";
	    	}
	    	
	    	cardTable.html(html);
	    }
	    
	    bnkXls.readXlsFile = function (file) {
	    	let reader, evfn;
	    	reader = new FileReader();
	    	console.log("STEP 2 : Read xls file second stage");
	    	evfn = function () {
	    		let data, wrkBook;
	    		data = this.result;
	    		wrkBook = XLSX.read(data, { "type": "binary" });
	    		bnkXls.parseXlsFile(wrkBook);
	    	} // End of Anonymous Function in readExcel()

	    	reader.readAsBinaryString(file);
	    	// 읽기 동작이 성공적으로 완료되었을 때 발생 
	    	reader.onload = evfn;
	    }
	    
	    bnkXls.parseXlsFile = function (wb) {
	    	let r, c, x, y, z, t, spLine, data = [], data1, data2, result;
	    	console.log("STEP 3 : data arrange with parsed data");
	    	// A1 타입 셀 이름 추출
	    	t = [];
	    	for (x in wb.Sheets[wb.SheetNames[0]]) if (x.substring(0, 1) !== "!") t.push(x);
	    	t.sort();

	    	// 2차원 배열로 변환
	    	for (x in t) {
	    		r = t[x].substring(0, 1).charCodeAt() - 65;
	    		c = t[x].substring(1) * 1 - 1;
	    		if (data[c] === undefined) data[c] = [];
	    		data[c][r] = wb.Sheets[wb.SheetNames[0]][t[x]].v;
	    	}

	    	// 헤더부분과 본문 부분 구분하기
	    	// 1차 시도 / 빈 줄 찾기
	    	for (x = 0; x < data.length; x++)  if (data[x] === undefined) spLine = x;

	    	// 1차 시도 성공여부 검증 / 실패시 2차 시도 / row 중 숫자가 없는 row 찾기
	    	t = undefined;
	    	if (spLine === undefined) {
	    		for (x = 0; x < data.length; x++) {
	    			if (data[x] !== undefined && !bnkXls.haveNumeric(data[x])) spLine = x;
	    		}
	    	}
	    	console.log(spLine);
	    	data1 = data.slice(0, spLine);
	    	data2 = data.slice(spLine);


	    	// ================ 거래내역 정리하기 ===================      
	    	// 헤더 정리
	    	r = [-1, -1, -1, -1, -1]; // 0-거래일자 1-카드번호 2-승인번호 3-가맹점명 4-승인금액(청구금액) 
	    	for (z in data2) {
	    		t = data2[z];
	    		break;
	    	}
	    	z = z * 1;
	    	console.log(t + "전체 확인");
			
	    	for (x = 0; x < t.length; x++) {
	    		if (t[x].includes("승인일자") || t[x].includes("이용일시")) r[0] = x;
	    		else if (t[x].includes("카드번호") || t[x].includes("이용카드")) r[1] = x;
	    		else if (t[x].includes("승인번호")) r[2] = x;
	    		else if (t[x].includes("가맹점명")) r[3] = x;
	    		else if (t[x].includes("승인금액") || t[x].includes("청구금액") || t[x].includes("이용금액")) r[4] = x;
	    		else if (t[x].includes("거래은행")) r[5] = x;
	    	}
			
	    	t = [];
	    	for (x = z + 1; x < data2.length; x++) {
	    		if (r[0] >= 0 && data2[x][r[0]] === undefined) break;
	    		if (r[1] >= 0 && data2[x][r[1]] === undefined) break;
	    		if (r[2] >= 0 && data2[x][r[2]] === undefined) break;
	    		if (r[3] >= 0 && data2[x][r[3]] === undefined) break;
	    		if (r[4] >= 0 && data2[x][r[4]] === undefined) break;
					    			
	    		y = [data2[x][r[0]].replaceAll("(", "").replaceAll(")", "").replaceAll("-", ""), data2[x][r[1]], data2[x][r[2]], data2[x][r[3]], data2[x][r[4]], data2[x][r[5]] + ""];
	    		t.push(y);
	    	}
	    	t.sort(function (a, b) { let x, y; x = new Date(a[0]); y = new Date(b[0]); return x.getTime() - y.getTime(); })
	    	if(t[0][5] !== "" || t[0][5] !== undefined){
		    	localStorage.setItem("bankName", t[0][5])
	    	}
	    	result = { "detail": t };
	    	console.log("STEP 4 : End of data arrange");
	    	console.log(result);
	    	processAccData(result);
	    }
	    
	    bnkXls.haveNumeric = function (arr) {
	    	let x, y, z;
	    	if (arr === undefined) return false;
	    	if (typeof arr === "string") {
	    		for (x = 0; x < arr.length; x++) {
	    			z = arr.substring(x, x + 1);
	    			z = z.charCodeAt();
	    			if (z > 47 && z < 58) return true;
	    		}
	    	} else if (typeof arr === "object") {
	    		for (x = 0; x < arr.length; x++) {
	    			if (arr[x] !== undefined) for (y = 0; y < arr[x].length; y++) {
	    				z = arr[x].substring(y, y + 1);
	    				z = z.charCodeAt();
	    				if (z > 47 && z < 58) return true;
	    			}
	    		}
	    	}
	    	return false;
	    }
    
	    function reverse(str) {
	        var reverse = str.split('');
	        reverse = reverse.reverse();
	     
	        return reverse.join('')
	    }
    
	    function uploadFile(){
	    	const excel_file = document.getElementById("fileUpload");
	    	
    		var reader = new FileReader();
			    		
    		reader.readAsArrayBuffer(excel_file.files[0]);
    		
    		reader.onload = function(){
    			var data = new Uint8Array(reader.result);
    			var work_book = XLSX.read(data, {type: 'array'});
    			var sheet_name = work_book.SheetNames;
    			var sheet_data = XLSX.utils.sheet_to_json(work_book.Sheets[sheet_name[0]], {header:1});
    			
    			if(sheet_data.length > 0){
    				var table_output = '<table id="cardTable" class="table table-striped table-bordered" style="text-align:center;">';
    				
    				for(var row = 0; row < sheet_data.length-1; row++){
    					if(row == 0){
	    					table_output += "<tr style='font-weight:600;'>";
    					}else{
    						table_output += "<tr>";
    					}
    					
    					for(var cell = 0; cell < sheet_data[row].length; cell++){
                            if (cell == 0){
                                if(row == 0){
                                    table_output += '<td>검토</td><td>' + sheet_data[row][cell] + '</td>';
                                }else{
                                    table_output += '<td><input type="checkbox" class="cardchecked" onClick="return false;"></td><td class="cardlst'+cell+'">' + sheet_data[row][cell] + '</td>';
                                }
                            } else {
                                if (row == 0){
                                    table_output += '<td>' + sheet_data[row][cell] + '</td>';
                                }else{
                                    table_output += '<td class="cardlst'+cell+'">' + sheet_data[row][cell] + '</td>';
                                }
                            }
    					}
    					table_output += '</tr>';
    				}
    				
    				table_output += '</table>';
    				
    				document.getElementById("excel_data").innerHTML = table_output;
    			}
    		}

    		$(".modal-backdrop").remove();
   	      	$("#fileUploadModal").modal("hide");

   	      	$("#chkBtn").removeClass();
   	      	$("#chkBtn").removeAttr("disabled");
   	      	$("#chkBtn").attr("class", "btn btn-sm btn-success");
	    }
	    
	    function downloadCSV() {
	    	var getDate = new Date();
	    	var compNo = "${sessionScope.compNo}";
	    	var year = getDate.getFullYear();
	    	var month = getDate.getMonth()+1;
	    	var day = getDate.getDate();
	    	var fileName = "";
	    	
	    	if(month < 10){
		    	month = "0" + month;
	    	}
	    	
	    	if(day < 10){
	    		day = "0" + day;	
	    	}
	    	
	    	var now = year + "-" + month + "-" + day;
	    	
	    	if(compNo === "100002"){
	    		fileName = "VTEK" + "(" + now + ")";	
	    	}
	    	
    	    $("#cardTable").table2excel({
    	        exclude: ".excludeThisClass",
    	        name: "sheet",
    	        filename: fileName + ".xls", // do include extension
    	        preserveColors: false // set to true if you want background colors and font colors preserved
    	    });
	    }

        function fnCheckCardlist(){
            $.LoadingOverlay("show", true);
            
            setTimeout(() => {
            	let forFlag = true;
            	
	        	if($(this).attr("data-value") == 0){
	        		$(this).attr("data-value", 1);	
	        	}
	        	
	            var chk = $(".cardchecked");
	            for(let i = 0; i < chk.length; i++){
	            	if(forFlag){
		            	var cardDisNum;
		            	var appSerial = $(".appSerial")[i];
		            	var appContents = $(".appContents")[i];
		            	var cardSerial = $(".cardSerial")[i];
		            	
		            	if(localStorage.getItem("bankName") === "부산은행"){
            				cardDisNum = $(cardSerial).text().substring($(cardSerial).text().length-6, $(cardSerial).text().length);
            				
		            		$.ajax({
        	                    url : "${path}/acc/cardCheck.do",
        	                    data : {
        	                    	"appSerial": appSerial.innerText,
        	                    	"appContents": appContents.innerText,
        	                    	"cardDisNum": cardDisNum
        	                    },
        	                    method : "POST",
        	                    async: false,
        	                    dataType : "json",
        	                    success:function(data){
        	                    	if(data.resultCount > 0){
        	                    		$(chk[i]).prop("checked", false);
        	                    	}else{
        	                    		$(chk[i]).prop("checked", true);
        	                    	}
        	                    },
        	                });
		            	}else{
			            	$.ajax({
		            			url: "${path}/acc/checkCardNum.do",
		            			method: "get",
		            			async: false,
		            			data: {
		            				"firstCardNum": $(cardSerial).text().replace(/-/g, "").substring(0, 4) + "-" + $(cardSerial).text().replace(/-/g, "").substring(4, 6),
		            				"lastCardNum": $(cardSerial).text().substring($(cardSerial).text().length-4, $(cardSerial).text().length)
		            			},
		            			success: function(numDatas){
		            				if(numDatas === ""){
		            					forFlag = false;
		            					alert("카드번호: " + $(cardSerial).text() + " 일치하는 카드가 없습니다.\n카드를 먼저 등록해주세요.");
		            					return false;
		            				}else{
		            					cardSerial = numDatas.replaceAll("-", "").substring(numDatas.replaceAll("-", "").length - 6, numDatas.replaceAll("-", "").length);
			            				cardDisNum = cardSerial.substring(cardSerial.length-6, cardSerial.length);
			            				
			            				$.ajax({
			        	                    url : "${path}/acc/cardCheck.do",
			        	                    data : {
			        	                    	"appSerial": appSerial.innerText,
			        	                    	"appContents": appContents.innerText,
			        	                    	"cardDisNum": cardDisNum
			        	                    },
			        	                    method : "POST",
			        	                    async: false,
			        	                    dataType : "json",
			        	                    success:function(data){
			        	                    	if(data.resultCount > 0){
			        	                    		$(chk[i]).prop("checked", false);
			        	                    	}else{
			        	                    		$(chk[i]).prop("checked", true);
			        	                    	}
			        	                    },
			        	                });
		            				}
		            			}
		            		});
		            	}
	            	}
	            }
	            
	            if(forFlag){
		           	alert("내역 검토가 완료되었습니다.");
		           	$(".submitBtn").show();
		           	$.LoadingOverlay("hide", true);
	            }else{
	            	$.LoadingOverlay("hide", true);
	            }
            }, 300);
        }

        function fnRegCardlist(){
        	$.LoadingOverlay("show", true);
            
        	setTimeout(() => {
        		var $cardSerial = $(".cardSerial");
        		var $appDate = $(".appDate");
        		var $appSerial = $(".appSerial");
        		var $appContents = $(".appContents");
        		var $appAmount = $(".appAmount");
	        	var $cardchecked = $(".cardchecked");  //체크여부
	        	var compNo = "${sessionScope.compNo}";
	        	
	            /* var $Aarr = $(".cardlst12");         //가맹점명/국가명
	            var $Barr = $(".cardlst11");           // 승인번호
	            var $Carr = $(".cardlst6");          // 사용구분
	            var $Darr = $(".cardlst7");           // 매출종류
	            var $Earr = $(".cardlst8");           // 할부기간
	            var $Farr = $(".cardlst13");           // 승인금액
	            var $Garr = $(".cardlst14");           // 환율
	            var $Harr = $(".cardlst10");			// 승인시간
	            var $Iarr = $(".cardlst9");			// 승인일자
	            var $Jarr = $(".cardlst2");			// 카드번호
	            var compNo = "${sessionScope.compNo}"; */
				
	            for (var i = 0; i < $appSerial.length; i++){
	                if ($($cardchecked[i]).is(":checked")){
 	                    var cardData = {};
 	                    var randomStr = "";
	                    cardData.compNo = compNo;
	                    cardData.appContents = $appContents[i].innerText;
	                    cardData.appSerial = $appSerial[i].innerText;
	                    cardData.useDivision = "국내";
	                    cardData.salesType = "일시불";
	                    cardData.instPeriod = 0;
	                    cardData.appAmount = Number($appAmount[i].innerText.replace(/,/g, ""));
	                    /* cardData.appExchange = $Garr[i].innerText === "" ? "0" : $Garr[i].innerText; */
	                    cardData.appDate = $appDate[i].innerText;
	                    /* cardData.appTime = $Harr[i].innerText; */
	                    randomStr = generateRandomString(1);	   
	                    
	                    if(localStorage.getItem("bankName") === "부산은행"){
	                    	cardData.cardSerial = $cardSerial[i].innerText;
            				cardData.cardDisNum = cardData.cardSerial.substring(cardData.cardSerial.length-6, cardData.cardSerial.length);
            				
	                    	$.ajax({
    	                        url : "${path}/acc/insertCardLedger.do",
    	                        data : cardData,
    	                        method : "POST",
    	                        async: false,
    	                        dataType: "json",
    	                        success:function(){
    	                        	var updateData = {};
    	                        	updateData.cardSerial = cardData.cardSerial
    	                        	
    	                        	$.ajax({
    	                        		url: "${path}/acc/lastUpdateCard.do",
    	                        		method: "post",
    	                        		async: false,
    	                        		data: updateData,
    	                        		dataType: "json"
    	                        	});
    	                        	
    	                        	if(i == $appSerial.length-2){
    	    			                $.LoadingOverlay("hide", true);
    	                        	}
    	                        }
    	                    });                   	
	                    }else{
		            		$.ajax({
		            			url: "${path}/acc/checkCardNum.do",
		            			method: "get",
		            			async: false,
		            			data: {
		            				"firstCardNum": $($cardSerial[i]).text().replace(/-/g, "").substring(0, 4) + "-" + $($cardSerial[i]).text().replace(/-/g, "").substring(4, 6),
		            				"lastCardNum": $($cardSerial[i]).text().substring($($cardSerial[i]).text().length-4, $($cardSerial[i]).text().length)
		            			},
		            			success: function(numDatas){
		            				cardData.cardSerial = randomStr + numDatas.replaceAll("-", "").substring(numDatas.replaceAll("-", "").length - 6, numDatas.replaceAll("-", "").length);
		            				cardData.cardDisNum = cardData.cardSerial.substring(cardData.cardSerial.length-6, cardData.cardSerial.length);
		            				
		            				$.ajax({
		    	                        url : "${path}/acc/insertCardLedger.do",
		    	                        data : cardData,
		    	                        method : "POST",
		    	                        async: false,
		    	                        dataType: "json",
		    	                        success:function(){
		    	                        	var updateData = {};
		    	                        	updateData.cardSerial = cardData.cardSerial
		    	                        	
		    	                        	$.ajax({
		    	                        		url: "${path}/acc/lastUpdateCard.do",
		    	                        		method: "post",
		    	                        		async: false,
		    	                        		data: updateData,
		    	                        		dataType: "json"
		    	                        	});
		    	                        	
		    	                        	if(i == $appSerial.length-2){
		    	    			                $.LoadingOverlay("hide", true);
		    	                        	}
		    	                        }
		    	                    });
		            			}
		            		});
	                    }
	                    
	                   	/* $.ajax({
	                        url : "${path}/acc/insertCardLedger.do",
	                        data : cardData,
	                        method : "POST",
	                        async: false,
	                        dataType: "json",
	                        success:function(){
	                        	var updateData = {};
	                        	updateData.cardSerial = $($cardSerial[i]).text().substring($($cardSerial[i]).text().length-6, $($cardSerial[i]).text().length);
	                        	
	                        	$.ajax({
	                        		url: "${path}/acc/lastUpdateCard.do",
	                        		method: "post",
	                        		data: updateData,
	                        		dataType: "json"
	                        	});
	                        	
	                        	if(i == $appSerial.length-2){
	    			                $.LoadingOverlay("hide", true);
	                        	}
	                        }
	                    }); */
	                }
	            }
	        	setTimeout(() => {
		            alert("카드 내역 등록 완료");
		            fnCheckCardlist();
				}, 300);
			}, 300);
        }


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
    </script>
    <!-- hide and show -->
</div>
<jsp:include page="../body-bottom.jsp"/>