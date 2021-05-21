<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<div class="input-group input-group-sm mb-0">
    <c:choose>
        <c:when test="${!empty contDto.contNo}">
            <input type="text" class="form-control" id="exContName" value="${contDto.exContName}" data-type="contDto" readonly/>
            <input type="hidden" id="exContNo" value="${contDto.exContNo}" />
        </c:when>
        <c:when test="${!empty dto.contNo || !empty dto.techdNo}">
            <c:choose>
                <c:when test="${!empty dto.contName}">
                    <input type="text" class="form-control" id="contName" value="${dto.contName}" data-type="dto" readonly/>
                </c:when>
                <c:when test="${!empty dto.contTitle}">
                    <input type="text" class="form-control" id="contName" value="${dto.contTitle}" data-type="dto" readonly/>
                </c:when>
                <c:otherwise>
                    <input type="text" class="form-control" id="contName" value="" data-type="dto" readonly/>
                </c:otherwise>
            </c:choose>
            <input type="hidden" id="contNo" value="${dto.contNo}" />
        </c:when>
        <c:otherwise>
            <input type="text" class="form-control" id="contName" value="" data-type="default" readonly/>
            <input type="hidden" id="contNo" value="" />
        </c:otherwise>
    </c:choose>
    <span class="input-group-btn">
        <button class="btn btn-dark" id="contInputDelete">
            <i class="icofont icofont-close"></i>
        </button>
        <button class="btn btn-primary sch-opportunity2" data-remote="${path}/modal/popup.do?popId=cont" type="button" data-toggle="modal" data-target="#contModal">
            <i class="icofont icofont-search"></i>
        </button>
    </span>
    <div class="modal fade " id="contModal" tabindex="-1"
         role="dialog">
        <div class="modal-dialog modal-80size" role="document">
            <div class="modal-content modal-80size">
                <div class="modal-header">
                    <h4 class="modal-title"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <h5>계약 목록</h5>
                    <p>Loading!!!</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $("#contInputDelete").on("click",function (e) {
        <c:choose>
            <c:when test="${!empty contDto.userNo && mode ne 'write'}">
                $("#exContName").val("");
                $("#exContNo").val("");
            </c:when>
            <c:when test="${!empty dto.userNo && mode ne 'write'}">
                $("#contName").val("");
                $("#contNo").val("");
            </c:when>
            <c:otherwise>
                $("#contName").val("");
                $("#contNo").val("");
            </c:otherwise>
        </c:choose>
    })

    $('#contModal').on('show.bs.modal', function(e) {
        var button = $(e.relatedTarget);
        var modal = $(this);
        modal.find('.modal-body').load(button.data("remote"));
    });

    function fnSetContData(a,b,c,d){
        <c:choose>
            <c:when test="${!empty contDto.contNo}">
                $("#exContName").val(a);
                $("#exContNo").val(b);
            </c:when>
            <c:when test="${!empty dto.contNo}">
                $("#contName").val(a);
                $("#contNo").val(b);
            </c:when>
            <c:otherwise>
                $("#contName").val(a);
                $("#contNo").val(b);
            </c:otherwise>
        </c:choose>
        $(".modal-backdrop").remove();
        $("#contModal").modal("hide");
    }
</script>