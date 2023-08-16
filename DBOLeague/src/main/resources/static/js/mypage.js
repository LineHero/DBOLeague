/**
 * 마이페이지 js
 */

// 로고 클릭
$("#title span").click(function() {
	console.log("DBO LEAGUE");
}); //click

// 로그아웃 클릭
$("#logout-btn").click(function() {
	console.log("로그아웃");
}); //click

// 상단 버튼들(4개) 클릭
$("#change-nick-btn").click(function() {
	console.log("닉네임 변경");
}); //click
$("#change-pw-btn").click(function() {
	console.log("비밀번호 변경");
}); //click
$("#anything-btn").click(function() {
	console.log("뭔가 추가할 거");
}); //click
$("#delete-member-btn").click(function() {
	console.log("회원탈퇴");
}); //click

// 최근 전적 행에 마우스 올릴 때
$("#latest-result tbody tr").mouseover(function() {
	console.log("최근 전적");
}); //mouseover