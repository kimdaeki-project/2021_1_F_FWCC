
HashMap = function(){
	this.map = new Array();
};

HashMap.prototype={
	put:function(key, value){
		this.map[key] = value;
	},
	get:function(key){
		return this.map[key];
	},
	getAll:function(){
		return this.map;
	},
	clear:function(){
		this.map = new Array();
	},
	getKeys:function(){
		let keys = new Array();
		for(let i in this.map){
			keys.put(i);
		}
		return keys;
	}
};

var chart1 = bb.generate({
	data:{
		columns:[
		],
		type: "pie",
	},
	bindto:"#chart1"
});

$(document).ready(function(){
	
	let array1 = new Array();
	
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
			}
			chart1.load({
				columns:array1
			});
		}
	});
});

$("#ajaxDate").click(function(event){
	event.preventDefault();
	
	let selectedDate = $("#getDate").val();
	
	let array1 = new Array();
	
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
			}
			chart1.unload();
			chart1.load({
				columns:array1
			});
		}
	});
});