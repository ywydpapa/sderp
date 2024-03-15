<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style>
	.sopp_contents > td,
	.cont_contents > td{
		font-weight: 600;	
	}
	
	.sopp_contents > td > span,
	.cont_contents > td > span{
		color: #FF0000;
	}
	
	.sopp_contents > td:hover,
	.cont_contents > td:hover{
		background-color: #EDEDED;
		cursor: pointer;
	}
	
	.trSopp{
		display: none;
	}
	
	.activeBox{
		display: none;
	}
</style>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<table class="table table-sm bst02" id="inoutlist">
	<thead>
		<tr>
			<th class="text-center"><input type="checkbox" class="deleteAllCheck" onclick="deleteAllCheck(this);"/></th>
			<th class="text-center">계산서상태</th>
			<th class="text-center">구분(등록/수정일)</th>
			<th class="text-center">거래처(매입/매출처)</th>
			<th class="text-center">상품</th>
			<th class="text-center">단가</th>
			<th class="text-center">수량</th>
			<th class="text-center">부가세액</th>
			<th class="text-center">공급가액</th>
			<th class="text-center">금액</th>
			<th class="text-center">비고</th>
			<th class="text-center">승인번호</th>
			<th class="text-center activeBox">계약선택</th>
			<th class="text-center activeBox">할당</th>
			<th class="text-center">수정</th>
			<%--<th class="text-center">삭제</th>--%>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="row" items="${dtodata01}">
		<c:if test="${row.contNo eq '100'}">
			<c:set var="soppLength" value="${soppLength + 1}" />
		</c:if>
	</c:forEach>
	<c:if test="${soppLength > 0}">
		<tr class="clickTr sopp_contents" data-name="trSopp" data-flag="true" data-type="sopp" onclick="clickTrViewSet(this);">
			<th style="text-align: center;">영업기회명</th>
			<td colspan="14">${dto.soppTitle}(<span>※클릭하여 상세보기</span>)</td>
		</tr>
		<c:forEach var="row" items="${dtodata01}">
			<input type="hidden" id="hideSoppTitle" value="${row.soppTitle}" />
			<c:if test="${row.dataType eq '1101' && row.contNo eq '100'}">
				<c:set var="totalSum1" value="${totalSum1 + row.dataTotal}" />
				<tr class="item1 trSopp" id="${row.soppdataNo}">
					<td style="text-align: center;">
						<input type="checkbox" class="form-control deleteCheckBox" data-type="sopp" data-id="${row.soppdataNo}" data-inoutNo="${row.inoutNo}" />
					</td>
					<td style="text-align: center; color: #0054FF;">
						<c:if test="${row.vatStatus eq 'B1'}">
							매입발행
						</c:if> 
						<c:if test="${row.vatStatus eq 'B3'}">
							지급처리중
						</c:if>
						<c:if test="${row.vatStatus eq 'B5'}">
							지급완료
						</c:if>
					</td>
					<c:choose>
						<c:when test="${empty row.vatDate}">
							<td style="text-align: center;" data-type="${row.dataType}">
								매입(<fmt:parseDate value="${row.regDatetime}" var="regDatetime" pattern="yyyy-MM-dd HH:mm:ss"/>
								<fmt:formatDate value="${regDatetime}" pattern="yyyy-MM-dd"/>)
							</td>
						</c:when>
						<c:otherwise>
							<td style="text-align: center;">매입(${row.vatDate})</td>
						</c:otherwise>
					</c:choose>
					<td style="text-align: center;">${row.salesCustNoN}<input type="hidden" value="${row.salesCustNo}"></td>
					<td style="text-align: center;">${row.dataTitle}<input type="hidden" value="${row.productNo}"></td>
					<td style="text-align: right">₩<fmt:formatNumber value="${row.dataNetprice}" pattern="#,###" /></td>
					<td style="text-align: right"><fmt:formatNumber value="${row.dataQuanty}" pattern="#,###" /></td>
					<td style="text-align: right">₩<fmt:formatNumber value="${row.dataVat}" pattern="#,###" /></td>
					<td style="text-align: right">₩<fmt:formatNumber value="${row.dataAmt}" pattern="#,###" /></td>
					<td style="text-align: right">₩<fmt:formatNumber value="${row.dataTotal}" pattern="#,###" /></td>
					<td>${row.dataRemark}</td>
					<td class="vatSerialTd" style="text-align: center;">${row.vatSerial}</td>
					<td class="activeBox">
						<select class="form-control" id="contSelect" name="contSelect" onchange="vatSoppChange(this);">
							<option value="">계약선택</option>
							<c:forEach var="item" items="${soppContList}" varStatus="status">
								<option value="${item.contNo}">${item.contTitle}</option>
							</c:forEach>
						</select>
					</td>
					<td class="activeBox" style="text-align: center;"><button type="button" class="btn btn-sm btn-success" data-no="${row.soppdataNo}" onclick="contAssign(this);">할당</button></td>
					<td style="text-align: center;"><button class="btn btn-sm btn-dark" data-value="1101" onClick="javascript:fn_data01modify(this)">수정</button></td>
					<%--<td style="text-align: center;"><button class="btn btn-sm btn-danger" data-id="${row.soppdataNo}" data-inoutNo="${row.inoutNo}" onClick="javascript:fn_data01delete1(this)">삭제</button></td>--%>
				</tr>
			</c:if>
		</c:forEach>
		<tr class="item1 trSopp">
			<td colspan="1" style="text-align: center; background: #80808030;">매입합계</td>
			<td colspan="14" style="text-align: right; background: #80808030;" id="product01InSum_table">₩<fmt:formatNumber value="${totalSum1}" pattern="#,###" /></td>
		</tr>
		<c:forEach var="row" items="${dtodata01}">
			<c:if test="${row.dataType eq '1102' && row.contNo eq '100'}">
				<c:set var="totalSum2" value="${totalSum2 + row.dataTotal}" />
				<tr class="item1 trSopp" id="${row.soppdataNo}">
					<td style="text-align: center;">
						<input type="checkbox" class="form-control deleteCheckBox" data-type="sopp" data-id="${row.soppdataNo}" data-inoutNo="${row.inoutNo}" />
					</td>
					<td style="text-align: center; color: #0054FF;">
						<c:if test="${row.vatStatus eq 'S1'}">
							매출발행
						</c:if>
						<c:if test="${row.vatStatus eq 'S3'}">
							수금처리중
						</c:if>
						<c:if test="${row.vatStatus eq 'S5'}">
							수금완료
						</c:if>
					</td>
					<c:choose>
						<c:when test="${empty row.vatDate}">
							<td data-type="${row.dataType}">
								매출(<fmt:parseDate value="${row.regDatetime}" var="regDatetime" pattern="yyyy-MM-dd HH:mm:ss"/>
								<fmt:formatDate value="${regDatetime}" pattern="yyyy-MM-dd"/>)
							</td>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${!empty row.endvataDate}">
									<td style="text-align: center;">유지보수(${row.vatDate} ~ ${row.endvataDate})</td>
								</c:when>
								<c:otherwise>
									<td style="text-align: center;">매출(${row.vatDate})</td>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
					<td style="text-align: center;">${row.salesCustNoN}<input type="hidden" value="${row.salesCustNo}"></td>
					<td style="text-align: center;">${row.dataTitle}<input type="hidden" value="${row.productNo}"></td>
					<td style="text-align: right">₩<fmt:formatNumber value="${row.dataNetprice}" pattern="#,###" /></td>
					<td style="text-align: right"><fmt:formatNumber value="${row.dataQuanty}" pattern="#,###" /></td>
					<td style="text-align: right">₩<fmt:formatNumber value="${row.dataVat}" pattern="#,###" /></td>
					<td style="text-align: right">₩<fmt:formatNumber value="${row.dataAmt}" pattern="#,###" /></td>
					<td style="text-align: right">₩<fmt:formatNumber value="${row.dataTotal}" pattern="#,###" /></td>
					<td>${row.dataRemark}</td>
					<td class="vatSerialTd" style="text-align: center;">${row.vatSerial}</td>
					<td class="activeBox">
						<select class="form-control" id="contSelect" name="contSelect" onchange="vatSoppChange(this);">
							<option value="">계약선택</option>
							<c:forEach var="item" items="${soppContList}" varStatus="status">
								<option value="${item.contNo}">${item.contTitle}</option>
							</c:forEach>
						</select>
					</td>
					<td class="activeBox" style="text-align: center;"><button type="button" class="btn btn-sm btn-success" data-no="${row.soppdataNo}" onclick="contAssign(this);">할당</button></td>
					<td style="text-align: center;"><button class="btn btn-sm btn-dark" data-value="1102" onClick="javascript:fn_data01modify(this)">수정</button></td>
					<%--<td style="text-align: center;"><button class="btn btn-sm btn-danger" data-id="${row.soppdataNo}" data-inoutNo="${row.inoutNo}" onClick="javascript:fn_data01delete1(this)">삭제</button></td>--%>
				</tr>
			</c:if>
		</c:forEach>
		<tr class="item1 trSopp" style="text-align: right;">
			<td colspan="1" style="text-align: center; background: #80808030;">매출합계</td>
			<td colspan="14" style="text-align: right; background: #80808030;" id="product01OutSum_table">₩<fmt:formatNumber value="${totalSum2}" pattern="#,###" /></td>
		</tr>
	</c:if>
	
	<c:forEach var="row" items="${dtoContdata01}">
		<c:set var="contLength" value="${contLength + 1}" />
	</c:forEach>
	<c:if test="${contLength > 0}">
		<c:forEach var="row" items="${dtoContdata01}" varStatus="status">
			<input type="hidden" id="hideSoppTitle" value="${row.soppTitle}" />
			<c:if test="${row.contTitle ne ''}"> 
				<tr class="contTitleTr clickTr cont_contents" data-name="trCont_${row.contNo}" data-flag="true" data-type="cont" onclick="clickTrViewSet(this);">
					<th style="text-align: center;">계약명</th>
					<td colspan="14">${row.contTitle}(<span>※클릭하여 상세보기</span>)</td>
				</tr>
			</c:if>
			<c:choose>
				<c:when test="${row.dataType eq '1101'}">
					<c:set var="totalSum3" value="${totalSum3 + row.dataTotal}" />
					<tr class="trCont_${row.contNo}" id="${row.soppdataNo}" style="display: none;">
						<td style="text-align: center;">
							<input type="checkbox" class="form-control deleteCheckBox" data-type="cont" data-id="${row.soppdataNo}" data-inoutNo="${row.inoutNo}" />
						</td>
						<td style="text-align: center; color: #0054FF;">
							<c:if test="${row.vatStatus eq 'B1'}">
								매입발행
							</c:if>
							<c:if test="${row.vatStatus eq 'B3'}">
								지급처리중
							</c:if>
							<c:if test="${row.vatStatus eq 'B5'}">
								지급완료
							</c:if>
						</td>
						<c:choose>
							<c:when test="${empty row.vatDate}">
								<td style="text-align: center;" data-type="${row.dataType}">
									매입(<fmt:parseDate value="${row.regDatetime}" var="regDatetime" pattern="yyyy-MM-dd HH:mm:ss"/>
									<fmt:formatDate value="${regDatetime}" pattern="yyyy-MM-dd"/>)
								</td>
							</c:when>
							<c:otherwise>
								<td style="text-align: center;">매입(${row.vatDate})</td>
							</c:otherwise>
						</c:choose>
						<td style="text-align: center;">${row.salesCustNoN}<input type="hidden" value="${row.salesCustNo}"></td>
						<td style="text-align: center;">${row.dataTitle}<input type="hidden" value="${row.productNo}"></td>
						<td style="text-align: right">₩<fmt:formatNumber value="${row.dataNetprice}" pattern="#,###" /></td>
						<td style="text-align: right"><fmt:formatNumber value="${row.dataQuanty}" pattern="#,###" /></td>
						<td style="text-align: right">₩<fmt:formatNumber value="${row.dataVat}" pattern="#,###" /></td>
						<td style="text-align: right">₩<fmt:formatNumber value="${row.dataAmt}" pattern="#,###" /></td>
						<td class="contInAmount" data-cont="${row.contNo}" style="text-align: right">₩<fmt:formatNumber value="${row.dataTotal}" pattern="#,###" /></td>
						<td>${row.dataRemark}</td>
						<td class="vatSerialTd" style="text-align: center;">${row.vatSerial}</td>
						<td style="text-align: center;"><button class="btn btn-sm btn-dark contUpBtn" data-value="1101" onClick="javascript:fn_data01modify(this)">계약에서 진행</button></td>
						<%--<td style="text-align: center;"><button class="btn btn-sm btn-danger contDelBtn" data-id="${row.soppdataNo}" data-inoutNo="${row.inoutNo}" onClick="javascript:fn_data01delete1(this)">계약에서 진행</button></td>--%>
					</tr>
					<tr class="trCont_${row.contNo}" style="display: none;">
						<td class="totalTdTitle" colspan="1" style="text-align: center; background: #80808030;">매입합계</td>
						<td colspan="14" style="text-align: right; background: #80808030;" id="totalInCont" data-cont="${row.contNo}">₩<fmt:formatNumber value="${totalSum3}" pattern="#,###" /></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:set var="totalSum4" value="${totalSum4 + row.dataTotal}" />
					<tr class="trCont_${row.contNo}" id="${row.soppdataNo}" style="display: none;">
						<td style="text-align: center;">
							<input type="checkbox" class="form-control deleteCheckBox" data-type="cont" data-id="${row.soppdataNo}" data-inoutNo="${row.inoutNo}" />
						</td>
						<td style="text-align: center; color: #0054FF;">
							<c:if test="${row.vatStatus eq 'S1'}">
								매출발행
							</c:if>
							<c:if test="${row.vatStatus eq 'S3'}">
								수금처리중
							</c:if>
							<c:if test="${row.vatStatus eq 'S5'}">
								수금완료
							</c:if>
						</td>
						<c:choose>
							<c:when test="${empty row.vatDate}">
								<td data-type="${row.dataType}">
									매출(<fmt:parseDate value="${row.regDatetime}" var="regDatetime" pattern="yyyy-MM-dd HH:mm:ss"/>
									<fmt:formatDate value="${regDatetime}" pattern="yyyy-MM-dd"/>)
								</td>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${!empty row.endvataDate}">
										<td style="text-align: center;">유지보수(${row.vatDate} ~ ${row.endvataDate})</td>
									</c:when>
									<c:otherwise>
										<td style="text-align: center;">매출(${row.vatDate})</td>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
						<td style="text-align: center;">${row.salesCustNoN}<input type="hidden" value="${row.salesCustNo}"></td>
						<td style="text-align: center;">${row.dataTitle}<input type="hidden" value="${row.productNo}"></td>
						<td style="text-align: right">₩<fmt:formatNumber value="${row.dataNetprice}" pattern="#,###" /></td>
						<td style="text-align: right"><fmt:formatNumber value="${row.dataQuanty}" pattern="#,###" /></td>
						<td style="text-align: right">₩<fmt:formatNumber value="${row.dataVat}" pattern="#,###" /></td>
						<td style="text-align: right">₩<fmt:formatNumber value="${row.dataAmt}" pattern="#,###" /></td>
						<td class="contOutAmount" data-cont="${row.contNo}" style="text-align: right">₩<fmt:formatNumber value="${row.dataTotal}" pattern="#,###" /></td>
						<td>${row.dataRemark}</td>
						<td class="vatSerialTd" style="text-align: center;">${row.vatSerial}</td>
						<td style="text-align: center;"><button class="btn btn-sm btn-dark contUpBtn" data-value="1102" onClick="javascript:fn_data01modify(this)">계약에서 진행</button></td>
						<%--<td style="text-align: center;"><button class="btn btn-sm btn-danger contDelBtn" data-id="${row.soppdataNo}" data-inoutNo="${row.inoutNo}" onClick="javascript:fn_data01delete1(this)">계약에서 진행</button></td>--%>
					</tr>
					<tr class="trCont_${row.contNo}" style="text-align: right; display: none;">
						<td class="totalTdTitle" colspan="1" style="text-align: center; background: #80808030;">매출합계</td>
						<td colspan="14" style="text-align: right; background: #80808030;" id="totalOutCont" data-cont="${row.contNo}">₩<fmt:formatNumber value="${totalSum4}" pattern="#,###" /></td>
					</tr>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</c:if>
	</tbody>
