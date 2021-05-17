<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<div class="input-group input-group-sm mb-0">
    <c:choose>
        <c:when test="${dto.userNo ne ''}">
            <input type="text" class="form-control" name="custName" id="custName" value="${dto.custName}" data-type="dto" readonly/>
            <input type="hidden" name="custNo" id="custNo" value="${dto.custNo}" />
        </c:when>
        <c:when test="${contDto.userNo ne ''}">
            <input type="text" class="form-control" name="custName" id="custName" value="${contDto.custName}" data-type="dto" readonly/>
            <input type="hidden" name="custNo" id="custNo" value="${contDto.custNo}" />
        </c:when>
        <c:otherwise>
            <input type="text" class="form-control" name="custName" id="custName" value="${dto.custName}" data-type="otherwise" readonly/>
            <input type="hidden" name="custNo" id="custNo" value="${dto.custNo}" />
        </c:otherwise>
    </c:choose>

    <span class="input-group-btn">
        <button class="btn btn-dark" id="custInputDelete">
            <i class="icofont icofont-close"></i>
        </button>
    	<button class="btn btn-primary sch-company" data-remote="${path}/modal/popup.do?popId=cust" type="button" data-toggle="modal" data-target="#custModal">
            <i class="icofont icofont-search"></i>
        </button>
    </span>
    <div class="modal fade " id="custModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-80size" role="document">
            <div class="modal-content modal-80size">
                <div class="modal-header">
                    <h4 class="modal-title">매출처</h4>
                    <button type="button" class="close" onclick="$('#custModal').modal('hide');" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <h5>매출처목록</h5>
                    <p>Loading!!!</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default waves-effect" onclick="$('#custModal').modal('hide');">Close</button>
                    <button type="button" class="btn btn-success waves-effect" id="custRegSimple">간편추가</button>
                </div>
                <div style="display: none; border: solid; width: 80%; margin: auto; margin-bottom: 5px;" id="custRegSimple_div">
                    <table>
                        <colgroup>
                            <col width="10%">
                            <col width="75%">
                            <col width="15%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>거래처명*</th>
                            <td><input type="text" value="" id="custRegSimple_custName" style="width: 100%;"> </td>
                            <td><button type="button" class="btn-sm btn-dark" id="custRegSimple_custName_check">중복확인</button></td>
                        </tr>
                        <tr>
                            <th>담당자</th>
                            <td><input type="text" value="" id="custRegSimple_custMemerName" style="width: 100%;" placeholder="미입력시 미정으로 세팅됩니다."></td>
                            <td><button type="button" class="btn-sm btn-success" id="custRegSimple_custName_register">등록</button></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $("#custInputDelete").on("click",function (e) {
        $("#custName").val("");
        $("#custNo").val("");
    })

    $('#custModal').on('show.bs.modal', function(e) {
        var button = $(e.relatedTarget);
        var modal = $(this);
        modal.find('.modal-body').load(button.data("remote"));
    });

    function fnSetCustData(a, b) {
        $("#custName").val(a);
        $("#custNo").val(b);
        if($("#custmemberModalbtn").length > 0){
            $("#custmemberModalbtn").data('whatever', b);
        }
        $(".modal-backdrop").remove();
        $("#custModal").modal("hide");
    }

    $("#custRegSimple").on("click",function (event) {
        if($("#custRegSimple_div").is(':visible') == false){
            $("#custRegSimple_div").show();
            $("custRegSimple").val("간편등록 취소");
        } else {
            $("#custRegSimple_div").hide();
            $("custRegSimple").val("간편등록");
        }
    });

    $("#custRegSimple_custName_check").on("click", function (event) {
        var custRegSimple_custName = $("#custRegSimple_custName").val();
        var obj = new Object();
        obj.custName = custRegSimple_custName;
        $.ajax({
            url: "${path}/cust/custNameCheck", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            data: obj , // HTTP 요청과 함께 서버로 보낼 데이터
            method: "POST", // HTTP 요청 메소드(GET, POST 등)
            dataType: "json" // 서버에서 보내줄 데이터의 타입
        }) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
            .done(function(data) {
                if(data.code == 10001){
                    console.log("응답 성공");
                    var html= "";
                    if(data.result1.length > 0){
                        var tempArr = data.result1;
                        html += "같은 결과) \n";
                        for(var i=0; i<tempArr.length; i++){
                            html += "번호 : " + tempArr[i].custNo + " / 거래처 : " + tempArr[i].custName + "\n";
                        }
                    }

                    if(data.result2.length > 0){
                        var tempArr = data.result2;
                        html += "\n유사 결과) \n";
                        for(var i=0; i<tempArr.length; i++){
                            html += "번호 : " + tempArr[i].custNo + " / 거래처 : " + tempArr[i].custName + "\n";
                        }
                    }

                    if(data.result1.length == 0 && data.result2.length == 0){
                        html += "일치검색, 유사검색결과가 존재하지 않습니다.\n";
                    }

                    html += "\n등록하시겠습니까?";
                    var result = confirm(html);

                    if(result){
                        console.log("등록진행");
                    } else {
                        console.log("등록거부");
                    }
                }else{
                    alert("응답 실패");
                }
            }) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
            .fail(function(xhr, status, errorThrown) {
                alert("통신 실패");
            });
    });

    $("#custRegSimple_custName_register").on("click", function (event) {
        var custRegSimple_custName = $("#custRegSimple_custName").val();
        var custRegSimple_custMemerName = $("#custRegSimple_custMemerName").val();

        var obj = new Object();
        obj.custName = custRegSimple_custName;
        obj.custMemberName = custRegSimple_custMemerName;

        $.ajax({
            url: "${path}/cust/simpleRegister", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            data: obj , // HTTP 요청과 함께 서버로 보낼 데이터
            method: "POST", // HTTP 요청 메소드(GET, POST 등)
            dataType: "json" // 서버에서 보내줄 데이터의 타입
        }) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
        .done(function(result) {
            if(result.code == 10001){
                alert("저장 성공");
                $('#custModal').modal('hide');
                $("#custName").val(result.data.custName);
                $("#custNo").val(result.data.custNo);
            }else{
                alert("저장 실패");
            }
        }) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
        .fail(function(xhr, status, errorThrown) {
            alert("통신 실패");
        });
    });
</script>