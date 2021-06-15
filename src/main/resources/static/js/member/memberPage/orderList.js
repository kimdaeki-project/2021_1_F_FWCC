/**
 * 
 */
 
$(document).ready(function(){
	let today = "";
	let year = new Date().getFullYear();
	let month = new Date().getMonth()+1;
	let date = new Date().getDate();
	today = year+"-"+month+"-"+date;
	$("#history_end_date").val(today);
});