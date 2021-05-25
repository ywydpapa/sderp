<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<div class="input-group input-group-sm mb-0">
    <c:choose>
        <c:when test="${!empty contDto.contNo}">
            <input type="text" class="form-control" id="buyrName" value="${contDto.buyrName}" data-type="contDto" readonly/>
            <input type="hidden" id="buyrNo" value="${contDto.buyrNo}" />
        </c:when>
        <c:when test="${!empty dto.soppNo and empty contDto.contNo}">
            <input type="text" class="form-control" id="buyrName" value="${dto.buyrName}" data-type="buyrNo" readonly/>
            <input type="hidden" id="buyrNo" value="${dto.buyrNo}" />
        </c:when>
        <c:when test="${!empty dto.techdNo}">
            <input type="text" class="form-control" id="buyrName" value="${dto.custName}" data-type="techNo" readonly/>
            <input type="hidden" id="buyrNo" value="${dto.custNo}" />
        </c:when>
        <c:otherwise>
            <input type="text" class="form-control" id="buyrName" value="" data-type="default" readonly/>
            <input type="hidden" id="buyrNo" value="" />
        </c:otherwise>
    </c:choose>


    <span class="input-group-btn">
        <button class="btn btn-dark" id="buyrInputDelete">
            <i class="icofont icofont-close"></i>
        </button>
		<button class="btn btn-primary sch-partner" data-remote="${path}/modal/popup.do?popId=buyr" type="button" data-toggle="modal" data-target="#buyrModal">
			<i class="icofont icofont-search"></i>
		</button>
	</span>
    <div class="modal fade " id="buyrModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-80size" role="document">
            <div class="modal-content modal-80size">
                <div class="modal-header">
                    <h4 class="modal-title">엔드유저</h4>
                    <button type="button" class="close" onclick="$('#buyrModal').modal('hide');" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <h5>엔드유저 목록</h5>
                    <p>Loading!!!</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default waves-effect" onclick="$('#buyrModal').modal('hide');">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $("#buyrInputDelete").on("click",function (e) {
        $("#buyrName").val("");
        $("#buyrNo").val("");
        if($("#buyrMemberName").length > 0){
            $("#buyrMemberName").val("");
            $("#buyrMemberNo").val("");
        }
    })

    $('#buyrModal').on('show.bs.modal', function(e) {
        var button = $(e.relatedTarget);
        var modal = $(this);
        modal.find('.modal-body').load(button.data("remote"));
    });

    function fnSetBuyrData(a, b) {
        $("#buyrName").val(a);
        $("#buyrNo").val(b);
        $(".modal-backdrop").remove();
        $("#buyrModal").modal("hide");
        if($("#buyrMemberInputDelete").length > 0){
            $("#buyrMemberInputDelete").trigger("click");
        }
    }
</script>