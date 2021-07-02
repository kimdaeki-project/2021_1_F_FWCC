//시작하자마자 아임포트 설정이 될 수 있도록 처리
$(document).ready(function(){
	var IMP = window.IMP;
	IMP.init('imp27607634');
});

//쿠폰을 골랐다면 그만큼의 값이 변하도록 해주어야 한다.
$("#couponSelector").change(function(){
	const disRate = Number($("#couponSelector option:selected").attr("data-disRate"));
	const originTotPrice = Number($("#purchasebutton").attr("data-originTotPrice"));
	const mileSp = Number($("#purchasebutton").attr("data-mileSp"));
	const sale = Math.floor(originTotPrice*disRate/100/100)*100;
	const thisvalue = Number($("#couponSelector option:selected").val());
	
	$("#cuSalePrice1").text(sale);
	$("#cuSalePrice2").text(sale);
	$("#delPriceInsert").text(mileSp+sale)
	$("#purchasebutton").attr("data-cuSale", sale);
	$("#onsaleprice").text(mileSp+sale);
	$("#endprice").text(originTotPrice-(mileSp+sale));
	$("#forUserPrice").text(originTotPrice-(mileSp+sale));
	$("#purchasebutton").attr("data-cuNum", thisvalue);
});

$("#mileAccept").click(function(event){
	event.preventDefault();
	
	const originTotPrice = Number($("#purchasebutton").attr("data-originTotPrice"));
	const mileSp = Number($("#useMile").val());
	const sale = Number($("#purchasebutton").attr("data-cusale"));
	
	if(mileSp<0){
		swal({
			icon:"error",
			title:"잘못된 입력입니다.",
			text:"-값을 입력할 수 없습니다."
		});
		$("#useMile").val(0);
		return;
	}else if(mileSp>2000){
		swal({
			icon:"error",
			title:"잘못된 입력입니다.",
			text:"마일리지는 2000원 까지 사용할 수 있습니다."
		});
		$("#useMile").val(2000);
		return;
	}
	
	$("#delPriceInsert").text(mileSp+sale);
	$("#purchasebutton").attr("data-milesp", mileSp);
	$("#onsaleprice").text(mileSp+sale);
	$("#endprice").text(originTotPrice-(mileSp+sale));
	$("#forUserPrice").text(originTotPrice-(mileSp+sale));
});

$("#addressAllCheck").click(function(){
	let value = $("#addressAllCheck").prop("checked");
	
	$(".addressSelect").each(function(){
		$(this).prop("checked", value);
	});
});

$(".addressSelect").click(function(){
	let check = true;
	
	$(".addressSelect").each(function(){
		if(!$(this).prop("checked")){
			check=false;
		}
	});
	
	$("#addressAllCheck").prop("checked", check);
});

$("#selectAddressDelete").click(function(event){
	event.preventDefault();
	let addrNums = new Array();
	let count = 0;
	
	$(".addressSelect").each(function(){
		if($(this).prop("checked")){
			addrNums.push($(this).attr("data-addrNum"));
			count++;
		}
	});
	
	if(count<1){
		swal({
			icon:"warning",
			title:"삭제 불가",
			text:"삭제할 주소가 없습니다."
		});
		return;
	}
	
	$.get({
		traditional:true,
		url:"/address/deleteSelect",
		data:{
			addrNums:addrNums
		},
		success:function(result){
			if(result>0){
				$.get({
					url:"/address/getAddressList",
					success:function(result){
						if(result[0]==""){
							let nothingthere = "<tr><td colspan='6' style='text-align: center;'>등록된 주소가 없습니다.</td></tr>";
							$("#settingAddressList").empty();
							$("#settingAddressList").append(nothingthere);
						}else{
							$("#settingAddressList").empty();
							for(let datas of result){
								let data = JSON.parse(datas);
								
								let trform = '<tr data-addrNum="'+data.addrNum+'"></tr>';
								$("#settingAddressList").append(trform);
								let target = $("#settingAddressList").find('tr[data-addrNum="'+data.addrNum+'"]');
								
								let tdform = '<td><input type="checkbox" class="addressSelect" data-addrNum="'+data.addrNum+'"></td>';
								target.append(tdform);
								tdform = '<td>'+data.addrName+'</td>';
								target.append(tdform);
								tdform = '<td>'+data.recipient+'</td>';
								target.append(tdform);
								tdform = '<td>'+data.addrPhone+'</td>';
								target.append(tdform);
								tdform = '<td>'+data.fullAddress+'</td>';
								target.append(tdform);
								tdform = '<td><button class="addressAdapt" data-addrNum='+data.addrNum+'>적용</button>'
										+'<br><button class="addressRepareForm" data-addrNum='+data.addrNum+'>수정</button></td>';
								target.append(tdform);
							}
						}
					}
				});
			}else{
				swal({
					icon:"error",
					title:"삭제 실패",
					text:"삭제하는 도중 서버에서 오류가 발생하였습니다."
				});
			}
		}
	});
	$("#recPeople").val('');
	$("#recZipcode").val('');
	$("#recBasic").val('');
	$("#recDetail").val('');
	$("#reccall1").val('');
	$("#reccall2").val('');
	$("#reccall3").val('');
});

