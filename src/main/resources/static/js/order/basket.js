//전체 체크박스 선택
$("#allcheck").click(function(){
	$(".selectcheck").each(function(){
		$(this).prop("checked", $("#allcheck").prop("checked"));
	});
});

//체크박스 선택
$(".selectcheck").click(function(){
	let check = true;
	$(".selectcheck").each(function(){
		if(!$(this).prop("checked"))	{
			check=false;
		}
	});
	$("#allcheck").prop("checked", check);
});

//모든 상품 구매
$("#buyall").click(function(event){
	event.preventDefault();
	
	let count = 0;
	let cartNums = new Array();
	
	$(".selectcheck").each(function(){
		cartNums.push($(this).attr("data-cartNum"));
		count++;
	});
	
	if(count==0){
		swal({
			icon:"error",
			title:"실패",
			text:"구매할 상품이 없습니다."
		});
		return;
	}
	
	$("body").append('<form id="transferorderform" action="/order/orderform" method="post"></form>');
	for(let cartNum of cartNums){
		$("#transferorderform").append('<input type="hidden" name="cartNums" value="'+cartNum+'">');
	}
	$("#transferorderform").submit();
});

//선택된 상품들 구매
$("#buyselects").click(function(event){
	event.preventDefault();
	
	let cartNums = new Array();
	let count = 0;
	$(".selectcheck").each(function(){
		if($(this).prop("checked")){
			cartNums.push($(this).attr("data-cartNum"));
			count++;
		}
	});
	
	if(count==0){
		swal({
			icon:"error",
			title:"실패",
			text:"선택된 상품이 없습니다."
		});
		return;
	}
	
	$("body").append('<form id="transferorderform" action="/order/orderform" method="post"></form>');
	for(let cartNum of cartNums){
		$("#transferorderform").append('<input type="hidden" name="cartNums" value="'+cartNum+'">');
	}
	$("#transferorderform").submit();
});

//장바구니에서 모든 항목 제거
$("#allcartremove").click(function(event){
	event.preventDefault();
	
	let count = 0;
		
	$(".selectcheck").each(function(){
		count++;
	});
	
	if(count==0){
		swal({
			icon:"info",
			title:"INFO",
			text:"장바구니가 이미 비어있습니다."
		});
	}
	
	$.get({
		url:"/cart/deleteCart",
		success:function(result){
			if(result>0){
				swal({
					icon:"success",
					title:"삭제 완료",
					text:"장바구니를 모두 비웠습니다."
				});
				location.href="/order/basket";
			}else{
				swal({
					icon:"error",
					title:"에러발생",
					text:"장바구니를 비우는 동안 에러가 발생했습니다."
				});
			}
		}
	});
});

//장바구니에서 체크한 항목 제거
$("#selectcartremove").click(function(event){
	event.preventDefault();
	
	let count = 0;
	let cartNums = new Array();
	
	$(".selectcheck").each(function(){
		if($(this).prop("checked")){
			count++;
			cartNums.push($(this).attr("data-cartNum"));
		}
	});

	if(count==0){
		swal({
			icon:"info",
			title:"INFO",
			text:"선택된 항목이 없습니다."
		});
	}	

	$.post({
		url:"/cart/deleteItems",
		traditional:true,
       	data : {
			cartNums:cartNums
		},
		success:function(result){
			if(result>0){
				swal({
					icon:"success",
					title:"삭제 완료",
					text:"선택된 항목을 비웠습니다."
				});
				location.href="/order/basket";
			}else{
				swal({
					icon:"error",
					title:"에러발생",
					text:"장바구니를 비우는 동안 에러가 발생했습니다."
				});
			}
		}
	});
});

//장바구니에 있는 상품의 구매 개수 조절
$(".countchange").click(function(event){
	event.preventDefault();
	
	const typenumber=$(this).siblings('input[type="number"]');
	const typehidden=$(this).siblings('input[type="hidden"]');
	const productCount = typenumber.val();
	const cartNum = typehidden.attr("data-cartNum");
	const pInfoNum = typehidden.attr("data-pInfoNum");
	
	if(productCount<1){
		swal({
			icon:"error",
			title:"실패",
			text:"0 이하의 숫자는 입력할 수 없습니다."
		});
		return;
	}
	
	$.get({
		url:"/cart/updateCount",
		data:{
			productCount:productCount,
			cartNum:cartNum,
			pInfoNum:pInfoNum
		},
		success:function(result){
			if(result>0){
				location.href="/order/basket";
			}else{
				swal({
					icon:"error",
					title:"실패",
					text:"현재 재고보다 수량이 더 많습니다."
				});
				typenumber.val(typehidden.attr("data-productCount"));
			}
		}
	});
});

//선택된 항목 하나만 주문
$(".oneOrder").click(function(event){
	event.preventDefault();
	
	let cartNums = new Array();

	cartNums.push($(this).attr("data-cartNum"));
	
	$("body").append('<form id="transferorderform" action="/order/orderform" method="post"></form>');
	for(let cartNum of cartNums){
		$("#transferorderform").append('<input type="hidden" name="cartNums" value="'+cartNum+'">');
	}
	$("#transferorderform").submit();
});

//선택된 항목 하나만 제거
$(".oneDelete").click(function(event){
	event.preventDefault();
	
	let cartNums = new Array();
	cartNums.push($(this).attr("data-cartNum"));

	$.post({
		url:"/cart/deleteItems",
		traditional:true,
       	data : {
			cartNums:cartNums
		},
		success:function(result){
			if(result>0){
				swal({
					icon:"success",
					title:"삭제 완료",
					text:"선택된 항목을 제거하였습니다."
				});
				location.href="/order/basket";
			}else{
				swal({
					icon:"error",
					title:"에러발생",
					text:"장바구니에서 제거하지 못했습니다."
				});
			}
		}
	});
});