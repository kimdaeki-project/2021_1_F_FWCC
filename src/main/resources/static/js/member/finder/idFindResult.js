/**
 * 
 */
 
// ready ======================================
$(document).ready(function(){
	$(".encrypted_name").html($(".encrypted_name").attr("title"));
	$(".encrypted_searchInfo").html($(".encrypted_searchInfo").attr("title"));
	let username = $(".encrypted_username").attr("title");
	let parsed = username.substring(0, 3);
	let num = username.length - 3;
	let encrypt = "*";
	encrypt = encrypt.repeat(num);
	username = parsed.concat(encrypt);
	$(".encrypted_username").html(username);
	
});
