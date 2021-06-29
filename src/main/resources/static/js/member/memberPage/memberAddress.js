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
// ajax 배열 보내기 -> traditional 찾아보기
let ar = [];

$("#deleteAddr").click(function(){
	let confirmCheck = confirm("삭제하겠습니까?");
	if(confirmCheck) {		
		$(".check").each(function(){		
			let selected = $(this).prop("checked");
			if(selected){
				ar.push($(this).attr("title"));
			}
		});

		$.ajax({
			method:"POST",
			url:"./addressDelete",
			traditional:true,
			data:{ar:ar},
			success:function(result){
				result=result.trim();
				if(result>0){
					alert("삭제 완료");
					location.reload();
				}
			},
			error:function(result){
				alert("AJAX error : "+result);
			}
		});
	}
	
});







