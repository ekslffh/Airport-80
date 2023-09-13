<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<security:authentication property="principal.realUser" var="authMember" />



<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">    
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					     <h5 class="card-tit">유지보수 일정등록</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">일정현황</a></li>
					        <li class="breadcrumb-item"><a href="#">유지보수 일정/현황</a></li>
					        <li class="breadcrumb-item active">유지보수 일정등록</li>
					      </ol>
					    </nav>
					 </div>
<!-- 유지보수 일정 등록 -->
<div class="card">
	<div class="card-header" style="padding: 9px 15px 9px;">유지보수 일정
		등록</div>
	<div class="card-body" style="height: 420px;">
		<form:form method="post" modelAttribute="schedule" id="insertForm">
			<form:hidden path="rsEmpNo" value="${authMember.empNo }" />
			<form:hidden path="rsId" />
			<form:hidden path="rsCrtTs" />
			<form:hidden path="rrStts"/>
			<table class="table table-bordered"
				style="margin-top: 10px; margin-bottom: 10px;">
				<tr>
					<th class="table-light">제목</th>
					<td colspan="3"><form:input path="rsTitle"
							class="form-control" type="text" id="rsTitle"/> <form:errors path="rsTitle"
							class="error" /></td>
				</tr>
				<tr>
					<th class="table-light">유지보수접수 내역</th>
					<td ><form:input path="rrId"
							class="form-control" type="text"
							style="width: 300px; display: inline-block;" id="rsIdInput" />
						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#modalDialogScrollable"
							style="border: 1px solid #e0e0e0; border-radius: 3px; padding: 5px 9px; background: #e8eeff;">
							<i class="bi bi-search"></i>
						</button></td>
						
					<th class="table-light">위치</th>
					<td><select class="form-select" type="text" id="floorSelect"
						style="width: 120px; display: inline-block;">

							<option value="" label="층수선택" />
							<c:set var="previousFloor" value="" />
							<c:forEach items="${zoneList}" var="zone">
								<c:if test="${zone.zoneFloor != previousFloor}">
									<option value="${zone.zoneFloor}" label="${zone.zoneFloor}" />
									<c:set var="previousFloor" value="${zone.zoneFloor}" />
								</c:if>
							</c:forEach>
					</select><form:select class="form-select" type="text" path="rsZone"
							id="zoneSelect" style="width: 120px; display: inline-block;">
							<form:option value="" label="구역선택" />
							<c:forEach items="${zoneList }" var="zone">
								<form:option value="${zone.zoneCd }" class="${zone.zoneFloor}"
									label="${zone.zoneCtgr }" />
							</c:forEach>
						</form:select> <form:errors path="rsZone" class="error" /></td>
				</tr>
				<tr>
					<th class="table-light">카테고리</th>
					<td><form:select path="rsDiv" class="form-select" id="rsDiv">
							<form:option value="" label="카테고리선택" />
							<form:option value="EWC" label="전기 유지보수" />
							<form:option value="WSC" label="수도 유지보수" />
							<form:option value="EEM" label="전자장비 유지보수" />
							<form:option value="IDC" label="인테리어 유지보수" />
							<form:option value="HEM" label="중장비 유지보수" />
						</form:select></td>
					<th class="table-light">주체</th>
					<td><form:select path="rsType" class="form-select" id="rsType">
							<form:option value="" label="주체선택" />
							<form:option value="REF" label="유지보수팀" />
							<form:option value="OS" label="외주" />
						</form:select></td>
				</tr>
				<tr>
					<th class="table-light">시작일시</th>
					<td><form:input class="form-control" type="datetime-local"
							path="rsStartTs" id="rrStartTsInput" /> <form:errors
							class="error" path="rsStartTs" /></td>
					<th class="table-light">예상종료일시</th>
					<td><form:input class="form-control" type="datetime-local"
							path="rsEndTs" id="rrEndTsInput" /> <form:errors
							class="error" path="rsEndTs" /></td>
				<tr>
					<th class="table-light">내용</th>
					<td colspan="3"><form:textarea class="form-control"
							path="rsContent" id="rsCtInput" /> <form:errors path="rsContent"
							class="error" /></td>
				</tr>
			</table>
			<button type="submit" class="btn btn-primary btn-sm"
				style="font-size: 15px; padding: 4px 10px;">등록</button>
			<button class="btn btn-dark" id="test" type="button"><i class="bi bi-folder"></i></button>	
		</form:form>
	</div>
</div>
<c:url value="/infra/modalRncReqList.do" var="viewURL" />
<!-- 유지보수접수내역 모달 -->
<div class="modal fade" id="modalDialogScrollable" tabindex="-1"
	data-url="${viewURL}">
	<div class="modal-dialog modal-dialog-scrollable" style="margin-right: 895px;">
		<div class="modal-content" style="width: 1000px; height: 640px; margin-right: 400px;">
			<div class="modal-header">
				<h5 class="modal-title">유지보수접수 내역</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">...</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

				</div>
			</div>
		</div>
	</div>
</section>
<script>
const floorSelect = document.getElementById("floorSelect");
const zoneSelect = document.getElementById("zoneSelect");


