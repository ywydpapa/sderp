<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${path}/assets/js/pcoded.min.js"></script>
<script src="${path}/js/script.js"></script>
<script src="${path}/assets/js/demo-12.js"></script>
<script>

</script>
<nav>
	<ul class="pcoded-item pcoded-left-item">
		<li class=""><a href="javascript:fnSetPage('${path}/myboard.do')">
				<span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span> <span
				class="pcoded-mtext" data-i18n="nav.dash.main">나의 업무 홈</span> <span
				class="pcoded-mcaret"></span>
		</a></li>
		<li class="pcoded-hasmenu pcoded">
			<a href="javascript:fnSetPage('${path}/calendar/calmain.do')">
			<%-- <a href="javascript:fnSetPage('${path}/sched/list.do')"> --%> 
			<span
				class="pcoded-micon"><i class="ti-calendar"></i></span> <span
				class="pcoded-mtext" data-i18n="nav.basic-components.main">일정관리</span>
				<span class="pcoded-mcaret"></span>
		</a>
			<ul class="pcoded-submenu">
				<li class="pcoded-hasmenu"><a
					href="javascript:fnSetPage('${path}/sched/list.do')"> <span
						class="pcoded-micon"><i class="ti-direction-alt"></i></span> <span
						class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">일정조회</span>
						<span class="pcoded-mcaret"></span>
				</a></li>
				<li class="pcoded-hasmenu"><a
					href="javascript:fnSetPage('${path}/sched/write.do')"> <span
						class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
						class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">일정등록</span>
						<span class="pcoded-mcaret"></span>
				</a></li>
			</ul>
		</li>
		<li class="pcoded-hasmenu pcoded"><a
			href="javascript:fnSetPage('${path}/sales/list.do')"> <span
				class="pcoded-micon"><i class="ti-briefcase"></i></span> <span
				class="pcoded-mtext" data-i18n="nav.form-select.main">영업활동관리</span>
				<span class="pcoded-mcaret"></span>
		</a>
			<ul class="pcoded-submenu">
				<li class="pcoded-hasmenu "><a
					href="javascript:fnSetPage('${path}/sales/list.do')"> <span
						class="pcoded-micon"><i class="ti-direction-alt"></i></span> <span
						class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">영업활동조회</span>
						<span class="pcoded-mcaret"></span>
				</a></li>
				<li class="pcoded-hasmenu"><a
					href="javascript:fnSetPage('${path}/sales/write.do')"> <span
						class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
						class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">영업활동등록</span>
						<span class="pcoded-mcaret"></span>
				</a></li>
			</ul></li>
		<li class="pcoded-hasmenu pcoded"><a
			href="javascript:fnSetPage('${path}/sopp/list.do')"> <span
				class="pcoded-micon"><i class="ti-agenda"></i></span> <span
				class="pcoded-mtext" data-i18n="nav.basic-components.main">영업기회</span>
				<span class="pcoded-mcaret"></span>
		</a>
			<ul class="pcoded-submenu">
				<li class="pcoded-hasmenu "><a
					href="javascript:fnSetPage('${path}/sopp/list.do')"> <span
						class="pcoded-micon"><i class="ti-direction-alt"></i></span> <span
						class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">영업기회조회</span>
						<span class="pcoded-mcaret"></span>
				</a></li>
				<li class="pcoded-hasmenu"><a
					href="javascript:fnSetPage('${path}/sopp/write.do')"> <span
						class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
						class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">영업기회등록</span>
						<span class="pcoded-mcaret"></span>
				</a></li>
			</ul></li>
		<li class="pcoded-hasmenu pcoded"><a
			href="javascript:fnSetPage('${path}/sopp/list2.do')"> <span
				class="pcoded-micon"><i class="ti-package"></i></span> <span
				class="pcoded-mtext" data-i18n="nav.basic-components.main">수주
					판매보고</span> <span class="pcoded-mcaret"></span>
		</a>
			<ul class="pcoded-submenu">
				<li class="pcoded-hasmenu "><a
					href="javascript:fnSetPage('${path}/sopp/list2.do')"> <span
						class="pcoded-micon"><i class="ti-direction-alt"></i></span> <span
						class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">수주
							판매보고 조회</span> <span class="pcoded-mcaret"></span>
				</a></li>
				<%--<li class="pcoded-hasmenu"><a
					href="javascript:fnSetPage('${path}/sopp/write2.do')"> <span
						class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
						class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">수주
							판매보고 등록</span> <span class="pcoded-mcaret"></span>
				</a></li>--%>
			</ul></li>
		<li class="pcoded-hasmenu  pcoded"><a
			href="javascript:fnSetPage('${path}/cont/list.do')"> <span
				class="pcoded-micon"><i class="ti-pencil-alt"></i></span> <span
				class="pcoded-mtext" data-i18n="nav.basic-components.main">계약관리</span>
				<span class="pcoded-mcaret"></span>
		</a>
			<ul class="pcoded-submenu">
				<li class="pcoded-hasmenu "><a
					href="javascript:fnSetPage('${path}/cont/list.do')"> <span
						class="pcoded-micon"><i class="ti-direction-alt"></i></span> <span
						class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">계약조회</span>
						<span class="pcoded-mcaret"></span>
				</a></li>
				<li class="pcoded-hasmenu"><a
					href="javascript:fnSetPage('${path}/cont/write.do')"> <span
						class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
						class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">계약등록</span>
						<span class="pcoded-mcaret"></span>
				</a></li>
			</ul>
		<li class="pcoded-hasmenu pcoded"><a
			href="javascript:fnSetPage('${path}/techd/list.do')"> <span
				class="pcoded-micon"><i class="ti-agenda"></i></span> <span
				class="pcoded-mtext" data-i18n="nav.basic-components.main">기술지원업무</span>
				<span class="pcoded-mcaret"></span>
		</a>
			<ul class="pcoded-submenu">
				<li class="pcoded-hasmenu "><a
					href="javascript:fnSetPage('${path}/techd/list.do')"> <span
						class="pcoded-micon"><i class="ti-direction-alt"></i></span> <span
						class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">기술지원
							조회</span> <span class="pcoded-mcaret"></span>
				</a></li>
				<li class="pcoded-hasmenu"><a
					href="javascript:fnSetPage('${path}/techd/write.do')"> <span
						class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
						class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">기술지원
							등록</span> <span class="pcoded-mcaret"></span>
				</a></li>
			</ul></li>
	</ul>

	<div class="pcoded-navigatio-lavel" data-i18n="nav.category.other">설정</div>
	<ul class="pcoded-item pcoded-left-item">
		<li class="pcoded-hasmenu"><a href="javascript:void(0)"> <span
				class="pcoded-micon"><i class="ti-settings"></i><b>M</b></span> <span
				class="pcoded-mtext" data-i18n="nav.menu-levels.main">설정</span> <span
				class="pcoded-mcaret"></span>
		</a>
			<ul class="pcoded-submenu">
				<li class="pcoded-hasmenu"><a
					href="javascript:fnSetPage('${path}/cust/list.do')"> <span
						class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
						class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">고객/거래처
							설정</span> <span class="pcoded-mcaret"></span>
				</a></li>
				<li class="pcoded-hasmenu"><a
					href="javascript:fnSetPage('${path}/product/list.do')"> <span
						class="pcoded-micon"><i class="ti-direction-alt"></i></span> <span
						class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">상품설정</span>
						<span class="pcoded-mcaret"></span>
				</a></li>
				<li class="pcoded-hasmenu"><a
					href="javascript:fnSetPage('${path}/code/list.do')"> <span
						class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
						class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">기초코드
							설정</span> <span class="pcoded-mcaret"></span>
				</a></li>
				<li class="pcoded-hasmenu"><a
					href="javascript:fnSetPage('${path}/code/organizChart.do')"> <span
						class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
						class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">조직도
							설정</span> <span class="pcoded-mcaret"></span>
				</a></li>
				<li class="pcoded-hasmenu"><a
					href="javascript:fnSetPage('${path}/board/regboard.do')"> <span
						class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
						class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">게시판
							설정</span> <span class="pcoded-mcaret"></span>
				</a></li>
				<li class="pcoded-hasmenu"><a
					href="javascript:fnSetPage('${path}/sales/setTarget.do')"> <span
						class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
						class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">영업목표
							설정</span> <span class="pcoded-mcaret"></span>
				</a></li>
				<li class="pcoded-hasmenu"><a
					href="javascript:fnSetPage('${path}/user/list.do')"> <span
						class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
						class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">사용자 목록</span>
						<span class="pcoded-mcaret"></span>
				</a></li>
				<li class="pcoded-hasmenu"><a
					href="javascript:fnSetPage('${path}/user/write.do')"> <span
						class="pcoded-micon"><i class="ti-angle-right"></i></span> <span
						class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">사용자 등록</span>
						<span class="pcoded-mcaret"></span>
				</a></li>
			</ul>
	</ul>

</nav>
