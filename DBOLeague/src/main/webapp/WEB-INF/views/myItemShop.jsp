<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>DBO 개인 랭킹</title>
<script src="../js/jquery-3.6.4.min.js"></script>
<link href="../css/myItemShop.css" rel="stylesheet" type="text/css" />
<link href="../css/cursor.css" rel="stylesheet" type="text/css" />
<script src="../js/loading.js"></script>
<link href="../css/loading.css" rel="stylesheet" type="text/css" />
<link href="../css/itemseffect.css" rel="stylesheet" type="text/css" />

</head>
<body>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/loading.jsp"%>
		<header>
			<div id="home">
				<span class="cursorPointer headermenu" onclick="goPage('maintest')">메인
					화면으로</span>
			</div>
			<div id="title">
				<span>DBO LEAGUE - ItemShop</span>
			</div>
			<div id="id-logout">
				<c:choose>
					<c:when test="${not empty login}">
						<span class="cursorPointer headermenu" onclick="goPage('mypage')">마이페이지</span> | <span
							class="cursorPointer headermenu" onclick="goPage('logout')">로그아웃</span>
					</c:when>
					<c:otherwise>
						<span class="cursorPointer headermenu" onclick="goPage('login')">로그인</span> | <span
							class="cursorPointer headermenu" onclick="goPage('join')">회원가입</span>
					</c:otherwise>
				</c:choose>

			</div>
		</header>
		<main>
			<div id="main-body">
				<section>
					<div>
						<img src="../img/Sprite-0001.png" alt=""
							data-animated="../img/Sprite-0001.gif"
							data-static="../img/Sprite-0001.png" class="cursorPointer arrows"
							onclick="goSpecificWeek(${year}, ${week - 1})" />
					</div>
					<div class="items">
						<div class="shoptitle">
							<div class="inboxtitle">닉네임 변경 아이템</div>
							<div class="expamount">99999999 exp. 보유중</div>
						</div>
						<div class="itemblocks">
							<div class="item jumping"><span>Jumping</span></div>
							<div class="itemname">콩콩뛰는 닉네임</div>
							<div class="itemexplain">닉네임을 점프하게 만들어보세요!<br>이 아이템을 적용하면 랭킹 페이지에도 보여집니다!</div>
							<div class="itemprice">1000 exp.</div>
						</div>
						<div class="itemblocks">
							<div class="item glowing"><span>Glowing</span></div>
							<div class="itemname">빛나는 닉네임</div>
							<div class="itemexplain">닉네임이 깜박거려요!<br>이 아이템을 적용하면 랭킹 페이지에도 보여집니다!</div>
							<div class="itemprice">1000000 exp.</div>
						</div>
						<div class="itemblocks">
							<div class="item rainbow"><span>RainBow</span></div>
							<div class="itemname">그래디언트 무지개색 닉네임</div>
							<div class="itemexplain">닉네임을 그래디언트 무지개로 만들어보세요!<br>이 아이템을 적용하면 랭킹 페이지에도 보여집니다!</div>
							<div class="itemprice">1000000 exp.</div>
						</div>
						<div class="itemblocks">
							<div class="item neon"><span>Neon</span></div>
							<div class="itemname">네온 무지개색 닉네임</div>
							<div class="itemexplain">닉네임을 네온 무지개로 만들어보세요!<br>이 아이템을 적용하면 랭킹 페이지에도 보여집니다!</div>
							<div class="itemprice">1000000 exp.</div>
						</div>
					</div>
					<div>
						<img src="../img/Sprite-0002.png" alt=""
							data-animated="../img/Sprite-0002.gif"
							data-static="../img/Sprite-0002.png" class="cursorPointer arrows"
							onclick="goSpecificWeek(${year}, ${week + 1})" />
					</div>
				</section>
			</div>
		</main>
	</div>
</body>
<script src="../js/ranking.js"></script>
</html>
