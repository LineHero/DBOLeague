<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임 변경 폼</title>
<script src="/js/jquery-3.6.4.min.js"></script>
<style>
	@font-face {
		font-family: 'NeoDGM';
		src: url('/fonts/neodgm.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}
	* {
	  margin: 0px;
	  padding: 0px;
	  box-sizing: border-box;
	  font-family: 'NeoDGM';
	}
	html, body {
		height: 100%;
		margin: 0px;
		padding: 0px;
		background-color: black;
		color: white;
	}
	html {
		overflow-x:hidden; 
		overflow-y:hidden;
	}
	header {
		padding-left: 30px;
		height: 60px;
		line-height: 60px;
		background-color: #B9B9B9;
		color: black;
		margin-bottom: 20px;
		font-size: 19px;
	}
	main {
		width: 100%;
		height: 100%;
		display: flex;
		align-items: center;
	}
	#form {
		width: 100%;
		height: 100%;
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	#form > div {
		margin-bottom: 7px;
	}
	#form, button, input {
		font-size: 17px;
	}
	input {
		height: 18px;
	}
	button {
		width: 50px;
		height: 30px;
	}
	.btns {
	  background: #c1ec42;
	  border: 0px;
	  position: relative;
	  box-shadow: 
	    inset -2px 2px 1px 1px #d5ee99,
	    inset -2px -2px 1px 1px #537726,
	    inset 2px 0px 1px 1px #7abc69
	}
	.btns:active {
	  top: 2px;
	}
	.btns::after {
	  content: '';
	  background: #000;
	  position: absolute;
	  left: -2%;
	  top: 0;
	  width: 104%;
	  height: 100%;
	  z-index: -1
	}
	.btns::before {
	  content: '';
	  background: #000;
	  position: absolute;
	  left: 0;
	  top: -5%;
	  width: 100%;
	  height: 110%;
	  z-index: -2
	}
	.btns:focus {
		border: none;
		outline: none;
	}
	input:focus {
		outline: none;
		height: 18px;
	}
</style>
</head>
<body>
<header>
	닉네임 변경
</header>
<main>
	<div id="form">
		<div>새 닉네임을 입력해주세요.</div>
		<div>
			<input id="newNick" type="text"/>
		</div>
		<div id="btns">
			<button id="change" class="btns">변경</button>
			<button id="cancel" class="btns">취소</button>
		</div>
	</div>
</main>
<script>
	$("#change").click(function() {
		if ($("#newNick").val() === "") {
			alert("변경할 닉네임을 입력해주세요.");
			$("#newNick").focus();
		} 
		else if($("#newNick").val().length > 30) {
			alert("닉네임이 너무 길어 변경할 수 없습니다.");
			$("#newNick").focus();
		} 
		else {
			$.ajax({
				url: "/updateNick",
				data: {
					"newNick": $("#newNick").val(),
				},
				dataType: "json",
				method: "post",
				success: function(response) {
					if (response.updateResult === -1) {
						alert("세션이 만료되어 로그아웃 되었습니다.");
						location.href = "/maintest";
						self.close();
					}
					else if (response.updateReuslt === -2) {
						alert("현재 닉네임과 같은 닉네임으로는 변경할 수 없습니다.");
					}
					else if (response.updateResult === 1) {
						alert("정상적으로 닉네임이 변경되었습니다.");
						opener.location.reload();
						self.close();
					}
					else {
						alert("알 수 없는 이유로 닉네임이 변경되지 않았습니다. 다시 시도해주세요.");
						self.close();
					}
				},
				error: function(request,error) {
		    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
			}); //ajax
		} //else
	}); //click
	$("#cancel").click(function() {
		self.close();
	}); //click
</script>
</body>
</html>