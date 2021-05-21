<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<div class="input-group input-group-sm mb-0 mr-1">
    <input class="form-control col-md-2" type="date" id="schedFrom" value="${dto.schedFrom}" onChange="javascript:inputDate(setDateHourMinute($('#schedFrom').val(), $('#startTime').val()), setDateHourMinute($('#schedTo').val(), $('#endTime').val()))">
    <select id="startTime" style="width:100px" onChange="javascript:inputDate(setDateHourMinute($('#schedFrom').val(), $('#startTime').val()), setDateHourMinute($('#schedTo').val(), $('#endTime').val()))"></select>
    <span style="padding-left: 10px; padding-right: 10px;">~</span>
    <input class="form-control col-md-2" type="date" id="schedTo" value="${dto.schedTo}" onChange="javascript:inputDate(setDateHourMinute($('#schedFrom').val(), $('#startTime').val()), setDateHourMinute($('#schedTo').val(), $('#endTime').val()))">
    <select id="endTime" style="width:100px" onChange="javascript:inputDate(setDateHourMinute($('#schedFrom').val(), $('#startTime').val()), setDateHourMinute($('#schedTo').val(), $('#endTime').val()))"></select>
</div>

<script>

</script>