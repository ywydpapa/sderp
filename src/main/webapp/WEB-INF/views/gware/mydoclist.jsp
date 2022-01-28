<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value ="${pageContext.request.contextPath}"/>
<c:set var="path2" value="${requestScope['javax.servlet.forward.servlet_path']}" />

<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top2.jsp"/>

<style>
	input[type="checkbox"]{
		width: 15px;
		height: 15px;
		margin-top: 5px;
	}
</style>

<div id="main_content">
    <script>
        $(function(){
            $('#divStatus4').find("#myDocTable").DataTable({
                info:false,
                searching: true,
                order: [[ 0, "desc" ]],
            });
            
            $('#divStatus5').find("#myDocTable").DataTable({
                info:false,
                searching: true,
                order: [[ 0, "desc" ]],
            });
            
            $('#divAStatus2').find("#myDocTable").DataTable({
                info:false,
                searching: true,
                order: [[ 0, "desc" ]],
            });
            
            $('#divAStatus5').find("#myDocTable").DataTable({
                info:false,
                searching: true,
                order: [[ 0, "desc" ]],
            });
        });
    </script>
    <style>
        a {
            text-decoration:underline;
        }
        #myDocTable > tbody > tr > td:nth-child(4){
            overflow: hidden;
            text-overflow: ellipsis;
            max-width: 220px;
            white-space: nowrap;
        }
        #myDocTable > tbody > tr > td:nth-child(5){
            overflow: hidden;
            text-overflow: ellipsis;
            max-width: 220px;
            white-space: nowrap;
        }
        
    </style>
    <c:if test="${preserveSearchCondition != 'Y'}">
        <!-- Page-header start 페이지 타이틀-->
        <div class="page-header2">
            <div class="row align-items-end">
                <div class="col-lg-12">
                	<div class="page-header-title" style="float:left;">
						<div style="margin-top:15px;">
							<h6 style="font-weight:600;">나의 전자결재 목록</h6>
						</div>
					</div>
					<div class="btn_wr" style="float:right;">
						<button class="btn btn-sm btn-inverse" onClick="javascript:fnClearall()"><i class="icofont icofont-spinner-alt-3"></i>초기화</button>
                        <button class="btn btn-sm btn-primary" onClick="javascript:fnListcon()"><i class="icofont icofont-search" id="search"></i>검색</button>
                        <button class="btn btn-sm btn-outline" onClick="javascript:location='${path}/gw/write.do'"><i class="icofont icofont-pencil-alt-2"></i>결재등록</button>
					</div>
                </div>
            </div>
        </div>
        <!--Page-header end 페이지 타이틀 -->

        <!--계약조회-->
        <div class="cnt_wr">
            <div class="row">
                <div class="col-sm-12">
                    <div class="card_box sch_it">
                        <div class="form-group row" style="clear:both;">
                            <div class="col-sm-12 col-xl-3">
                                <label class="col-form-label">거래처</label>
                                <div class="input-group input-group-sm mb-0">
                                    <input type="text" class="form-control" name="custName" id="custName" value="${param.custName}" readonly />
                                    <input type="hidden" name="custNo" id="custNo" value="${param.custNo}" />
                                    <span class="input-group-btn">
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
                                                    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 col-xl-3">
                                <label class="col-form-label" for="userName">담당사원</label>
                                <div class="input-group input-group-sm mb-0">
                                    <input type="text" class="form-control" name="userName"
                                           id="userName" readonly /> <input type="hidden"
                                                                            name="userNo" id="userNo" /> <span
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
                                                    <h4 class="modal-title">담당사원</h4>
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
                                                            data-dismiss="modal">Close</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 col-xl-3">
                                <label class="col-form-label">작성일자</label>
                                <p class="input_inline"><input class="form-control form-control-sm col-xl-6" type="date" id="vatSdate"> ~ <input class="form-control form-control-sm col-xl-6" type="date" id="vatEdate"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
    <!--//계약조회-->
    <!--리스트 table-->
    <div class="cnt_wr" id="list-container">
        <div class="row">
            <div class="col-sm-12">
                <div class="card-block table-border-style">
                    <div class="table-responsive" style="overflow:hidden;">
                    	<c:if test="${sessionScope.docRole eq 'A'}">
                    		<div style="margin-bottom: 20px;">
	                   			<button type="button" class="btn btn-primary" id="AbtnStatus2" onClick="fn_ABtnStatus2();" style="margin-right:10px;">검토요청</button>
	                   			<button type="button" class="btn btn-secondary" id="AbtnStatus5" onClick="fn_ABtnStatus5();">승인완료</button>
                   			</div>
                    		<div id="divAStatus2">
                    			<table id="myDocTable" class="table table-striped table-bordered nowrap RoleATable">
		                            <colgroup>
		                                <col width="10%"/>
		                                <col width="10%"/>
		                                <col width="10%"/>
		                                <col width="10%"/>
		                                <col width="30%"/>
		                                <col width="10%"/>
		                                <col width="10%"/>
		                                <col width="10%"/>
		                            </colgroup>
		                            <thead>
			                            <tr>
			                                <th class="text-center">작성일자</th>
			                                <th class="text-center">문서번호</th>
			                                <th class="text-center">문서종류</th>
			                                <th class="text-center">거래처</th>
			                                <th class="text-center">문서명</th>
			                                <th class="text-center">금액</th>
			                                <th class="text-center">요청자</th>
			                                <th class="text-center">진행상태</th>
			                            </tr>
		                            </thead>
		                            <tbody>
		                            	<c:forEach var="row" items="${mydoclist}">
			                      			<c:if test="${row.appStatus == 2}">
				                                <tr>
				                                    <td class="text-center">${row.regDate}</td>
				                                    <td class="text-center">
				                                		<a href="${path}/gw/detail/${row.docNo}">VTEK_2022${row.docNo}</a>
				                                	</td>
				                                    <td class="text-center">
				                                    	<c:if test="${row.docType eq 'BUY'}">구매요청서</c:if>
				                                    	<c:if test="${row.docType eq 'TRS'}">지출품의서</c:if>
				                                    	<c:if test="${row.docType eq 'ODS'}">수주수</c:if>
				                                    	<c:if test="${row.docType eq 'CKD'}">검토요청서</c:if>
				                                    	<c:if test="${row.docType eq 'FMF'}">공문서 확인 요청서</c:if>
				                                    	<c:if test="${row.docType eq 'COST'}">비용청구</c:if>
				                                    	<c:if test="${row.docType eq 'TAX'}">세금공과금</c:if>
				                                    	<c:if test="${row.docType eq 'CREDIT'}">외상매입금</c:if>
				                                    	<c:if test="${row.docType eq 'PAY'}">급여</c:if>
				                                    	<c:if test="${row.docType eq 'PUR'}">발주서</c:if>
				                                    	<c:if test="${row.docType eq 'DIP'}">공문서</c:if>
				                                    </td>
				                                    <td class="text-center">${row.custName}</td>
				                                    <td>${row.docTitle}</td>
				                                    <td class="text-right">￦<fmt:formatNumber type="number" maxFractionDigits="3" value="${row.docAmount}" /></td>
				                                    <td class="text-center">${row.userIsName}</td>
				                                    <td class="text-center">검토요청</td>
				                                    <%-- <td class="text-center">
				                                    	<c:if test="${row.appStatus == 2}">검토요청</c:if>
				                                    	<c:if test="${row.appStatus == 3}">반려</c:if>
				                                    	<c:if test="${row.appStatus == 4}">승인요청</c:if>
				                                    </td> --%>
				                                </tr>
			                       			</c:if>
		                            	</c:forEach>
	                            	</tbody>
		                        </table>
                    		</div>
                    		<div id="divAStatus5">
                    			<table id="myDocTable" class="table table-striped table-bordered nowrap RoleATable">
		                            <colgroup>
		                                <col width="10%"/>
		                                <col width="10%"/>
		                                <col width="10%"/>
		                                <col width="10%"/>
		                                <col width="30%"/>
		                                <col width="10%"/>
		                                <col width="10%"/>
		                                <col width="10%"/>
		                            </colgroup>
		                            <thead>
			                            <tr>
			                                <th class="text-center">작성일자</th>
			                                <th class="text-center">문서번호</th>
			                                <th class="text-center">문서종류</th>
			                                <th class="text-center">거래처</th>
			                                <th class="text-center">문서명</th>
			                                <th class="text-center">금액</th>
			                                <th class="text-center">요청자</th>
			                                <th class="text-center">진행상태</th>
			                            </tr>
		                            </thead>
		                            <tbody>
		                            	<c:forEach var="row" items="${mydoclist}">
			                      			<c:if test="${row.appStatus == 5 && row.docFormNo eq 'TREQ'}">
				                                <tr>
				                                    <td class="text-center">${row.regDate}</td>
				                                    <td class="text-center">
				                                		<a href="${path}/gw/detail/${row.docNo}">VTEK_2022${row.docNo}</a>
				                                	</td>
				                                    <td class="text-center">
				                                    	<c:if test="${row.docType eq 'BUY'}">구매요청서</c:if>
				                                    	<c:if test="${row.docType eq 'TRS'}">지출품의서</c:if>
				                                    	<c:if test="${row.docType eq 'ODS'}">수주수</c:if>
				                                    	<c:if test="${row.docType eq 'CKD'}">검토요청서</c:if>
				                                    	<c:if test="${row.docType eq 'FMF'}">공문서 확인 요청서</c:if>
				                                    	<c:if test="${row.docType eq 'COST'}">비용청구</c:if>
				                                    	<c:if test="${row.docType eq 'TAX'}">세금공과금</c:if>
				                                    	<c:if test="${row.docType eq 'CREDIT'}">외상매입금</c:if>
				                                    	<c:if test="${row.docType eq 'PAY'}">급여</c:if>
				                                    	<c:if test="${row.docType eq 'PUR'}">발주서</c:if>
				                                    	<c:if test="${row.docType eq 'DIP'}">공문서</c:if>
				                                    </td>
				                                    <td class="text-center">${row.custName}</td>
				                                    <td>${row.docTitle}</td>
				                                    <td class="text-right">￦<fmt:formatNumber type="number" maxFractionDigits="3" value="${row.docAmount}" /></td>
				                                    <td class="text-center">${row.userIsName}</td>
				                                    <td class="text-center">검토요청</td>
				                                    <%-- <td class="text-center">
				                                    	<c:if test="${row.appStatus == 2}">검토요청</c:if>
				                                    	<c:if test="${row.appStatus == 3}">반려</c:if>
				                                    	<c:if test="${row.appStatus == 4}">승인요청</c:if>
				                                    </td> --%>
				                                </tr>
			                       			</c:if>
		                            	</c:forEach>
	                            	</tbody>
		                        </table>
                    		</div>
	                   	</c:if>
                   		<c:if test="${sessionScope.docRole eq 'S'}">
                   			<div style="margin-bottom: 20px;">
	                   			<button type="button" class="btn btn-primary" id="btnStatus4" onClick="fn_BtnStatus4();" style="margin-right:10px;">승인요청</button>
	                   			<button type="button" class="btn btn-secondary" id="btnStatus5" onClick="fn_BtnStatus5();">승인완료</button>
                   			</div>
                   			<div id="divStatus4">
	                   			<table id="myDocTable" class="table table-striped table-bordered nowrap ">
		                            <colgroup>
		                                <col width="10%"/>
		                                <col width="10%"/>
		                                <col width="10%"/>
		                                <col width="10%"/>
		                                <col width="30%"/>
		                                <col width="10%"/>
		                                <col width="10%"/>
		                                <col width="10%"/>
		                            </colgroup>
		                            <thead>
		                            <tr>
		                            	<th class="text-center">
		                            		<input type="checkbox" id="thisAllCheck">
		                            	</th>
		                                <th class="text-center">작성일자</th>
		                                <th class="text-center">문서번호</th>
		                                <th class="text-center">문서종류</th>
		                                <th class="text-center">거래처</th>
		                                <th class="text-center">문서명</th>
		                                <th class="text-center">금액</th>
		                                <th class="text-center">요청자</th>
		                                <th class="text-center">진행상태</th>
		                            </tr>
		                            </thead>
		                            <tbody>
			                            <c:forEach var="row" items="${mydoclist}">
		                           			<c:if test="${row.appStatus == 4}">
		                           				<tr>
		                           					<td class="text-center">
				                                		<input type="checkbox" id="thisCheck" data-id="${row.docNo}">
				                                	</td>
				                                    <td class="text-center">${row.regDate}</td>
				                                    <td class="text-center">
				                                		<a href="${path}/gw/detail/${row.docNo}">VTEK_2022${row.docNo}</a>
				                                	</td>
				                                    <td class="text-center">
				                                    	<c:if test="${row.docType eq 'BUY'}">구매요청서</c:if>
				                                    	<c:if test="${row.docType eq 'TRS'}">지출품의서</c:if>
				                                    	<c:if test="${row.docType eq 'ODS'}">수주수</c:if>
				                                    	<c:if test="${row.docType eq 'CKD'}">검토요청서</c:if>
				                                    	<c:if test="${row.docType eq 'FMF'}">공문서 확인 요청서</c:if>
				                                    	<c:if test="${row.docType eq 'COST'}">비용청구</c:if>
				                                    	<c:if test="${row.docType eq 'TAX'}">세금공과금</c:if>
				                                    	<c:if test="${row.docType eq 'CREDIT'}">외상매입금</c:if>
				                                    	<c:if test="${row.docType eq 'PAY'}">급여</c:if>
				                                    	<c:if test="${row.docType eq 'PUR'}">발주서</c:if>
				                                    	<c:if test="${row.docType eq 'DIP'}">공문서</c:if>
				                                    </td>
				                                    <td class="text-center">${row.custName}</td>
				                                    <td>${row.docTitle}</td>
				                                    <td class="text-right">￦<fmt:formatNumber type="number" maxFractionDigits="3" value="${row.docAmount}" /></td>
				                                    <td class="text-center">${row.userIsName}</td>
				                                    <td class="text-center">승인요청</td>
				                                    <%-- <td class="text-center">
				                                    	<c:if test="${row.appStatus == 2}">검토요청</c:if>
				                                    	<c:if test="${row.appStatus == 3}">반려</c:if>
				                                    	<c:if test="${row.appStatus == 4}">승인요청</c:if>
				                                    </td> --%>
				                                </tr>
		                           			</c:if>
			                            </c:forEach>
	                            	</tbody>
	                        	</table>
                   			</div>
                   			<div id="divStatus5">
	                   			<table id="myDocTable" class="table table-striped table-bordered nowrap ">
		                            <colgroup>
		                                <col width="10%"/>
		                                <col width="10%"/>
		                                <col width="10%"/>
		                                <col width="10%"/>
		                                <col width="30%"/>
		                                <col width="10%"/>
		                                <col width="10%"/>
		                                <col width="10%"/>
		                            </colgroup>
		                            <thead>
		                            <tr>
		                                <th class="text-center">작성일자</th>
		                                <th class="text-center">문서번호</th>
		                                <th class="text-center">문서종류</th>
		                                <th class="text-center">거래처</th>
		                                <th class="text-center">문서명</th>
		                                <th class="text-center">금액</th>
		                                <th class="text-center">요청자</th>
		                                <th class="text-center">진행상태</th>
		                            </tr>
		                            </thead>
		                            <tbody>
			                            <c:forEach var="row" items="${mydoclist}">
		                           			<c:if test="${row.appStatus == 5}">
		                           				<tr>
				                                    <td class="text-center">${row.regDate}</td>
				                                    <td class="text-center">
				                                		<a href="${path}/gw/detail/${row.docNo}">VTEK_2022${row.docNo}</a>
				                                	</td>
				                                    <td class="text-center">
				                                    	<c:if test="${row.docType eq 'BUY'}">구매요청서</c:if>
				                                    	<c:if test="${row.docType eq 'TRS'}">지출품의서</c:if>
				                                    	<c:if test="${row.docType eq 'ODS'}">수주수</c:if>
				                                    	<c:if test="${row.docType eq 'CKD'}">검토요청서</c:if>
				                                    	<c:if test="${row.docType eq 'FMF'}">공문서 확인 요청서</c:if>
				                                    	<c:if test="${row.docType eq 'COST'}">비용청구</c:if>
				                                    	<c:if test="${row.docType eq 'TAX'}">세금공과금</c:if>
				                                    	<c:if test="${row.docType eq 'CREDIT'}">외상매입금</c:if>
				                                    	<c:if test="${row.docType eq 'PAY'}">급여</c:if>
				                                    	<c:if test="${row.docType eq 'PUR'}">발주서</c:if>
				                                    	<c:if test="${row.docType eq 'DIP'}">공문서</c:if>
				                                    </td>
				                                    <td class="text-center">${row.custName}</td>
				                                    <td>${row.docTitle}</td>
				                                    <td class="text-right">￦<fmt:formatNumber type="number" maxFractionDigits="3" value="${row.docAmount}" /></td>
				                                    <td class="text-center">${row.userIsName}</td>
				                                    <td class="text-center">승인완료</td>
				                                    <%-- <td class="text-center">
				                                    	<c:if test="${row.appStatus == 2}">검토요청</c:if>
				                                    	<c:if test="${row.appStatus == 3}">반려</c:if>
				                                    	<c:if test="${row.appStatus == 4}">승인요청</c:if>
				                                    </td> --%>
				                                </tr>
		                           			</c:if>
			                            </c:forEach>
	                            	</tbody>
	                        	</table>
                   			</div>
	                        <div class="text-left">
	                        	<input type="hidden" id="docUserNo" value="${sessionScope.userNo}" />
	                        	<button type="button" class="btn btn-mb btn-success" onClick="fn_ListApp();">승인</button>
	                        </div>
	                   	</c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--//리스트 table-->
    <script>
        $("#myDocTable tbody tr").find("#absSum").each(function(index, item){
            var absValue = $(item).html().replace(/[\D\s\._\-]+/g, "");
            var absSum = 0;

            if(absValue < 0){
                absSum = absValue * -1;
            }else{
                absSum = absValue;
            }

            $(item).html(Number(absSum).toLocaleString("en-US"));
        });

        $("#vatSdate").change(function(){
            var dateValue = $(this).val();
            var dateValueArr = dateValue.split("-");
            var dateValueCom = new Date(dateValueArr[0], parseInt(dateValueArr[1])-1, dateValueArr[2]);
            var EdateValue = $("#vatEdate").val();
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

            $("#vatEdate").val(year + "-" + month + "-" + day);
        });

        $("#vatEdate").change(function(){
            var SdateValue = $("#vatSdate").val();
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

            $("#vatSdate").val(year + "-" + month + "-" + day);
        });


        $('#userModal').on('show.bs.modal', function(e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find('.modal-body').load(button.data("remote"));
        });

        $('#custModal').on('show.bs.modal', function(e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find('.modal-body').load(button.data("remote"));
        });
        $('#endCustModal').on('show.bs.modal', function(e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find('.modal-body').load(button.data("remote"));
        });
        
        function fn_BtnStatus4(){
        	$("#divStatus4").show();
        	$("#divStatus5").hide();
        	$("#btnStatus4").removeClass();
        	$("#btnStatus4").attr("class", "btn btn-primary");
        	$("#btnStatus5").removeClass();
        	$("#btnStatus5").attr("class", "btn btn-secondary");
        }
        
        function fn_BtnStatus5(){
        	$("#divStatus5").show();
        	$("#divStatus4").hide();
        	$("#btnStatus5").removeClass();
        	$("#btnStatus5").attr("class", "btn btn-primary");
        	$("#btnStatus4").removeClass();
        	$("#btnStatus4").attr("class", "btn btn-secondary");
        }
        
        function fn_ABtnStatus2(){
        	$("#divAStatus2").show();
        	$("#divAStatus5").hide();
        	$("#AbtnStatus2").removeClass();
        	$("#AbtnStatus2").attr("class", "btn btn-primary");
        	$("#AbtnStatus5").removeClass();
        	$("#AbtnStatus5").attr("class", "btn btn-secondary");
        }
        
        function fn_ABtnStatus5(){
        	$("#divAStatus5").show();
        	$("#divAStatus2").hide();
        	$("#AbtnStatus5").removeClass();
        	$("#AbtnStatus5").attr("class", "btn btn-primary");
        	$("#AbtnStatus2").removeClass();
        	$("#AbtnStatus2").attr("class", "btn btn-secondary");
        }

        function fnSetUserData(a, b) {
            localStorage.setItem("userName", b);
            $("#userName").val(b);
            $("#userNo").val(a);
            $(".modal-backdrop").remove();
            $("#userModal").modal("hide");
        }

        function fnSetCustData(a, b) {
            $("#custNo").val(b);
            $("#custName").val(a);
            $(".modal-backdrop").remove();
            $("#custModal").modal("hide");
        }
        function fnSetEndCustData(a, b) {
            $("#endCustNo").val(b);
            $("#endCustName").val(a);
            $(".modal-backdrop").remove();
            $("#endCustModal").modal("hide");
        }
        
        function fn_ListApp(){
        	$("#myDocTable tbody tr td").find("#thisCheck:checked").each(function(index, item){
           		$.ajax({
           			url: "${path}/gw/myDocListUpdate.do/",
           			method: "post",
           			data: {
           				docNo: $(item).attr("data-id")
           			},
           			async : false,
           			dataType: "json",
           			success:function(){
           				$.ajax({
           					url: "${path}/gw/myDocCopyInsert.do",
           					method: "post",
           					data: {
           						docNo: $(item).attr("data-id"),
           						docStatus: 3
           					},
           					async : false,
           					dataType: "json",
           					success:function(data){
           						var dataArrayApp = {};
           		   	        	var dataArrayData = {};
           		   	        	
           						dataArrayApp.docNo = data;
           						dataArrayApp.appStatus = 5;
           						dataArrayApp.userNoIS = $("#docUserNo").val();
           						dataArrayApp.tempId = $(item).attr("data-id");
           						
           						$.ajax({
           							url: "${path}/gw/myDocCopyInsertApp.do",
                   					method: "post",
                   					data: dataArrayApp,
                   					async : false,
                   					dataType: "json",
                   					success:function(){
                   						dataArrayData.docNo = data;
                   						dataArrayData.tempId = $(item).attr("data-id");
                   						
                   						$.ajax({
                   							url: "${path}/gw/myDocCopyInsertData.do",
                           					method: "post",
                           					data: dataArrayData,
                           					async : false,
                           					dataType: "json"
                   						});
                   					}
           						});
           					}
           				});
           			}
           		});
       		});
        	
           	setTimeout(() => {
   	        	alert("승인되었습니다.");
   	        	location.reload();
   			}, 1000); 
       	}  	

        function fnListcon() {
        	var myDocData = {};
    		myDocData.custNo = $("#custNo").val() ? Number($("#custNo").val()) : 0;
    		myDocData.userName = $("#userName").val() ? $("#userName").val() : null;
    		myDocData.vatSdate = $("#vatSdate").val() ? $("#vatSdate").val() : null;
    		myDocData.vatEdate = $("#vatEdate").val() ? $("#vatEdate").val() : null;
    		var param = "?";
    		var paramFirst = true;
    		for (variable in myDocData) {
    			console.log("key: " + variable + ", value: " + myDocData[variable]);
    			if(myDocData[variable] != null && myDocData[variable] != 0) {
    				if(paramFirst){
    					param = param + variable + "=" + myDocData[variable];
    					paramFirst = false;
    				} else {
    					param = param + "&" + variable + "=" + myDocData[variable];
    				}
    			}
    		}

    		if(param == "?"){
    			param = "";
    		}
    		
    		localStorage.setItem("custNo", myDocData.custNo);
    		localStorage.setItem("custName", $("#custName").val());
    		localStorage.setItem("userName", myDocData.userName);
    		localStorage.setItem("vatSdate", $("#vatSdate").val());
    		localStorage.setItem("vatEdate", $("#vatEdate").val());

    		var url = '${path}/gw/mydoclist.do'+param;
    		location.href = url;
        }

        $("input[type='text']").keyup(function(e){
            if(e.keyCode == 13){
                $("#search").click();
            }
        });

        $(document).ready(function() {
        	$("#vatSdate").val(localStorage.getItem("vatSdate"));
        	$("#vatEdate").val(localStorage.getItem("vatEdate"));
        	
        	$("#divStatus5").hide();
        	$("#divAStatus5").hide();
        	
        	$("#thisAllCheck").click(function(){
        		if($(this).is(":checked")){
        			$("#myDocTable tbody tr td").find("#thisCheck").prop("checked", true);
        		}else{
        			$("#myDocTable tbody tr td").find("#thisCheck").prop("checked", false);
        		}
        	})
        	
            if(window.location.search.toString().startsWith('?')){
            	if('${param.userName}' == ''){
    				$("#userName").val("");
    			} else {
    				$("#userName").val(localStorage.getItem("userName"));
    			}
    			
    			if('${param.custNo}' == ''){
    				$("#custNo").val("");
    				$("#custName").val("");
    			} else {
    				$("#custNo").val(localStorage.getItem("custNo"));
    				$("#custName").val(localStorage.getItem("custName"));
    			}
            } /* else {
			var userName = '${sessionScope.userName}';
			$("#userName").val(userName);
		} */
			localStorage.clear();
        });
    </script>
</div>
<jsp:include page="../body-bottom.jsp"/>
