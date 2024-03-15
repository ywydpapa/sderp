<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions"%>

<link href="${path}/fullcalendar4/core/main.css" rel="stylesheet" />
<link href="${path}/fullcalendar4/daygrid/main.css" rel="stylesheet" />
<link href="${path}/fullcalendar4/bootstrap/main.css" rel="stylesheet" />
<link href="${path}/assets/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<%--
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
  rel="stylesheet"
/>
<!--CDN 링크 -->--%>
<link href="${path}/fancytree/skin-win8/ui.fancytree.css" rel="stylesheet" />

<!-- material icon cdn -->
<!-- <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" /> -->

<script src="${path}/fullcalendar4/core/main.js"></script>
<script src="${path}/fullcalendar4/daygrid/main.js"></script>
<script src="${path}/fullcalendar4/interaction/main.js"></script>
<script src="${path}/fullcalendar4/list/main.js"></script>
<script src="${path}/fullcalendar4/timegrid/main.js"></script>
<script src="${path}/fullcalendar4/google-calendar/main.js"></script>
<%--
<script src="${path}/fullcalendar4/moment/main.js"></script>
--%>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"
  integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ=="
  crossorigin="anonymous"
  referrerpolicy="no-referrer"
></script>
<script src="${path}/fancytree/jquery.fancytree-all-deps.js"></script>
<script src="${path}/fancytree/jquery.fancytree-all.js"></script>

<style>
  #calendar {
    display: none;
  }
  .org_wrap {
    display: flex;
    justify-content: end;
    padding-bottom: 20px;
  }
  .org_chart {
  }

  #docSelect2 {
    display: none;
  }
  #docSelect3 {
    display: none;
  }
  #organizationChartView {
    min-width: 200px;
    background-color: #fff;
    display: none;
    position: absolute;
    z-index: 9999;
    padding: 5px 5px 10px 5px;
    border: 2px solid #efefef;
  }

  input[type="checkbox"] {
    margin: 4px 0 0 0;
  }

  .fa-caret-down,
  .fa-caret-right {
    cursor: pointer;
  }

  .fancytree-container {
    outline: none;
  }

  #selectedPerson > div > button {
    margin-top: 2px;
    margin-right: 4px;
  }

  #selectedPerson > div > button > span {
    font-size: 22px;
    color: #f00;
  }
  .payment_line {
    display: flex;
    align-items: center;
    justify-content: end;
  }

  .payment_line_wrap {
    padding: 10px 19px;
    color: white;
    background: #312d85;
    cursor: pointer;
  }

  /* #312d85 메인컬러 */

  html,
  body {
    width: 100%;
    height: 100%;
  }

  /*전자결재 모달창 css*/
  .payment_modal {
    width: 100%;
    height: 100%;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    /* background-color: bisque; */
  }

  .payment_modal_wrap {
    width: 100%;
    height: 100%;
    position: relative;
  }

  .payment_modal_wrap_inner {
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: space-between;
  }

  .payment_modal_right {
    display: none;
    width: 20%;
    height: 100%;
    position: relative;
    border-radius: 0px 20px 20px 0px;
    background-color: #312d85;
  }

  .payment_order_txt_wrap {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    display: flex;
    flex-direction: column;
    gap: 40px;
  }

  .payment_order_txt {
    color: white;
    font-weight: 500;
  }

  .modal_content {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 65%;
    height: 70%;
    background-color: white;
    z-index: 999;
    border: 1px solid #ccc;
  }

  .modal_content_wrap {
    width: 100%;
    height: 100%;
  }

  .modal_content_wrap_inner {
    width: 100%;
    height: 100%;
    padding: 20px;
  }

  /* 위치는 임시 하드코딩  */
  .payment_content_level {
    position: absolute;
    display: flex;
    flex-direction: column;
    gap: 50px;
    top: 50%;
    left: 0.5px;
    transform: translate(-50%, -50%);
  }

  .level_avtive {
    border-color: rgb(53, 231, 76) !important;
  }

  .level {
    box-sizing: border-box;
    border: 3px solid transparent;
    border-radius: 50%;
    font-size: 30px;
    padding: 15px 30px;
    background-color: white;
    /* border-image: linear-gradient(to right, red 0%, orange 100%); */
  }

  .payment_people {
    position: absolute;
    gap: 50px;
    top: 50%;
    left: 26%;
    transform: translate(-50%, -50%);
  }
  .payment_people_wrap_inner {
    display: flex;
    flex-direction: column;
    gap: 90px;
  }
  .people_wrpa {
    width: 300px;
    height: 40px;
    border-radius: 10px;
    border: 1px solid #ccc;
  }

  .payment_line {
    display: flex;
    align-items: center;
    justify-content: end;
  }

  .payment_modal_overlay {
    display: none;
    background-color: rgba(0, 0, 0, 0.5);
    width: 100%;
    height: 100%;
    position: fixed;
    z-index: 10000;
    top: 0;
    left: 0;
  }
  .bottom_btn {
    position: absolute;
    width: 100%;
    bottom: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    padding: 0 10px 10px 0;
  }
  .payment_close {
  }
  .payment_close_wrap {
    background: #aa1c1f;
    padding: 10px 19px;
    color: white;
    font-weight: 500;
    cursor: pointer;
    border-radius: 10px;
  }
  .payment_bottom_btn_wrap {
    background: #312d85;
    padding: 10px 19px;
    color: white;
    font-weight: 500;
    cursor: pointer;
    border-radius: 10px;
  }
  .line_add {
    width: 40%;
    height: 85%;
    border: 3px solid #312d85;
    border-radius: 30px;
    position: absolute;
    /* left: 0; */
    right: 0;
    margin-right: 10px;
  }
  .line_add_header {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 20px;
    padding-top: 10px;
  }
  .line_add_header_button {
    color: white;
    font-weight: 500;
    background: #312d85;
    padding: 10px 20px;
    border-radius: 10px;
    cursor: pointer;
  }
  .org_chart {
    width: 750px;
    display: flex;
    justify-content: center;
  }
  .org_chart > div > input {
    border-radius: 10px;
    height: 40px;
  }
