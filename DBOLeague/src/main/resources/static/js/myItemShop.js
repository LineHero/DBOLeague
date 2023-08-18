$(".arrows").mouseover(function() {
  $(this).attr("src", $(this).data("animated"))
}),
$(".arrows").mouseout(function() {
  $(this).attr("src", $(this).data("static"))
});

function goPage(page) {
	location.href = "/" + page;
}