$("#addressChapter1").on("click",".addressAdapt", function(){
	const addrNum = $(this).attr("data-addrNum");
	
	$.get({
		url:"/address/getSelectOne",
		data:{
			addrNum:addrNum
		},
		success:function(result){
			if(result==""){
				swal({
					icon:"error",
					title:"에러발생",
					text:"주소를 가져오는중 에러가 발생하였습니다."
				});
			}else{
				let address = JSON.parse(result);
				$("#recPeople").val(address.recipient);
				$("#recZipcode").val(address.zipCode);
				$("#recBasic").val(address.basicAddr);
				$("#recDetail").val(address.detailAddr);
				$("#recPeople").val(address.recipient);
				$("#reccall1").val(address.addrPhone1);
				$("#reccall2").val(address.addrPhone2);
				$("#reccall3").val(address.addrPhone3);
				$.modal.close();
			}
		}
	});
});

//주소 추가에 사용되는 폼으로 들어가기 위해서 사용한다.
$("#addressAddButton").click(function(event){
	event.preventDefault();
	
	$("#insertAddressTitle").val("");
	$("#insertAddrRecipient").val('');
	$("#sample2_postcode").val('');
	$("#sample2_address").val('');
	$("#sample2_detailAddress").val('');
	$("#insertAddrPhone1").val('');
	$("#insertAddrPhone2").val('');
	$("#insertAddrPhone3").val('');
	
	$("#addressChapter1").css("display","none");
	$("#addThisAddress").attr("data-role", "add");
	$("#addThisAddress").empty();
	$("#addThisAddress").text("등록");
	$("#addressChapter2").css("display","contents");
});

//주소 수정 폼에서 사용된다.
$("#addressChapter1").on("click",".addressRepareForm", function(event){
	event.preventDefault();
	const addrNum = $(this).attr("data-addrNum");
	let checking = true;
	
	$.get({
		url:"/address/getSelectOne",
		data:{
			addrNum:addrNum
		},
		success:function(data){
			if(data==""){
				swal({
					icon:"error",
					title:"에러 발생",
					text:"데이터를 가져오는 도중 문제가 발생하였습니다."
				});
				checking=false;
				return;
			}else{
				let addr=JSON.parse(data);
			
				$("#insertAddressTitle").val(addr.addrName);
				$("#insertAddrRecipient").val(addr.recipient);
				$("#sample2_postcode").val(addr.zipCode);
				$("#sample2_address").val(addr.basicAddr);
				$("#sample2_detailAddress").val(addr.detailAddr);
				$("#insertAddrPhone1").val(addr.addrPhone1);
				$("#insertAddrPhone2").val(addr.addrPhone2);
				$("#insertAddrPhone3").val(addr.addrPhone3);
			}
		}
	});
	
	if(!checking){
		return;
	}
	
	$("#addressChapter1").css("display","none");
	$("#addThisAddress").attr("data-role", "edit");
	$("#addThisAddress").empty();
	$("#addThisAddress").text("수정");
	$("#addThisAddress").attr("data-addrNum", addrNum);
	$("#addressChapter2").css("display","contents");
});

