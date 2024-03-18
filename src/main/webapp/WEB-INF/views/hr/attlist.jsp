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

<div id="main_content">
    <script>
        $(function(){
            $('#contTable').DataTable({
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
        #contTable > tbody > tr > td:nth-child(4){
            overflow: hidden;
            text-overflow: ellipsis;
            max-width: 220px;
            white-space: nowrap;
        }
        #contTable > tbody > tr > td:nth-child(5){
            overflow: hidden;
            text-overflow: ellipsis;
            max-width: 220px;
            white-space: nowrap;
        }
        
        #contTable thead tr th{
        	vertical-align: middle;
        }
        
        #contTable tbody tr td{
        	vertical-align: middle;
        }
    </style>
   <!--리스트 table-->
    <div class="cnt_wr" id="list-container">
        <div class="row">
            <div class="col-sm-12">
                <div class="card-block table-border-style">
                    <div class="table-responsive">
                        <table id="contTable" class="table table-striped table-bordered nowrap ">
                        	<c:choose>
                               	<c:when test="${sessionScope.docRole eq 'S' || sessionScope.docRole eq 'A'}">
                               		<colgroup>
                               			<col width="5%"/>
                               			<col width="5%"/>
		                                <col width="5%"/>
		                                <col width="10%"/>
		                                <col width="5%"/>
		                                <col width="7%"/>
		                                <col width="38%"/>
		                                <col width="15%"/>
		                                <col width="15%"/>
		                            </colgroup>
                               	</c:when>
                               	<c:otherwise>
                               		<colgroup>
		                                <col width="5%"/>
		                                <col width="5%"/>
		                                <col width="10%"/>
		                                <col width="10%"/>
		                                <col width="10%"/>
		                                <col width="35%"/>
		                                <col width="15%"/>
		                                <col width="15%"/>
		                            </colgroup>
                               	</c:otherwise>
                           	</c:choose>
                            <thead>
                            <tr>
                            	<c:if test="${sessionScope.docRole eq 'S' || sessionScope.docRole eq 'A'}">
                            		<th>
                            			<input type="checkbox" class="form-control" onclick="hrAllCheck(this);">
                            		</th>
                            	</c:if>
                                <th class="text-center">상태</th>
                            	<th class="text-center">출금여부</th>
                                <th class="text-center">작성일자</th>
                                <th class="text-center">근태종류</th>
                                <th class="text-center">신청자</th>
                                <th class="text-center">신청내용</th>
                                <th class="text-center">시작일</th>
                                <th class="text-center">종료일</th>
                            </tr>
                            </thead>
                            <tbody>
	                            <c:forEach var="row" items="${list}">
	                            	<!-- 계정 권한 ADMIN -->
	                            	<c:if test="${sessionScope.docRole eq 'S'}">
	                            		 <tr>
			                                <c:choose>
				                               	<c:when test="${row.attStatus eq 1}">
				                               		<td>
					                               		<input type="checkbox" class="form-control" data-id="${row.attendId}" id="hrCheck">
				                               		</td>
				                               	</c:when>
				                               	<c:otherwise>
				                               		<td>
					                               		<input type="checkbox" class="form-control" id="hrCheck" disabled>
				                               		</td>
				                               	</c:otherwise>
			                               	</c:choose>
			                               	<td class="text-center">
		                                    	<c:if test="${row.attStatus eq 1}">신청중</c:if>
		                                        <c:if test="${row.attStatus eq 3}">반려/보류</c:if>
		                                        <c:choose>
		                                        	<c:when test="${row.attType eq 4}">
														<c:choose>
															<c:when test="${row.attendDrawStatus eq 1}">
																<c:if test="${row.attStatus eq 5}">정산완료</c:if>	
															</c:when>
															<c:otherwise>
																<c:if test="${row.attStatus eq 5}">승인완료</c:if>
															</c:otherwise>
														</c:choose>		                                        		
		                                        	</c:when>
		                                        	<c:otherwise>
				                                        <c:if test="${row.attStatus eq 5}">승인완료</c:if>
		                                        	</c:otherwise>
		                                        </c:choose>
											</td>
			                               	<td class="text-center">
			                               		<c:if test="${row.attType eq 4}">
			                               			<c:choose>
														<c:when test="${row.attendDrawStatus eq 1}">
															Y
														</c:when>
														<c:otherwise>
															N
														</c:otherwise>	                               			
			                               			</c:choose>
			                               		</c:if>
			                               	</td>
		                                    <td class="text-center">${row.regDate}</td>
		                                    <td class="text-center">
		                                        <a href="${path}/gw/attdetail/${row.attendId}"><c:if test="${row.attType eq 1}">월차</c:if>
		                                            <c:if test="${row.attType eq 2}">연차</c:if>
		                                            <c:if test="${row.attType eq 3}">연장근무</c:if>
		                                            <c:if test="${row.attType eq 4}">휴일근무</c:if>
		                                            <c:if test="${row.attType eq 5}">경조휴가</c:if>
		                                        </a>
		                                    </td>
		                                    <td class="text-center">${row.userName}</td>
		                                    <td class="text-left"><a href="${path}/gw/attdetail/${row.attendId}">${fn:replace(row.attDesc, '&nbsp;', '')}</a></td>
		                                    <td class="text-center">${row.attStart}</td>
		                                    <td class="text-center">${row.attEnd}</td>
		                                </tr>
									</c:if>
									<!-- 계정 권한 ADMIN -->
									<!-- 계정 권한 평사원 -->
									<c:if test="${sessionScope.docRole ne 'S'}">
										<c:if test="${sessionScope.docRole ne 'A' && row.userNo eq sessionScope.userNo}">
											<tr>
												<td class="text-center">
		                                    		<c:if test="${row.attStatus eq 1}">신청중</c:if>
		                                        	<c:if test="${row.attStatus eq 3}">반려/보류</c:if>
		                                        	<c:choose>
			                                        	<c:when test="${row.attType eq 4}">
															<c:choose>
																<c:when test="${row.attendDrawStatus eq 1}">
																	<c:if test="${row.attStatus eq 5}">정산완료</c:if>	
																</c:when>
																<c:otherwise>
																	<c:if test="${row.attStatus eq 5}">승인완료</c:if>
																</c:otherwise>
															</c:choose>		                                        		
			                                        	</c:when>
			                                        	<c:otherwise>
					                                        <c:if test="${row.attStatus eq 5}">승인완료</c:if>
			                                        	</c:otherwise>
			                                        </c:choose>
												</td>
												<td class="text-center">
													<c:choose>
					                               		<c:when test="${row.attType eq 4}">
					                               			<c:choose>
																<c:when test="${row.attendDrawStatus eq 1}">
																	Y
																</c:when>
																<c:otherwise>
																	N
																</c:otherwise>	                               			
					                               			</c:choose>
					                               		</c:when>
					                               		<c:otherwise>
					                               			
					                               		</c:otherwise>
													</c:choose>
				                               	</td>
				                               	<td class="text-center">${row.regDate}</td>
		                                    	<td class="text-center">
		                                        	<a href="${path}/gw/attdetail/${row.attendId}"><c:if test="${row.attType eq 1}">월차</c:if>
		                                            	<c:if test="${row.attType eq 2}">연차</c:if>
		                                            	<c:if test="${row.attType eq 3}">연장근무</c:if>
		                                            	<c:if test="${row.attType eq 4}">휴일근무</c:if>
		                                            	<c:if test="${row.attType eq 5}">경조휴가</c:if>
		                                        	</a>
		                                    	</td>
		                                    	<td class="text-center">${row.userName}</td>
		                                    	<td class="text-left"><a href="${path}/gw/attdetail/${row.attendId}">${fn:replace(row.attDesc, '&nbsp;', '')}</a></td>
		                                    	<td class="text-center">${row.attStart}</td>
		                                    	<td class="text-center">${row.attEnd}</td>
		                                	</tr>
										</c:if>
										<c:if test="${sessionScope.docRole eq 'A' && row.userNo eq sessionScope.userNo}">
											<tr>
												<c:choose>
					                               	<c:when test="${row.attType eq 4}">
					                               		<td>
						                               		<input type="checkbox" class="form-control" data-id="${row.attendId}" id="hrCheck">
					                               		</td>
					                               	</c:when>
					                               	<c:otherwise>
					                               		<td>
						                               		<input type="checkbox" class="form-control" id="hrCheck" disabled>
					                               		</td>
					                               	</c:otherwise>
				                               	</c:choose>
				                               	<td class="text-center">
		                                    		<c:if test="${row.attStatus eq 1}">신청중</c:if>
		                                        	<c:if test="${row.attStatus eq 3}">반려/보류</c:if>
		                                        	<c:choose>
			                                        	<c:when test="${row.attType eq 4}">
															<c:choose>
																<c:when test="${row.attendDrawStatus eq 1}">
																	<c:if test="${row.attStatus eq 5}">정산완료</c:if>	
																</c:when>
																<c:otherwise>
																	<c:if test="${row.attStatus eq 5}">승인완료</c:if>
																</c:otherwise>
															</c:choose>		                                        		
			                                        	</c:when>
			                                        	<c:otherwise>
					                                        <c:if test="${row.attStatus eq 5}">승인완료</c:if>
			                                        	</c:otherwise>
			                                        </c:choose>
												</td>
												<td class="text-center">
				                               		<c:if test="${row.attType eq 4}">
				                               			<c:choose>
															<c:when test="${row.attendDrawStatus eq 1}">
																Y
															</c:when>
															<c:otherwise>
																N
															</c:otherwise>	                               			
				                               			</c:choose>
				                               		</c:if>
				                               	</td>
				                               	<td class="text-center">${row.regDate}</td>
		                                    	<td class="text-center">
		                                        	<a href="${path}/gw/attdetail/${row.attendId}"><c:if test="${row.attType eq 1}">월차</c:if>
		                                            	<c:if test="${row.attType eq 2}">연차</c:if>
		                                            	<c:if test="${row.attType eq 3}">연장근무</c:if>
		                                            	<c:if test="${row.attType eq 4}">휴일근무</c:if>
		                                            	<c:if test="${row.attType eq 5}">경조휴가</c:if>
		                                        	</a>
		                                    	</td>
		                                    	<td class="text-center">${row.userName}</td>
		                                    	<td class="text-left"><a href="${path}/gw/attdetail/${row.attendId}">${fn:replace(row.attDesc, '&nbsp;', '')}</a></td>
		                                    	<td class="text-center">${row.attStart}</td>
		                                    	<td class="text-center">${row.attEnd}</td>
		                                	</tr>
										</c:if>
										<c:if test="${sessionScope.docRole eq 'A' && row.userNo ne sessionScope.userNo && row.attStatus eq 5 && row.attType eq 4}">
												<tr>
													<c:choose>
						                               	<c:when test="${row.attType eq 4}">
						                               		<td>
							                               		<input type="checkbox" class="form-control" data-id="${row.attendId}" id="hrCheck">
						                               		</td>
						                               	</c:when>
						                               	<c:otherwise>
						                               		<td>
							                               		<input type="checkbox" class="form-control" id="hrCheck" disabled>
						                               		</td>
						                               	</c:otherwise>
					                               	</c:choose>
					                               	<td class="text-center">
			                                    		<c:if test="${row.attStatus eq 1}">신청중</c:if>
			                                        	<c:if test="${row.attStatus eq 3}">반려/보류</c:if>
			                                        	<c:choose>
				                                        	<c:when test="${row.attType eq 4}">
																<c:choose>
																	<c:when test="${row.attendDrawStatus eq 1}">
																		<c:if test="${row.attStatus eq 5}">정산완료</c:if>	
																	</c:when>
																	<c:otherwise>
																		<c:if test="${row.attStatus eq 5}">승인완료</c:if>
																	</c:otherwise>
																</c:choose>		                                        		
				                                        	</c:when>
				                                        	<c:otherwise>
						                                        <c:if test="${row.attStatus eq 5}">승인완료</c:if>
				                                        	</c:otherwise>
				                                        </c:choose>
													</td>
													<td class="text-center">
					                               		<c:if test="${row.attType eq 4}">
					                               			<c:choose>
																<c:when test="${row.attendDrawStatus eq 1}">
																	Y
																</c:when>
																<c:otherwise>
																	N
																</c:otherwise>	                               			
					                               			</c:choose>
					                               		</c:if>
					                               	</td>
					                               	<td class="text-center">${row.regDate}</td>
			                                    	<td class="text-center">
			                                        	<a href="${path}/gw/attdetail/${row.attendId}"><c:if test="${row.attType eq 1}">월차</c:if>
			                                            	<c:if test="${row.attType eq 2}">연차</c:if>
			                                            	<c:if test="${row.attType eq 3}">연장근무</c:if>
			                                            	<c:if test="${row.attType eq 4}">휴일근무</c:if>
			                                            	<c:if test="${row.attType eq 5}">경조휴가</c:if>
			                                        	</a>
			                                    	</td>
			                                    	<td class="text-center">${row.userName}</td>
			                                    	<td class="text-left"><a href="${path}/gw/attdetail/${row.attendId}">${fn:replace(row.attDesc, '&nbsp;', '')}</a></td>
			                                    	<td class="text-center">${row.attStart}</td>
			                                    	<td class="text-center">${row.attEnd}</td>
			                                	</tr>
										</c:if>
									</c:if>
									<!-- 계정 권한 평사원 -->
	                            </c:forEach>
                            </tbody>
                        </table>
                        <c:if test="${sessionScope.docRole eq 'S'}">
	                        <div style="float:left;">
	                        	<button type="button" class="btn btn-success" onclick="hrListApp();">승인</button>
	                        	<button type="button" class="btn btn-danger" onclick="hrListCom();">반려</button>
	                        </div>
                        </c:if>
                        <c:if test="${sessionScope.docRole eq 'A'}">
	                        <div style="float:left;">
	                        	<button type="button" class="btn btn-success" onclick="hrAttendStatusUpdate();">출금</button>
	                        	<button type="button" class="btn btn-danger" onclick="hrAttendStatusCancel();">출금취소</button>
	                        </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--//리스트 table-->
    <script>
        $(document).ready(function() {
			     	
        });
        
        function hrAllCheck(e){
        	if($(e).is(":checked") == true){
        		$("#contTable tbody tr #hrCheck").not(":disabled").prop("checked", true);
        	}else{
        		$("#contTable tbody tr #hrCheck").not(":disabled").prop("checked", false);
        	}
        }
        
        function hrListApp(){
        	if(confirm("승인하시겠습니까??")){
        		var compNo = "${sessionScope.compNo}";
        		var pathName = $(location).attr("pathname");
        		
        		$("#contTable tbody tr #hrCheck").each(function(index, item){
        			if($(item).is(":checked") == true){
		        		var updateData = {};
        				updateData.attendId = $(item).attr("data-id");
						updateData.compNo = compNo;
        				
						$.ajax({
							url: "${path}/gw/hrListApp.do",
							method: "post",
							data: updateData,
							dataType: "json",
							error:function(){
								alert("승인을 완료하지 못했습니다.\n다시 시도해주십시오.");
								return false;
							}
						});						
        			}
        		});
        		
        		alert("승인이 완료되었습니다.");
        		location.href = pathName;
        	}else{
        		return false;
        	}
        }
        
        function hrListCom(){
        	if(confirm("반려하시겠습니까??")){
        		var compNo = "${sessionScope.compNo}";
        		var pathName = $(location).attr("pathname");
        		
        		$("#contTable tbody tr #hrCheck").each(function(index, item){
        			if($(item).is(":checked") == true){
		        		var updateData = {};
        				updateData.attendId = $(item).attr("data-id");
						updateData.compNo = compNo;
        				
						$.ajax({
							url: "${path}/gw/hrListCom.do",
							method: "post",
							data: updateData,
							dataType: "json",
							error:function(){
								alert("반려 완료하지 못했습니다.\n다시 시도해주십시오.");
								return false;
							}
						});						
        			}
        		});
        		
        		alert("반려가 완료되었습니다.");
        		location.href = pathName;
        	}else{
        		return false;
        	}
        }
        
        function hrAttendStatusUpdate(){
        	if(confirm("출금 상태를 변경하시겠습니까??")){
	        	var tableCheck = $("#contTable tbody tr td");
	        	var path = $(location).attr("pathname");
	        	var compNo = "${sessionScope.compNo}";
				var tableCheckLength = tableCheck.find("#hrCheck:checked").length;
				
	        	tableCheck.find("#hrCheck").each(function(index, item){
	        		if($(item).is(":checked") === true){
			        	var updateData = {};

			        	updateData.attendId = $(item).attr("data-id");
			        	
	        			$.LoadingOverlay("show", true);
	        			
	        			$.ajax({
			        		url: "${path}/gw/hrAttendStatusUpdate.do",
			        		method: "post",
			        		data: updateData,
			        		async: false,
			        		dataType: "json",
			        		error: function(){
			        			alert("상태를 변경할 수 없습니다.\n다시 시도해주십시오.");
			        			return false;
			        		}
			        	});
	        			
	        		}
	        		
		        	if(index == tableCheckLength){
					    $.LoadingOverlay("hide", true);
		        	}
	        	});
	        	
	        	alert("변경되었습니다.");
	        	location.href = path;
	        	
        	}else{
        		return false;
        	}
        }
        
        function hrAttendStatusCancel(){
        	if(confirm("출금 상태를 취소하시겠습니까??")){
	        	var tableCheck = $("#contTable tbody tr td");
	        	var path = $(location).attr("pathname");
	        	var compNo = "${sessionScope.compNo}";
	        	var tableCheckLength = tableCheck.find("#hrCheck:checked").length;
	        	
	        	tableCheck.find("#hrCheck").each(function(index, item){
	        		if($(item).is(":checked") === true){
			        	var updateDocData = {};
		        		updateDocData.attendId = $(item).attr("data-id");
		        		
	        			$.LoadingOverlay("show", true);
	        			
	        			$.ajax({
			        		url: "${path}/gw/hrAttendStatusCancel.do",
			        		method: "post",
			        		async: false,
			        		data: updateDocData,
			        		dataType: "json",
			        		error: function(){
			        			alert("상태를 제대로 변경하지 못했습니다.\n다시 시도해주십시오.");
			        			return false;
			        		}
			        	});
	        			
	        		}
	        		
	        		if(index == tableCheckLength){
					    $.LoadingOverlay("hide", true);
		        	}
	        	});
	        	
        		alert("변경되었습니다.");
        		location.href = path;
	        	
        	}else{
        		return false;
        	}
        }
    </script>
</div>
<jsp:include page="../body-bottom.jsp"/>
