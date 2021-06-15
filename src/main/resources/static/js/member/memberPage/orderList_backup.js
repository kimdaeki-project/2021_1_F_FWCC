/**
 * 
 */

let today = new Date();
let sysYear = new Date().getFullYear();
let sysMonth = new Date().getMonth() + 1;
let sysDate = new Date().getDate();
sysToday = sysYear + "-" + sysMonth + "-" + sysDate;

// yyyy-MM-dd 포맷으로 반환
function getFormatDate(date){
    let year = date.getFullYear();              //yyyy
    let month = (1 + date.getMonth());          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    let day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    return  year + '-' + month + '-' + day;
}

// document.ready ===============================================
// 페이지 로딩 시 기간 default 3개월 전
$(document).ready(function() {
	today = getFormatDate(today);
	$("#history_end_date").val(today);
	let targetDate = new Date();
	targetDate.setMonth(targetDate.getMonth() - 3);
	targetDate = getFormatDate(targetDate);
	$("#history_start_date").val(targetDate);
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


