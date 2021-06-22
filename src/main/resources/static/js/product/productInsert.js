/**
 * 
 */
let titleCheck = false;
let priceCheck = false;
let collabCheck = false;
let type1Check = false;
let type2Check = false;
let thumbCheck = false;
let summaryCheck = false;
let sizeCheck = false;
let contentsCheck = false;
let finalCheck = false;

isEmptyTitle = function(){
	titleCheck=false;
	let title=$("#pTitle").val();
	if(title.length!=0){
		titleCheck=true;
	}
}
isOkPrice = function(){
	priceCheck =false;
	let price = $("#pPrice").val();
	if(price>0){
		priceCheck =true;
	}
}
isOkCollab = function(){
	collabCheck = false;
	let collab = $("#pCollab").val();
	if(collab!="default"){
		collabCheck=true;
	}
}
isOkType1 = function(){
	type1Check = false;
	let type1 = $("#pType1").val();
	if(type1!="default"){
		type1Check=true;
	}
}
isOkType2 = function(){
	type2Check = false;
	let type2 = $("#pType2").val();
	if(type2!="default"){
		type2Check=true;
	}
}
isEmptyThumbnail = function(){
	thumbCheck = false;
	let thumbNail = $("#input-image").val();
	if(thumbNail.length>0){
		thumbCheck = true;
	}
}
isEmptySummary = function(){
	summaryCheck=false;
	let summary = $("#summary").val();
	if(summary.length>0){
		summaryCheck=true;
	}
}
isOkSize = function(){
	sizeCheck = false;
	let size = $(".size").is(":checked");
	sizeCheck = size;
}
isEmptyContents = function(){
	contentsCheck = false;
	let contents = $("#contents").val();
	if(contents.length>0){
		contentsCheck = true;
	}
}
$("#sBtn").click(function(){
	finalCheck=false;
	isEmptyTitle()
	isOkPrice()
	isOkCollab()
	isOkType1()
	isOkType2()
	isEmptyThumbnail()
	isEmptySummary()
	isOkSize()
	isEmptyContents()
	finalCheck=titleCheck&&priceCheck&&collabCheck&&type1Check&&type2Check&&thumbCheck&&summaryCheck&&sizeCheck&&contentsCheck; 
	/*
	alert($("#contents").val())
	alert("title : "+titleCheck
	+"\n"+"price : "+priceCheck
	+"\n"+"collab : "+collabCheck
	+"\n"+"type1 : "+type1Check
	+"\n"+"type2 : "+type2Check
	+"\n"+"file : "+thumbCheck
	+"\n"+"summary : "+summaryCheck
	+"\n"+"size : "+sizeCheck
	+"\n"+"contents : "+contentsCheck)
	alert("final : "+finalCheck)
	*/
	if(finalCheck){
		alert("ok")
		$("#frm").submit()
	}else{
		alert("입력사향 재확인!")
	}
})