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
            <col width="25%" />
            <col width="25%" />
            <col width="25%" />
            <col width="25%" />
        </colgroup>
        <thead>
        <tr>
            <th class="text-center">근태종류</th>
            <th class="text-center">시작일</th>
            <th class="text-center">종료일</th>
            <th class="text-center">삭제</th>
        </tr>
        </thead>
        <tbody>
            <tr class="item1">
                <td><select class="form-control form-control-sm" id="hrType" style="min-width: 80px;">
                    <option value="">선택</option>
                    <option value="1">월차</option>
                    <option value="2">연차</option>
                    <option value="3">연장근무</option>
                    <option value="4">휴일근무</option>
                    <option value="5">경조휴가</option>
                </select></td>
                <td><input type="date" class="form-control form-control-sm" id="hrFrom" style="min-width: 80px;" /><input type="time" class="form-control form-control-sm" id="hrFromTm" style="min-width: 80px;" /></td>
                <td><input type="date" class="form-control form-control-sm" id="hrTo" style="min-width: 80px;" /><input type="time" class="form-control form-control-sm" id="hrToTm" style="min-width: 80px;" /></td>
                <td>
                    <button id="HRAddbtn" class="btn btn-success btn-sm" onClick="dataSave();">추가</button>
                </td>
            </tr>
            <tr>
            	<td colspan="4">
	            	<textarea rows="5" id="hrDesc" class="form-control form-control-sm" placeholder="추가기재사항을 입력해주세요."></textarea>
            	</td>
            </tr>
        </tbody>
    </table>
</form>

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
    	var temp = {};
       var qutylist = $("#qutylist tbody");
    	var attType = $("#hrType").val();
       var attTypeN = $("#hrType option:selected").text();
    	var attStart = $("#hrFrom").val() +"T"+ $("#hrFromTm").val() ;
        var attEnd = $("#hrTo").val() + "T"+$("#hrToTm").val();
    	var attDesc = tinyMCE.get("hrDesc").getContent();
        if (attDesc ==-""){
            alert("신청내용을 기입해 주십시오.");
            $("#hrDesc").focus();
            return;
        }
		temp.compNo = $("#compNo").val();
    	temp.userNo = $("#userNo").val();
    	temp.attType = attType;
    	temp.attStart = attStart;
    	temp.attEnd = attEnd;
    	temp.attDesc = attDesc;
    	dataArray.push(temp);
        $("#hrType").val("");
        $("#hrFrom").val("");
        $("#hrTo").val("");
        $("#hrDesc").val("");
        qutylist.append("<tr><td id='hrType1' style='text-align:center;'><input type='hidden' id='hrTypeN' value ='"+attType+"'/> "+attTypeN+"</td><td id='sttFromN' style='text-align:center;'>"+attStart+"</td><td id='attEndN' style='text-align: center'>"+attEnd+"</td><td id='attDescN' style='text-align: center'>"+attDesc+"</td><td><button class='btn btn-sm btn-danger' data-index="+dataIndex+" id='dataDelBtn'>삭제</button></td></tr>");
    	console.log(dataArray);
        dataIndex++;
    }

    function fn_AttInsert() {
    	var dataHr = {};
    	
    	if($("#hrTypeN").val() === ""){
    		alert("신청 내용이 없습니다.");
    		$("#hrType").focus();
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

    $(document).ready(function(){
        var d= new Date();
        var today = new Date(d.getTime() - (d.getTimezoneOffset() * 60000)).toISOString();
        $("#hrFrom").val(today.substr(0,10));
        $("#hrTo").val(today.substr(0,10));
        $("#hrFromTm").val("09:00");
        $("#hrToTm").val("18:00");
    });
</script>
