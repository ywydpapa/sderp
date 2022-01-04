<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top.jsp"/>

<div id="main_content">
    <!-- Page-header start 페이지 타이틀-->
    <div class="page-header2">
        <div class="row align-items-end">
            <div class="col-lg-12">
                <div class="page-header-title">
                    <div class="d-inline">
                        휴가신청서 작성
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Page-header end 페이지 타이틀 -->

    <!--계약등록-->
    <div class="cnt_wr">
        <h5 class="cont_title"><i class="icofont icofont-square-right"></i>휴가정보</h5>
        <div class="row">
            <div class="col-sm-12">
                <div class="card-block table-border-style">
                    <div class="table-responsive">
                        <input type="hidden" id="compNo" value="${sessionScope.compNo}" />
                        <input type="hidden" id="userNo" value="${sessionScope.userNo}" />
                        <table class="table table-sm bst02">
                            <colgroup>
                                <col width="15%" />
                                <col width="35%"/>
                                <col width="15%"/>
                                <col width="35%"/>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th class="text-center">견적번호(*)</th>
                                <td>
                                    <input type="text" class="form-control" id="estId">
                                </td>
                                <th class="text-center">견적제목(*)</th>
                                <td>
                                    <input type="text" class="form-control" id="estTitle">
                                </td>
                            </tr>
                            <tr>
                                <th class="text-center">견적버전</th>
                                <td>
                                    <input type="text" class="form-control" id="estVer" placeholder="등록될 때 자동 등록" readonly>
                                </td>
                                <th class="text-center">견적서 작성일자(*)</th>
                                <td>
                                    <input type="date" id="estDate" name="estDate" class="form-control" style="text-align: right;" value="">
                                </td>
                            </tr>
                            <tr>
                                <th class="text-center">첨부파일</th>
                                <td>
                                    <input class="form-control" type="file" id="addFile">
                                </td>
                                <th class="text-center">과세/비과세</th>
                                <td>
                                    <select name="vatYn" id="vatYn" class="form-control form-control-sm">
                                        <option value="Y" selected>과세</option>
                                        <option value="N" >비과세</option>
                                    </select>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="table-responsive" style="overflow-x: hidden;">
                            <jsp:include page="/WEB-INF/views/module/inputSet/inputSetHR.jsp"/>
                            <jsp:include page="/WEB-INF/views/gware/hrdetaillist.jsp"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="btn_wr text-right mt-3">
        <button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/gw/estlist.do'">견적목록</button>
        <button class="btn btn-md btn-primary" onClick="fn_data02Insert()">견적등록</button>
        <button class="btn btn-md btn-inverse" onClick="javascript:location='${path}/gw/estlist.do'">취소</button>
    </div>
    <!--//계약등록-->

    <script>

        $('#custModal').on('show.bs.modal', function(e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find('.modal-body').load(button.data("remote"));
        });

        $(".radioLabel").hide();

        $("[name='contractType']").change(function(){
            if($(this).val() === "NFORM"){
                $(".contDetailSopp").hide();
                $(".radioLabel").show();
            }else{
                $(".radioLabel").hide();
                $(".contDetailSopp").show();
            }
        });

        $('#soppModal').on('show.bs.modal', function(e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find('.modal-body').load(button.data("remote"));
        });

        $('#contModal').on('show.bs.modal', function(e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find('.modal-body').load(button.data("remote"));
        });

        function fnSetCustData(a, b) {
            $("#custNo").val(b);
            $("#custName").val(a);
            $(".modal-backdrop").remove();
            $("#custModal").modal("hide");
        }

        function fnSetproductdata(a,b){
            $("#productNo1").val(a);
            $("#data01Title").val(b);
            //$(".modal-backdrop").remove();
            //$("#productdataModal").modal("hide");
            // 모달이 정상적으로 제거되지않아 close 버튼 트리거로 구성함
            $("#productdataModal1").find(".modal-footer button").trigger('click');
        }

        function fnSetSoppData(a, b) {
            $("#soppNo").val(b);
            $("#soppTitle").val(a);
            $("#soppModal").modal("hide");
        }

        function fnSetproductdata2(a,b){
            $("#productNo2").val(a);
            $("#data02Title").val(b);
            $("#productdataModal2").find(".modal-footer button").trigger('click');
        }

        $(document).ready(function() {
        });
    </script>
</div>
<jsp:include page="../body-bottom.jsp"/>

