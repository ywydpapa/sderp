<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<div class="input-group input-group-sm mb-0">
    <c:choose>
        <c:when test="${!empty dto.userNo}">
            <input type="text" class="form-control" id="custMemberName" value="${dto.custName}" data-type="dto" readonly/>
            <input type="hidden" name="custNo" id="custMemberNo" value="${dto.custNo}" />
        </c:when>
        <c:when test="${!empty contDto.userNo}">
            <input type="text" class="form-control" id="custMemberName" value="${contDto.custName}" data-type="dto" readonly/>
            <input type="hidden" id="custMemberNo" value="${contDto.custNo}" />
        </c:when>
        <c:otherwise>
            <input type="text" class="form-control" id="custMemberName" value="${dto.custName}" data-type="otherwise" readonly/>
            <input type="hidden" id="custMemberNo" value="${dto.custNo}" />
        </c:otherwise>
    </c:choose>

    <span class="input-group-btn">
        <button class="btn btn-dark" id="custMemberInputDelete">
            <i class="icofont icofont-close"></i>
        </button>
    	<button class="btn btn-primary sch-company" data-remote="${path}/modal/popup.do?popId=custmem&compNo=" type="button" data-toggle="modal" data-target="#custMemberModal" id="custMemberModalbtn">
            <i class="icofont icofont-search"></i>
        </button>
    </span>

    <div class="modal fade " id="custMemberModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-80size" role="document">
            <div class="modal-content modal-80size">
                <div class="modal-header">
                    <h4 class="modal-title">매출처 담당자</h4>
                    <button type="button" class="close" onclick="$('#custMemberModal').modal('hide');" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <h5>매출처 담당자 목록</h5>
                    <p>매출처를 먼저 입력해주셔야 목록이 보입니다.</p>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $("#custMemberInputDelete").on("click",function (e) {
        $("#custMemberName").val("");
        $("#custMemberNo").val("");
    })

    $('#custMemberModal').on('show.bs.modal', function(e) {
        if($("#custNo").val() == ""){
            return;
        }
        var custNo = Number($("#custNo").val());
        var url = "${path}/modal/popup.do?popId=custmem&compNo=";
        url = url + custNo;
        $("#custMemberModalbtn").data("remote",url);
        var button = $(e.relatedTarget);
        var modal = $(this);
        modal.find('.modal-body').load(button.data("remote"));
    });

    function fnSetCustMemberData(a, b) {
        $("#custMemberNo").val(a);
        $("#custMemberName").val(b);
        $(".modal-backdrop").remove();
        $("#custMemberModal").modal("hide");
    }
</script>