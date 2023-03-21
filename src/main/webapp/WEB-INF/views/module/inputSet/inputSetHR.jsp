<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<form name="form2" method="post" onsubmit="return false;">
    <table class="table table-sm bst02">
        <tbody>
        <tr>
            <th scope="row">근태일정</th>
        </tr>
        </tbody>
    </table>
    <table class="table table-sm bst02" id="addquty">
        <colgroup>
            <col width="10%" />
            <col width="45%" />
            <col width="40%" />
            <col width="5%" />
        </colgroup>
        <thead>
        <tr>
            <th class="text-center">근태종류</th>
            <th class="text-center">시작일</th>
            <th class="text-center">종료일</th>
            <th class="text-center">추가</th>
        </tr>
        </thead>
        <tbody>
            <tr class="item1">
                <td><select class="form-control form-control-sm" id="hrType" style="min-width: 80px;">
                    <option value="">선택</option>
                    <option value="1" <c:if test="${list.attType eq 1}">selected</c:if>>월차</option>
                    <option value="2" <c:if test="${list.attType eq 2}">selected</c:if>>연차</option>
                    <option value="3" <c:if test="${list.attType eq 3}">selected</c:if>>연장근무</option>
                    <option value="4" <c:if test="${list.attType eq 4}">selected</c:if>>휴일근무</option>
                    <option value="5" <c:if test="${list.attType eq 5}">selected</c:if>>경조휴가</option>
                </select></td>
                <td class="text-center">
                	<div style="width:100%">
                		<div style="float:left; width:49%;" >
		                	<input type="date" max="9999-12-30" class="form-control form-control-sm" id="hrFrom"  />
                		</div>
                		<div style="float:left; width:49%;">
		                	<input type="time" class="form-control form-control-sm" id="hrFromTm" />
                		</div>
                	</div>
                </td>
                <td class="text-center">
                	<div style="width:100%">
                		<div style="float:left; width:49%;" >
		                	<input type="date" max="9999-12-31" class="form-control form-control-sm" id="hrTo" />
                		</div>
                		<div style="float:left; width:49%;">
		                	<input type="time" class="form-control form-control-sm" id="hrToTm"/>
                		</div>
                	</div>
                </td>
                <td class="text-center">
                    <button id="HRAddbtn" class="btn btn-success btn-sm" onClick="dataSave();">추가</button>
                </td>
            </tr>
            <tr>
            	<td colspan="4">
	            	<textarea rows="5" id="hrDesc" class="form-control form-control-sm" placeholder="추가기재사항을 입력해주세요.">${list.attDesc}</textarea>
            	</td>
            </tr>
        </tbody>
    </table>
</form>
<%-- <tbody>
	    	<tr>
	            <td class="text-center" id='hrType'><c:if test="${list.attType eq 1}">월차</c:if><c:if test="${list.attType eq 2}">연차</c:if><c:if test="${list.attType eq 3}">연장근무</c:if><c:if test="${list.attType eq 4}">휴일근무</c:if><c:if test="${list.attType eq 5}">경조휴가</c:if></td>
                <td class="text-center" id='hrUser'>${list.userName}</td>
                <td class="text-center" id='hrStart'>${list.attStart}</td>
	            <td class="text-center" id='hrEnd'>${list.attEnd}</td>
	            <td class="text-center" id='hrDesc'>${list.attDesc}</td>
	    	</tr>
    </tbody>
