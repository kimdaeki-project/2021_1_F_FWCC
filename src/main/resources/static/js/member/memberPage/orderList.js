/**
 * 
 */

let today = dayjs().format("YYYY-MM-DD");

// document.ready ===============================================
// 페이지 로딩 시 기간 default 3개월 전
$(document).ready(function() {
	$("#history_end_date").val(today);
	
	/*//3개월 전
	let targetDate = dayjs().subtract(3, "month").format("YYYY-MM-DD");
	$("#history_start_date").val(targetDate);*/
});

// 날짜 검색 버튼 ==============================================
// 오늘 버튼
$("#btn01").click(function() {
	$("#history_start_date").val(today);
});

// 1주일 버튼
$("#btn07").click(function() {
	let targetDate = dayjs().subtract(7, "day").format("YYYY-MM-DD");
	$("#history_start_date").val(targetDate);
});

// 1개월 버튼
$("#btn30").click(function(){
	let targetDate = dayjs().subtract(1, "month").format("YYYY-MM-DD");
	$("#history_start_date").val(targetDate);
});

// 3개월 버튼
$("#btn90").click(function(){
	let targetDate = dayjs().subtract(3, "month").format("YYYY-MM-DD");
	$("#history_start_date").val(targetDate);
});

// 6개월 버튼
$("#btn180").click(function(){
	let targetDate = dayjs().subtract(6, "month").format("YYYY-MM-DD");
	$("#history_start_date").val(targetDate);
});

// 필터 조회 ===================================================
$("#order_search_btn").click(function(){
	let orderState = $("#order_status").val();
	let startDate = $("#history_start_date").val();
	let endDate = $("#history_end_date").val();
	console.log(startDate);
	console.log(endDate);
	$.ajax({
		type:"GET",
		url:"./orderlist",
		data:{
			orderState:orderState,
			startDate:startDate,
			endDate:endDate
		},
		success:function(result){
			alert(result);
		},
		error:function(result){
			alert(result);
		}
	}); // --- ajax END ---
});


