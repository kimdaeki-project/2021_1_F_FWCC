$(document).ready(function(){
	$.get({
		url:"/cart/counting",
		success:function(result){
			$("#navbar-cartspan").text(result);
		}
	});
});