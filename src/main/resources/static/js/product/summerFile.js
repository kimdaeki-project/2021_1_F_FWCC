/**
 * 
 */

$("#contents").summernote({
			height:500,
			placeholder:'write here...'
			,
			callbacks :{
				onImageUpload: function(files){
					uploadFile(files);
				},// onImageUpload
				onMediaDelete: function(files){
					deleteFile(files);
				}
			}// callback
		});
	
		
	// $('#contents').summernote('insertImage', url, filename);	

function deleteFile(files){
	let fileName = $(files[0]).attr("src");
	fileName = fileName.substring(fileName.lastIndexOf("/")+1);
	$.post("./summerFileDelete",{fileName:fileName},function(result){
		console.log(result);
	});	
}

function uploadFile(files){
	const formData = new FormData(); // form 태그 작성
	formData.append('file',files[0]); // input type = "File" name="file"
	let fileName="";
	$.ajax({
		type:"post",
		url:"./summerFileUpload",
		data:formData,
		enctype:"multipart/form-data",
		cache:false,
		processData:false,
		contentType:false,
		success: function(result){
			fileName=result.trim();
			console.log(fileName);		
			fileName=result.trim();
            let node = '<img class="formoveimg" alt="" src="'+fileName+'">';
            $("#contents").summernote('pasteHTML', node);		
			//$("#contents").summernote('insertImage',fileName);
		}
	});
	
	/*
	fileName=result.trim();
            let node = '<img class="formoveimg" alt="'+fileName+'" src="'
                        +$("#rootcontext").val()+'/resources/uploaded/'+name+'/'+fileName+'">';
            $("#content").summernote('pasteHTML', node);
	*/
	
	
	
}