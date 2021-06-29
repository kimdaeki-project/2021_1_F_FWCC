
$("#setCouponButton").click(function(event){
	event.preventDefault();
	
	let cuName = $("#couponNameInput").val();
	let disRate = $("#disRateInput").val();
	
	if(cuName.trim()=='') {
		alert("쿠폰 이름을 적어주세요.");
		return;
	}
	
	if(disRate<1 || disRate>100) {
		alert("할인률을 지정해 주세요.");
		return;
	}
	
	$("#setCouponSpForm").submit();
});