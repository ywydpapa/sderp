<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출력물 출력</title>
</head>
<body>
	<div class="mainPdf">
		<div id="imgLogo">
			<img src="${path}/images/pdf_logo_left.jpg" style="width:28.5%; height:90px;" />
			<img src="${path}/images/pdf_logo_right.png" style="position:absolute; right:0; top:19px; width:68.5%; height:60px;" />
		</div>
		<div id="pdfTitle">
			<div style="font-size: 100px; font-weight:600; text-align:center;">QUOTATION</div>
		</div>
	</div>
</body>
</html>