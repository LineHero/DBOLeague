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
						<tr class="checkbox">
							<td>
								<div class="id-save">
									<input id="save_id" name="save_id" value="T" type="checkbox">
									<label for="save_id">아이디 저장</label>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<h5 style="color: red">${loginfail}</h5> <a id="login_btn">로그인</a>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			</form>
		</div>
</body>
</html>