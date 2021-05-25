<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<div class="input-group input-group-sm mb-0">
    <c:choose>
        <c:when test="${!empty dto.buyrMemberNo}">
            <input type="text" class="form-control" id="buyrMemberName" value="${dto.buyrMemberName}" readonly/>
            <input type="hidden" id="buyrMemberNo" value="${dto.buyrMemberNo}" />
        </c:when>
        <c:when test="${!empty dto.techdNo}">
            <input type="text" class="form-control" id="buyrMemberName" value="${dto.custMemberName}" readonly/>
            <input type="hidden" id="buyrMemberNo" value="${dto.custMemberNo}" />
        </c:when>
        <c:otherwise>
            <input type="text" class="form-control" id="buyrMemberName" value="" readonly/>
            <input type="hidden" id="buyrMemberNo" value="" />
        </c:otherwise>
    </c:choose>
    <span class="input-group-btn">
        <button class="btn btn-dark" id="buyrMemberInputDelete">
            <i class="icofont icofont-close"></i>
        </button>
        <button class="btn btn-primary sch-partner" data-remote="${path}/modal/popup.do?popId=buyrmem&compNo=" type="button" data-toggle="modal" data-target="#buyrMemberModal" id="buyrMemberModalbtn">
			<i class="icofont icofont-search"></i>
		</button>
    </span>
    <div class="modal fade " id="buyrMemberModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-80size" role="document">
            <div class="modal-content modal-80size">
                <div class="modal-header">
                    <h4 class="modal-title">고객 검색</h4>
                    <button type="button" class="close" onclick="$('#buyrMemberModal').modal('hide');"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <h5>엔드유저 담당자 목록</h5>
                    <p>엔드유저를 먼저 입력해주셔야 목록이 보입니다.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default waves-effect " onclick="$('#buyrMemberModal').modal('hide');">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $("#buyrMemberInputDelete").on("click",function (e) {
        $("#buyrMemberName").val("");
        $("#buyrMemberNo").val("");
    })

    $('#buyrMemberModal').on('show.bs.modal', function(e) {
        if($("#buyrNo").val() == ""){
            return;
        }
        var buyrNo = Number($("#buyrNo").val());
        var url = "${path}/modal/popup.do?popId=buyrmem&compNo=";
        url = url + buyrNo;
        console.dir(url);
        $("#buyrMemberModalbtn").data("remote",url);
        var button = $(e.relatedTarget);
        var modal = $(this);
        modal.find('.modal-body').load(button.data("remote"));
    });

    function fnSetbuyrMmereData(a, b) {
        $("#buyrMemberNo").val(a);
        $("#buyrMemberName").val(b);
        $(".modal-backdrop").remove();
        $("#buyrMemberModal").modal("hide");
    }
</script>