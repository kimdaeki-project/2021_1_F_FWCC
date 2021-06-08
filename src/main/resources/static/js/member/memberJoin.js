/**
 * 
 */

// 전체 동의 checkbox ==============================
$("#sAgreeAllChecked").click(function(){
	let checked = $(this).prop("checked");
		$(".ec-base-chk").prop("checked", checked);
});

// 체크 하나 빠지면 전체동의 변동 ==================
$(".ec-base-chk").click(function(){
	$(this).each(function(){
		let result = true;
		let check = $(this).prop("checked");
		if(!check){
			result = false;
		}
		$("#sAgreeAllChecked").prop("checked", result);
	});
});

// 주소 API ======================================
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipCodeT').value = data.zonecode;
                document.getElementById("basicAddrT").value = roadAddr;
                document.getElementById("basicAddrT").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("basicAddrT").value = roadAddr+extraRoadAddr;
                } else {
                    document.getElementById("basicAddrT").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    
// MemberVO init =======================================
let username = "";
let password = "";
let passwordCheck = "";
let name = "";
let zipCode = "";
let basicAddr = "";
let detailAddr = "";
let phone0 = "";
let phone1 = "";
let phone2 ="";
let phone = "";
let email = "";
let birth_year = "";
let birth_month = "";
let birth_day = "";
let birth = "";
let smsAgree = "";
let emailAgree = "";

// ID 중복 체크 ===========================================================
$("#usernameCheck").click(function(){
	username = $("#usernameT").val();
	$.ajax({
		method:"POST",
		url:"./usernameCheck",
		data:{username:username},
		success:function(){
			
		}
	}); 
});


// table -> form ==========================================================
$(".joinBtn").click(function(){
	username = $("#usernameT").val();
	password = $("#passwordT").val();
	passwordCheck = $("#passwordCheckT").val();
	name = $("#nameT").val();
	zipCode = $("#zipCodeT").val();
	basicAddr = $("#basicAddrT").val();
	detailAddr = $("#detailAddrT").val();
	phone0 = $("#phone0").val();
	phone1 = $("#phone1").val();
	phone2 = $("#phone2").val();
	phone = phone0+"-"+phone1+"-"+phone2;
	email = $("#emailT").val();
	let birth = $("#birth_year").val()+"-"+$("#birth_month").val()+"-"+$("#birth_day").val();
	smsAgree = $("#is_sms0").prop("checked");
	emailAgree = $("#is_news_mail0").prop("checked");
	$.ajax({
		method:"POST",
		url:"./memberJoin",
		data:{
			username:username,
			password:password,
			name:name,
			phone:phone,
			email:email,
			birth:birth,
			smsAgree:smsAgree,
			emailAgree:emailAgree,
			zipCode:zipCode,
			basicAddr:basicAddr,
			detailAddr:detailAddr
		},
		success:function(result){
			result = result.trim();
			if(result != 0 ){
				alert("회원가입 성공");
				location.href="/";
			}
		}, // --- memberJoin success END ---
		error:function(){
			
		} // --- memberJoin error END ---
	}); // --- ajax END ---
});







