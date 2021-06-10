
var chart1 = bb.generate({
	data:{
		columns:[
		],
		type: "bar",
	},
	bindto:"#chart1"
});

var chart2 = bb.generate({
	data:{
		columns:[
		],
		type: "pie",
	},
	bindto:"#chart2"
});

$(document).ready(function(){
	
	let array1 = new Array();
	let array2 = new Array();
	
	$.get({
		async:false,
		url:"./getSaleDay",
		data:{
			date:""
		},
		success:function(datas){
			console.log(datas);
			for(let data of datas){
				console.log(data);
				let obj = JSON.parse(data);
				let productTitle = obj.productVO.productTitle;
				let saleCount = obj.saleCount;
				let finalPrice = obj.productVO.finalPrice*saleCount;
				let temp1 = new Array();
				let temp2 = new Array();
				console.log(productTitle);
				console.log(saleCount);
				temp1.push(productTitle);
				temp1.push(saleCount);
				temp2.push(productTitle);
				temp2.push(finalPrice);
				array1.push(temp1);
				array2.push(temp2);
			}
			chart1.load({
				columns:array1
			});
			chart2.load({
				columns:array2
			});
		}
	});
});

$("#ajaxDate").click(function(event){
	event.preventDefault();
	
	let selectedDate = $("#getDate").val();
	
	$.get({
		async:false,
		url:"./getSaleDay",
		data:{
			date:selectedDate
		},
		success:function(datas){
			let array1 = new Array();
			let array2 = new Array();
			for(let data of datas){
				let obj = JSON.parse(data);
				let productTitle = obj.productVO.productTitle;
				let saleCount = obj.saleCount;
				let finalPrice = obj.productVO.finalPrice*saleCount;
				let temp1 = new Array();
				let temp2 = new Array();
				temp1.push(productTitle);
				temp1.push(saleCount);
				temp2.push(productTitle);
				temp2.push(finalPrice);
				array1.push(temp1);
				array2.push(temp2);
			}
			chart1.load({
				columns:array1
			});
			chart2.load({
				columns:array2
			});
		}
	});
});