$("#cancleAddAddress").click(function(event){
	event.preventDefault();
	
	$("#addressChapter2").css("display","none");
	$("#addressChapter1").css("display","contents");
});

//주소 추가 혹은 수정폼
$("#addThisAddress").click(function(event){
	event.preventDefault();
	
	let error = false;	
	const addrNum = $(this).attr("data-addrNum");
	const addrName = $("#insertAddressTitle").val();
	const recipient = $("#insertAddrRecipient").val();
	const zipCode = $("#sample2_postcode").val();
	const basicAddr = $("#sample2_address").val();
	const detailAddr = $("#sample2_detailAddress").val();
	const addrPhone1 = $("#insertAddrPhone1").val();
	const addrPhone2 = $("#insertAddrPhone2").val();
	const addrPhone3 = $("#insertAddrPhone3").val();
	const addrPhone = addrPhone1+"-"+addrPhone2+"-"+addrPhone3;
	
	let reg = new RegExp("[^\\s]{1,10}");
	if(!reg.test(addrName)){
		swal({
			icon:"warning",
			title:"형식에러",
			text:"공백이 아닌 1~10글자를 입력해 주세요."
		});
		return;
	}
	if(!reg.test(recipient)){
		swal({
			icon:"warning",
			title:"형식에러",
			text:"공백이 아닌 1~10글자를 입력해 주세요."
		});
		return;
	}
	reg = new RegExp("[0-9]{4,5}");
	if(!reg.test(zipCode)){
		swal({
			icon:"warning",
			title:"형식에러",
			text:"주소를 입력해주세요."
		});
		return;
	}
	reg = new RegExp(".{1,}");
	if(!reg.test(basicAddr)){
		swal({
			icon:"warning",
			title:"형식에러",
			text:"주소를 입력해주세요."
		});
		return;
	}
	if(!reg.test(detailAddr)){
		swal({
			icon:"warning",
			title:"형식에러",
			text:"주소를 입력해주세요."
		});
		return;
	}
	reg = new RegExp("[0-9]{2,3}");
	if(!reg.test(addrPhone1)){
		swal({
			icon:"warning",
			title:"형식에러",
			text:"전화번호를 제대로 입력해 주세요."
		});
		return;
	}
	reg = new RegExp("[0-9]{3,4}");
	if(!reg.test(addrPhone2)){
		swal({
			icon:"warning",
			title:"형식에러",
			text:"전화번호를 제대로 입력해 주세요."
		});
		return;
	}
	if(!reg.test(addrPhone3)){
		swal({
			icon:"warning",
			title:"형식에러",
			text:"전화번호를 제대로 입력해 주세요."
		});
		return;
	}
	
	if($(this).attr("data-role")=='edit'){
		$.get({
			url:"/address/updateAddress",
			async:false,
			data:{
				addrNum:addrNum,
				addrName:addrName,
				recipient: recipient,
				zipCode: zipCode,
				basicAddr:basicAddr,
				detailAddr:detailAddr,
				addrPhone:addrPhone
			},
			success:function(data){
				if(data>0){
					return;
				}else{
					swal({
						icon:"error",
						title:"에러발생",
						text:"수정사항 적용에서 서버오류가 발생하였습니다."
					});
					error=true;
					return;
				}
			}
		});
	}else{
		$.get({
			url:"/address/checkCount",
			async:false,
			success:function(data){
				if(data>10){
					swal({
						icon:"warning",
						title:"등록 제한",
						text:"주소는 10개까지 등록할 수 있습니다."
					});
					error=true;
					return;
				}else if(data==null){
					swal({
						icon:"error",
						title:"에러발생",
						text:"데이터를 가져오는 도중 에러가 발생하였습니다."
					});
					error=true;
					return;
				}else{
					$.get({
						url:"/address/setAddress",
						async:false,
						data:{
							addrName:addrName,
							recipient: recipient,
							zipCode: zipCode,
							basicAddr:basicAddr,
							detailAddr:detailAddr,
							addrPhone:addrPhone
						},
						success:function(data){
							if(data>0){
								return;
							}else{
								swal({
									icon:"error",
									title:"에러발생",
									text:"주소를 추가하는 과정에서 서버오류가 발생하였습니다."
								});
								error=true;
								return;
							}
						}
					});
				}
			}
		});
	}
	
	if(error){
		return;
	}else{
		$.get({
			url:"/address/getSelectRecent",
			async:false,
			success:function(data){
				if(data==''){
					$("#recPeople").val('');
					$("#recZipcode").val('');
					$("#recBasic").val('');
					$("#recDetail").val('');
					$("#reccall1").val('');
					$("#reccall2").val('');
					$("#reccall3").val('');
					return;
				}else{
					let addr = JSON.parse(data);
					
					$("#recPeople").val(addr.recipient);
					$("#recZipcode").val(addr.zipCode);
					$("#recBasic").val(addr.basicAddr);
					$("#recDetail").val(addr.detailAddr);
					$("#reccall1").val(addr.addrPhone1);
					$("#reccall2").val(addr.addrPhone2);
					$("#reccall3").val(addr.addrPhone3);
				}
			}
		});
	}
	
	$.get({
		url:"/address/getAddressList",
		async:false,
		success:function(result){
			if(result[0]==""){
				let nothingthere = "<tr><td colspan='6' style='text-align: center;'>등록된 주소가 없습니다.</td></tr>";
				$("#settingAddressList").empty();
				$("#settingAddressList").append(nothingthere);
			}else{
				$("#settingAddressList").empty();
				for(let datas of result){
					let data = JSON.parse(datas);
					let trform = '<tr data-addrNum="'+data.addrNum+'"></tr>';
					$("#settingAddressList").append(trform);
					let target = $("#settingAddressList").find('tr[data-addrNum="'+data.addrNum+'"]');
					
					let tdform = '<td><input type="checkbox" class="addressSelect" data-addrNum="'+data.addrNum+'"></td>';
					target.append(tdform);
					tdform = '<td>'+data.addrName+'</td>';
					target.append(tdform);
					tdform = '<td>'+data.recipient+'</td>';
					target.append(tdform);
					tdform = '<td>'+data.addrPhone+'</td>';
					target.append(tdform);
					tdform = '<td>'+data.fullAddress+'</td>';
					target.append(tdform);
					tdform = '<td><button class="addressAdapt" data-addrNum='+data.addrNum+'>적용</button>'
							+'<br><button class="addressRepareForm" data-addrNum='+data.addrNum+'>수정</button></td>';
					target.append(tdform);
				}
			}
		}
	});
	
	$("#addressChapter2").css("display","none");
	$("#addressChapter1").css("display","contents");
});

