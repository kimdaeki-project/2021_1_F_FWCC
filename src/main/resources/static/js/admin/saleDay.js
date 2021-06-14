
$(document).ready(function(){
	
	google.charts.load("current", {packages:["corechart", "bar"]});
	
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
				
				let temp2 = obj.productVO.productDivisionVO.collab+" "+obj.productVO.productDivisionVO.productType;
				
				if(hm.has(temp2)){
					let tempdata = hm.get(temp2);
					hm.set(temp2, tempdata + obj.sellCount);
				}else{
					hm.set(temp2, obj.sellCount);
				}
			}
			let arr = Array.from(hm);
			let array2 = new Array();
			for(let data of array1){
				const r = Math.floor(Math.random()*256).toString(16);
				const g = Math.floor(Math.random()*256).toString(16);
				const b = Math.floor(Math.random()*256).toString(16);
				let rgb = "color:#";
				if(r.length==1){
					rgb+="0"+r;
				}else{
					rgb+=r;
				}
				if(g.length==1){
					rgb+="0"+g;
				}else{
					rgb+=g;
				}
				if(b.length==1){
					rgb+="0"+b;
				}else{
					rgb+=b;
				}
				data.push(rgb);
				array2.push(data);
			}
			
			google.charts.setOnLoadCallback(
				function(){
					drawChart1(arr);
					drawChart2(array2);
			});
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
				
				let temp2 = obj.productVO.productDivisionVO.collab+" "+obj.productVO.productDivisionVO.productType;
				
				if(hm.has(temp2)){
					let tempdata = hm.get(temp2);
					hm.set(temp2, tempdata + obj.sellCount);
				}else{
					hm.set(temp2, obj.sellCount);
				}
			}
			let arr = Array.from(hm);
			let array2 = new Array();
			for(let data of array1){
				const r = Math.floor(Math.random()*256).toString(16);
				const g = Math.floor(Math.random()*256).toString(16);
				const b = Math.floor(Math.random()*256).toString(16);
				let rgb = "color:#";
				if(r.length==1){
					rgb+="0"+r;
				}else{
					rgb+=r;
				}
				if(g.length==1){
					rgb+="0"+g;
				}else{
					rgb+=g;
				}
				if(b.length==1){
					rgb+="0"+b;
				}else{
					rgb+=b;
				}
				rgb+=";";
				data.push(rgb);
				array2.push(data);
			}
			
			google.charts.setOnLoadCallback(
				function(){
					drawChart1(arr);
					drawChart2(array2);
			});
		}
	});
});

function drawChart1(data1){
	let data = new google.visualization.DataTable();
	data.addColumn('string', 'product name');
	data.addColumn('number', 'sale count');
	data.addRows(data1);
	let options = {
		title: '일별 상품군 판매량',
		titleTextStyle: {
			fontSize:16
		},
		is3D: true,
		chartArea:{width:'100%', height:'80%', left:0},
		legend: {'position': 'bottom'}
	}
	
	var chart2 = new google.visualization.PieChart(document.getElementById('chart2'));
	chart2.draw(data,options);
}

function drawChart2(data2){
	let data = new google.visualization.DataTable();
	data.addColumn('string', 'product div name');
	data.addColumn('number', 'sale count');
	data.addColumn({type:"string",role: "style"});
	data.addRows(data2);
	var view = new google.visualization.DataView(data);
	let options = {
		title: '일별 상품 판매량',
		titleTextStyle: {
			fontSize:16
		},
		legend: {'position': 'none'},
		axes: {
			x:{
				0:{side:'top', label:'Percentage'}
			}
		},
		chartArea:{width:'90%', height:'80%'}
	}
	var chart1 = new google.visualization.ColumnChart(document.getElementById('chart1'));
	chart1.draw(view,options);
}