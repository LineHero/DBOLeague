<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>DBO 개인 랭킹</title>
<script src="../js/jquery-3.6.4.min.js"></script>
<link href="../css/ranking.css" rel="stylesheet" type="text/css" />
<link href="../css/cursor.css" rel="stylesheet" type="text/css" />
<!-- <script type="text/javascript">

$(window).on('load', ()=>{
	setTimeout("closeLoadingWithMask()", 1000);
});
 
function closeLoadingWithMask() {
    $('#mask, #loadingImg').hide();
    $('#mask, #loadingImg').empty();  
}
</script> -->
</head>
<body>
	<div class="wrapper">
	<!-- <div id="mask"></div> -->
		<header>
			<div></div>
			<div id="home">
				<span class="cursorPointer headermenu">HOME</span>
			</div>
			<div id="title">
				<span>DBO LEAGUE - Personal Ranking</span>
			</div>
			<div id="id-logout">
				<span class="cursorPointer headermenu">아이디</span> | <span
					class="cursorPointer headermenu">로그아웃</span>
			</div>
		</header>
		<main>
			<div id="main-header">
				<div>
					<img src="../img/Sprite-0001.png" alt=""
						data-animated="../img/Sprite-0001.gif"
						data-static="../img/Sprite-0001.png" class="cursorPointer arrows"
						onclick="goSpecificWeek(${year}, ${week - 1})" />
				</div>
				<div class="headerTitle">
					<div>
						<p class="headertitlep">${year}년 ${week}회차 개인 랭킹</p>
					</div>
					<div>
						<p class="termp">${firstDayOfWeek} ~ ${lastDayOfWeek}</p>
					</div>
				</div>
				<div>
					<img src="../img/Sprite-0002.png" alt=""
						data-animated="../img/Sprite-0002.gif"
						data-static="../img/Sprite-0002.png" class="cursorPointer arrows"
						onclick="goSpecificWeek(${year}, ${week + 1})" />
				</div>
			</div>

			<div id="main-body">

				<section>
					<div class="rankings">
						<c:choose>
							<c:when test="${empty ranklist}">
								<div class="nothing">아무도 게임을 플레이해주지 않았어요...</div>
							</c:when>
							<c:otherwise>
								<c:forEach items="${ranklist}" var="dto" varStatus="status">
									<div class="rankblocks">
										<c:choose>
											<c:when test="${status.count == 1}">
												<div class="medal">
													<img class="medalimg" src="../img/pixel-medal-gold.png" />
												</div>
											</c:when>
											<c:when test="${status.count == 2}">
												<div class="medal">
													<img class="medalimg" src="../img/pixel-medal-silver.png" />
												</div>
											</c:when>
											<c:when test="${status.count == 3}">
												<div class="medal">
													<img class="medalimg" src="../img/pixel-medal-bronze.png" />
												</div>
											</c:when>
											<c:otherwise>
												<div class="medal">
													<img class="medalimg"
														src="../img/Sprite-transparent0001.png" />
												</div>
											</c:otherwise>
										</c:choose>
										<div class="place"> ${status.count} </div>
										<div class="nickname">${dto.member_nick}</div>
										<div class="expamount">${dto.exp_total} exp.</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>

					</div>
				</section>
			</div>

		</main>
	</div>
</body>
<script src="../js/ranking.js"></script>
</html>
