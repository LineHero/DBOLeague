<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경 폼</title>
<script src="/js/jquery-3.6.4.min.js"></script>
</head>
<body>
<div>
	<span>현재 비밀번호 : </span>
	<input id="curPw" type="password" /><br/>
	<span>새 비밀번호 : </span>
	<input id="newPw1" type="password" /><br/>
	<span>새 비밀번호 확인 : </span>
	<input id="newPw2" type="password" /><br/>
	<button id="change">변경</button>
	<button id="cancel">취소</button>
</div>
<script>
	$("#change").click(function() {
		if ($("#curPw").val() === "") alert("현재 비밀번호를 입력해주세요.");
		else if ($("#newPw1").val() === "") alert("새 비밀번호를 입력해주세요.");
		else if ($("#newPw2").val() === "") alert("새 비밀번호 확인을 입력해주세요.");
		else {
			$.ajax({
				url: "/updatePw",
				data: {
					"curPw": $("#curPw").val(),
					"newPw1": $("#newPw1").val(),
					"newPw2": $("#newPw2").val(),
				},
				dataType: "json",
				method: "post",
				success: function(response) {
					if (response.updateResult === -1) {
						alert("세션이 만료되어 로그아웃 되었습니다.");
						self.close();
					}
					else if (response.updateResult === -2) alert("현재 비밀번호가 맞지 않습니다.");
					else if (response.updateResult === -3) alert("비밀번호 확인이 같지 않습니다.");
					else if (response.updateResult === -4) alert("현재 비밀번호와 같은 비밀번호로는 변경할 수 없습니다.")
					else if (response.updateResult === 1) {
						alert("정상적으로 비밀번호가 변경되었습니다.");
						self.close();
					}
					else {
						alert("알 수 없는 이유로 비밀번호가 변경되지 않았습니다.");
						self.close();
					}
				},
				error: function(request,error) {
		    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
			}); //ajax
		}
	}); //click
	$("#cancel").click(function() {
		alert("비밀번호 변경이 취소되었습니다.");
		self.close();
	}); //click
</script>
</body>
</html>