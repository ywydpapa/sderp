<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<div class="input-group input-group-sm mb-0 has-feedback has-clear">
    <c:choose>
        <c:when test="${!empty dto.userNo && mode ne 'write'}">
            <input type="text" class="form-control" name="userName" id="userName" value="${dto.userName}" data-type="dto" readonly/>
            <input type="hidden" class="form-control" name="userNo" id="userNo" value="${dto.userNo}" />
        </c:when>
        <c:when test="${!empty contDto.userNo && mode ne 'write'}">
            <input type="text" class="form-control" name="userName" id="userName" value="${contDto.userName}" data-type="contDto" readonly/>
            <input type="hidden" class="form-control" name="userNo" id="userNo" value="${contDto.userNo}" />
        </c:when>
        <c:when test="${mode eq 'write'}">
            <input type="text" class="form-control" name="userName" id="userName" value="${sessionScope.userName}" data-type="sessionScope" readonly/>
            <input type="hidden" class="form-control" name="userNo" id="userNo" value="${sessionScope.userNo}" />
        </c:when>
        <c:otherwise>
            <input type="text" class="form-control" name="userName" id="userName" value="" data-type="list" readonly/>
            <input type="hidden" class="form-control" name="userNo" id="userNo" value="" />
        </c:otherwise>
    </c:choose>
    <span class="input-group-btn">
		<button class="btn btn-dark" id="userInputDelete">
            <i class="icofont icofont-close"></i>
        </button>
        <button class="btn btn-primary sch-company" data-remote="${path}/modal/popup.do?popId=user" type="button" data-toggle="modal" data-target="#userModal">
			<i class="icofont icofont-search"></i>
		</button>
	</span>
    <div class="modal fade " id="userModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-80size" role="document">
            <div class="modal-content modal-80size">
                <div class="modal-header">
                    <h4 class="modal-title">담당사원</h4>
                    <button type="button" class="close" onclick="$('#userModal').modal('hide');" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <h5>사용자목록</h5>
                    <p>Loading!!!</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default waves-effect" onclick="$('#userModal').modal('hide');">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $("#userInputDelete").on("click",function (e) {
        $("#userName").val("");
        $("#userNo").val("");
    })

    $('#userModal').on('show.bs.modal', function(e) {
        var button = $(e.relatedTarget);
        var modal = $(this);
        modal.find('.modal-body').load(button.data("remote"));
    });

    function fnSetUserData(a, b) {
        $("#userNo").val(a);
        $("#userName").val(b);
        $(".modal-backdrop").remove();
        $("#userModal").modal("hide");
    }
</script>
