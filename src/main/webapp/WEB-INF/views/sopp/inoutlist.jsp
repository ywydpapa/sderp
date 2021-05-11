<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
<c:set var="path" value ="${pageContext.request.contextPath}"/>

								<colgroup>
									<col width="5%" />
									<col width="30%" />
									<col width="15%" />
									<col width="10%" />
									<col width="20%" />
									<col width="15%" />
									<col width="5%" />
								</colgroup>
								<thead>
									<tr>
										<th class="text-center">구분(매입/매출)</th>
										<th class="text-center">항목</th>
										<th class="text-center">단가</th>
										<th class="text-center">수량</th>
										<th class="text-center">금액</th>
										<th class="text-center">비고</th>
										<th class="text-center">삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="row" items="${dtodata01}">
									<tr class="item1">
										<td><c:if test="${row.dataType eq '1101'}">매입 </c:if><c:if test="${row.dataType eq '1102'}">매출 </c:if></td>
										<td>${row.dataTitle}</td>
										<td style="text-align:right"><fmt:formatNumber value="${row.dataNetprice}" pattern="#,###"/></td>
										<td style="text-align:right"><fmt:formatNumber value="${row.dataQuanty}" pattern="#,###"/></td>
										<td style="text-align:right"><fmt:formatNumber value="${row.dataAmt}" pattern="#,###"/></td>
										<td>${row.dataRemark}</td>
										<td><button id="inoutDelbtn" onClick="javascript:fn_data01delete(${row.soppdataNo})">삭제</button></td>
									</tr>
									</c:forEach>
								</tbody>