var chart1;
var chart2;
var chart3;

$(document).ready(function(){
	google.charts.load("current", {packages:["corechart", "bar"]});
	
	getData();
});

$("#ajaxDate").click(function(event){
	event.preventDefault();
	
	chart1.clearChart();
	chart2.clearChart();
	chart3.clearChart();
	getData();
});

function getData(){
	
	const date = $("#getDate").val();
	let first = new Date(date);
	first.setDate(first.getDate()-7);
	let count = 0;
	const arr1 = new Array();
	const arr2 = new Map();
	while(count<7){
		let tempdate = new Date(first);
		tempdate.setDate(first.getDate()+1);
		first.setDate(first.getDate()+1);
		tempdate = tempdate.getFullYear()+"-"+(tempdate.getMonth()+1)+"-"+tempdate.getDate();
		arr2.set(tempdate, 0);
		count++;
	}

	const hm = new Map();
	$.get({
		url:"./getSaleWeek",
		data:{
			date:date
		},
		success:function(result){
			for(let datas of result){
				let data = JSON.parse(datas);
				let temparr = new Array();
				
				//상품별로 판매한 수량
				temparr.push(data.productVO.productTitle);
				temparr.push(data.sellCount);
				temparr.push(randomRGB());
				arr1.push(temparr);
				
				//일별로 판매한 수량
				let tempdate = new Date(data.parseDate);
				tempdate = tempdate.getFullYear()+"-"+(tempdate.getMonth()+1)+"-"+tempdate.getDate();
				arr2.set(tempdate, arr2.get(tempdate)+data.sellCount);
				
				//상품 종류별로 판매한 수량
				let temp2 = data.productVO.productDivisionVO.collab + " " + data.productVO.productDivisionVO.productType;
				if(hm.has(temp2)){
					let tempdata = hm.get(temp2);
					hm.set(temp2, tempdata + data.sellCount);
				}else{
					hm.set(temp2, data.sellCount);
				}
			}
			let array2 = Array.from(arr2);
			let array1 = new Array();
			arr1.sort(function(a, b){
				return b[1]-a[1];
			});
			if(arr1.length<=10){
				array1 = arr1;
			}else{
				for(let i = 0 ; i < 10; i++){
					array1.push(arr1[i]);
				}
			}
			google.charts.setOnLoadCallback(
				function(){
					drawChart1(array1);
					drawChart2(array2);
					drawChart3(Array.from(hm));
				}
			);
		}
	});
}

//상품별로 판매한 수량을 chart로 나타내는 콜백함수
function drawChart1(arr){
	let data = new google.visualization.DataTable();
	data.addColumn('string', 'product div name');
	data.addColumn('number', 'sale count');
	data.addColumn({type:"string",role: "style"});
	data.addRows(arr);
	var view = new google.visualization.DataView(data);
	let options = {
		title: '주간 상품 판매량',
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
	chart1 = new google.visualization.ColumnChart(document.getElementById('chart1'));
	chart1.draw(view,options);
}

//일별로 판매한 수량을 chart로 나타내는 콜백함수
function drawChart2(arr){
	let data = new google.visualization.DataTable();
	data.addColumn("string", "date");
	data.addColumn("number", "sale count");
	data.addRows(arr);
	let options = {
		title: "주중 일간 판매량",
		titleTextStyle: {
			fontSize:16
		},
		legend: { position: 'bottom' },
		chartArea:{
			width:'90%',
			height:'80%'
		}
	}
	chart2 = new google.visualization.LineChart(document.getElementById('chart2'));
	chart2.draw(data, options);
}

//상품 종류별로 판매한 수량을 chart로 나타내는 콜백함수
function drawChart3(arr){
	let data = new google.visualization.DataTable();
	data.addColumn('string', 'product name');
	data.addColumn('number', 'sale count');
	data.addRows(arr);
	let options = {
		title: '주간 상품군 판매량',
		titleTextStyle: {
			fontSize:16
		},
		is3D: true,
		chartArea:{width:'100%', height:'80%', left:0},
		legend: {'position': 'bottom'}
	}
	chart3 = new google.visualization.PieChart(document.getElementById('chart3'));
	chart3.draw(data,options);
}

function randomRGB(){
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
	
	return rgb;
}