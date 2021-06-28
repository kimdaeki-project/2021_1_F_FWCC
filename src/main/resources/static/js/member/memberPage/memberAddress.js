/**
 * 
 */
 
// 체크박스 ================================================
// 전체선택
$("#allCheck").click(function(){
	let checked = $(this).prop("checked");
	$(".check").prop("checked", checked);
});

// 하나 체크 해제시 allCheck 풀리기

$(".check").click(function(){
	$(".check").each(function(){		
		let result = true;
		let check = $(this).prop("checked");
		if(!check) {
			result = false;
		}
		$("#allCheck").prop("checked", result);
	});
});

// 주소 삭제 ===============================================
$("#deleteAddr").click(function(){
	$(".check").each(function(){		
		let selected = $(this).prop("checked");
		if(selected){
			let addrNum = $(this).attr("title");
			console.log(addrNum);
		}
	});
});








