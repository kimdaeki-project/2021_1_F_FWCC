/**
 * 
 */

$("body").on("click", "#adminMenu", function(){
	if($("#adminMenuBar").css("display")=="none"){
		$("#adminMenuBar").css("display", "block");
	}else{
		$("#adminMenuBar").css("display", "none");
	}		
});