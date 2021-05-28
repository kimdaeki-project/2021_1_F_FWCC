
$(document).ready(function(){
	var IMP = window.IMP;
	IMP.init('iamport');

	IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : 100,
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
		});
	});
});