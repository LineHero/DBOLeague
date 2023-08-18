<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="css/signUp.css">
<link href="../css/cursor.css" rel="stylesheet" type="text/css" />
<link href="../css/stars.css" rel="stylesheet" type="text/css" />
</head>
<script src="js/jquery-3.6.4.min.js"></script>
<script>
$(document).ready(function() {
	const id = document.getElementById("member_id");
	const pw = document.getElementById("member_pw");
	const email = document.getElementById("member_email");
	
	//아이디 유효성 검사
	function isIdValid(id) {
		// 조건 : 영문대소문자 + 숫자 조합
		const regex = /^(?=.*[a-zA-Z])(?=.*\d).{6,16}$/;
		
		return regex.test(id);
	}
	
	//비밀번호 유효성 검사
	function isPasswordValid(password) {
		// 조건 1: 영문대소문자 + 숫자 조합
		const regex1 = /^(?=.*[a-zA-Z])(?=.*\d).{8,16}$/;
		// 조건 2: 영문대소문자 + 특수문자 조합
		const regex2 = /^(?=.*[a-zA-Z])(?=.*[\W_]).{8,16}$/;
		// 조건 3: 숫자 + 특수문자 조합
		const regex3 = /^(?=.*\d)(?=.*[\W_]).{8,16}$/;
		
		return regex1.test(password) || regex2.test(password) || regex3.test(password);
	}
	
	//이메일 유효성 검사
    function isEmailValid(email) {
        // 이메일 유효성 검사 정규식
        const regex = /^[A-Za-z0-9+_.-]+@(.+)$/;
        return regex.test(email);
    }
	
	// 다른 곳 클릭 시 아이디 유효성 검사
	$(id).on('blur', function() {
	    var idValue = $(this).val();
	    if (idValue.trim() !== "" && !isIdValid(idValue)) {
	        alert("아이디 입력 조건을 만족해주세요.");
	    }
	});
	
	// 다른 곳 클릭 시 비밀번호 유효성 검사
	$(pw).on('blur', function() {
	    var pwValue = $(this).val();
	    if (!isPasswordValid(pwValue)) {
	        alert("비밀번호 입력 조건을 만족해주세요.");
	    }
	});
	
	// 비밀번호 일치 여부 확인
      $(document).on('click', 'input:not(#memPw_confirm)', function(e) {
         var pwConfirmValue = $("#memPw_confirm").val();
         var pwValue = $("#member_pw").val();
         if (pwValue !== '' && pwConfirmValue !== '' && pwConfirmValue !== pwValue) {
             alert("비밀번호가 일치하지 않습니다.");
             $("#memPw_confirm").focus();
             
         }
      });
	
      $(email).on('blur', function() {
  	    var emailValue = $(this).val();
  	    if (!isEmailValid(emailValue)) {
  	        alert("이메일 형식이 올바르지 않습니다. @를 포함한 이메일 형식으로 작성해 주세요.");
  	    }
  	});
	
			$("#join_submit_btn").on(
					'click',
					function(e) {
						e.preventDefault();
						
						var member_id = $("#member_id").val();
						var member_pw =  $("#member_pw").val();
						var memPw_confirm = $("#memPw_confirm").val();
			            var member_nick = $("#member_nick").val();
			            var member_email = $("#member_email").val();
			            /* var member_team */
			            
			            if (member_id === "") {
			            	alert("아이디를 입력해 주세요.");
			                $("#member_id").focus();
			            } else if (member_pw === "") {
			                alert("비밀번호를 입력해 주세요.");
			                $("#member_pw").focus();
			            } else if(memPw_confirm === ""){
			            	alert("비밀번호 확인란을 입력해 주세요.");
			            	$("#memPw_confirm").focus();
			            } else if(member_nick === ""){
			            	alert("닉네임을 입력해 주세요.");
			            	$("#member_nick").focus();
			            } else if(member_email === ""){
			            	alert("이메일을 입력해 주세요.");
			            	$("#member_email").focus();
			            } else if(member_pw !== memPw_confirm) {
			            	alert("비밀번호가 일치하지 않습니다.");
			            	 $("#memPw_confirm").focus();
		            	} else {
			            
						$.ajax({
							url : '/join',
							data : {
								'member_id' : member_id,
								'member_pw' : member_pw,
								'member_nick' : member_nick,
								'member_email' : member_email
								/* 'member_team' :  */
							},
							type : 'post',
							success : function(res) {
								location.href = "/maintest";
							},
							error : function(request, status, e) {
								console.log("코드=" + request.status + "\n메시지="
										+ request.responseText + "\nerror="
										+ e);
							}
						});
			            }
					});
});
</script>
<body>
	<div class="wrapper">
		<div id="stars"></div>
		<div id="stars2"></div>
		<div class="logo">
			<a href="/main" class="cursorPointer">DBO League</a>
		</div>
		<form id="join_form" action="/join" method="post">
			<div class="join">
				<div class='cursorPointer formindiv'>
					<p>아이디</p>
					<div id=id_div>
						<input id="member_id" name="member_id" type="text" class="cursorPointer" autocomplete='off'>
						<a class="help">(영문 대소문자/숫자로 조합, 6자~16자)</a>
					</div>
				</div>

				<div class='cursorPointer formindiv'>
					<p>비밀번호</p>
					<label><input id="member_pw" name="member_pw"
						autocomplete="off" type="password" maxlength="16" class="cursorPointer"></label>
						<a class="help">(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)</a>
				</div>

				<div class='cursorPointer formindiv'>
					<p>비밀번호 확인</p>
					<label><input type="password" name="memPw_confirm"
						id="memPw_confirm" value="" autocomplete="off" maxlength="16" class="cursorPointer"></label>
				</div>

				<div class='cursorPointer formindiv'>
					<p>닉네임</p>
					<input id="member_nick" name="member_nick" type="text" maxlength="10" class="cursorPointer" autocomplete='off'>
				</div>

				<div class='cursorPointer formindiv'>
					<p>E-mail</p>
					<input id="member_email" name="member_email" type="text" maxlength="80" class="cursorPointer" autocomplete='off'>
				</div>
			</div>
			
			<div id="join_btn" class='cursorPointer formindiv'>
				<button type="button" class="cursorPointer join_submit_btn" id="join_submit_btn">회원가입</button>
			</div>
			
		</form>
	</div>
</body>
</html>