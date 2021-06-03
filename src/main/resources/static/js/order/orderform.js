
$(document).ready(function(){
	var IMP = window.IMP;
	IMP.init('iamport');
});

$("#purchasebutton").click(function(){
	
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
	const amount = $(this).attr("data-orderPrice");
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