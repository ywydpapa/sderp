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
										<th class="text-center">구분(상품/서비스)</th>
										<th class="text-center">항목</th>
										<th class="text-center">단가</th>
										<th class="text-center">수량</th>
										<th class="text-center">금액</th>
										<th class="text-center">비고</th>
										<th class="text-center">삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="row2" items="${dtodata02}">
									<tr class="item1">
										<td><c:if test="${row2.dataType eq '2201'}">상품 </c:if><c:if test="${row2.dataType eq '2202'}">서비스</c:if></td>
										<td>${row2.dataTitle}</td>
										<td style="text-align:right"><fmt:formatNumber value="${row2.dataNetprice}" pattern="#,###"/></td>
										<td style="text-align:right"><fmt:formatNumber value="${row2.dataQuanty}" pattern="#,###"/></td>
										<td style="text-align:right"><fmt:formatNumber value="${row2.dataAmt}" pattern="#,###"/></td>
										<td>${row2.dataRemark}</td>
										<td><button id="inoutDelbtn" onClick="javascript:fn_data02delete(${row2.soppdataNo})">삭제</button></td>
									</tr>
									</c:forEach>
								</tbody>