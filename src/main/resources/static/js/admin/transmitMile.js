const adduser = $("#adduser").html();

$("#toggleselectusers").click(function(){
	if($("#selectusers").css("display") == 'none'){
		$("#selectusers").css("display", 'block');
	}else{
		$("#selectusers").css("display", 'none');
	}
});

$("#addinput").click(function(){
	$("#adduser").append(adduser);
});

$("#adduser").on("click", '.deleteuser', function(){
	$(this).parent().remove();
});

$("#allmiletrans").click(function(event){
	event.preventDefault();
	const mileage = $("#sendmileage").val();
	const contents = $("#mileContents").val().trim();
	
	if(mileage<=0){
		swal({
			icon:"info",
			title:"INFO",
			text:"전송할 마일리지는 최소 0 이상이어야 합니다."
		});
		return;
	}
	
	if(contents==''){
		swal({
			icon:"info",
			title:"INFO",
			text:"최소한의 텍스트를 입력해주어야 합니다."
		});
		return;
	}
	
	$.get({
		url:"./transAllMile",
		data:{
			mileage:mileage,
			contents:contents
		},
		success:function(result){
			if(result>0){
				location.href="./transmitMile";
			}else{
				swal({
					icon:"error",
					title:"전송실패",
					text:"마일리지를 전송하던 중 에러가 발생하였습니다."
				});
			}
		}
	});
});

$("#selecttransmile").click(function(event){
	event.preventDefault();
	const mileage = $("#sendmileage").val();
	const contents = $("#mileContents").val().trim();
	let usernames = new Array();
	
	if(mileage<=0){
		swal({
			icon:"info",
			title:"INFO",
			text:"전송할 마일리지는 최소 0 이상이어야 합니다."
		});
		return;
	}
	
	if(contents==''){
		swal({
			icon:"info",
			title:"INFO",
			text:"최소한의 텍스트를 입력해주어야 합니다."
		});
		return;
	}
	
	$(".usernames").each(function(){
		const username = $(this).val().trim();
		if(username!=''){
			usernames.push(username);
		}
	});
	
	if(usernames.length==0){
		swal({
			icon:"info",
			title:"INFO",
			text:"적어도 제대로 된 형식의 username을 하나 이상 적어주어야 합니다."
		});
		return;
	}
	
	$.post({
		url:"./mileageForSelect",
		data:{
			mileage:mileage,
			contents:contents,
			usernames:usernames
		},
		success:function(result){
			if(result>0){
				location.href="./transmitMile";
			}else{
				swal({
					icon:"error",
					title:"전송실패",
					text:"마일리지를 전송하던 중 에러가 발생하였습니다."
				});
			}
		}
	});
});