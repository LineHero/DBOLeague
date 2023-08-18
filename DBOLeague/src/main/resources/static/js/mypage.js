/**
 * 마이페이지 js
 */

// 메일 화면으로 클릭
$("#title").click(function() {
	location.href = "/maintest";
}); //click

// 마이페이지 클릭
$("#logout-btn").click(function() {
	location.href = "/mypage";
}); //click
// 로그아웃 클릭
$("#logout-btn").click(function() {
	location.href = "/logout";
}); //click

// 닉네임 변경 버튼 클릭
$("#change-nick-btn").click(function() {
	window.open("/changeNick", "", "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=260, height=120, top=0,left=0");
}); //click

// 비밀번호 변경 버튼 클릭
$("#change-pw-btn").click(function() {
	window.open("/changePw", "", "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=260, height=120, top=0,left=0");
}); //click

// 꾸미기 아이템 버튼 클릭
$("#decorate-store").click(function() {
	console.log("꾸미기 아이템");
}); //click

// 회원 탈퇴 버튼 클릭
$("#delete-member-btn").click(function() {
	let isDelete = confirm("회원의 모든 정보가 삭제됩니다. 그래도 탈퇴하시겠습니까?");
	if (isDelete) {
		$.ajax({
			url: "/deleteMember",
			dataType: "json",
			method: "post",
			success: function(response) {
				if (response.deleteResult === -1) alert("세션이 만료되어 로그아웃 되었습니다.");
				else if (response.deleteResult === 1) {
					alert("정상적으로 탈퇴 처리되었습니다.");
					location.href = "/maintest";
				} else alert("알 수 없는 이유로 탈퇴가 처리되지 않았습니다.");
			},
			error: function(request,error) {
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
		}); //ajax
	} //if
}); //click

// 최근 전적 행에 마우스 올릴 때
let prevRecord = null;
let recordIdx = null;
$("#latest-result tr").mouseover(function(e) {
	if (prevRecord === e.currentTarget) return;
	$("#record-detail").css("display", "inline");
	prevRecord = e.currentTarget;
	recordIdx = e.currentTarget.id;
	$.ajax({
			url: "/showRecordDetail",
			data: {
				"detailIdx": recordIdx,
			},
			dataType: "json",
			method: "post",
			success: function(response) {
				for (let i = 0; i < response.singleDetails.length; i++) {
					$("#record-detail").css({
						"top": e.screenY - 35,
						"left": e.screenX,
					}); //css
					$("#record-detail tbody").append('<tr></tr>');
					if ($("#record-detail tbody tr").eq(i + 1).children().length === 0) {
						$("#record-detail tbody tr").eq(i + 1).append(`
							<td>${response.singleDetails[i].innings_count}</td>
							<td>5314</td>
							<td>
								<span style="color: yellow">${response.singleDetails[i].innings_strike}S <span>
								<span style="color: green">${response.singleDetails[i].innings_ball}B <span>
							</td>
						`);
					}
				}
			}, 
			error: function(request,error) {
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
		}); //ajax
}); //mouseover
// 최근 전적 행에서 마우스 내릴 때
$("#latest-result tr").mouseout(function() {
	$("#record-detail").css("display", "none");
	prevRecord = null;
	recordIdx = null;
	$("#record-detail tbody tr").each(function(index, item) {
		if (index !== 0) {
			$(item).remove();
		}
	});
}); //mouseover
$("#latest-result tr").first().off("mouseover");
$("#latest-result tr").first().off("mouseout");
