/**
 * 
 */
 
// ready =====================================================================
$(document).ready(function(){
	$("#mobile_view").hide();
});
 
// email checked =============================================================
$("#check_method1").click(function(){
	$("#email_view").show();
	$("#mobile_view").hide();
});

// phone checked =============================================================
$("#check_method2").click(function(){
	$("#email_view").hide();
	$("#mobile_view").show();
});