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
  	
 // 아이디 유효성 검사
  	$(id).on('blur', function() {
  	    var idValue = $(this).val();
  	    var idError = $("#idError");
  	    if(idValue.trim() === ""){
  	    	idError.text("아이디를 입력해 주세요.");
        	idError.show();
            $(this).focus();
  	    } else if (idValue.trim() !== "" && !isIdValid(idValue)) {
  	        idError.text("아이디 입력 조건을 만족해주세요.");
  	        idError.show();
  	        $(this).focus();
  	    } else {
  	        idError.hide();
  	    }
  	});

  	// 비밀번호 유효성 검사
  	$(pw).on('blur', function() {
  	    var pwValue = $(this).val();
  	    var pwError = $("#pwError");
  	    if (pwValue.trim() !== "" && !isPasswordValid(pwValue)) {
  	        pwError.text("비밀번호 입력 조건을 만족해주세요.");
  	        pwError.show();
  	        $(this).focus();
  	    } else {
  	        pwError.hide();
  	    }
  	});

  	// 비밀번호 일치 여부 확인
  	$(document).on('click', 'input:not(#memPw_confirm)', function(e) {
  	    var pwConfirmValue = $("#memPw_confirm").val();
  	    var pwValue = $("#member_pw").val();
  	    var pwConfirmError = $("#pwConfirmError");
  	    if (pwValue !== '' && pwConfirmValue !== '' && pwConfirmValue !== pwValue) {
  	        pwConfirmError.text("비밀번호가 일치하지 않습니다.");
  	        pwConfirmError.show();
  	        $("#memPw_confirm").focus();
  	    } else {
  	        pwConfirmError.hide();
  	    }
  	});

  	// 이메일 유효성 검사
  	$(email).on('blur', function() {
  	    var emailValue = $(this).val();
  	    var emailError = $("#emailError");
  	    if (emailValue.trim() !== "" && !isEmailValid(emailValue)) {
  	        emailError.text("이메일 형식이 올바르지 않습니다. @를 포함한 이메일 형식으로 작성해 주세요.");
  	        emailError.show();
  	        $(this).focus();
  	    } else {
  	        emailError.hide();
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
			            
			            var idError = $("#idError");
			            var pwError = $("#pwError");
			            var pwConfirmError = $("#pwConfirmError");
			            var nickError = $("#nickError");
			            var emailError = $("#emailError");

			            idError.empty();
			            pwError.empty();
			            pwConfirmError.empty();
			            nickError.empty();
			            emailError.empty();

			            if (member_id === "") {
			            	idError.text("아이디를 입력해 주세요.");
			            	idError.show();
			                $("#member_id").focus();
			            } else if (member_pw === "") {
			            	pwError.text("비밀번호를 입력해 주세요.");
			            	pwError.show();
			                $("#member_pw").focus();
			            } else if (memPw_confirm === "") {
			            	pwConfirmError.text("비밀번호 확인란을 입력해 주세요.");
			            	pwConfirmError.show();
			                $("#memPw_confirm").focus();
			            } else if (member_pw !== memPw_confirm) {
			            	pwConfirmError.text("비밀번호가 일치하지 않습니다.");
			            	pwConfirmError.show();
			                $("#memPw_confirm").focus();
			            } else if (member_nick === "") {
			            	nickError.text("닉네임을 입력해 주세요.");
			            	nickError.show();
			                $("#member_nick").focus();
			            } else if (member_email === "") {
			            	emailError.text("이메일을 입력해 주세요.");
			            	emailError.show();
			                $("#member_email").focus();
			            } else {
			            
						$.ajax({
							url : '/ismemberexist',
							data : {
								'inputId': $('#member_id').val(),
				                'inputEmail': $('#member_email').val()
							},
							type : 'post',
							dataType: 'json',
							success : function(response) {
								if ($.trim(response.result) === "ok") {
									addMember();
									alert("가입되었습니다!");
								location.href = "/maintest";
								} else if ($.trim(response.result) === "one_id") {
				                    alert("이미 존재하는 아이디입니다. 다른 아이디를 입력해주세요.");
				                } else if ($.trim(response.result) === "one_email") {
				                    alert("이미 존재하는 이메일입니다. 다른 이메일을 입력해주세요.");
				                } else {
				                    alert("아이디와 이메일이 이미 존재합니다.");
				                }
							},
							error : function(request, status, e) {
								console.log("코드=" + request.status + "\n메시지="
										+ request.responseText + "\nerror="
										+ e);
							}
						});
			            }
					});
			
			function addMember() {
				const teamList = ["Team A", "Team B", "Team C", "Team D"];
				// 랜덤으로 팀 선택
	            const randomTeamIndex = Math.floor(Math.random() * teamList.length);
	            const member_team = teamList[randomTeamIndex];
	            
				$.ajax({
					url : '/join',
					type : 'post',
					data : {
						'member_id' : $("#member_id").val(),
						'member_pw' : $("#member_pw").val(),
						'member_nick' : $("#member_nick").val(),
						'member_email' : $("#member_email").val(),
						'member_team' : member_team
					},
					dataType: 'json',
					success: function(response) {
		    	    	console.log("정상적으로 가입되었습니다.");
		    	    },
		    	    error: function(request, status, e) {
		    	    	console.log("코드=" + request.status + "\n" + "메시지=" + request.responseText + "\n" + "error=" + e);
		    	    }
				});
			}
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
						<div id="idError" class="error"></div>
					</div>
				</div>

				<div class='cursorPointer formindiv'>
					<p>비밀번호</p>
					<label><input id="member_pw" name="member_pw"
						autocomplete="off" type="password" maxlength="16" class="cursorPointer"></label>
						<a class="help">(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)</a>
						<div id="pwError" class="error"></div>
				</div>

				<div class='cursorPointer formindiv'>
					<p>비밀번호 확인</p>
					<label><input type="password" name="memPw_confirm"
						id="memPw_confirm" value="" autocomplete="off" maxlength="16" class="cursorPointer"></label>
						<div id="pwConfirmError" class="error"></div>
				</div>

				<div class='cursorPointer formindiv'>
					<p>닉네임</p>
					<input id="member_nick" name="member_nick" type="text" maxlength="10" class="cursorPointer" autocomplete='off'>
					<div id="nickError" class="error"></div>
				</div>

				<div class='cursorPointer formindiv'>
					<p>E-mail</p>
					<input id="member_email" name="member_email" type="text" maxlength="80" class="cursorPointer" autocomplete='off'>
				<div id="emailError" class="error"></div>
				<div id="ineError" class="error"></div>
				</div>
			</div>
			
			<div id="join_btn" class='cursorPointer formindiv'>
				<button type="button" class="cursorPointer join_submit_btn" id="join_submit_btn">회원가입</button>
			</div>
			
		</form>
	</div>
</body>
</html>