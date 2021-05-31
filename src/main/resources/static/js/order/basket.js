
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

$("#allcartremove").click(function(event){
	event.preventDefault();
	$.ajax({
		
	});
});

$("#selectcartremove").click(function(event){
	event.preventDefault();
	$.ajax({
		
	});
});