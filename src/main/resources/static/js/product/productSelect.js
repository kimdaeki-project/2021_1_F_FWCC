
$("#addcartbutton").click(function(event){
		event.preventDefault();
	if(tPrice != 0){
					
		toChart(false);
	}
});

$("#buynowbutton").click(function(event){
		event.preventDefault();
	if(tPrice != 0){
					
		toChart(true);
	}
});

function toChart(data){
	let pInfoNums = new Array();
	let productCounts = new Array();
	let productNum = $("#pTitle").attr("data-productNum");
	
	$(".delInfo").each(function(){
		if($(this).parent().parent().css("display")=='none'){
			return true;
		}
		productCounts.push($(this).parent().find("input[type='number']").val());
		pInfoNums.push($(this).attr("data-infoNum"));
	});
	
	$.post({
		url:"/cart/setCartList",
		traditional:true,
		data:{
			productNum:productNum,
			pInfoNums:pInfoNums,
			productCounts:productCounts
		},
		success:function(result){
			if(result>0){
				alert("장바구니에 추가되었습니다.")
				if(data){
					location.href="/order/basket";
				}else{
					return;
				}
			}else{
				alert("장바구니에 넣을 수 없습니다.");
			}
		}
	});
}