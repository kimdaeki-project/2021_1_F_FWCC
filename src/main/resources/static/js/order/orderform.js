
$(document).ready(function(){
	var IMP = window.IMP;
	IMP.init('iamport');
});

$("#couponSelector").change(function(){
	const disRate = Number($("#couponSelector option:selected").attr("data-disRate"));
	const originTotPrice = Number($("#purchasebutton").attr("data-originTotPrice"));
	const mileSp = Number($("#purchasebutton").attr("data-mileSp"));
	const sale = Math.floor(originTotPrice*disRate/100/100)*100;
	
	$("#cuSalePrice1").text(sale);
	$("#cuSalePrice2").text(sale);
	$("#delPriceInsert").text(mileSp+sale)
	$("#purchasebutton").attr("data-cuSale", sale);
	$("#onsaleprice").text(mileSp+sale);
	$("#endprice").text(originTotPrice-(mileSp+sale));
	$("#forUserPrice").text(originTotPrice-(mileSp+sale));
});

$("#mileAccept").click(function(event){
	event.preventDefault();
	
	const originTotPrice = Number($("#purchasebutton").attr("data-originTotPrice"));
	const mileSp = Number($("#useMile").val());
	const sale = Number($("#purchasebutton").attr("data-cusale"));
	
	if(mileSp<0){
		swal({
			icon:"error",
			title:"잘못된 입력입니다.",
			text:"-값을 입력할 수 없습니다."
		});
		$("#useMile").val(0);
		return;
	}else if(mileSp>2000){
		swal({
			icon:"error",
			title:"잘못된 입력입니다.",
			text:"마일리지는 2000원 까지 사용할 수 있습니다."
		});
		$("#useMile").val(2000);
		return;
	}
	
	$("#delPriceInsert").text(mileSp+sale);
	$("#purchasebutton").attr("data-milesp", mileSp);
	$("#onsaleprice").text(mileSp+sale);
	$("#endprice").text(originTotPrice-(mileSp+sale));
	$("#forUserPrice").text(originTotPrice-(mileSp+sale));
});

$("#addressAllCheck").click(function(){
	let value = $("#addressAllCheck").prop("checked");
	
	$(".addressSelect").each(function(){
		$(this).prop("checked", value);
	});
});

$(".addressSelect").click(function(){
	let check = true;
	
	$(".addressSelect").each(function(){
		if(!$(this).prop("checked")){
			check=false;
		}
	});
	
	$("addressAllCheck").prop("checked", check);
});

//주소를 지우고 나서 다시 가져오는 작업을 실행하지 못함
$("#selectAddressDelete").click(function(event){
	event.preventDefault();
	let addrNums = new Array();
	let count = 0;
	
	$(".addressSelect").each(function(){
		if($(this).prop("checked")){
			addrNums.push($(this).attr("data-addrNum"));
			count++;
		}
	});
	
	if(count<1){
		swal({
			icon:"warning",
			title:"삭제 불가",
			text:"삭제할 주소가 없습니다."
		});
		return;
	}
	
	$.get({
		traditional:true,
		url:"/address/deleteSelect",
		data:{
			addrNums:addrNums
		},
		success:function(result){
			if(result==count){
				
			}else{
				
			}
		}
	});
});

$(".addressAdapt").click(function(){
	const addrNum = $(this).attr("data-addrNum");
	
	$.get({
		url:"/address/getSelectOne",
		data:{
			addrNum:addrNum
		},
		success:function(result){
			if(result==""){
				swal({
					icon:"error",
					title:"에러발생",
					text:"주소를 가져오는중 에러가 발생하였습니다."
				});
			}else{
				let address = JSON.parse(result);
				$("#recZipcode").val(address.zipCode);
				$("#recZipcode").val(address.basicAddr);
				$("#recZipcode").val(address.detailAddr);
				$("#recPeople").val(address.recipient);
				$("#reccall1").val(address.addrPhone1);
				$("#reccall2").val(address.addrPhone2);
				$("#reccall3").val(address.addrPhone3);
				$.modal.close();
			}
		}
	});
});

$("#purchasebutton").click(function(event){
	event.preventDefault();
	
	if(!$("#agreepayment").prop("checked")){
		swal({
			icon:"warning",
			title:"필수 입력사항 누락",
			text:"약관동의에 체크해 주세요."
		});
		return;
	}
	
	const date = new Date();
	const merchant_uid = date.getTime() + '-' + date.getFullYear()+date.getMonth()+date.getDate()+date.getHours()
											+date.getMinutes()+date.getSeconds();
	const amount = $(this).attr("data-originTotPrice");
	const name = $(this).attr("data-name");
	const buyeremail = $("#buyerEmail1").val()+"@"+$("#buyerEmail2").val()+"."+$("#buyerEmail3").val();
	const buyername = $("#buyerName").val();
	const buyertel = $("#buyerPhone1").val()+"-"+$("#buyerPhone2").val()+"-"+$("#buyerPhone3").val();
	const buyeraddr = $("#buyerBasic").val()+' '+$("#buyerDetail").val();
	const buyerpostcode = $("#buyerZipcode").val();
	
	IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid : merchant_uid,
	    name : name,
	    amount : amount,
	    buyer_email : buyeremail,
	    buyer_name : buyername,
	    buyer_tel : buyertel,
	    buyer_addr : buyeraddr,
	    buyer_postcode : buyerpostcode
	}, function(rsp) {
		$.ajax({
			type:"post",
			url:"/order/vertify/"+rsp.imp_uid
		}).done(function(data){
			if(data.success&&data.response.amount==amount){
				console.log("성공");
			}else{
				console.log("실패");
			}
		});
	});
});