/**
 * 
 */

$("#contents").summernote({
			height:500,
			placeholder:'write here...',
			callbacks :{
				onImageUpload: function(files){
					uploadFile(files);
				},// onImageUpload
				onMediaDelete: function(files){
					deleteFile(files);
				}
			}// callback
		});
		
		

function deleteFile(files){
	let fileName = $(files[0]).attr("src");
	fileName = fileName.substring(fileName.lastIndexOf("/")+1);
	let productNum = $("#pNum").attr("title");
	$.post("./summerFileDelete",{fileName:fileName,productNum:productNum},function(result){
		console.log(result);
	});	
}

function uploadFile(files){
	const pNum = $("#pNum").attr("title");
	console.log(pNum)
	const formData = new FormData(); // form 태그 작성
	formData.append('file',files[0]); // input type = "File" name="file"
	formData.append('productNum',pNum);
	$.ajax({
		type:"post",
		url:"./summerFileUpload",
		data:formData,
		enctype:"multipart/form-data",
		cache:false,
		processData:false,
		contentType:false,
		success: function(result){
           // $("#contents").summernote('insertImage', result);
			// console.log(result);	
			//$("#contents").summernote('insertImage',fileName);
			 let node = '<img class="formoveimg" src="'+result+'">';
            $("#contents").summernote('pasteHTML', node);
		}
	});
	
	
}