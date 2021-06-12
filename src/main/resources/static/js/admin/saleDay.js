const chart = toastui.Chart;

const chart1 = $("#chart1");
const data1 = {
	categories:
};

$(document).ready(function(){
	
	let array1 = new Array();
	const hm = new Map();
	
	$.get({
		url:"./getSaleDay",
		data:{
			date:""
		},
		success:function(datas){
			for(let data of datas){
				let obj = JSON.parse(data);
				let productTitle = obj.productVO.productTitle;
				let sellCount = obj.sellCount;
				let temp1 = new Array();
				temp1.push(productTitle);
				temp1.push(sellCount);
				array1.push(temp1);
				
				if(hm.has(obj.productVO.productDivNum)){
					let tempdata = hm.get(obj.productVO.productDivNum);
					hm.set(obj.productVO.productDivNum, tempdata + obj.sellCount);
				}else{
					hm.set(obj.productVO.productDivNum, obj.sellCount);
				}
			}
			
		}
	});
});

$("#ajaxDate").click(function(event){
	event.preventDefault();
	
	let selectedDate = $("#getDate").val();
	
	let array1 = new Array();
	const hm = new Map();
	
	$.get({
		url:"./getSaleDay",
		data:{
			date:selectedDate
		},
		success:function(datas){
			for(let data of datas){
				let obj = JSON.parse(data);
				let productTitle = obj.productVO.productTitle;
				let sellCount = obj.sellCount;
				let temp1 = new Array();
				temp1.push(productTitle);
				temp1.push(sellCount);
				array1.push(temp1);
				
				if(hm.has(obj.productVO.productDivNum)){
					let tempdata = hm.get(obj.productVO.productDivNum);
					hm.set(obj.productVO.productDivNum, tempdata + obj.sellCount);
				}else{
					hm.set(obj.productVO.productDivNum, obj.sellCount);
				}
			}
			
		}
	});
});