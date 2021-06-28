/**
 * 
 */
let dCheck = false;
$("#duplCheck").click(duplCheck);

function duplCheck(){
	let collab=$("#collab").val();
	if(collab.length>0){
		$.get("divisionCheck?collab="+collab,function(result){
			result=result.trim();
			let str = "이미 있음"
			alert(result)
			if(result=="가능"){
				str = "추가 가능"
				dCheck=true;
			}
			alert(str);
		})
	}
}

