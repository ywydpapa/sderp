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
                        결제서류 작성
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Page-header end 페이지 타이틀 -->

    <!--계약등록-->
    <div class="cnt_wr">
        <h5 class="cont_title"><i class="icofont icofont-square-right"></i>결제정보</h5>
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
                                <th scope="row" class="text-center">연결 영업기회/계약</th>
                                <td colspan="3">
                                    <div class="form-radio">
                                        <form>
                                            <div class="radio radio-inline">
                                                <label> <input type="radio" name="contractType" value="SOPP" checked="checked"> <i class="helper"></i>영업기회</label>
                                            </div>
                                            <!-- <div class="radio radio-inline">
                                                <label> <input type="radio" name="contractType" value="CONT"> <i class="helper"></i>계약</label>
                                            </div> -->
                                            <div class="radio radio-inline">
                                                <label> <input type="radio" name="contractType" value="NFORM"> <i class="helper"></i>표준견적 작성</label>
                                            </div>
                                            <div class="radioLabel radio-inline">
                                                <label style="color:red;">※ 표준견적 작성은 영업기회가 필요없습니다.</label>
                                            </div>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th class="contDetailSopp text-center">영업기회</th>
                                <td class="contDetailSopp">
                                    <div class="input-group input-group-sm mb-0">
                                        <input type="text" class="form-control" name="soppDTO" id="soppTitle" value="" readonly/>
                                        <input type="hidden" class="form-control" name="soppDTO" id="soppNo" value="" />
                                        <span class="input-group-btn">
												<button class="btn btn-primary sch-opportunity2"
                                                        data-remote="${path}/modal/popup.do?popId=sopp"
                                                        type="button" data-toggle="modal" data-target="#soppModal">
													<i class="icofont icofont-search"></i>
												</button>
											</span>
                                        <div class="modal fade " id="soppModal" tabindex="-1"
                                             role="dialog">
                                            <div class="modal-dialog modal-80size" role="document">
                                                <div class="modal-content modal-80size">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title"></h4>
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <h5>영업기회목록</h5>
                                                        <p>Loading!!!</p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button"
                                                                class="btn btn-default waves-effect "
                                                                data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <th class="text-center">견적고객</th>
                                <td>
                                    <div class="input-group input-group-sm mb-0">
                                        <input type="text" class="form-control" name="custName"
                                               id="custName" value="${dto.custName}" /> <input
                                            type="hidden" name="custNo" id="custNo"
                                            value="${dto.custNo}" /> <span class="input-group-btn">
												<button class="btn btn-primary sch-company"
                                                        data-remote="${path}/modal/popup.do?popId=cust"
                                                        type="button" data-toggle="modal"
                                                        data-target="#custModal">
													<i class="icofont icofont-search"></i>
												</button>
											</span>
                                        <div class="modal fade " id="custModal" tabindex="-1"
                                             role="dialog">
                                            <div class="modal-dialog modal-80size" role="document">
                                                <div class="modal-content modal-80size">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title">거래처검색</h4>
                                                        <button type="button" class="close"
                                                                data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <h5>매출처목록</h5>
                                                        <p>Loading!!!</p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
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
                            <jsp:include page="/WEB-INF/views/module/inputSet/inputSetProductSalesEstimate3.jsp"/>
                            <jsp:include page="/WEB-INF/views/gware/estdetaillist.jsp"/>
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

