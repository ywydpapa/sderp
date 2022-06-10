<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css" href="${path}/css/sideMenu.css" />

<div id="sideMenu">
	<ul id="work">
		<li>
			<a href="">
				<img src="${path}/images/main/icons/mainHomeIcon.png" />
				<span>나의 업무 홈</span>
			</a>
		</li>
		<li>
			<a href="${path}/notice/list.do">
				<img src="${path}/images/main/icons/mainNoticeIcon.png" />
				<span>공지사항</span>
			</a>
		</li>
		<li>
			<a href="#">
				<img src="${path}/images/main/icons/mainSchedIcon.png" />
				<span>일정관리</span>
			</a>
		  	<ul id="panel">
		  		<li><a href="#">- 캘린더</a></li>
		  		<li><a href="#">- 일정조회</a></li>
		  		<li><a href="#">- 일정</a></li>
		  	</ul>
		</li>
		<li>
			<a href="#">
				<img src="${path}/images/main/icons/mainSalesIcon.png" />
				<span>영업활동관리</span>
			</a>
		</li>
		<li>
			<a href="#">
				<img src="${path}/images/main/icons/mainSoppIcon.png" />
				<span>영업기회</span>
			</a>
		</li>
		<li>
			<a href="#">
				<img src="${path}/images/main/icons/mainPpsIcon.png" />
				<span>조달업무</span>
			</a>
		</li>
		<li>
			<a href="#">
				<img src="${path}/images/main/icons/mainContIcon.png" />
				<span>계약관리</span>
			</a>
		</li>
		<li>
			<a href="#">
				<img src="${path}/images/main/icons/mainTechIcon.png" />
				<span>기술지원업무</span>
			</a>
		</li>
		<li>
			<a href="#">
				<img src="${path}/images/main/icons/mainBoardFileIcon.png" />
				<span>자료실</span>
			</a>
		</li>
		<li>
			<a href="${path}/user/logout.do">
				<img src="${path}/images/main/icons/mainLogOutIcon.png" />
				<span>로그아웃</span>
			</a>
		</li>
	</ul>
		
	<ul id="group">
		<li>
			<a href="#">
				<img src="${path}/images/main/icons/mainHomeIcon.png" />
				<span>그룹웨어</span>
			</a>
		</li>
	</ul>
	
	<ul id="acc">
		<li>
			<a href="#">
				<img src="${path}/images/main/icons/mainHomeIcon.png" />
				<span>회계관리</span>
			</a>
		</li>
	</ul>
	
	<ul id="manage">
		<li>
			<a href="#">
				<img src="${path}/images/main/icons/mainHomeIcon.png" />
				<span>경영정보</span>
			</a>
		</li>
	</ul>
</div>