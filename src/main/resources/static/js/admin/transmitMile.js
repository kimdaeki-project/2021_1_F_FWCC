const adduser = $("#adduser").html();

$("#toggleselectusers").click(function(){
	if($("#selectusers").css("display")=='none'){
		$("#selectusers").css("display", 'block');
	}else{
		$("#selectusers").css("display", 'none');
	}
});

$("#addinput").click(function(){
	$("#adduser").append(adduser);
});

$("#adduser").on("click", 'deleteuser', function(){
	$(this).parent().remove();
});

$("#allmiletrans").click(function(event){
	event.preventDefault();
	const mileage = $("#sendmileage").val();
	
	if(mileage<=0){
		swal({
			icon:"info",
			title:"INFO",
			text:"전송할 마일리지는 최소 0 이상이어야 합니다."
		});
	}
	
	$.get({
		url:"./transAllMile",
		data:{
			mileage:mileage
		},
		success:function(data){
			
		}
	});
});

$("#selecttransmile").click(function(event){
	event.preventDefault();
	
	
});