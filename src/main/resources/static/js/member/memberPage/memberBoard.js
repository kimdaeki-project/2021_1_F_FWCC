/**
 * 
 */

$(".boardLink").click(function(){
	let PKNum = $(this).parent().prev().html();
	PKNum = PKNum.trim();
	console.log(PKNum);
	let check = PKNum.startsWith("R");
	if(check) {
		let num  = PKNum.substring(2);
		console.log(num);
		location.href="/review/select?num="+num;
	} else {
		let num  = PKNum.substring(2);
		console.log(num);
		location.href="/qna/select?num="+num;
	}
});