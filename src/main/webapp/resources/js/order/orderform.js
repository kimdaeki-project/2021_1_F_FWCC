
$(document).ready(function(){
	var IMP = window.IMP;
	IMP.init('iamport');
	
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
	const merchant_uid= date.getTime() + '-' + date.getFullYear()+date.getMonth()+date.getDate()+date.getHours()
											+date.getMinutes()+date.getSeconds();
	const amount=100;
	IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid : merchant_uid,
	    name : '주문명:결제테스트',
	    amount : amount,
	    buyer_email : 'iamport@tester.do',
	    buyer_name : 'tester',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456'
	}, function(rsp) {
	    console.log(rsp);
		$.ajax({
			type:"post",
			url:"/order/vertify/"+rsp.imp_uid
		}).done(function(data){
			console.log(data);
			if(data.success&&data.response.amount==amount){
				console.log("성공");
			}else{
				console.log("실패");
			}
		});
	});
});