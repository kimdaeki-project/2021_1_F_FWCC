let type = $("#type").attr("title");
let type1 = type.substr(0,type.indexOf("-"));
let type2 = type.substr(type.indexOf("-")+1);
console.log(type);
console.log(type1);
console.log(type2);

let titleCheck=false;
let collabCheck=false;
let type1Check=false;
let type2Check=false;
let summaryCheck=false;
let contentsCheck=false;
let finalCheck = false;

isEmptyTitle = function(){
	titleCheck=false;
	let title=$("#pTitle").val();
	if(title.length!=0){
		titleCheck=true;
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
isEmptySummary = function(){
	summaryCheck=false;
	let summary = $("#summary").val();
	if(summary.length>0){
		summaryCheck=true;
	}
}
isEmptyContents = function(){
	contentsCheck = false;
	let contents = $("#contents").val();
	if(contents.length>0){
		contentsCheck = true;
	}
}
$(document).ready(function(){
	$("#pCollab").val($("#pCollab").attr("title"));
	$("#pType1").val(type1);
	$("#pType2").val(type2);
	$("#pSaleable").val($("#saleable").attr("title"));
})

getSizes = function(){
	let sizes = new Array();
	$(".size").each(function(index,item){
		sizes.push($(item).val())
	});
	$("#sizeList").val(sizes);
}

getStocks = function(){
	let stocks = new Array();
	$(".stock").each(function(index,item){
		stocks.push($(item).val())
	});
	$("#stockList").val(stocks);
}
calFinalPrice = function(){
	let price = $("#pPrice").val();
	let disRate = $("#pDisRate").val();
	if(disRate>100){
		disRate=100;
		$("#pDisRate").val(disRate);
	}
	price = Math.floor(price*(100-disRate)/100);
	$("#finalPrice").val(price);
}
$("#pDisRate").blur(calFinalPrice);
// 제품 이름, 콜라보, 구분2개, 제품요약, 내용 null 검사
$("#sBtn").click(function(){
	calFinalPrice();
	isEmptyTitle()
	isOkCollab()
	isOkType1()
	isOkType2()
	isEmptySummary()
	isEmptyContents()
	finalCheck=false;
	finalCheck=titleCheck&&collabCheck&&type1Check&&type2Check&&summaryCheck&&contentsCheck;
	if(finalCheck) {
		getSizes();
		getStocks();
		$("#frm").submit();
	}else{
		alert("입력사항 재확인!")
	}
})