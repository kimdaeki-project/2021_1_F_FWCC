
$(".orderCancle").click(function(){
	
	const orderNum = $(this).attr("data-orderNum");
	
	$.post({
		url:"/order/cancle",
		data:{
			merchant_uid:orderNum
		},
		success:function(result){
			if(result){
				alert("결제 취소에 성공하였습니다.");
				location.href="./orderList";
			}else{
				alert("결제 취소 도중 에러가 발생하였습니다.");
			}
		}
	});
});