$(document).ready(function() {
    // 폼 제출 시 실행되는 함수
    $("#insertForm").submit(function(event) {
        // 폼 제출을 중지하여 서버로 데이터를 보내지 않습니다.
        event.preventDefault();

        // 각 입력 필드에서 값 가져오기
        let rsTitle = $("#rsTitle").val();
        let rsIdInput = $("#rsIdInput").val();
        let floorSelect = $("#floorSelect").val();
        let rsDiv = $("#rsDiv").val();
        let rsType = $("#rsType").val();
        let rrStartTsInput = $("#rrStartTsInput").val();
        let rrEndTsInput = $("#rrEndTsInput").val();
        let rsCtInput = $("#rsCtInput").val();

        // 값이 비어 있는 경우 경고 메시지 표시
        if (
            rsTitle === "" ||
            rsIdInput === "" ||
            floorSelect === "" ||
            rsDiv === "" ||
            rsType === "" ||
            rrStartTsInput === "" ||
            rrEndTsInput === "" ||
            rsCtInput === ""
        ) {
          	alert("일정 등록에 실패했습니다")
        	        } else {
        	        	Swal.fire({
        	                icon: 'success',
        	                text: '등록에 성공했습니다.'
        	            })
            // 모든 필수 입력 필드가 값으로 채워져 있다면 서버로 데이터를 보내도록 폼을 제출합니다.
            this.submit();
        }
    });
});




floorSelect.addEventListener("change", function() {
    const selectedFloor = floorSelect.value;

    // 기존 구역 옵션들 숨김
    for (const option of zoneSelect.options) {
        option.style.display = "none";
    }

    // 선택된 층에 해당하는 구역 옵션들 표시
    for (const option of zoneSelect.options) {
        if (option.classList.contains(selectedFloor)) {
            option.style.display = "block";
        }
    }
});

zoneSelect.addEventListener("change", function() {
    const selectedZoneCode = zoneSelect.value;
    // 선택된 구역 코드를 이용하여 다른 처리 수행 (예: 값 저장 등)
});

//유지보수접수 내역 모달창 상세조회 
$(modalDialogScrollable).on("show.bs.modal", function(event){
	let $modalBody = $(this).find(".modal-body");
	let viewURL = this.dataset['url'];
		let settings = {
				url : viewURL,
				dataType : "html",
				success : function(resp){
					$modalBody.html(resp);
				}
		}
		$.ajax(settings);
}).on("hidden.bs.modal", function(event){
	let $modalBody = $(this).find(".modal-body");
	if ($modalBody.find('.modal-content-to-preserve').length === 0){
	$modalBody.empty();
	}
});

// 모달창에서 접수내역 선택시 해당값 input창에 들어감 
$(".modal-body").on("click", "tr", function(event) {
    let clickedRow = $(this); // 클릭된 행
    let rsId = clickedRow.find(".rncItem[data-rrid]").data('rrid');
    let rsZone = clickedRow.find(".rncItem[data-rrloc]").data('rrloc').split(',');
    
    let rsFloor = rsZone[0];
    let rsCd = rsZone[1];
    
    
    
    let rsContent = clickedRow.find(".rncItem[data-rrcontent]").data('rrcontent');
    let rsTs = clickedRow.find(".rncItem[data-rrts]").data('rrts');
    let rsEmpNo = clickedRow.find(".rncItem[data-rracc]").data('rracc');
    
//     console.log("시간:",srTs);
//     let truncatedSrTs = srTs.replace("T"," ").slice(0, 16); 
//     console.log("자른시간:",truncatedSrTs);
    console.log(rsId);
    console.log(rsFloor);
    console.log(rsCd);
    console.log(rsZone);
    console.log(rsContent);
    console.log(rsTs);
    console.log(rsEmpNo);
    
    // 각 input 요소에 값을 설정
    $('#rsIdInput').val(rsId);
    $('#floorSelect').val(rsFloor);
    $('#zoneSelect').val(rsCd);
    $('#rsCtInput').val(rsContent);
//     $('#srCtInput').val(rsTs);
//     $('#srPrcCtInput').val(srPrcCt);
    
    // 모달 닫기
     $('#modalDialogScrollable').modal('hide');
});

// 시연용 등록버튼 값 넣기 
// $("#test").on("click", function(event){
//     let srCa = $("#srCa");
//     let floorSelect = $("#floorSelect");
//     let srLoc = $("#zoneSelect");
//     let srContent = $("#srContent");
    
//     let srCaValue = 'CRO';
//     let floorValue = '1';
//     let srLocValue = '1F2';
//     let cntValue = ''; // 값을 변수에 할당하고
    
//     // srContent 요소에 값을 설정
//     srCa.val(srCaValue);
//     floorSelect.val(floorValue);
//     srLoc.val(srLocValue);
//     srContent.val(cntValue);
// });
// //유지보수일정 등록
// let $insertForm = $(insertForm).on("submit", function(event){
// 	event.preventDefault();
// 	let settings = {
// 			url:insertForm.action,
// 			method:insertForm.method,
// 			data: JSON.stringify($insertForm.serializeObject()),
// 			contentType:"application/json;charset=UTF-8",
// 			dataType:"json"
// 	};
// 	$.ajax(settings)
// 		.done(resp=>{
// 			if(resp){
// 				console.log("유지보수일정 등록 결과값",resp);
// // 				fn_ListBody(resp);
// 				insertForm.reset();
// 				 window.location.href = "/infra/ScheduleRetrieve.do";
// 			}else{
// 				alert("유지보수일정 등록 실패");
// 			}
// 		});
// });

</script>