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
	const date = $("#getMonth").val();
	
	$.get({
		url:"./getSaleMonth",
		data:{
			date:date
		},
		success:function(result){
			
		}
	});
}