</table>
<br/>
<table class="table table-sm bst02" id="inoutlistSum">
	<tbody>
		<colgroup>
			<col width="5%" />
			<col width="20%" />
			<col width="5%" />
			<col width="20%" />
			<col width="5%" />
			<col width="20%" />
			<col width="5%" />
			<col width="20%" />
		</colgroup>
		<tr>
			<c:set var="totalValue" value="${totalSum4 - totalSum3 - ((totalSum4 - totalSum3)/11)}" />
			<td style="text-align: center; background: #80808030;">매입 합계</td>
			<td id="product01InSum" style="text-align: right">₩<fmt:formatNumber value="${totalSum3 - (totalSum3/11)}" pattern="#,###" /></td>
			<td style="text-align: center; background: #80808030;">매출 합계</td>
			<td id="product01OutSum" style="text-align: right">₩<fmt:formatNumber value="${totalSum4 - (totalSum4/11)}" pattern="#,###" /></td>
			<td style="text-align: center; background: #80808030;">이익 합계</td>
			<td id="product01DiffSum" style="text-align: right">₩<fmt:formatNumber value="${totalValue}" pattern="#,###" /></td>
			<td style="text-align: center; background: #80808030;">이익률</td>
			<td id="product01Percent" style="text-align: right">-</td>
		</tr>
	</tbody>
