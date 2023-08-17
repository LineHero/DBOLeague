<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="css/signIn.css">
</head>
<script src="js/jquery-3.6.4.min.js"></script>
<script>
$(document).ready(function() {
	var userlogin = '<%=session.getAttribute("userlogin")%>';
	if (userlogin != "null") {
		window.history.forward();
	}
	
	const loginForm = document.getElementById("login_form");	
	const loginBtn = document.getElementById("login_submit_btn");
	const loginId = document.getElementById("member_id");
	const loginPassword= document.getElementById("member_pw");
	
	$("#login_submit_btn").on('click', function(event){
		 	event.preventDefault();

			//아이디, 비번에 빈칸 입력시 경고창. + 둘 다 입력시 submit
		    if (loginId.value.trim() === "" || loginPassword.value.trim() === "") {
		      alert("빈칸을 입력해주세요"); 
		    } else {
		      loginForm.submit(); 
		    }
		});

	  //엔터로 다음칸 가기 : (순서) 아이디-> pw-> 로그인버튼
	  loginId.addEventListener("keydown", function(event) {
	    if (event.keyCode === 13) {
	      event.preventDefault(); 
	      loginPassword.focus();
	    }
	  });

	  loginPassword.addEventListener("keydown", function(event) {
	    if (event.keyCode === 13) {
	      event.preventDefault(); 
	      loginBtn.click(); 
	    }
	    });
});
</script>
<body>
		<div class="wrapper">
			<div class="logo">
				<a href="/main">DBO League</a>
			</div>
			<form id="login_form" action="/login" method="post">
			<div class="login">
				<table>
					<tbody>
						<tr>
							<th>아이디</th>
							<td><input id="member_id" name="member_id" type="text"></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input id="member_pw" name="member_pw" autocomplete="off" type="password"></td>
						</tr>
						<!-- <tr class="checkbox">
							<td>
								<div class="id-save">
									<input id="save_id" name="save_id" value="T" type="checkbox">
									<label for="save_id">아이디 저장</label>
								</div>
							</td>
						</tr> -->
						<tr>
							<td>
								<h5 style="color: red">${loginfail}</h5>
								<a href="#" class="btn-primary full" id="login_submit_btn" onclick="return login()">로그인</a>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			</form>
		</div>
</body>
</html>