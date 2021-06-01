$("#allcheck").click(function(){
	$(".selectcheck").each(function(){
		$(this).prop("checked",$("#allcheck").prop("checked"));
	});
});

$(".selectcheck").click(function(){
	let check = true;
	$(".selectcheck").each(function(){
		if(!$(this).prop("checked"))	{
			check=false;
		}
	});
	$("#allcheck").prop("checked", check);
});

$("#buyall").click(function(event){
	event.preventDefault();
	let count = 0;
	$(".checklist").each(function(){
		count++;
	});
	if(count==0){
		swal({
			icon:"error",
			title:"실패",
			text:"구매할 상품이 없습니다."
		});
	}else{
		let carts = new Array();
		
		$(".checklist").each(function(){
			$(this).val('true');
		});
		
		$("body").append('<form id="transferorderform" action="./orderform"></form>');
		$("#transferorderform").append();
		$("#transferorderform").submit();
	}
});

$("#buyselects").click(function(event){
	event.preventDefault();
	let count = 0;
	$(".checklist").each(function(){
		if(this.prop("checked")){
			count++;
		}
	});
	if(count==0){
		swal({
			icon:"error",
			title:"실패",
			text:"선택된 상품이 없습니다."
		});
	}
});

$("#allcartremove").click(function(){
	let count = 0;
	let carts = new Array();
		
	$(".checklist").each(function(){
		carts.push();/* cartnum을 집어넣고 테스트 하면 된다. */
		count++;
	});
	
	if(count==0){
		swal({
			icon:"info",
			title:"INFO",
			text:"장바구니가 이미 비어있습니다."
		});
	}
	
	$.post({
		url:"",
		data:{
			
		},
		success:function(result){
			if(result>0){
				swal({
					icon:"success",
					title:"삭제 완료",
					text:"장바구니를 모두 비웠습니다."
				});
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

$("#selectcartremove").click(function(){
	let count = 0;
	let carts = new Array();
		
	$(".checklist").each(function(){
		carts.push();/* cartnum을 집어넣고 테스트 하면 된다. */
		count++;
	});
	
	if(count==0){
		swal({
			icon:"info",
			title:"INFO",
			text:"선택된 항목이 존재하지 않습니다."
		});
	}
	
	$.post({
		url:"",
		data:{
			
		},
		success:function(result){
			if(result>0){
				swal({
					icon:"success",
					title:"삭제 완료",
					text:"선택된 항목을 비웠습니다."
				});
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