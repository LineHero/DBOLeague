<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="css/signIn.css">
<link href="../css/cursor.css" rel="stylesheet" type="text/css" />
<link href="../css/stars.css" rel="stylesheet" type="text/css" />
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

//아이디 저장 체크박스
window.addEventListener("DOMContentLoaded", function() {
  var checkbox = document.getElementById("member_check_save_id0");
  var backgroundUrlOff = "/img/key.svg";
  var backgroundUrlOn = "/img/lock-2.svg";
  var inputId = document.getElementById("member_id");

  // 아이디 정보를 로컬 스토리지에 저장하는 함수
  function saveIdToLocalStorage() {
    if (checkbox.checked) {
      var savedId = inputId.value;
      localStorage.setItem("savedId", savedId);
    } else {
      localStorage.removeItem("savedId");
    }
  }

  checkbox.addEventListener("change", function() {
    checkbox.style.backgroundImage = checkbox.checked ? "url(" + backgroundUrlOn + ")" : "url(" + backgroundUrlOff + ")";
    saveIdToLocalStorage(); // 아이디 정보 저장 함수 호출
  });

  // 페이지 로드 시 로컬 스토리지에서 아이디 정보를 불러와서 입력란에 설정
  var savedId = localStorage.getItem("savedId");
  if (savedId) {
    inputId.value = savedId;
    checkbox.checked = true;
    checkbox.style.backgroundImage = "url(" + backgroundUrlOn + ")";
  }

  // 아이디 입력란 값이 변경될 때마다 로컬 스토리지 업데이트
  inputId.addEventListener("input", saveIdToLocalStorage);
});
</script>
<body>
	<div class="wrapper">
		<div id="stars"></div>
		<div id="stars2"></div>
		<div class="logo">
			<a href="/main" class="cursorPointer">DBO League</a>
		</div>
		<form id="login_form" action="/login" method="post">
			<div class="login">
			
				<div class='cursorPointer formindiv'>
					<p>아이디</p>
						<input id="member_id" name="member_id" type="text" class="cursorPointer" autocomplete='off'>
				</div>

				<div class='cursorPointer formindiv'>
					<p>비밀번호</p>
					<label><input id="member_pw" name="member_pw"
						autocomplete="off" type="password" maxlength="16" class="cursorPointer"></label>
				</div>
				<div class="checkbox">
					<div class="id-pw-td">
								<div class="id-save">
									<input id="member_check_save_id0" name="check_save_id" value="T" type="checkbox">
                                     <label for="member_check_save_id0">아이디 저장</label>
								</div>
								</div>
						</div>
				<div class='cursorPointer formindiv'>
					<h5>${loginfail}</h5>
					<button type="button" id="login_submit_btn" class="cursorPointer">로그인</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>