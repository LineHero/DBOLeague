<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임 변경 폼</title>
<script src="/js/jquery-3.6.4.min.js"></script>
</head>
<body>
<div>
	<span>새 닉네임을 입력해주세요.</span><br/>
	<input id="newNick" type="text" /><br/>
	<button id="change">변경</button>
	<button id="cancel">취소</button>
</div>
<script>
	$("#change").click(function() {
		$.ajax({
			url: "/updateNick",
			data: {
				"newNick": $("#newNick").val(),
			},
			dataType: "json",
			method: "post",
			success: function(response) {
				if (response.updateResult === -1) alert("세션이 만료되어 로그아웃 되었습니다.");
				else if (response.updateResult === 1) alert("정상적으로 닉네임이 변경되었습니다.");
				else alert("알 수 없는 이유로 닉네임이 변경되지 않았습니다.");
				opener.location.reload();
				self.close();
			},
			error: function(request,error) {
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
		}); //ajax
	}); //click
	$("#cancel").click(function() {
		alert("닉네임 변경이 취소되었습니다.");
		self.close();
	}); //click
</script>
</body>
</html>