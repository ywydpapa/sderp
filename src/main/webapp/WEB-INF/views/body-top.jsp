<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="${path}/css/bodyTop.css" />

<div id="header">
	<div id="mainTopLogo">
		<a href=""><img src="${path}/images/main/topLogo.png" id="mainTopLogoImg" /></a>
		<img src="${path}/images/main/topEllipse.png" id="mainTopEllipseImg" />
		<img src="${path}/images/main/topVector.png" id="mainTopVectorImg" />
	</div>
	<div id="mainTopMenu">
		<ul>
			<li><button type="button" data-keyword="work" onClick="bodyTopPageClick(this);">업무관리</button></li>
			<li><button type="button" data-keyword="group" onClick="bodyTopPageClick(this);">그룹웨어</button></li>
			<li><button type="button" data-keyword="acc" onClick="bodyTopPageClick(this);">회계관리</button></li>
			<li><button type="button" data-keyword="manage" onClick="bodyTopPageClick(this);">경영정보</button></li>
		</ul>
	</div>
</div>

<script src="${path}/js/bodyTop.js"></script>