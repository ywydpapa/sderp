<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<select name="select" class="form-control form-control-sm" id="contType">
  <option value="">선택</option>
  <c:forEach var="contType" items="${contType}">
    <option value="${contType.codeNo}">${contType.desc03}</option>
  </c:forEach>
</select>