</table>
<input type="hidden" id="attendId" value="${list.attendId}"> --%>
<script>
    var dataArray = [];
    var dataIndex = 0;

    function checkDate(){
        var dateA = new Date($("#hrFrom").val());
        var dateB = new Date($("#hrTo").val());
        if (dateB < dateA){
            alert("종료일이 시작일 이전입니다.");
        }
    }

   function dataSave(){
	   	var now = new Date();
    	var temp = {};
       var qutylist = $("#qutylist tbody");
    	var attType = $("#hrType").val();
       var attTypeN = $("#hrType option:selected").text();
    	var attStart = $("#hrFrom").val() +"T"+ $("#hrFromTm").val() ;
        var attEnd = $("#hrTo").val() + "T"+$("#hrToTm").val();
    	var attDesc = tinyMCE.get("hrDesc").getContent();
        
    	now = now.toISOString().slice(0, 10);
    	
    	if (attDesc == ""){
            alert("신청내용을 기입해 주십시오.");
            $("#hrDesc").focus();
            return;
        }else if($("#hrType").val() === ""){
        	alert("근태종류를 선택해주십시오.");
        	return false;
        }else if($("#hrFrom").val() === "" || $("#hrTo").val() === ""){
        	alert("시작일 및 종료일을 선택해주십시오.");
        	return false;
        }
    	
		temp.compNo = $("#compNo").val();
    	temp.userNo = $("#userNo").val();
    	temp.attType = attType;
    	temp.attStart = attStart;
    	temp.attEnd = attEnd;
    	temp.attDesc = attDesc;
    	dataArray.push(temp);
        $("#hrType").val("");
        $("#hrFrom").val(now);
        $("#hrTo").val(now);
        tinyMCE.get("hrDesc").setContent("");
        qutylist.append("<tr><td id='hrType1' style='text-align:center;'><input type='hidden' id='hrTypeN' value ='"+attType+"'/> "+attTypeN+"</td><td id='sttFromN' style='text-align:center;'>"+attStart+"</td><td id='attEndN' style='text-align: center'>"+attEnd+"</td><td id='attDescN' style='text-align: center; vertical-align: middle;'>"+attDesc+"</td><td style='text-align:center;'><button class='btn btn-sm btn-danger' data-index="+dataIndex+" id='dataDelBtn'>삭제</button></td></tr>");
    	console.log(dataArray);
        dataIndex++;
    }

    function fn_AttInsert() {
    	var dataHr = {};
    	
    	if($("#hrTypeN").val() === ""){
    		alert("신청 내용이 없습니다.");
    		$("#hrType").focus();
    	}else if(dataArray.length == 0){
    		alert("데이터를 추가해주십시오.");
    		return false;
    	}else{
    		dataHr.compNo = $("#compNo").val();
    		dataHr.userNo = $("#userNo").val();
			for(var i = 0; i < dataArray.length; i++){
				var JsonArray = JSON.stringify(dataArray[i]);
				console.log(JSON.parse(JsonArray));
  				$.ajax({
  					url: "${path}/gw/attinsert.do",
  					method: "post",
  					data: JSON.parse(JsonArray),
  					dataType: "json"
  				});
 			}
 			alert("등록되었습니다.");
 			location.href = "${path}/gw/attwrite.do";
    	}
    }

    $("#hrFrom,#hrTo").change(function(){
        checkDate();
    });

    $(document).on("click", "#dataDelBtn", function(){
		dataArray.splice($(this).attr("data-index"), 1);
		$("#qutylist tbody tr").eq($(this).attr("data-index")).remove();
	
		$("#qutylist tbody tr").find("#dataDelBtn").each(function(index, item){
			$(this).attr("data-index", index);
			dataIndex = index+1;
		});
	});
    
    $(document).ready(function(){
    	let detailList = "${list}";
    	let attStart = "${list.attStart}";
    	let attEnd = "${list.attEnd}";
    	let attStatus = "${list.attStatus}";
    	let addquty = $("#addquty");
    	let date, d, today;
    	
    	if(detailList !== ""){
    		date = new Date(attStart);
    		$("#hrFrom").val(date.getFullYear() + "-" + (date.getMonth()+1).toString().padStart(2, "0") + "-" + date.getDate().toString().padStart(2, "0"));
	        $("#hrFromTm").val(date.getHours().toString().padStart(2, "0") + ":" + date.getMinutes().toString().padStart(2, "0"));
    		
    		date = new Date(attEnd);
    		$("#hrTo").val(date.getFullYear() + "-" + (date.getMonth()+1).toString().padStart(2, "0") + "-" + date.getDate().toString().padStart(2, "0"));
	        $("#hrToTm").val(date.getHours().toString().padStart(2, "0") + ":" + date.getMinutes().toString().padStart(2, "0"));

	        setTimeout(() => {
	    		dataSave();
	    		
		    	if(attStatus == 5){
		    		$("#HRAddbtn").attr("disabled", true);
		    		$("#dataDelBtn").attr("disabled", true);
		    	}else{
		    		$("#HRAddbtn").attr("disabled", false);
		    		$("#dataDelBtn").attr("disabled", false);
		    	}
	    	}, 600);
	        
    	}else {
	    	d = new Date();
    		today = new Date(d.getTime() - (d.getTimezoneOffset() * 60000)).toISOString();
	        $("#hrFrom").val(today.substr(0,10));
	        $("#hrFromTm").val("09:00");
    		
    		d = new Date();
    		today = new Date(d.getTime() - (d.getTimezoneOffset() * 60000)).toISOString();
	        $("#hrTo").val(today.substr(0,10));
	        $("#hrToTm").val("18:00");
    	}
    	
    });
</script>
