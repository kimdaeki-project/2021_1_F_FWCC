
$(document).ready(function(){
	
	$.get({
		async:false,
		url:"./getSaleDate"
	});
	
	var chart = bb.generate({
		data:{
			columns:[
				["내부SF", 30, 200, 100, 400],
				["외부SF", 50, 20, 10, 40]
			],
			type: "bar",
		},
		bindto:"#chart"
	});
});