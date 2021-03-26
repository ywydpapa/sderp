<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<div id="popup" style="background-color:#fff">
	<form name="frm" method="post">		
    	<div class="form-row align-items-center">
		    <div class="col-auto my-1">
		    	<label class="mr-sm-2" for="inlineFormCustomSelect">년도</label>
				<select class="custom-select mr-sm-2" name="targetyear" id="targetyear">
			    	<option value="">선택</option>
			    	<option value="2020">2020</option>
			    	<option value="2021" selected>2021</option>
			    	<option value="2022">2022</option>
			    	<option value="2023">2023</option>
			    	<option value="2024">2024</option>
			    	<option value="2025">2025</option>
			    	<option value="2026">2026</option>			
			    	<option value="2027">2027</option>			
			    	<option value="2028">2028</option>			
			    	<option value="2029">2029</option>			
			    	<option value="2030">2030</option>			
			    	<option value="2031">2031</option>		
			    </select>
			</div>
					
		    <div class="col-auto my-1">
		    	<label class="mr-sm-2" for="inlineFormCustomSelect">부서</label>
				<select class="custom-select mr-sm-2" name="targetDepartment" id="targetDepartment">
					<!-- <option value = "ALL">전체</option> -->
					<c:forEach var ="row" items="${listDept}">
						<option value = "${row.org_id}">${row.org_title}</option>
					</c:forEach>
				</select>
			</div>
					
			<div class="col-auto my-1">
				<label class="mr-sm-2" for="inlineFormCustomSelect">설정</label>
			    <select class="custom-select mr-sm-2" name="planType" id="planType">
					<option value="sales">매출목표금액</option>
					<option value="profit" selected>이익목표금액</option>
			    </select>
			</div>
		</div>
		
		<table class="table plan-table table-bordered">
		    <tr>
				<th rowspan="2" style="vertical-align: middle;">담당사원</th>
				<th colspan="12">월별매출목표</th>
				<th rowspan="2" style="vertical-align: middle;">합계</th>
		    </tr>
		    <tr>
				<th width="100px">1</th>
				<th width="100px">2</th>
				<th width="100px">3</th>
				<th width="100px">4</th>
				<th width="100px">5</th>
				<th width="100px">6</th>
				<th width="100px">7</th>
				<th width="100px">8</th>
				<th width="100px">9</th>
				<th width="100px">10</th>
				<th width="100px">11</th>
				<th width="100px">12</th>
		    </tr>
		    <tbody id="plan_list"></tbody>
			    <tr>
					<td>김가이</td>
					<td><input type="text" name="kykim_1" value="1,000,000" size="10" /></td>
					<td><input type="text" name="kykim_1" value="1,000,000" size="10" /></td>
					<td><input type="text" name="kykim_1" value="1,000,000" size="10" /></td>
					<td><input type="text" name="kykim_1" value="1,000,000" size="10" /></td>
					<td><input type="text" name="kykim_1" value="1,000,000" size="10" /></td>
					<td><input type="text" name="kykim_1" value="1,000,000" size="10" /></td>
					<td><input type="text" name="kykim_1" value="1,000,000" size="10" /></td>
					<td><input type="text" name="kykim_1" value="1,000,000" size="10" /></td>
					<td><input type="text" name="kykim_1" value="1,000,000" size="10" /></td>
					<td><input type="text" name="kykim_1" value="1,000,000" size="10" /></td>
					<td><input type="text" name="kykim_1" value="1,000,000" size="10" /></td>
					<td><input type="text" name="kykim_1" value="1,000,000" size="10" /></td>
					<td><input type="text" name="kykim_1" value="1,000,000" size="10" width="100%" readonly/></td>
			    </tr>
			    <tr>
					<th>합계</th>
					<th class="number"><span id="1_sum"></span></th>
					<th class="number"><span id="2_sum"></span></th>
					<th class="number"><span id="3_sum"></span></th>
					<th class="number"><span id="4_sum"></span></th>
					<th class="number"><span id="5_sum"></span></th>
					<th class="number"><span id="6_sum"></span></th>
					<th class="number"><span id="7_sum"></span></th>
					<th class="number"><span id="8_sum"></span></th>
					<th class="number"><span id="9_sum"></span></th>
					<th class="number"><span id="10_sum"></span></th>
					<th class="number"><span id="11_sum"></span></th>
					<th class="number"><span id="12_sum"></span></th>
					<th class="number"><span id="total_sum"></span></th>
			    </tr>
		</table>
    
	    <div class="col-lg-12 pull-right" style="margin-bottom:15px;margin-top:5px">
	    	<button class="btn btn-success config-save" type="button">저장</button>
	    	<button class="btn btn-primary pop-close" type="button">닫기</button>
	    </div>
    </form>
</div>
<style>
tr, th, td{
	text-align: center;
	vertical-align: middle;
}
td > input {
	text-align: center;
}
td:last-child > input {
	width: 100%;
	text-align: right;
}
</style>