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
	#vatTableB tbody tr td{
		vertical-align: middle;
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
                            <h6 style="font-weight:600;">부가가치세</h6>
                        </div>
                    </div>
                    <div class="btn_wr" style="float:right;">
                        <!-- hide and show -->
						<button class="btn btn-sm btn-success" id="fold" onclick="acordian_action()">펼치기</button>
						<button class="btn btn-sm btn-success" id="fold2"  onclick="acordian_action1()" style="display:none;">접기</button>
                        <button class="btn btn-sm btn-inverse" onClick="javascript:fnClearall()">
                        	<i class="icofont icofont-spinner-alt-3"></i>초기화
                        </button>
                        <button class="btn btn-sm btn-primary" onClick="javascript:fnListcon()">
                        	<i class="icofont icofont-search"></i>검색
                        </button>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="cnt_wr" id="acordian" style="display:none;">
            <div class="row">
                <form id="searchForm" method="post" onsubmit="return false;" class="col-sm-12">
                    <div class="col-sm-12">
                        <div class="card_box sch_it">
                            <div class="form-group row">
                                <div class="col-sm-12 col-xl-5">
                                	<c:set var="today" value="<%=new java.util.Date() %>"/>
                                	<fmt:formatDate value="${today}" pattern="yyyy" var="start"/>
                                    <p class="input-group">
                                    	<select class="form-control form-control-sm" id="searchYear">
                                    		<option value="">년도 선택</option>
                                    		<c:forEach var="i" begin="0" end="100" step="1">
                                    			<option value="${start - i}" <c:if test="${param.searchYear eq (start - i)}">selected</c:if>>${start - i}</option>
                                    		</c:forEach>
                                    	</select>
                                    	<select class="form-control form-control-sm" id="searchChoice">
                                    		<option value="" <c:if test="${param.searchChoice == 0}">selected</c:if>>분기별 선택</option>
                                    		<option value="3" <c:if test="${param.searchChoice == 3}">selected</c:if>>1기 예정</option>
                                    		<option value="6" <c:if test="${param.searchChoice == 6}">selected</c:if>>1기 확정</option>
                                    		<option value="1" <c:if test="${param.searchChoice == 1}">selected</c:if>>1기 (예정+확정)</option>
                                    		<option value="9" <c:if test="${param.searchChoice == 9}">selected</c:if>>2기 예정</option>
                                    		<option value="12" <c:if test="${param.searchChoice == 12}">selected</c:if>>2기 확정</option>
                                    		<option value="2" <c:if test="${param.searchChoice == 2}">selected</c:if>>2기 (예정+확정)</option>
                                    	</select>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </c:if>

    <!--리스트 table-->
    <div class="cnt_wr" id="list-container">
        <div class="row">
            <div class="col-sm-12">
                <div class="card-block table-border-style">
                    <div class="table-responsive" style="overflow:hidden;">
                    	<table class="table table-bordered nowrap" style="margin-bottom: 1%;">
                    		<c:forEach items="${vatListB}" var="vlist">
                    			<c:if test="${vlist.vatDeduction eq 'Y'}">
                    				<c:set var="totalSumB" value="${totalSumB + vlist.vatTax}" />
                    			</c:if>
                    		</c:forEach>
                    		<c:forEach items="${vatListS}" var="vlist">
                    			<c:if test="${vlist.vatDeduction eq 'Y'}">
                    				<c:set var="totalSumS" value="${totalSumS + vlist.vatTax}" />
                    			</c:if>
                    		</c:forEach>
                   			<tr style="background-color: #FAF4C0;">
                   				<th class="text-center" style="color: #FF0000;">부가가치세</th>
                   				<c:choose>
                    				<c:when test="${empty vatListB || empty vatListS}">
		                            	<th class="text-right">0</th>
                    				</c:when>
                    				<c:otherwise>
	                    				<th class="text-center moneyTdHtml" style="color: #FF0000;">${totalSumS - totalSumB}</th>
                    				</c:otherwise>
                   				</c:choose>
                   			</tr>
                    	</table>
                        <table id="vatTable" class="table table-bordered nowrap ">
                        	<tr>
                        		<th></th>
                        		<th class="text-center" colspan="2" style="background-color: #B2CCFF;">매출</th>
                        		<th class="text-center" colspan="2" style="background-color: #FFC19E;">매입</th>
                        	</tr>
                        	<tr>
                        		<th></th>
                        		<th class="text-center" style="background-color: #EAEAEA;">공급가액</th>
                        		<th class="text-center" style="background-color: #EAEAEA;">총세액</th>
                        		<th class="text-center" style="background-color: #EAEAEA;">공급가액</th>
                        		<th class="text-center" style="background-color: #EAEAEA;">총세액</th>
                        	</tr>
                        	
                        	<c:forEach var="list" items="${vatListB1}">
                        		<c:if test="${list.vatDeduction eq 'Y'}">
	                        		<c:set var="totalBA1" value="${totalBA1 + list.vatAmount}" />
	                        		<c:set var="totalBT1" value="${totalBT1 + list.vatTax}" />
	                        		<c:set var="totalBA" value="${totalBA + list.vatAmount}" />
	                        		<c:set var="totalBT" value="${totalBT + list.vatTax}" />
                        		</c:if>
                        	</c:forEach>
                        	
                        	<c:forEach var="list" items="${vatListS1}">
                        		<c:if test="${list.vatDeduction eq 'Y'}">
                        			<c:set var="totalSA1" value="${totalSA1 + list.vatAmount}" />
                        			<c:set var="totalST1" value="${totalST1 + list.vatTax}" />
                        			<c:set var="totalSA" value="${totalSA + list.vatAmount}" />
	                        		<c:set var="totalST" value="${totalST + list.vatTax}" />
                  				</c:if>
                        	</c:forEach>
                        	
                        	<c:if test="${totalBA1 > 0}">
	                        	<tr style="background-color: #F6F6F6;">
	                        		<td class="text-center">1월</td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalSA1}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalST1}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalBA1}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalBT1}" pattern="#,###" /></td>
	                        	</tr>
                        	</c:if>
                        	
                        	<c:forEach var="list" items="${vatListB2}">
                        		<c:if test="${list.vatDeduction eq 'Y'}">
                        			<c:set var="totalBA2" value="${totalBA2 + list.vatAmount}" />
                        			<c:set var="totalBT2" value="${totalBT2 + list.vatTax}" />
                        			<c:set var="totalBA" value="${totalBA + list.vatAmount}" />
	                        		<c:set var="totalBT" value="${totalBT + list.vatTax}" />
                        		</c:if>
                        	</c:forEach>
                        	
                        	<c:forEach var="list" items="${vatListS2}">
                        		<c:if test="${list.vatDeduction eq 'Y'}">
                        			<c:set var="totalSA2" value="${totalSA2 + list.vatAmount}" />
                        			<c:set var="totalST2" value="${totalST2 + list.vatTax}" />
                        			<c:set var="totalSA" value="${totalSA + list.vatAmount}" />
	                        		<c:set var="totalST" value="${totalST + list.vatTax}" />
                        		</c:if>
                        	</c:forEach>
                        	
                        	<c:if test="${totalBA2 > 0}">
	                        	<tr style="background-color: #F6F6F6;">
	                        		<td class="text-center">2월</td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalSA2}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalST2}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalBA2}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalBT2}" pattern="#,###" /></td>
	                        	</tr>
                        	</c:if>
                        	
                        	<c:forEach var="list" items="${vatListB3}">
                        		<c:if test="${list.vatDeduction eq 'Y'}">
                        			<c:set var="totalBA3" value="${totalBA3 + list.vatAmount}" />
                        			<c:set var="totalBT3" value="${totalBT3 + list.vatTax}" />
                        			<c:set var="totalBA" value="${totalBA + list.vatAmount}" />
	                        		<c:set var="totalBT" value="${totalBT + list.vatTax}" />
                       			</c:if>
                        	</c:forEach>
                        	
                        	<c:forEach var="list" items="${vatListS3}">
                        		<c:if test="${list.vatDeduction eq 'Y'}">
                        			<c:set var="totalSA3" value="${totalSA3 + list.vatAmount}" />
                        			<c:set var="totalST3" value="${totalST3 + list.vatTax}" />
                        			<c:set var="totalSA" value="${totalSA + list.vatAmount}" />
	                        		<c:set var="totalST" value="${totalST + list.vatTax}" />
                        		</c:if>
                        	</c:forEach>
                        	
                        	<c:if test="${totalBA3 > 0}">
	                        	<tr style="background-color: #F6F6F6;">
	                        		<td class="text-center">3월</td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalSA3}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalST3}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalBA3}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalBT3}" pattern="#,###" /></td>
	                        	</tr>
                        	</c:if>
                        	
                        	<c:forEach var="list" items="${vatListB4}">
                        		<c:if test="${list.vatDeduction eq 'Y'}">
                        			<c:set var="totalBA4" value="${totalBA4 + list.vatAmount}" />
                        			<c:set var="totalBT4" value="${totalBT4 + list.vatTax}" />
                        			<c:set var="totalBA" value="${totalBA + list.vatAmount}" />
	                        		<c:set var="totalBT" value="${totalBT + list.vatTax}" />
                       			</c:if>
                        	</c:forEach>
                        	
                        	<c:forEach var="list" items="${vatListS4}">
                        		<c:if test="${list.vatDeduction eq 'Y'}">
                        			<c:set var="totalSA4" value="${totalSA4 + list.vatAmount}" />
                        			<c:set var="totalST4" value="${totalST4 + list.vatTax}" />
                        			<c:set var="totalSA" value="${totalSA + list.vatAmount}" />
	                        		<c:set var="totalST" value="${totalST + list.vatTax}" />
                        		</c:if>
                        	</c:forEach>
                        	
                        	<c:if test="${totalBA4 > 0}">
	                        	<tr style="background-color: #F6F6F6;">
	                        		<td class="text-center">4월</td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalSA4}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalST4}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalBA4}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalBT4}" pattern="#,###" /></td>
	                        	</tr>
	                        </c:if>
                        	
                        	<c:forEach var="list" items="${vatListB5}">
                        		<c:if test="${list.vatDeduction eq 'Y'}">
                        			<c:set var="totalBA5" value="${totalBA5 + list.vatAmount}" />
                        			<c:set var="totalBT5" value="${totalBT5 + list.vatTax}" />
                        			<c:set var="totalBA" value="${totalBA + list.vatAmount}" />
	                        		<c:set var="totalBT" value="${totalBT + list.vatTax}" />
                        		</c:if>
                        	</c:forEach>
                        	
                        	<c:forEach var="list" items="${vatListS5}">
                        		<c:if test="${list.vatDeduction eq 'Y'}">
                        			<c:set var="totalSA5" value="${totalSA5 + list.vatAmount}" />
                        			<c:set var="totalST5" value="${totalST5 + list.vatTax}" />
                        			<c:set var="totalSA" value="${totalSA + list.vatAmount}" />
	                        		<c:set var="totalST" value="${totalST + list.vatTax}" />
                        		</c:if>
                        	</c:forEach>
                        	
                        	<c:if test="${totalBA5 > 0}">
	                        	<tr style="background-color: #F6F6F6;">
	                        		<td class="text-center">5월</td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalSA5}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalST5}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalBA5}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalBT5}" pattern="#,###" /></td>
	                        	</tr>
                        	</c:if>
                        	
                        	<c:forEach var="list" items="${vatListB6}">
                        		<c:if test="${list.vatDeduction eq 'Y'}">
                        			<c:set var="totalBA6" value="${totalBA6 + list.vatAmount}" />
                        			<c:set var="totalBT6" value="${totalBT6 + list.vatTax}" />
                        			<c:set var="totalBA" value="${totalBA + list.vatAmount}" />
	                        		<c:set var="totalBT" value="${totalBT + list.vatTax}" />
                        		</c:if>
                        	</c:forEach>
                        	
                        	<c:forEach var="list" items="${vatListS6}">
                        		<c:if test="${list.vatDeduction eq 'Y'}">
                        			<c:set var="totalSA6" value="${totalSA6 + list.vatAmount}" />
                        			<c:set var="totalST6" value="${totalST6 + list.vatTax}" />
                        			<c:set var="totalSA" value="${totalSA + list.vatAmount}" />
	                        		<c:set var="totalST" value="${totalST + list.vatTax}" />
                        		</c:if>
                        	</c:forEach>
                        	
                        	<c:if test="${totalBA6 > 0}">
	                        	<tr style="background-color: #F6F6F6;">
	                        		<td class="text-center">6월</td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalSA6}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalST6}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalBA6}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalBT6}" pattern="#,###" /></td>
	                        	</tr>
                        	</c:if>
                        	
                        	<c:forEach var="list" items="${vatListB7}">
                        		<c:if test="${list.vatDeduction eq 'Y'}">
                        			<c:set var="totalBA7" value="${totalBA7 + list.vatAmount}" />
                        			<c:set var="totalBT7" value="${totalBT7 + list.vatTax}" />
                        			<c:set var="totalBA" value="${totalBA + list.vatAmount}" />
	                        		<c:set var="totalBT" value="${totalBT + list.vatTax}" />
                        		</c:if>
                        	</c:forEach>
                        	
                        	<c:forEach var="list" items="${vatListS7}">
                        		<c:if test="${list.vatDeduction eq 'Y'}">
                        			<c:set var="totalSA7" value="${totalSA7 + list.vatAmount}" />
                        			<c:set var="totalST7" value="${totalST7 + list.vatTax}" />
                        			<c:set var="totalSA" value="${totalSA + list.vatAmount}" />
	                        		<c:set var="totalST" value="${totalST + list.vatTax}" />
                        		</c:if>
                        	</c:forEach>
                        	
                        	<c:if test="${totalBA7 > 0}">
	                        	<tr style="background-color: #F6F6F6;">
	                        		<td class="text-center">7월</td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalSA7}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalST7}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalBA7}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalBT7}" pattern="#,###" /></td>
	                        	</tr>
                        	</c:if>
                        	
                        	<c:forEach var="list" items="${vatListB8}">
                        		<c:if test="${list.vatDeduction eq 'Y'}">
                        			<c:set var="totalBA8" value="${totalBA8 + list.vatAmount}" />
                        			<c:set var="totalBT8" value="${totalBT8 + list.vatTax}" />
                        			<c:set var="totalBA" value="${totalBA + list.vatAmount}" />
	                        		<c:set var="totalBT" value="${totalBT + list.vatTax}" />
                        		</c:if>
                        	</c:forEach>
                        	
                        	<c:forEach var="list" items="${vatListS8}">
                        		<c:if test="${list.vatDeduction eq 'Y'}">
                        			<c:set var="totalSA8" value="${totalSA8 + list.vatAmount}" />
                        			<c:set var="totalST8" value="${totalST8 + list.vatTax}" />
                        			<c:set var="totalSA" value="${totalSA + list.vatAmount}" />
	                        		<c:set var="totalST" value="${totalST + list.vatTax}" />
                        		</c:if>
                        	</c:forEach>
                        	
                        	<c:if test="${totalBA8 > 0}">
	                        	<tr style="background-color: #F6F6F6;">
	                        		<td class="text-center">8월</td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalSA8}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalST8}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalBA8}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalBT8}" pattern="#,###" /></td>
	                        	</tr>
                        	</c:if>
                        	
                        	<c:forEach var="list" items="${vatListB9}">
                        		<c:if test="${list.vatDeduction eq 'Y'}">
                        			<c:set var="totalBA9" value="${totalBA9 + list.vatAmount}" />
                        			<c:set var="totalBT9" value="${totalBT9 + list.vatTax}" />
                        			<c:set var="totalBA" value="${totalBA + list.vatAmount}" />
	                        		<c:set var="totalBT" value="${totalBT + list.vatTax}" />
                        		</c:if>
                        	</c:forEach>
                        	
                        	<c:forEach var="list" items="${vatListS9}">
                        		<c:if test="${list.vatDeduction eq 'Y'}">
                        			<c:set var="totalSA9" value="${totalSA9 + list.vatAmount}" />
                        			<c:set var="totalST9" value="${totalST9 + list.vatTax}" />
                        			<c:set var="totalSA" value="${totalSA + list.vatAmount}" />
	                        		<c:set var="totalST" value="${totalST + list.vatTax}" />
                        		</c:if>
                        	</c:forEach>
                        	
                        	<c:if test="${totalBA9 > 0}">
	                        	<tr style="background-color: #F6F6F6;">
	                        		<td class="text-center">9월</td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalSA9}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalST9}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalBA9}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalBT9}" pattern="#,###" /></td>
	                        	</tr>
                        	</c:if>
                        	
                        	<c:forEach var="list" items="${vatListB10}">
                        		<c:if test="${list.vatDeduction eq 'Y'}">
                        			<c:set var="totalBA10" value="${totalBA10 + list.vatAmount}" />
                        			<c:set var="totalBT10" value="${totalBT10 + list.vatTax}" />
                        			<c:set var="totalBA" value="${totalBA + list.vatAmount}" />
	                        		<c:set var="totalBT" value="${totalBT + list.vatTax}" />
                        		</c:if>
                        	</c:forEach>
                        	
                        	<c:forEach var="list" items="${vatListS10}">
                        		<c:if test="${list.vatDeduction eq 'Y'}">
                        			<c:set var="totalSA10" value="${totalSA10 + list.vatAmount}" />
                        			<c:set var="totalST10" value="${totalST10 + list.vatTax}" />
                        			<c:set var="totalSA" value="${totalSA + list.vatAmount}" />
	                        		<c:set var="totalST" value="${totalST + list.vatTax}" />
                        		</c:if>
                        	</c:forEach>
                        	
                        	<c:if test="${totalBA10 > 0}">
	                        	<tr style="background-color: #F6F6F6;">
	                        		<td class="text-center">10월</td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalSA10}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalST10}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalBA10}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalBT10}" pattern="#,###" /></td>
	                        	</tr>
                        	</c:if>
                        	
                        	<c:forEach var="list" items="${vatListB11}">
                        		<c:if test="${list.vatDeduction eq 'Y'}">
                        			<c:set var="totalBA11" value="${totalBA11 + list.vatAmount}" />
                        			<c:set var="totalBT11" value="${totalBT11 + list.vatTax}" />
                        			<c:set var="totalBA" value="${totalBA + list.vatAmount}" />
	                        		<c:set var="totalBT" value="${totalBT + list.vatTax}" />
                        		</c:if>
                        	</c:forEach>
                        	
                        	<c:forEach var="list" items="${vatListS11}">
                        		<c:if test="${list.vatDeduction eq 'Y'}">
                        			<c:set var="totalSA11" value="${totalSA11 + list.vatAmount}" />
                        			<c:set var="totalST11" value="${totalST11 + list.vatTax}" />
                        			<c:set var="totalSA" value="${totalSA + list.vatAmount}" />
	                        		<c:set var="totalST" value="${totalST + list.vatTax}" />
                        		</c:if>
                        	</c:forEach>
                        	
                        	<c:if test="${totalBA11 > 0}">
	                        	<tr style="background-color: #F6F6F6;">
	                        		<td class="text-center">11월</td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalSA11}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalST11}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalBA11}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalBT11}" pattern="#,###" /></td>
	                        	</tr>
                        	</c:if>
                        	
                        	<c:forEach var="list" items="${vatListB12}">
                        		<c:if test="${list.vatDeduction eq 'Y'}">
                        			<c:set var="totalBA12" value="${totalBA12 + list.vatAmount}" />
                        			<c:set var="totalBT12" value="${totalBT12 + list.vatTax}" />
                        			<c:set var="totalBA" value="${totalBA + list.vatAmount}" />
	                        		<c:set var="totalBT" value="${totalBT + list.vatTax}" />
                        		</c:if>
                        	</c:forEach>
                        	
                        	<c:forEach var="list" items="${vatListS12}">
                        		<c:if test="${list.vatDeduction eq 'Y'}">
                        			<c:set var="totalSA12" value="${totalSA12 + list.vatAmount}" />
                        			<c:set var="totalST12" value="${totalST12 + list.vatTax}" />
                        			<c:set var="totalSA" value="${totalSA + list.vatAmount}" />
	                        		<c:set var="totalST" value="${totalST + list.vatTax}" />
                        		</c:if>
                        	</c:forEach>
                        	
                        	<c:if test="${totalBA12 > 0}">
	                        	<tr style="background-color: #F6F6F6;">
	                        		<td class="text-center">12월</td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalSA12}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalST12}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalBA12}" pattern="#,###" /></td>
	                        		<td class="text-right"><fmt:formatNumber value="${totalBT12}" pattern="#,###" /></td>
	                        	</tr>
                        	</c:if>
                        	
                        	<tr>
                        		<th class="text-center"></th>
                        		<th class="text-right" style="background-color: #B2CCFF;"><fmt:formatNumber value="${totalSA}" pattern="#,###" /></th>
                        		<th class="text-right" style="background-color: #B2CCFF;"><fmt:formatNumber value="${totalST}" pattern="#,###" /></th>
                        		<th class="text-right" style="background-color: #FFC19E;"><fmt:formatNumber value="${totalBA}" pattern="#,###" /></th>
                        		<th class="text-right" style="background-color: #FFC19E;"><fmt:formatNumber value="${totalBT}" pattern="#,###" /></th>
                        	</tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
    	$(document).ready(function(){
	    	
    	});
    
        $('#custModal').on('show.bs.modal', function(e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find('.modal-body').load(button.data("remote"));
        });
        $('#userModal').on('show.bs.modal', function(e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find('.modal-body').load(button.data("remote"));
        });
        $('#soppModal').on('show.bs.modal', function(e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find('.modal-body').load(button.data("remote"));
        });
        $('#userModal1').on('show.bs.modal', function(e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find('.modal-body').load(button.data("remote"));
        });
        
        function popupVat(e){
            var nWidth = "800";
            var nHeight = "800";

            var curX = window.screenLeft;
            var curY = window.screenTop;
            var curWidth = document.body.clientWidth;
            var curHeight = document.body.clientHeight;

            var nLeft = curX + (curWidth / 2) - (nWidth / 2);
            var nTop = curY + (curHeight / 2) - (nHeight / 2);

            var strOption = "";
            strOption += "left=" + nLeft + "px,";
            strOption += "top=" + nTop + "px,";
            strOption += "width=" + nWidth + "px,";
            strOption += "height=" + nHeight + "px,";
            strOption += "toolbar=no,menubar=no,location=no,";
            strOption += "resizable=yes,status=yes";

            var winObj = window.open($(e).attr("href"), '', strOption);

            if (winObj == null) {
                alert("팝업 차단을 해제해주세요.");
                return false;
            }
        }
        
        function fnListcon() {
    		var vatData = {};
    		vatData.searchYear = $("#searchYear").val() !== "" ? Number($("#searchYear").val()) : 0;
    		vatData.searchChoice = $("#searchChoice").val() !== "" ? Number($("#searchChoice").val()) : 0;
    		
    		var param = "?";
    		var paramFirst = true;
    		for (variable in vatData) {
    			console.log("key: " + variable + ", value: " + vatData[variable]);
    			if(vatData[variable] != null) {
    				if(paramFirst){
    					param = param + variable + "=" + vatData[variable];
    					paramFirst = false;
    				} else {
    					param = param + "&" + variable + "=" + vatData[variable];
    				}
    			}
    		}

    		if(param == "?"){
    			param = "";
    		}
    		
    		if(document.querySelector('#acordian').style.cssText == "display: none;"){
    			var testAco1 = document.querySelector('#acordian').style.cssText;
    			localStorage.setItem('lastAco1', testAco1);	
    		}else {
    			var testAco2 = document.querySelector('#acordian').style.cssText;
    			localStorage.setItem('lastAco2', testAco2);
    		}

    		var url = '${path}/acc/vatDeduction.do'+param;
    		location.href = url;
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

        function fnSetCustData(a, b) {
            $("#vatSellerCustNo").val(b);
            $("#vatSellerName").val(a);
            $(".modal-backdrop").remove();
            $("#custModal").modal("hide");
        }

        function fnSetUserData(a, b) {
            $("#userName").val(b);
            $("#userNo").val(a);
            $(".modal-backdrop").remove();
            $("#userModal").modal("hide");
        }

        function fnSetSoppData(a, b) {
            $("#soppNo").val(b);
            $("#soppTitle").val(a);
            $(".modal-backdrop").remove();
            $("#soppModal").modal("hide");
        }
        
        function fnChgStatus3(){
        	var tableBody = $("#vatTableB tbody tr td .vatStchg");
        	var compNo = "${sessionScope.compNo}";
        	
        	tableBody.each(function(index, item){
        		if($(item).is(":checked") === true){
		        	var vatSerial = $(this).attr("data-id");
	        		var vatData = {};
	        		vatData.compNo = compNo;
	        		vatData.vatSerial = vatSerial;
	        		vatData.vatStatus = 'B3';
	        		
	        		$.ajax({
	                    url : "${path}/acc/vatStatuschg.do",
	                    data : vatData,
	                    async: false,
	                    method : "POST",
	                    dataType: "json"
	                });
        		}
        	});
        	
            alert("변경 처리 완료");
            location.href = location.href;
        }

        function fnChgStatus5(){
        	var tableBody = $("#vatTableB tbody tr td .vatStchg");
        	var compNo = "${sessionScope.compNo}";
        	
        	tableBody.each(function(index, item){
        		if($(item).is(":checked") === true){
		        	var vatSerial = $(this).attr("data-id");
	        		var vatData = {};
	        		vatData.compNo = compNo;
	        		vatData.vatSerial = vatSerial;
	        		vatData.vatStatus = 'B5';
	        		
	        		$.ajax({
	                    url : "${path}/acc/vatStatuschg.do",
	                    data : vatData,
	                    async: false,
	                    method : "POST",
	                    dataType: "json"
	                });
        		}
        	});
        	
            alert("변경 처리 완료");
            location.href = location.href;
        }
        
    </script>
</div>
<jsp:include page="../body-bottom.jsp"/>