</table>

<script>
	var product02In = [
		<c:forEach var="row" items="${dtodata01}" varStatus="i">
			<c:if test="${row.dataType eq '1101'}">
				<c:if test="${!i.last}">${row.dataNetprice},</c:if>
				<c:if test="${i.last}">${row.dataNetprice}</c:if>
			</c:if>
		</c:forEach>
	];
	var product02InQuanty = [
		<c:forEach var="row" items="${dtodata01}" varStatus="i">
		<c:if test="${row.dataType eq '1101'}">
			<c:if test="${!i.last}">${row.dataQuanty},</c:if>
			<c:if test="${i.last}">${row.dataQuanty}</c:if>
		</c:if>
		</c:forEach>
	];
	var product02InSum = 0;
	var product02Out = [
		<c:forEach var="row" items="${dtodata01}" varStatus="i">
		<c:if test="${row.dataType eq '1102'}">
			<c:if test="${!i.last}">${row.dataTotal},</c:if>
			<c:if test="${i.last}">${row.dataTotal}</c:if>
		</c:if>
		</c:forEach>
	];
	var product02OutQuanty = [
		<c:forEach var="row" items="${dtodata01}" varStatus="i">
		<c:if test="${row.dataType eq '1102'}">
			<c:if test="${!i.last}">${row.dataQuanty},</c:if>
			<c:if test="${i.last}">${row.dataQuanty}</c:if>
		</c:if>
		</c:forEach>
	];
	var product02OutSum = 0;
	var product02DiffSum = 0;
	var product02Percent = 0;
	
	function clickTrViewSet(thisEle){
		let deleteAllCheck = $(".deleteAllCheck");
		let deleteCheckBox = $("#inoutlist tbody tr td .deleteCheckBox");
		$("#inoutlist tbody tr").not(".clickTr").not("." + $(thisEle).data("name")).css("display", "none");
		$("#inoutlist tbody .clickTr").data("flag", true);
		deleteAllCheck.prop("checked", false);

		for(let i = 0; i < deleteCheckBox.length; i++){
			let item = $(deleteCheckBox[i]);
			item.prop("checked", false);
			item.attr("disabled", true);
		}

		for(let i = 0; i < $("#inoutlist tbody tr").length; i++){
			let item = $("#inoutlist tbody tr");

			
			if(item.css("display") === "table-row"){
				item.find("td .deleteCheckBox").prop("checked", false);
				item.find("td .deleteCheckBox").attr("disabled", false);

				if($("#contNo").val() === undefined){
					item.find("td .deleteCheckBox[data-type=\"cont\"]").prop("checked", false);
					item.find("td .deleteCheckBox[data-type=\"cont\"]").attr("disabled", true);
				}
			}
		}

		if($(thisEle).data("type") === "sopp"){
			$(".activeBox").show();
			$(".activeDeleteBtn").attr("disabled", false);
			$(".activeDeleteBtn").text("선택 삭제");
		}else{
			$(".activeBox").hide();

			if($("contNo").val() === undefined){
				$(".activeDeleteBtn").attr("disabled", true);
				$(".activeDeleteBtn").text("계약에서 진행");
			}else{
				$(".activeDeleteBtn").attr("disabled", false);
				$(".activeDeleteBtn").text("선택 삭제");
			}
		}
		
		if(!$(thisEle).data("flag")){
			$(thisEle).data("flag", true);
			$("." + $(thisEle).data("name"));
		}else{
			$(thisEle).data("flag", false);
			$("." + $(thisEle).data("name")).css("display", "table-row");
		}
	}
	
	function contAssign(thisEle){
		let selectEle = $(thisEle).parent().prev().children();
		if(confirm("선택하신 계약[" + selectEle.find("option:selected").text() + "]에 할당하시겠습니까??")){
			let value = selectEle.val();
			let soppdataNo = $(thisEle).data("no");
			
			$.ajax({
				url: "${path}/sopp/contAssign.do",
				method: "post",
				data: {
					"soppdataNo": soppdataNo,
					"contNo": value,
				},
				dataType: "json",
				success: function(){
					alert("할당되었습니다.");
					location.reload();
				},
				error: function(error){
					alert("할당하는 중 에러가 발생했습니다." + error);
					console.log(error);
					return false;
				}
			});
		}else{
			return false;
		}
	}

	function fn_data01modify(e) {
		if($(e).text() === "수정"){
			if($("#data01Modbtn").is(':visible') == true){
				alert("수정은 1개만 가능합니다. 먼저 수정하고 있는것을 마무리하시거나 취소버튼을 클릭해주세요.")
				return;
			}
			var tr = $(e).closest("tr");
			var dataType = $(tr).children().eq(2).data('type');
			
			if(dataType == 1101){
				$("#data01Type").val("1101");
			} else if(dataType == 1102){
				$("#data01Type").val("1102");
			}

			var soppdataNo = Number(tr.attr("id"));
			
			$("#soppdataNo").val(soppdataNo);
			
			const date_default = $(tr).children().eq(2)[0].innerText.replaceAll(" ", "");
			
			if(date_default.length > 16){
				const date_maintain = date_default.substr(5, 10);
				$('#ioDate').val(date_maintain);
			}else {
				const date_default_2 = date_default.substr(3, 10);
				$('#ioDate').val(date_default_2);
			}
			
			var salesCustNoN = $(tr).children().eq(3)[0].innerText;
			var salesCustNo = Number($(tr).children().eq(3)[0].children[0].value);
			$("#productSalesInOutCustName").val(salesCustNoN).trigger("change");
			$("#productSalesInOutCustNo").val(salesCustNo);

			var data01Title = $(tr).children().eq(4)[0].innerText;
			var productNo1 = Number($(tr).children().eq(4)[0].children[0].value);
			$("#data01Title").val(data01Title).trigger("change");
			$("#productNo1").val(productNo1);


			var data01Netprice = $(tr).children().eq(5)[0].innerText.replace('₩','');
			// var data01NetpriceNum = Number(data01Netprice.replace(',',''));
			$("#data01Netprice").val(data01Netprice);

			var data01Quanty = $(tr).children().eq(6)[0].innerText;
			// var data01QuantyNum = Number(data01Quanty.replace(',',''));
			$("#data01Quanty").val(data01Quanty);

			var data01Vat = $(tr).children().eq(7)[0].innerText.replace('₩','');
			$("#data01Vat").val(data01Vat);
			
			var data01Amt = $(tr).children().eq(8)[0].innerText.replace('₩','');
			$("#data01Amt").val(data01Amt);
			
			var data01Total = $(tr).children().eq(9)[0].innerText.replace('₩','');
			$("#data01Total").val(data01Total);

			var data01Remark = $(tr).children().eq(10)[0].innerText;
			$("#data01Remark").val(data01Remark);
			
			$(e).removeClass("btn-dark");
			$(e).addClass("btn-warning");
			$(e).html('취소');

			$("#data01Addbtn").hide();
			$("#data01Modbtn").show();
			
			if($(e).attr("data-value") === "1101"){
				$("#data01Type").val("1101");
				$("#vatBdiv").show();
    			$("#vatSdiv").hide();
    			if($(tr).children().eq(11)[0].innerText !== ""){
					$("#vatBdiv").find("#vatSerialB").val($(tr).children().eq(11)[0].innerText).trigger("change");
					localStorage.setItem("setSerial", $("#vatBdiv").find("#vatSerialB").val());
    			}
			}else{
				$("#data01Type").val("1102");
				$("#vatBdiv").hide();
    			$("#vatSdiv").show();
    			if($(tr).children().eq(11)[0].innerText !== ""){
    				$("#vatSdiv").find("#vatSerialS").val($(tr).children().eq(11)[0].innerText).trigger("change");
					localStorage.setItem("setSerial", $("#vatSdiv").find("#vatSerialS").val());
    			}
			}
		} else if($(e).text() === "취소"){
			var today = new Date();
			var year = today.getFullYear();
			var month = ('0' + (today.getMonth() + 1)).slice(-2);
			var day = ('0' + today.getDate()).slice(-2);
			var dateString = year + '-' + month  + '-' + day;
			
			$("#data01Type option:eq(0)").attr("selected","selected");
			$("#soppdataNo").val("");
			$("#productSalesInOutCustName").val("").trigger("change");
			$("#productSalesInOutCustNo").val("");
			$("#productNo1").val("");
			$("#data01Title").val("").trigger("change");
			$("#data01Netprice").val(0);
			$("#data01Quanty").val(1);
			$("#data01Vat").val(0);
			$("#data01Amt").val(0);
			$("#data01Total").val(0);
			$("#data01Remark").val("");
			$("#vatBdiv").find("#vatSerialB").val("").trigger("change");
			$("#vatSdiv").find("#vatSerialS").val("").trigger("change");
			$('#ioDate').val(dateString);
			$(e).addClass("btn-dark");
			$(e).removeClass("btn-warning");
			$(e).html('수정');

			$("#data01Addbtn").show();
			$("#data01Modbtn").hide();
		}
	}
	
	$(document).ready(function(){
		var product01DiffSum = $("#product01DiffSum").html().replace(/,/g, "").replace(/₩/g, "");
		var product01OutSum = $("#product01OutSum").html().replace(/,/g, "").replace(/₩/g, "");
		var product01Percent = (product01DiffSum / product01OutSum * 100).toFixed(2);
		
		if(product01Percent == 'NaN'){
			$("#product01Percent").html('0'+'%');
		} else if (product01Percent == '-Infinity'){
			$("#product01Percent").html('0'+'%');
		} else if (product01Percent == 'Infinity'){
			$("#product01Percent").html('0'+'%');
		} else if(product01Percent >= 0){
			$("#product01Percent").html('+'+product01Percent+'%');
		} else if(product01Percent < 0){
			$("#product01Percent").html(product01Percent+'%');
		}
		
		contTableSet();
	});
	
	function contTableSet(){
		let contNoArr = [];
		let contTitleTr = $(".contTitleTr");
		let totalTdTitle = $(".totalTdTitle");
		let contInAmount = $("table tbody tr .contInAmount");
		let contOutAmount = $("table tbody tr .contOutAmount");
		let totalIn = 0;
		let totalOut = 0;
		
		for(let i = 0; i < contTitleTr.length; i++){
			let item = $(contTitleTr[i]);
			let itemTitle = item.text();
			
			if(itemTitle === $(contTitleTr[i-1]).text()){
				item.remove();
			}
		}
		
		for(let i = 0; i < totalTdTitle.length; i++){
			let item = $(totalTdTitle[i]);
			let itemTitle = item.text();
			
			if(itemTitle === $(totalTdTitle[i+1]).text()){
				item.parent().remove();
			}
		}
		
		for(let i = 0; i < contInAmount.length; i++){
			let item = $(contInAmount[i]);
			
			if(contNoArr.indexOf(item.data("cont")) == -1){
				contNoArr.push(item.data("cont"));	
			}	
		}
		
		for(let i = 0; i < contNoArr.length; i++){
			let totalInCont = 0;
			let totalOutCont = 0;
			
			for(let t = 0; t < contInAmount.length; t++){
				let secondItem = $(contInAmount[t]);
				
				if(contNoArr[i] === secondItem.data("cont")){
					totalInCont += parseInt(secondItem.text().replaceAll(",", "").replaceAll("₩", ""));
				}	
			}
			
			for(let t = 0; t < contOutAmount.length; t++){
				let secondItem = $(contOutAmount[t]);
				
				if(contNoArr[i] === secondItem.data("cont")){
					totalOutCont += parseInt(secondItem.text().replaceAll(",", "").replaceAll("₩", ""));
				}	
			}
			
			$("#totalInCont[data-cont=\"" + contNoArr[i] + "\"]").text("₩" + totalInCont.toLocaleString("en-US"));
			$("#totalOutCont[data-cont=\"" + contNoArr[i] + "\"]").text("₩" + totalOutCont.toLocaleString("en-US"));
		}
		
		for(let i = 0; i < contInAmount.length; i++){
			totalIn += $(contInAmount[i]).text().replaceAll(",", "").replaceAll("₩", "");
		}
		
		for(let i = 0; i < contOutAmount.length; i++){
			totalOut += $(contOutAmount[i]).text().replaceAll(",", "").replaceAll("₩", "");
		}
		
		if($("#contNo").val() === undefined){
    	    $(".sopp_contents").show();
    	    $(".cont_contents").show();
    	    $("trSopp").show();
    	    $(".contUpBtn").attr("disabled", true);
    	    $(".contDelBtn").attr("disabled", true);
        }else{
        	$(".sopp_contents").hide();
        	$(".cont_contents").hide();
    	    $("trSopp").hide();
    	    $("table tbody [class^=\"trCont_\"]").show();
    	    $(".contUpBtn").text("수정");
    	    $(".contDelBtn").text("삭제");
    	    $(".contUpBtn").attr("disabled", false);
    	    $(".contDelBtn").attr("disabled", false);
        }
		
		/* contTitleTr.before("<tr class=\"clickTr\" style=\"border: 0; height: 20px;\"></tr>"); */
	}
	
	function fn_data01delete1() {
		var pathname = $(location).attr('pathname');
		var msg = "선택한 건을 삭제하시겠습니까?";

		if( confirm(msg) ){
			var deleteCheckBox = $("#inoutlist tbody tr td .deleteCheckBox");
			var checkLength = $("#inoutlist tbody tr td .deleteCheckBox:checked").length;

			if(checkLength > 0){
				for(let i = 0; i < deleteCheckBox.length; i++){
					var item = $(deleteCheckBox[i]);
	
					if(item.is(":checked")){
						var vatSerial = item.parents("tr").find(".vatSerialTd").text();
						var updateData = {};
						updateData.vatSerial = vatSerial;
						updateData.compNo = "${sessionScope.compNo}";
	
						if(vatSerial !== "" && vatSerial !== null){
							$.ajax({
								url: "${path}/acc/vatContUpdate.do",
								method: "post",
								data: updateData,
								dataType: "json",
							});
						}
	
						$.ajax({
							url: "${path}/sopp/deletedata01.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
							data: {
								"soppdataNo" : item.attr("data-id"),
								"inoutNo": item.attr("data-inoutno")
							}, // HTTP 요청과 함께 서버로 보낼 데이터
							method: "POST", // HTTP 요청 메소드(GET, POST 등)
						})
						.fail(function(xhr, status, errorThrown) {
							alert("통신 실패");
						});
					}
				}
	
				alert("삭제 성공");
				localStorage.setItem('lastTab', "#tab02");
				/* location.href="${path}/cont/detail/"+ $("#soppNo").val() +"/"+ $("#contNo").val(); */
				location.href = pathname;
			}else{
				alert("체크된 항목이 없습니다.");
				return false;
			}
		}
	}
	
	function deleteAllCheck(e){
		let deleteCheckBox;
		let sopp_contents = $(".sopp_contents");
		let trSopp = $(".trSopp");
		let trCont = $("[class^='trCont_']");
		
		if(sopp_contents.length > 0) {
			if(trSopp.css("display") !== "none"){
				deleteCheckBox = trSopp.find("td .deleteCheckBox");
				
				for(let i = 0; i < deleteCheckBox.length; i++){
					let item = $(deleteCheckBox[i]);
					
					if($(e).is(":checked")) item.prop("checked", true);
					else item.prop("checked", false);
				}
			}
		} else {
			for(let i = 0; i < trCont.length; i++){
				let item = $(trCont[i]);
				
				if(item.css("display") !== "none"){
					deleteCheckBox = item.find("td .deleteCheckBox");
					
					for(let t = 0; t < deleteCheckBox.length; t++){
						let secondItem = $(deleteCheckBox[t]);
						
						if(!secondItem.attr("disabled")){
							if($(e).is(":checked")) secondItem.prop("checked", true);
							else secondItem.prop("checked", false);
						}
					}
				}
			}
		}
	}
</script>