</style>

<!DOCTYPE html>
<html>
  <jsp:include page="../head.jsp" />
  <jsp:include page="../body-top2.jsp" />

  <div id="main_content">
    <!-- Page-header start 페이지 타이틀-->
    <div class="page-header2">
      <div class="row align-items-end">
        <div class="col-lg-12">
          <div class="page-header-title">
            <div class="d-inline">결재서류 작성</div>
          </div>
        </div>
      </div>
    </div>
    <!--Page-header end 페이지 타이틀 -->
    <!-- 계약 -->
    <!--계약등록-->
    <div class="payment_modal_overlay">
      <div class="payment_modal">
        <div class="payment_modal_wrap">
          <!-- 뒷배경에 깔리는 wrap -->
          <div class="payment_modal_wrap_inner">
            <div class="payment_modal_right">
              <div class="payment_order_txt_wrap">
                <div class="payment_order_txt">
                  <span>Tell us about your Business</span>
                </div>
                <div class="payment_order_txt">
                  <span>Tell us about your Business Operations</span>
                </div>
                <div class="payment_order_txt">
                  <span>Configure your Account Here</span>
                </div>
                <div class="payment_order_txt">
                  <span>Add Reievant Data</span>
                </div>
                <div class="payment_order_txt">
                  <span>Map Categories</span>
                </div>
              </div>
            </div>
            <div class="payment_modal_left"></div>
          </div>
          <!-- 뒷배경 위에 올라오는 wrap -->
          <div class="modal_content">
            <div class="modal_content_wrap">
              <div class="modal_content_wrap_inner">
                <!-- 조직도 인원 목록 및 라인 들어올 곳 -->
                <div class="org_chart">
                  <div style="float: left; margin: 0px 5px">
                    <input
                      type="text"
                      id="organizationChartOpen"
                      class="form-control"
                      value="결재자"
                      style="width: 200px; cursor: pointer"
                      readonly
                    />
                    <div id="organizationChartView">
                      <div id="tree" style="display: inline-block">
                        <ul>
                          <li
                            class="folder expanded topElement"
                            data-json='{"icon": "${path}/images/tree-icon1.png"}'
                          >
                            ${organizationArrList[0].title}
                            <ul>
                              <c:forEach
                                var="i"
                                begin="0"
                                end="${fn:length(organizationArrList[0].children)-1}"
                                varStatus="status"
                                step="1"
                              >
                                <c:set var="item" value="${organizationArrList[0].children[i]}" />
                                <li class="folder">
                                  ${status.current}.${item.title}
                                  <ul>
                                    <c:forEach var="user" items="${item.children}">
                                      <li
                                        data-json='{"icon": "${path}/images/personIcon1.png"}'
                                        id="li_${user.userNo}"
                                      >
                                        ${user.title}
                                      </li>
                                    </c:forEach>
                                  </ul>
                                </li>
                              </c:forEach>
                            </ul>
                          </li>
                        </ul>
                      </div>
                      <div style="text-align: center; margin-top: 5px">
                        <button
                          class="btn btn-sm btn-inverse"
                          onClick="javascript:$('#organizationChartView').hide();"
                        >
                          닫기
                        </button>
                      </div>
                    </div>
                  </div>
                  <!-- <input type="button" onclick="fnSearchCalendar()" value="검색" /> -->
                </div>
                <div id="calendar"></div>
                <!-- 조직도 인원 목록 및 라인 들어올 곳 -->
                <div class="payment_content_level">
                  <div class="level_wrap">
                    <div class="level level_avtive">
                      <span>1</span>
                    </div>
                  </div>
                  <div class="level_wrap">
                    <div class="level">
                      <span>2</span>
                    </div>
                  </div>
                  <div class="level_wrap">
                    <div class="level">
                      <span>3</span>
                    </div>
                  </div>
                  <div class="level_wrap">
                    <div class="level">
                      <span>4</span>
                    </div>
                  </div>
                  <div class="level_wrap">
                    <div class="level">
                      <span>5</span>
                    </div>
                  </div>
                </div>

                <!-- 선택된 결재자input  -->
                <div class="payment_people">
                  <div class="payment_people_wrap">
                    <div class="payment_people_wrap_inner">
                      <div class="people_wrpa"></div>
                      <div class="people_wrpa"></div>
                      <div class="people_wrpa"></div>
                      <div class="people_wrpa"></div>
                      <div class="people_wrpa"></div>
                    </div>
                  </div>
                </div>
                <!-- 결재 라인 등록 폼 -->
                <div class="line_add">
                  <div class="line_add_wrap">
                    <div class="line_add_wrap_inner">
                      <div class="line_add_header">
                        <div class="line_add_header_button">
                          <span>결재라인 등록하기</span>
                        </div>
                        <div class="line_add_header_button">
                          <span>등록된 결재라인 보기</span>
                        </div>
                        <div class="line_add_header_button">
                          <span>결재라인 삭제</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- 최하단 버튼 -->
                <div class="bottom_btn">
                  <div class="payment_bottom_btn">
                    <div class="payment_bottom_btn_wrap">
                      <span>결재 등록</span>
                    </div>
                  </div>
                  <div class="payment_close">
                    <div class="payment_close_wrap">
                      <span>닫기</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="cnt_wr">
      <h5 class="cont_title"><i class="icofont icofont-square-right"></i>결재정보</h5>
      <!-- 조직도 -->
      <div class="org_wrap">
        <div class="payment_line">
          <div class="payment_line_wrap">
            <span>결재라인관리</span>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-12">
          <div class="card-block table-border-style">
            <div class="table-responsive">
              <input type="hidden" id="compNo" value="${sessionScope.compNo}" />
              <input type="hidden" id="docUserNo" value="${sessionScope.userNo}" />
              <input type="hidden" id="docUserName" value="${sessionScope.userName}" />
              <table class="table table-sm bst02">
                <colgroup>
                  <col width="5%" />
                  <col width="15%" />
                  <col width="5%" />
                  <col width="15%" />
                  <col width="5%" />
                  <col width="15%" />
                  <col width="5%" />
                  <col width="15%" />
                </colgroup>
                <tbody>
                  <tr>
                    <th scope="row" class="text-center">결재 문서 종류</th>
                    <td colspan="2">
                      <div class="form-radio">
                        <form>
                          <div class="radio radio-inline">
                            <label style="margin-top: 10px">
                              <input
                                type="radio"
                                name="contractType"
                                value="BREQ"
                                checked="checked"
                              />
                              <i class="helper"></i>지출품의서</label
                            >
                          </div>
                          <div class="radio radio-inline">
                            <label>
                              <input type="radio" name="contractType" value="TREQ" />
                              <i class="helper"></i>지출결의서</label
                            >
                          </div>
                          <div class="radio radio-inline">
                            <label>
                              <input type="radio" name="contractType" value="OTHER" />
                              <i class="helper"></i>외부문서</label
                            >
                          </div>
                        </form>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <th class="contDetailSopp text-center">연결프로젝트(영업기회)</th>
                    <td class="contDetailSopp">
                      <div class="input-group input-group-sm mb-0">
                        <select
                          class="form-control"
                          id="soppTitle"
                          name="soppTitle"
                          onchange="autoCompleteSelect(this);"
                        >
                          <option value="">선택</option>
                          <c:forEach var="row" items="${listSopp}">
                            <option data-no="${row.soppNo}" value="${row.soppTitle}">
                              ${row.soppTitle}
                            </option>
                          </c:forEach>
                        </select>
                        <input
                          type="hidden"
                          class="form-control"
                          name="soppDTO"
                          id="soppNo"
                          value=""
                        />
                        <!-- <input type="text" class="form-control" name="soppDTO" id="soppTitle" value="" autocomplete="off"/> -->
                        <%--
                        <span class="input-group-btn">
                          <button
                            class="btn btn-primary sch-opportunity2"
                            data-remote="${path}/modal/popup.do?popId=sopp"
                            type="button"
                            data-toggle="modal"
                            data-target="#soppModal"
                          >
                            <i class="icofont icofont-search"></i>
                          </button>
                        </span>
                        <div class="modal fade" id="soppModal" tabindex="-1" role="dialog">
                          <div class="modal-dialog modal-80size" role="document">
                            <div class="modal-content modal-80size">
                              <div class="modal-header">
                                <h4 class="modal-title"></h4>
                                <button
                                  type="button"
                                  class="close"
                                  data-dismiss="modal"
                                  aria-label="Close"
                                >
                                  <span aria-hidden="true">&times;</span>
                                </button>
                              </div>
                              <div class="modal-body">
                                <h5>영업기회목록</h5>
                                <p>Loading!!!</p>
                              </div>
                              <div class="modal-footer">
                                <button
                                  type="button"
                                  class="btn btn-default waves-effect"
                                  data-dismiss="modal"
                                >
                                  닫기
                                </button>
                              </div>
                            </div>
                          </div>
                        </div>
                        --%>
                      </div>
                    </td>
                    <th class="text-center">거래처</th>
                    <td>
                      <div class="input-group input-group-sm mb-0">
                        <select
                          class="form-control"
                          id="custName"
                          name="custName"
                          onchange="autoCompleteSelect(this);"
                        >
                          <option value="">선택</option>
                          <c:forEach var="row" items="${listCust}">
                            <option data-no="${row.custNo}" value="${row.custName}">
                              ${row.custName}
                            </option>
                          </c:forEach>
                        </select>
                        <input type="hidden" name="custNo" id="custNo" value="${dto.custNo}" />
                        <%--
                        <input
                          type="text"
                          class="form-control"
                          name="custName"
                          id="custName"
                          value="${dto.custName}"
                          autocomplete="off"
                        />
                        --%> <%--
                        <span class="input-group-btn">
                          <button
                            class="btn btn-primary sch-company"
                            data-remote="${path}/modal/popup.do?popId=cust"
                            type="button"
                            data-toggle="modal"
                            data-target="#custModal"
                          >
                            <i class="icofont icofont-search"></i>
                          </button>
                        </span>
                        <div class="modal fade" id="custModal" tabindex="-1" role="dialog">
                          <div class="modal-dialog modal-80size" role="document">
                            <div class="modal-content modal-80size">
                              <div class="modal-header">
                                <h4 class="modal-title">거래처검색</h4>
                                <button
                                  type="button"
                                  class="close"
                                  data-dismiss="modal"
                                  aria-label="Close"
                                >
                                  <span aria-hidden="true">&times;</span>
                                </button>
                              </div>
                              <div class="modal-body">
                                <h5>매출처목록</h5>
                                <p>Loading!!!</p>
                              </div>
                              <div class="modal-footer">
                                <button
                                  type="button"
                                  class="btn btn-default waves-effect"
                                  data-dismiss="modal"
                                >
                                  닫기
                                </button>
                              </div>
                            </div>
                          </div>
                        </div>
                        --%>
                      </div>
                    </td>
                    <th class="text-center">문서번호(자동 생성)</th>
                    <td>
                      <input
                        type="text"
                        class="form-control"
                        id="estId"
                        placeholder="자동생성 됩니다..."
                        readonly
                      />
                    </td>
                    <th class="text-center requiredTextCss">문서제목(*)</th>
                    <td>
                      <input type="text" class="form-control" id="docTitle" />
                    </td>
                  </tr>
                  <tr>
                    <th class="text-center requiredTextCss">문서종류(*)</th>
                    <td>
                      <div id="docSelect1">
                        <select class="form-control" id="docType">
                          <option value="">선택</option>
                          <option value="BUY">구매요청서</option>
                          <option value="TRS">지출품의서</option>
                          <option value="ODS">수주서</option>
                          <option value="CKD">검토요청서</option>
                          <option value="FMF">공문서 확인 요청서</option>
                        </select>
                      </div>
                      <div id="docSelect2">
                        <select class="form-control" id="docType">
                          <option value="">선택</option>
                          <option value="COST">비용청구</option>
                          <option value="TAX">세금공과금</option>
                          <option value="CREDIT">외상매입금</option>
                          <option value="PAY">급여</option>
                        </select>
                      </div>
                      <div id="docSelect3">
                        <select class="form-control" id="docType">
                          <option value="">선택</option>
                          <option value="PUR">발주서</option>
                          <option value="DIP">공문서</option>
                        </select>
                      </div>
                    </td>
                    <th class="text-center requiredTextCss">작성일자(*)</th>
                    <td>
                      <input
                        type="date"
                        max="9999-12-30"
                        id="docDate"
                        name="docDate"
                        class="form-control"
                        style="text-align: right"
                        value=""
                      />
                    </td>
                    <th class="text-center">첨부파일</th>
                    <td>
                      <form id="uploadForm">
                        <input type="file" name="file" id="addFile" />
                      </form>
                    </td>
                    <th class="text-center requiredTextCss">결재자(*)</th>
                    <td>
                      <%--
                      <div class="input-group input-group-sm mb-0">
                        <input
                          type="text"
                          class="form-control"
                          name="userName"
                          id="userName"
                          readonly
                        />
                        <input type="hidden" name="userNo" id="userNo" />
                        <span class="input-group-btn">
                          <button
                            class="btn btn-primary sch-company"
                            data-remote="${path}/modal/popup.do?popId=user"
                            type="button"
                            data-toggle="modal"
                            data-target="#userModal"
                          >
                            <i class="icofont icofont-search"></i>
                          </button>
                        </span>
                        <div class="modal fade" id="userModal" tabindex="-1" role="dialog">
                          <div class="modal-dialog modal-80size" role="document">
                            <div class="modal-content modal-80size">
                              <div class="modal-header">
                                <h4 class="modal-title"></h4>
                                <button
                                  type="button"
                                  class="close"
                                  data-dismiss="modal"
                                  aria-label="Close"
                                >
                                  <span aria-hidden="true">&times;</span>
                                </button>
                              </div>
                              <div class="modal-body">
                                <h5>사용자목록</h5>
                                <p>Loading!!!</p>
                              </div>
                              <div class="modal-footer">
                                <button
                                  type="button"
                                  class="btn btn-default waves-effect"
                                  data-dismiss="modal"
                                >
                                  닫기
                                </button>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </td>
                    --%>
                    <input
                      type="text"
                      class="form-control"
                      name="userName"
                      id="userName"
                      data-completeSet="true"
                      value=""
                    />
                    <input type="hidden" name="userNo" id="userNo" value="10002" />
                  </tr>
                  <tr>
                    <th class="text-center">상세 내용</th>
                    <td colspan="7"><textarea class="form-control" id="docDesc"></textarea></td>
                  </tr>
                </tbody>
              </table>
              <c:set var="now" value="<%=new java.util.Date()%>" />
              <c:set var="sysDate"
                ><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss"
              /></c:set>
              <input type="hidden" id="issueDate" value="${sysDate}" />
              <div id="cardAddBtn" style="float: right; margin-top: 20px; margin-bottom: 20px">
                <button
                  class="btn btn-primary sch-company"
                  data-remote="${path}/modal/popup.do?popId=cardAddModal&userNo=${sessionScope.userNo}"
                  type="button"
                  data-toggle="modal"
                  data-target="#cardAddModal"
                >
                  <i class="icofont icofont-search"></i>카드내역추가
                </button>
                <c:if test="${sessionScope.docRole eq 'A'}">
                  <button
                    class="btn btn-primary sch-company"
                    data-remote="${path}/modal/popup.do?popId=bacVatB_spending_resolution"
                    type="button"
                    data-toggle="modal"
                    data-target="#list_Purchase"
                  >
                    <i class="icofont icofont-search"></i>매입계산서추가
                  </button>
                </c:if>
              </div>
              <div class="table-responsive" style="overflow-x: hidden">
                <jsp:include page="/WEB-INF/views/module/inputSet/inputSetDoc.jsp" />
                <jsp:include page="/WEB-INF/views/gware/docdtaillist.jsp" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="modal fade" id="cardAddModal" tabindex="-1" role="dialog" data-backdrop="static">
      <div class="modal-dialog modal-80size" role="document">
        <div class="modal-content modal-80size">
          <div class="modal-header">
            <h4 class="modal-title">카드 내역</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body"></div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">
              닫기
            </button>
            <button
              type="button"
              class="btn btn-success waves-effect"
              data-dismiss="modal"
              onclick="cardDataSave();"
            >
              선택추가
            </button>
          </div>
          <div class="col-sm-12">
            <small style="color: red">※개별 등록된 카드 내역만 리스트업 됩니다.</small>
          </div>
          <div class="col-sm-12">
            <small style="color: red">※기간 검색 시 해당 기간의 모든 데이터가 출력됩니다.</small>
          </div>
        </div>
      </div>
    </div>
    <div class="modal fade" id="list_Purchase" tabindex="-1" role="dialog">
      <div class="modal-dialog modal-80size" role="document">
        <div class="modal-content modal-80size">
          <div class="modal-header">
            <h4 class="modal-title">매입 계산서 목록</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body"></div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">
              닫기
            </button>
            <button
              type="button"
              class="btn btn-success waves-effect"
              data-dismiss="modal"
              onclick="cardDataSave_purchase();"
            >
              선택추가
            </button>
          </div>
        </div>
      </div>
    </div>

    <div class="btn_wr text-right mt-3">
      <button
        class="btn btn-md btn-success f-left"
        onClick="javascript:location='${path}/gw/mylist.do'"
      >
        결재목록
      </button>
      <button class="btn btn-md btn-primary" onClick="fn_tempInsert()">임시저장</button>
      <button class="btn btn-md btn-primary" onClick="fn_data02Insert()">결재등록</button>
      <button class="btn btn-md btn-inverse" onClick="javascript:location='${path}/gw/mylist.do'">
        취소
      </button>
    </div>
    <!--계약등록-->

    <script>
      $(".payment_line_wrap").click(function(){
        $(".payment_modal_overlay").css("display","block");
      });

      $(".payment_close_wrap").click(function() {
        $(".payment_modal_overlay").css("display","none");
      });

      var userNoSelected = {
      	<c:forEach var="i" begin="0" end="${fn:length(organizationArrList[0].children)-1}" varStatus="status" step="1">
      		<c:set var="item" value="${organizationArrList[0].children[i]}"/>
      			<c:forEach var="user" items="${item.children}">
      				${user.userNo} : false,
      			</c:forEach>
      	</c:forEach>
      }
      var userNoMatchName = {
      	<c:forEach var="i" begin="0" end="${fn:length(organizationArrList[0].children)-1}" varStatus="status" step="1">
      		<c:set var="item" value="${organizationArrList[0].children[i]}"/>
      		<c:forEach var="user" items="${item.children}">
      			${user.userNo} : '${user.title}',
      		</c:forEach>
      	</c:forEach>
      }

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

      //계약 table의 soppNo 값이 0일 경우
      function fnSetContData1(a,b,c,d,e){
      	//영업기회와 sopno이 연결되어있지 않은 경우 경고창
      	alert("영업기회에 연결되어있지 않은 계약압니다.");
      	return false;
      	//영업기회와 sopno이 연결되어있지 않은 경우 경고창
      	/* $("#soppNo").val(e);
      	location.href = "${path}/cont/iowrite.do/" + e; */
      }

      function fnSetSoppData(a, b, c, d) {
      	$("#soppNo").val(b);
      	$("#soppTitle").val(a);
      	$("#userNo").val(c);
      	$("#custNo").val(d);
      	$("#soppModal").modal("hide");
      }
      function fnSetContData(a, b) {
      	$("#contNo").val(b);
      	$("#contTitle").val(a);
      	$("#contModal").modal("hide");
      }

      function fnSetDetail(value, info) {
      	var path;

      	if(value == '770010') {
      		path = '${path}/sales/write.do?simple=Y';
      	}else if(value == '770100'){
      		path = '${path}/techd/write.do?simple=Y';
      	}else if(value == '770800'){
      		path = '${path}/sched/write.do?simple=Y';
      	}else if(value == 'modify'){
      		var schedType = info.event.extendedProps.schedType;
      		if(schedType == '영업일정') {
      			path = '${path}/sales/detail/'+info.event.id+'?simple=Y';
      		}else if(schedType == '기술지원'){
      			path = '${path}/techd/detail/'+info.event.id+'?simple=Y';
      		}else if(schedType == '기타일정'){
      			path = '${path}/sched/detail/'+info.event.id+'?simple=Y';
      		}
      	}

      	if(path) {
      		$('#detail-content').load(path, function() {
      			$('.modal-list-btn').hide();
      			$('.modal-cancel-btn').hide();
      			$('#detail-content').find('.modal-dialog').draggable({
      				handle: ".modal-header"
      			});

      			fnSetCurrentDate();

      			setTimeout(() => {
      				autoCompleteSet();
      			}, 300);
      		});
      	}
      }
      var calendar;
      function setCalendar(event, userNoList) {
      	var userNoList = userNoList;
      	if(event != 'search') {
      		userNoList = ["${sessionScope.userNo}"];
      	}

      	var calendarEl = document.getElementById('calendar');
      	calendar = new FullCalendar.Calendar(calendarEl, {
      		 eventSources: [
      			 {
      				 url: '${path}/calendar/listEvent.do',
      				 method: 'POST',
      				 extraParams: {
      					 userNoList : userNoList
      				 },
      				 success : function(rawData, response) {
      					 return rawData;
      				 },
      				 failure: function(error) {
      					 // console.dir(error);
      					 alert('캘린더 데이터 요청 실패');
      				 },
      				 color: 'yellow',    // an option!
      				 textColor: 'black',  // an option!
      			 },
      		 ],

      		 header : {
      			 left:   '',
      			 center: 'title',
      			 right:  'prevYear prev today next nextYear'
      		 },
      		 plugins: [ 'dayGrid','interaction','timeGrid','list' ],
      		 locale                    : 'ko',
      		 timezone                  : "local",
      		 firstDay                  : 0,
      		 weekNumbers               : false,
      		 selectable                : true,
      		 weekNumberCalculation     : "ISO",
      		 nextDayThreshold          : "09:00:00",
      		 allDaySlot                : true,
      		 displayEventTime          : false,
      		 displayEventEnd           : true,
      		 eventLimit                : true,
      		 views                     : {
      										month : { eventLimit : 3 }
      									 },
      		 dateClick:function (info) {
      			 $('#detail-content').empty();
      			 $('#detail-content')[0].selectedDate = info.dateStr;
      			 fnInitializeRadio();
      			 $('.eventModalRadioGroup').show();
      			 $('#eventModal').modal('show');
      		 },

      		 eventClick: function(info) {
      			 $('#detail-content').empty();
      			 $('.eventModalRadioGroup').hide();
      			 $('#eventModal').modal('show');
      			 fnSetDetail('modify', info);
      		 },
      		 eventRender : function(info) {
      			 info.el.style.backgroundColor = info.event.extendedProps.color;
      			 info.el.style.borderColor = info.event.extendedProps.color;
      		 }
      	 });
      	 calendar.render();

      	if(event == 'search'){
      	}
      }

      function fnSearchCalendar() {
      	var userNoList = [];
      	for (const key in userNoSelected){
      		var userNo = key;
      		var bool = userNoSelected[key];
      		if(bool){
      			userNoList.push(userNo);
      		}
      	}

      	$('#calendar').empty();
      	setCalendar('search', userNoList);
      }

      function fnOrganizationCheck(companyCheckbox) {
      	var organizations = $('.organization-checkbox');
      	$('.organization-checkbox').each(function(index, item){
      		item.checked = companyCheckbox.checked;
      	});
      }

      function fnCaretClick () {
      	if($('.organizationList-ul').is(":visible")) {
      		$('.organizationList-ul').hide();
      		$('#caret1')[0].className = 'fa-li fa fa-caret-right'

      	}else {
      		$('.organizationList-ul').show();
      		$('#caret1')[0].className = 'fa-li fa fa-caret-down'
      	}
      }

      function fnSetCurrentDate() {
      	var startDate = $('#detail-content').find('input[type=date]')[0];
      	var startTime = $('#startTime');
      	var endDate = $('#detail-content').find('input[type=date]')[1];
      	var endTime = $('#endTime');

      	startDate.value = $('#detail-content')[0].selectedDate;
      	startTime.val("09:00");
      	endDate.value = $('#detail-content')[0].selectedDate;
      	endTime.val("23:30");
      }

      function fnInitializeRadio() {
      	var radioButtons = $('.eventModalRadioGroup').find('input[type=radio]');

      	for(var i = 0; i < radioButtons.length; i++) {
      		radioButtons[i].checked = false;
      	}
      }

      function userNoSelected_Delete(userNo){
      	$("#tree").fancytree("getTree").visit(function(node) {
      		if(node.key == ("li_"+userNo)){
      			node.setSelected(false);
      		}
      	});
      }

      function userNoSelected_ElementCreate(){
      	var html = "";
      	for (const key in userNoSelected){
      		var userNo = key;
      		var usrName = userNoMatchName[key];
      		var bool = userNoSelected[key];
      		if(bool){
      			html = html + '<div style="display: inline-block;border: solid 0.5px #ffb64d; margin-right:5px;">' +
      					'<button type="button" class="close" data-dismiss="alert" aria-label="Close" style="" onclick="userNoSelected_Delete('+userNo+');">' +
      					'<span aria-hidden="true" style="">×</span>' +
      					'</button>' +
      					'<strong style=" padding: 5px; font-size: 1.2em;">' + usrName + '</strong>' +
      					'</div>';
      		}
      	}
      	$("#selectedPerson").empty();
      	$("#selectedPerson").append(html);
      }
      var calYear = "";
      var calDate = "";
      $(document).ready(function() {
      	setCalendar();
      	// setOrganizationList();
      	//setOrganizationTree();
      	$('#organizationChartOpen').on('click', function() {
      		if ($('#organizationChartView').is(":visible")) {
      			$('#organizationChartView').hide();
      		} else {
      			$('#organizationChartView').show();
      		}
      	});
      	$("#tree").fancytree({
      		checkbox: true,
      		selectMode: 3,
      		select: function(event, data) {
      			// console.dir(data.node);

      			var html = "";
      			if(data.node.children === null) {
      				var userNo = data.node.key.split("_")[1];
      				if(data.node.isSelected()) userNoSelected[userNo] = true;
      				else userNoSelected[userNo] = false;
      			} else {
      				if(data.node.extraClasses === "topElement"){
      					data = data.node.children;
      					for(var i=0; i < data.length; i++){
      						var data2 = data[i];
      						if(data2.children !== null){
      							for(var j=0; j < data2.children.length; j++) {
      								var t = data2.children[j];
      								var userNo = t.key.split("_")[1];
      								if (t.isSelected()) userNoSelected[userNo] = true;
      								else userNoSelected[userNo] = false;
      							}
      						}
      					}
      				} else {
      					for(var i=0; i<data.node.children.length; i++){
      						var t = data.node.children[i];
      						var userNo = t.key.split("_")[1];
      						if(t.isSelected()) userNoSelected[userNo] = true;
      						else userNoSelected[userNo] = false;
      					}
      				}
      			}
      			// console.dir(userNoSelected);
      			userNoSelected_ElementCreate();
      		}
      	});

      	$("#tree").fancytree("getTree").visit(function(node) {
      		// node.setExpanded(true);
      		node.setSelected(true);
      		if(node.key == ("li_"+${sessionScope.userNo})){
      			node.setSelected(true);
      		}
      	});

          $("#custModal").on("show.bs.modal", function (e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find(".modal-body").load(button.data("remote"));
          });

          $(".radioLabel").hide();

          $("[name='contractType']").change(function () {
            if ($(this).val() === "NFORM") {
              $(".contDetailSopp").hide();
              $(".radioLabel").show();
            } else {
              $(".radioLabel").hide();
              $(".contDetailSopp").show();
            }
          });

          function fnPrintform() {
            var win = window.open("${path}/form/ordform/1", "PopupWin", "width=600,height=800");
          }

          $("#soppModal").on("show.bs.modal", function (e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find(".modal-body").load(button.data("remote"));
          });

          $("#contModal").on("show.bs.modal", function (e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find(".modal-body").load(button.data("remote"));
          });

          $("#cardAddModal").on("show.bs.modal", function (e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find(".modal-body").load(button.data("remote"));
          });

          $("#list_Purchase").on("show.bs.modal", function (e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find(".modal-body").load(button.data("remote"));
          });

          function fnSetCustData(a, b) {
            $("#custNo").val(b);
            $("#custName").val(a);
            $("#productSalesEstimateCustName").val(a);
            $("#productSalesEstimateCustNo").val(b);
            $(".modal-backdrop").remove();
            $("#custModal").modal("hide");
          }

          function fnSetproductdata(a, b) {
            $("#productNo1").val(a);
            $("#data01Title").val(b);
            //$(".modal-backdrop").remove();
            //$("#productdataModal").modal("hide");
            // 모달이 정상적으로 제거되지않아 close 버튼 트리거로 구성함
            $("#productdataModal1").find(".modal-footer button").trigger("click");
          }

          function fnSetSoppData(a, b) {
            $("#soppNo").val(b);
            $("#soppTitle").val(a);
            $("#soppModal").modal("hide");
          }

          function fnSetproductdata2(a, b) {
            $("#productNo2").val(a);
            $("#data02Title").val(b);
            $("#productdataModal2").find(".modal-footer button").trigger("click");
          }

          $(document).ready(function () {
            var getDate = new Date();
            var year = getDate.getFullYear();
            var month = getDate.getMonth() + 1;
            var day = getDate.getDate();

            if (month < 10) {
              month = "0" + month;
            }

            if (day < 10) {
              day = "0" + day;
            }

            $("#docDate").val(year + "-" + month + "-" + day);

            $("#docSelect2").hide();
            $("#docSelect3").hide();
            $("#cardAddBtn").hide();
          });
        });
    </script>
  </div>
  <jsp:include page="../body-bottom.jsp" />
</html>
