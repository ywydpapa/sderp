<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<div class="input-group input-group-sm mb-0">
    <input type="text" class="form-control"id="soppTitle" value="${dto.soppTitle}" readonly />
    <input type="hidden" id="soppNo" value="${dto.soppNo}" />
    <span class="input-group-btn">
        <button class="btn btn-dark" id="soppInputDelete">
            <i class="icofont icofont-close"></i>
        </button>
        <button class="btn btn-primary sch-opportunity2" data-remote="${path}/modal/popup.do?popId=sopp" type="button" data-toggle="modal" data-target="#soppModal">
            <i class="icofont icofont-search"></i>
        </button>
    </span>
    <div class="modal fade" id="soppModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-80size" role="document">
            <div class="modal-content modal-80size">
                <div class="modal-header">
                    <h4 class="modal-title">영업기회</h4>
                    <button type="button" class="close" onclick="$('#soppModal').modal('hide');"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <h5>영업기회목록</h5>
                    <p>Loading!!!</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default waves-effect"	onclick="$('#soppModal').modal('hide');">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $("#soppInputDelete").on("click",function (e) {
        $("#soppTitle").val("");
        $("#soppNo").val("");
    })

    $('#soppModal').on('show.bs.modal', function(e) {
        var button = $(e.relatedTarget);
        var modal = $(this);
        modal.find('.modal-body').load(button.data("remote"));
    });

    function fnSetSoppData(a, b) {
        $("#soppTitle").val(a);
        $("#soppNo").val(b);
        $(".modal-backdrop").remove();
        $("#soppModal").modal("hide");
    }
</script>