//구매버튼 누르기 전에 일단 form들에 자료가 전부 제대로 있는지 확인부터 해야한다.
$("#purchasebutton").click(function(event){
	event.preventDefault();
	
	if(!$("#agreepayment").prop("checked")){
		swal({
			icon:"warning",
			title:"필수 입력사항 누락",
			text:"약관동의에 체크해 주세요."
		});
		return;
	}
	
	const date = new Date();
	const merchant_uid = date.getTime() + '-' + date.getFullYear()+date.getMonth()+date.getDate()+date.getHours()
											+date.getMinutes()+date.getSeconds();
	const totPrice = Number($(this).attr("data-originTotPrice"));
	const amount = totPrice - Number($("#purchasebutton").attr("data-cuSale")) - Number($("#purchasebutton").attr("data-mileSp"));
	const name = $(this).attr("data-name");
	const buyeremail = $("#buyerEmail1").val()+"@"+$("#buyerEmail2").val()+"."+$("#buyerEmail3").val();
	const buyername = $("#buyerName").val();
	const buyertel = $("#buyerPhone1").val()+"-"+$("#buyerPhone2").val()+"-"+$("#buyerPhone3").val();
	const buyeraddr = $("#buyerBasic").val()+' '+$("#buyerDetail").val();
	const buyerpostcode = $("#buyerZipcode").val();
	const cuNum = Number($("#purchasebutton").attr("data-cuNum"));
	const destination = "(" + $("#recZipcod").val() + ")" + $("#recBasic").val() + " "+$("#recDetail").val();
	const orderMessage = $("#orderMessage").val();
	let changeMiles = new Array();
	changeMiles.push(Number($("#purchasebutton").attr("data-mileSp")));
	changeMiles.push(Number($("#purchasebutton").attr("data-changeMile")));
	let productNums = new Array();
	let pInfoNums = new Array();
	let productCounts = new Array();
	let finalPrices = new Array();
	let cartNums = new Array();
	$(".productDataList").each(function(){
		productNums.push(Number($(this).attr("data-productNum")));
		pInfoNums.push(Number($(this).attr("data-pInfoNum")));
		productCounts.push(Number($(this).attr("data-productCount")));
		finalPrices.push(Number($(this).attr("data-finalprice")));
		cartNums.push(Number($(this).attr("data-cartNum")));
	});
	
	let reg = new RegExp("[0-9]{4,5}");
	if(!reg.test($("#recZipcode").val())){
		swal({
			icon:"warning",
			title:"필수 입력사항 누락",
			text:"주소를 등록해주세요."
		});
		return;
	}
			
	IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid : merchant_uid,
	    name : name,
	    amount : amount,
	    buyer_email : buyeremail,
	    buyer_name : buyername,
	    buyer_tel : buyertel,
	    buyer_addr : buyeraddr,
	    buyer_postcode : buyerpostcode
	}, function(rsp) {
		if(rsp.success){
			$.ajax({
				type:"post",
				url:"/order/vertify/"+rsp.imp_uid,
				success:function(data){
					if(data.response.amount == rsp.paid_amount){
						$.post({
							url:"./orderComplete",
							traditional:true,
							data:{
								cuNum: cuNum,
								orderNum: merchant_uid,
								totPrice: totPrice,
								spPrice: amount,
								destination: destination,
								orderMessage: orderMessage,
								changeMiles: changeMiles,
								productNums: productNums,
								pInfoNums: pInfoNums,
								productCounts: productCounts,
								finalPrices: finalPrices,
								orderName: name,
								cartNums: cartNums
							},
							success:function(){
								$("body").append("<form id='sendOrderResult' action='./orderResult'></form>");
								$("#sendOrderResult").append("<input type='hidden' name='orderNum' value='"+merchant_uid+"'>");
								$("#sendOrderResult").submit();
							},
							error:function(){
								swal({
									icon:"error",
									title:"통신오류",
									text:"결제 결과를 저장하는 도중 에러가 발생하였습니다. 자정에 자동 환불됩니다."
								});
							}
						});
					}else{
						swal({
							icon:"error",
							title:"결제오류",
							text:"결제해야할 금액과 결제된 금액이 다릅니다."
						});
					}
				}
			});
		}else{
			swal({
				icon:"error",
				title:"결제오류",
				text:"결제 도중 문제가 발생하였습니다."
			});
		}
	});
});

 // 우편번호 찾기 화면을 넣을 element
var element_layer = document.getElementById('layer');

function closeDaumPostcode() {
    // iframe을 넣은 element를 안보이게 한다.
    element_layer.style.display = 'none';
}

function sample2_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수
            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample2_postcode').value = data.zonecode;
            document.getElementById("sample2_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample2_detailAddress").focus();

            // iframe을 넣은 element를 안보이게 한다.
            // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
            element_layer.style.display = 'none';
        },
        width : '100%',
        height : '100%',
        maxSuggestItems : 5
    }).embed(element_layer);

    // iframe을 넣은 element를 보이게 한다.
    element_layer.style.display = 'block';
    // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
    initLayerPosition();
}

// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
function initLayerPosition(){
    var width = 450; //우편번호서비스가 들어갈 element의 width
    var height = 600; //우편번호서비스가 들어갈 element의 height
    var borderWidth = 5; //샘플에서 사용하는 border의 두께

    // 위에서 선언한 값들을 실제 element에 넣는다.
    element_layer.style.width = width + 'px';
    element_layer.style.height = height + 'px';
    element_layer.style.border = borderWidth + 'px solid';
    // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
    element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
    element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
}