$(document).ready(function(){
	$.get({
		url:"/cart/counting",
		success:function(result){
			$("#navbar-cartspan").text(result);
		}
	});
	
	
	$.get({
		url:"/product/getDivisions",
		success:function(result){
			let hostIndex = location.href.indexOf(location.host)+location.host.length;
			let contextPath = location.href.substring(hostIndex,location.href.lastIndexOf('/',hostIndex+1));
			let step;
			for(step=0;step<result.length;step++){
				if(result[step]!="none"){
					$("#navbar-colaul").append('<li><a href="'+contextPath+'/product/list?collab='+result[step]+'&productType=&name='+result[step]+'&division=&sortStandard=&sale=false"> '+result[step]+' X FWCC </a></li>')
					
				}
			}
			
			
		}
	})
});