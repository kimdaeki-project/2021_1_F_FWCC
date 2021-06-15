/**
 * 
 */

let today = dayjs().format("YYYY-MM-DD");

// document.ready ===============================================
// 페이지 로딩 시 기간 default 3개월 전
$(document).ready(function() {
	$("#history_end_date").val(today);
	$("#history_start_date").val();
});

// 날짜 검색 버튼 ==============================================
// 오늘 버튼
$("#btn01").click(function() {
	$("#history_start_date").val(today);
});

// 1주일 버튼
$("#btn07").click(function() {
	let targetDate = new Date();
	targetDate.setDate(targetDate.getDate() - 7);
	targetDate = getFormatDate(targetDate);
	$("#history_start_date").val(targetDate);
});

// 1개월 버튼
$("#btn30").click(function(){
	let now = dayjs().format("YYYY-MM-DD");
	console.log(now);
});


