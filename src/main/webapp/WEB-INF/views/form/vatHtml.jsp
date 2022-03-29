<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="${path}/css/pdfForm.css">
<script type="text/javascript" src="${path}/js/jquery.min.js"></script>

<body>
	<div>
		<div>
			<table class="table table-striped table-bordered nowrap " id="">
				<tr>
					<th>종류</th>
					<td></td>
					<th>공급받는자구분</th>
					<td>사업자등록번호</td>	
				</tr>
			</table>
		</div>
		<div>
			<div style="float:left; width:50%;">
				<table class="table table-striped table-bordered nowrap " id="">
					<tr>
						<th rowspan="5">공급자</th>
						<th>등록번호</th>
						<td></td>
						<th>종사업장번호</th>
						<td></td>	
					</tr>
					<tr>
						<th>상호</th>
						<td></td>
						<th>성명</th>
						<td></td>
					</tr>
					<tr>
						<th>사업장</th>
						<td></td>
					</tr>
					<tr>
						<th>업태</th>
						<td></td>
						<th>종목</th>
						<td></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td></td>
					</tr>
				</table>
			</div>
			<div style="float:right; width:50%;">
				<table class="table table-striped table-bordered nowrap " id="">
					<tr>
						<th rowspan="5">공급받는자</th>
						<th>등록번호</th>
						<td></td>
						<th>종사업장번호</th>
						<td></td>	
					</tr>
					<tr>
						<th>상호</th>
						<td></td>
						<th>성명</th>
						<td></td>
					</tr>
					<tr>
						<th>사업장</th>
						<td></td>
					</tr>
					<tr>
						<th>업태</th>
						<td></td>
						<th>종목</th>
						<td></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
		<div>
			<table class="table table-striped table-bordered nowrap " id="">
				<tr>
					<th>작성일자</th>
					<td></td>
					<th>비고</th>
					<td></td>
				</tr>
			</table>
			<table class="table table-striped table-bordered nowrap " id="">
				<tr>
					<th>합계금액</th>
					<td></td>
					<th>공급가액</th>
					<td></td>
					<th>세액</th>
					<td></td>
				</tr>
			</table>
		</div>
		<div>
			<table class="table table-striped table-bordered nowrap " id="">
				<thead>
					<tr>
						<th>월</th>
						<th>일</th>
						<th>품목</th>
						<th>규격</th>
						<th>수량</th>
						<th>단가</th>
						<th>합계</th>
						<th>공급가액</th>
						<th>세액</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
</body>
</html>