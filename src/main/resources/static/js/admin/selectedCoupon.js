const cuSpNum = Number($("#cuSpNum").text().trim());
const usernameTag = $("#usernameList").html();

$("#allSend").click(function(event){
	event.preventDefault();
	
	const period = $("#couponperiod").val();
	
	if(period<1){
		swal({
			icon:"info",
			title:"INFO",
			text:"적어도 한달은 보내야 한다."
		});
		return;
	}
	
	$.get({
		url:"./couponforall",
		data:{
			cuSpNum:cuSpNum,
			period:period
		},
		success:function(result){
			if(result>0){
				location.href="./transmitCoupon";
			}else{
				swal({
					icon:"error",
					title:"전송실패",
					text:"쿠폰을 전송하던 중 에러가 발생하였습니다."
				});
			}
		}
	});
});

$("#selectUser").click(function(){
	if($("#userform").css("display")=='none'){
		$("#userform").css({display:"block"});
	}else{
		$("#userform").css({display:"none"});
	}
});

$("#addusername").click(function(){
	$("#usernameList").append(usernameTag);
});

$("#usernameList").on("click", ".deleteusername", function(){
	$(this).parent().remove();
});

$("#selectTransmit").click(function(event){
	event.preventDefault();
	let usernames = new Array();
	const period = $("#couponperiod").val();
	
	$(".usernames").each(function(){
		let data = $(this).val();
		if(data.trim()!=''){
			usernames.push(data);
		}
	});
	
	if(usernames.length==0){
		swal({
			icon:"info",
			title:"INFO",
			text:"username을 하나 이상 입력해 주세요."
		});
	}
	
	$.post({
		url:"./couponServeral",
		traditional:true,
		data:{
			cuSpNum:cuSpNum,
			usernames:usernames,
			period:period
		},
		success:function(data){
			if(data>0){
				location.href="./adminHome";
			}else{
				swal({
					icon:"error",
					title:"에러발생",
					text:"서버에서 쿠폰을 보내는 도중 에러가 발생하였습니다."
				});
			}
		}
	});
})