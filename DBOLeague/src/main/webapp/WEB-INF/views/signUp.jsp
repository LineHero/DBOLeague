<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="css/signUp.css">
</head>
<script src="js/jquery-3.6.4.min.js"></script>
<body>
<div class="containers">
		<div class="wrapper">
			<div class="logo">
				<a href="/main">DBO League</a>
			</div>
			<form id="join_form" action="/join" method="post">
			<div class="join">
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
						<tr>
							<th>닉네임</th>
							<td><input id="member_nick" name="member_nick" type="text"></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input id="member_email" name="member_email" type="text"> @
							<input id="member_email" name="member_email" type="text"></td>
						</tr>
						<tr>
							<td>
								<a id="join_btn">회원가입</a>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			</form>
		</div>
</div>
</body>
</html>