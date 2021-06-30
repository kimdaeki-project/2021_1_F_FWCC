/**
 * 
 */
let dCheck = false;
let str="";


function duplCheck(sibal){
	let collab=$("#collab").val();
	dCheck=false;
	if(collab.length>0){
		$.get("/product/divisionCheck?collab="+collab,function(result){
			result=result.trim();
			str = "이미 있음"
			if(result=="가능"){
				str = "추가 가능"
				dCheck=true;
			}
			$("#divCheckText").text(str);
			
			if(sibal){
				alert(dCheck);
				if(dCheck){
					$("#frm").submit();
				}
			}
		})
	}
}

$("#duplCheck").click(function(){
	
	duplCheck(false);
})

$("#addBtn").click(function(){
	duplCheck(true);
	
	
	
})

