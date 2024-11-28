<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/sj.css" type="text/css">
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/register.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function() {
	let idChecked = 0
	let nickChecked = 0
	let emailChecked = 0
	
	$('#login_form').submit(function(){
		if($('#logid').val().trim()==''){
			alert('아이디를 입력하세요!')
			$('#logid').val('').focus()
			return false
		}
		if($('#logpwd').val().trim()==''){
			alert('비밀번호를 입력하세요!')
			$('#logpwd').val('').focus()
			return false
		}
	})

		// 아이디 중복체크
		$('#id_check').click(function(){
			if(!/^[A-Za-z0-9]{4,12}$/.test($('#id').val())){
				alert('아이디는 영문 숫자 포함 4 ~ 12자로 작성해주세요.')
				$('#id').val('').focus()
				return
			}
			
			// 서버 통신
			$.ajax({
				url:'checkDuplicatedId.do',
				type:'post',
				data:{id:$('#id').val()},
				dataType:'json',
				success:function(param){
					if(param.result == 'idNotFound'){
						idChecked = 1
						$('#message_id').css('color', '#000000').text('등록 가능한 ID입니다.')
					}else if(param.result == 'idDuplicated'){
						idChecked = 0
						$('#message_id').css('color', 'red').text('중복된 ID입니다.')
						$('#id').val('').focus()
					}else{
						idChecked = 0
						alert('아이디 중복 체크 오류 발생')
					}
				},
				error:function(){
					idChecked = 0
					alert('네트워크 오류 발생')
				}
			})
		})
			// 닉네임 중복체크
		$('#nick_check').click(function(){
			if(!/^[가-힣A-Za-z0-9]{2,15}$/.test($('#nick').val())){
				alert('닉네임은 한글 영문 숫자 포함 2 ~ 15자로 작성해주세요.')
				$('#nick').val('').focus()
				return
			}
			
			// 서버 통신
			$.ajax({
				url:'checkDuplicatedNick.do',
				type:'post',
				data:{nick:$('#nick').val()},
				dataType:'json',
				success:function(param){
					if(param.result == 'nickNotFound'){
						nickChecked = 1
						$('#message_nick').css('color', '#000000').text('등록 가능한 닉네임입니다.')
					}else if(param.result == 'nickDuplicated'){
						nickChecked = 0
						$('#message_nick').css('color', 'red').text('중복된 닉네임입니다.')
						$('#nick').val('').focus()
					}else{
						nickChecked = 0
						alert('닉네임 중복 체크 오류 발생')
					}
				},
				error:function(){
					nickChecked = 0
					alert('네트워크 오류 발생')
				}
			})
		})
		
		// 이메일 중복체크
		$('#email_check').click(function(){
			if(!/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test($('#email').val())){
				alert('이메일 형식에 맞게 작성해주세요.')
				$('#email').val('').focus()
				return
			}
			// 서버 통신
			$.ajax({
				url:'checkEmail.do',
				type:'post',
				data:{email:$('#email').val()},
				dataType:'json',
				success:function(param){
					if(param.result == 'emailNotFound'){
						emailChecked = 1
						$('#message_email').css('color', '#000000').text('가입 가능한 이메일입니다.')
					}else if(param.result == 'emailDuplicated'){
						emailChecked = 0
						$('#message_email').css('color', 'red').text('이미 가입된 이메일입니다.')
						$('#email').val('').focus()
					}else{
						emailChecked = 0
						alert('이메일 가입 체크 오류 발생')
					}
				},
				error:function(){
					emailChecked = 0
					alert('네트워크 오류 발생')
				}
			})
		})
		
		// 아이디 중복 안내 메시지 초기화 및 아이디 중복 값 초기화
		$('#register_from #id').keydown(function(){
			idChecked = 0
			$('#message_id').text('')
		})
		
		// 닉네임 중복 안내 메시지 초기화 및 닉네임 중복 값 초기화
		$('#register_from #nick').keydown(function(){
			nickChecked = 0
			$('#message_nick').text('')
		})
		
		// 이메일 이미 가입 안내 메시지 초기화 및 이메일 값 초기화
		$('#register_from #email').keydown(function(){
			emailChecked = 0
			$('#message_email').text('')
		})
		
		// 회원 정보 등록 유효성 체크
		$('#register_form2').submit(function (e) {
		    e.preventDefault(); // 기본 제출 동작 방지
		    
		   
		});
    $('#submit_all').click(function(e) {
        e.preventDefault(); // 기본 버튼 동작 방지
        
        const items = document.querySelectorAll('.check');
	    for (let i = 0; i < items.length; i++) {
	    const item = items[i];

	        // 필드가 비어 있는지 확인
	        if (item.value.trim() === '') {
	            alert(item.placeholder + ' 을(를) 입력해주세요.');
	            item.focus();
	            return false;
	        }

	        // ID 유효성 검사
	        if (item.id === 'id' && !/^[A-Za-z0-9]{4,12}$/.test(item.value)) {
	            alert('아이디는 영문, 숫자 포함 4 ~ 12자로 작성해주세요.');
	            item.value = '';
	            item.focus();
	            return false;
	        }
	        if(items[i].id === 'id' && idChecked == 0){
	        	alert('아이디 중복체크를 해주세요')
	        	return false
	        }

	        // 비밀번호 유효성 검사
	        if (item.id === 'pwd' && !/^[A-Za-z0-9]{8,16}$/.test(item.value)) {
	            alert('비밀번호는 영문, 숫자 포함 8 ~ 16자로 작성해주세요.');
	            item.value = '';
	            item.focus();
	            return false;
	        }

	        // 비밀번호 확인
	        if (item.id === 'cpwd') {
	            const pwd = document.getElementById('pwd').value;
	            if (item.value !== pwd) {
	                alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
	                item.value = '';
	                item.focus();
	                return false;
	            }
	        }

	        // 닉네임 유효성 검사
	        if (item.id === 'nick' && !/^[가-힣A-Za-z0-9]{2,15}$/.test(item.value)) {
	            alert('닉네임은 한글, 영문, 숫자 포함 2 ~ 15자로 작성해주세요.');
	            item.value = '';
	            item.focus();
	            return false;
	        }
	        
	        if(items[i].id === 'nick' && nickChecked == 0){
	        	alert('닉네임 중복체크를 해주세요')
	        	return false
	        }
	       

	        // 이메일 유효성 검사
	        if (item.id === 'email' && !/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(item.value)) {
	            alert('유효한 이메일 주소를 입력해주세요.');
	            item.value = '';
	            item.focus();
	            return false;
	        }
	        
	        if(items[i].id === 'email' && emailChecked == 0){
	        	alert('이메일 중복체크를 해주세요')
	        	return false
	        }
	        // 우편번호 유효성 검사
	        if (item.id === 'zipcode' && !/^[0-9]{5,5}$/.test(item.value)) {
	            alert('우편번호는 5자리 숫자로 작성해주세요.');
	            item.value = '';
	            item.focus();
	            return false;
	        }
	    }

        let form1 = document.getElementById('register_form1');
        let form2 = document.getElementById('register_form2');
        
        // FormData 객체 생성
        let formData = new FormData(form1); // 폼1 데이터 추가
        new FormData(form2).forEach((value, key) => { // 폼2 데이터 병합
            formData.append(key, value);
        });

        $.ajax({
            url: 'registerXuser.do',
            type: 'POST',
            data: formData,
            processData: false, // FormData 사용 시 필수
            contentType: false, // FormData 사용 시 필수
            success: function(response) {
                alert('회원가입 성공');
                console.log(response);
                location.href='${ pageContext.request.contextPath }/main/main.do'
            },
            error: function() {
                alert('회원가입 실패: 네트워크 오류 발생');
            }
        });
    });
});
</script>
</head>
<body>
	<h2>꼬박꼬박 챌린지 회원가입</h2>
	<div class="container-wrapper">
		<div class="container" id="container">
		  <div class="form-container sign-up-container">
		    <form action="#" id="register_form1">
		      <h1>회원가입</h1>
		      <div class="input-group">
			      <input type="text" id="id" name="id" maxlength="12" autocomplete="off" class="check" placeholder="아이디">
			      <input type="button" id="id_check" value="중복체크">
		      </div>
		      <span id="message_id"></span>
		      <input type="password" id="pwd" name="pwd" maxlength="16" class="check" placeholder="비밀번호">
		      <input type="password" id="cpwd" name="cpwd" maxlength="16" class="check" placeholder="비밀번호 확인">
		      <div class="input-group">
			      <input type="email" id="email" name="email" maxlength="50" class="check" placeholder="이메일">
			      <input type="button" id="email_check" value="중복체크">
		      </div>
		      <span id="message_email"></span>
		      <div class="input-group">
			      <input type="text" id="nick" name="nick" maxlength="15" class="check" placeholder="닉네임">
			      <input type="button" id="nick_check" value="중복체크">
		      </div>
		      <span id="message_nick"></span>
		      <button class="detail" id="detail">정보입력</button>
		    </form>
		  </div>
		  <div class="form-container sign-in-container">
		    <form id="login_form" action="login.do" method="post">
		      <h1>로그인</h1>
		      <span>계정 정보를 입력하세요</span>
		      <input type="text" name="logid" id="logid" maxlength="12" autocomplete="off" placeholder="아이디" />
		      <input type="password" name="logpwd" id="logpwd" maxlength="12" autocomplete="off" placeholder="비밀번호"/>
		      <a href="#">비밀번호 찾기</a>
		      <input type="submit" value="로그인">
		      <input class="main" type="button" value="메인으로"
		        onclick="location.href='${ pageContext.request.contextPath }/main/main.do'">
		    </form>
		  </div>
		  <div class="overlay-container">
		    <div class="overlay">
		      <div class="overlay-panel overlay-left">
		        <h1>환영합니다!</h1>
		        <p>아래 버튼을 클릭해 로그인을 하세요!</p>
		        <button class="ghost" id="signIn">로그인</button>
		      </div>
		      <div class="overlay-panel overlay-right">
		        <h1>환영합니다!</h1>
		        <p>아래 버튼을 클릭해 회원가입을 하세요!</p>
		        <button class="ghost" id="signUp">회원등록</button>
		      </div>
		    </div>
		  </div>
		</div>
		<div class="container2" id="container2">
			<div class="form-container2" id="detail-container">
			    <form id="register_form2" action="#" method="post">
			      <h1>개인정보</h1>
			      <input type="text" id="name" name="name" maxlength="6" class="check" placeholder="이름" />
			      <div class="radio-group">
	 				<label for="male" class="custom-radio">
				    	<input type="radio" id="male" name="gender" value="남" checked>
			    		<span>남자</span>
			  		</label>
			  		<label for="female" class="custom-radio">
			    		<input type="radio" id="female" name="gender" value="여">
			    		<span>여자</span>
			  		</label>
				</div>
			      <input type="date" id="birth" name="birth" class="check" placeholder="생년월일" />
			      <input type="text" id="tel" name="tel" maxlength="11" class="check" placeholder="전화번호" />
			      <input type="text" name="zipcode" id="zipcode" maxlength="5" class="check" autocomplete="off" placeholder="우편번호" />
			      <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
			      <input type="text" name="address1" id="address1" maxlength="30" class="check" placeholder="주소" />
			      <input type="text" name="address2" id="address2" maxlength="30" class="check" placeholder="나머지주소" />
			      <input id="submit_all" type="button" value="회원가입">
			    </form>
<!-- 다음 우편번호 API 시작 -->
<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:5;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function execDaumPostcode() {
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
                    //(주의)address1에 참고항목이 보여지도록 수정
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //(수정) document.getElementById("address2").value = extraAddr;
                
                } 
                //(수정) else {
                //(수정)    document.getElementById("address2").value = '';
                //(수정) }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                //(수정) + extraAddr를 추가해서 address1에 참고항목이 보여지도록 수정
                document.getElementById("address1").value = addr + extraAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address2").focus();

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
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 2; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>
<!-- 다음 우편번호 API 끝 -->
			</div>
		</div>
	</div>
</body>
</html>