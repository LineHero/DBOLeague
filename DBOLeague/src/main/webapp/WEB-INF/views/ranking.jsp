<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DBOLeague - 랭킹</title>
<link rel="stylesheet" href="../css/ranking.css">
<script src="../js/jquery-3.6.4.min.js"></script>

</head>
<body>
	<div class="wrapper">
		<h1>${year}년 ${week} 회차 개인 랭킹</h1>
		<h3>${firstDayOfWeek} ~ ${lastDayOfWeek}</h3>
		<button onclick="goSpecificWeek(${year}, ${week - 1})">이전 (${week - 1}) 회차</button>
		<button onclick="goSpecificWeek(${year}, ${week + 1})">다음 (${week + 1}) 회차</button>
		<c:forEach items="${ranklist}" var="dto" varStatus="status">
			<p>${status.count}등 ${dto.member_nick} ${dto.exp_total} exp.</p>
		</c:forEach>
	</div>
</body>
<script type="text/javascript">
	function goSpecificWeek(year, weekNumber) {
		const jan1 = new Date(year, 0, 1);
		const daysToMonday = (7 - jan1.getDay() + 1) % 7;
		const startOfYear = new Date(year, 0, 1 + daysToMonday);
		const startDate = new Date(startOfYear.getTime() + (weekNumber - 1) * 7 * 24 * 60 * 60 * 1000);

		const startYear = startDate.getFullYear();
		const startMonth = startDate.getMonth() + 1;
		const startDay = startDate.getDate();
		
		location.href = "/ranking?year=" + startYear + "&month=" + startMonth + "&day=" + startDay;
	}
</script>
</html>