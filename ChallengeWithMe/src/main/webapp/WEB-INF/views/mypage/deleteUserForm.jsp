 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/infomodify.css" type="text/css">
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-3.7.1.min.js"></script>
    <script>
        $(function () {
            // 모달 및 버튼 요소 가져오기
            const openModalBtn = document.getElementById('openModal');
            //const closeModalBtn = document.getElementById('closeModal');
            const modal = document.getElementById('modal');
            // 유효성 검사 함수
            function validateForm() {
                const items = document.querySelectorAll('.check');

                // 입력값 유효성 검사
                for (let i = 0; i < items.length; i++) {
                    if (items[i].value.trim() === '') {
                        const placeholder = items[i].getAttribute('placeholder');
                        alert(placeholder + ' 을(를) 입력해주세요.');
                        items[i].focus();
                        return false;
                    }
                }

                // 비밀번호 일치 검사
                if ($('#pwd').val() !== $('#cpwd').val()) {
                    alert('비밀번호와 비밀번호 확인이 불일치합니다.');
                    $('#cpwd').val('').focus();
                    return false;
                }

                // 모든 검사를 통과하면 true 반환
                return true;
            }

            // 모달 열기
            openModalBtn.addEventListener('click', () => {
                if (validateForm()) {
                    modal.style.display = 'block'; // 유효성 검사 통과 시 모달 열기
                }
            });

            /*// 모달 닫기
            closeModalBtn.addEventListener('click', () => {
                modal.style.display = 'none';
            });*/

            // 모달 외부 클릭 시 닫기
            window.addEventListener('click', (event) => {
                if (event.target === modal) {
                    modal.style.display = 'none';
                }
            });
        });
    </script>
</head>
<body>

<!-- 모달 창 -->
	<h2>${ xuser.nickname }님 회원탈퇴</h2>
	<div class="container-wrapper">
		<div class="container2" id="container2">
			<div class="form-container2" id="detail-container">
			    <form id="register_form2" action="deleteUser.do" method="post">
			      <h1>회원탈퇴</h1>
			      <label for=id></label>
			      <input placeholder="아이디" type="text" name="id" id="id" maxlength="12" class="check">
			      <label for=email></label>
			      <input placeholder="이메일" type="email" name="email" id="email" maxlength="50" class="check">
			      <label for=pwd></label>
			      <input placeholder="비밀번호" type="password" name="pwd" id="pwd" maxlength="16" class="check">
			      <label for=cpwd></label>
			      <input placeholder="비밀번호 확인" type="password" name="cpwd" id="cpwd" maxlength="16" class="check">
			      <input type="button" value="회원탈퇴" id="openModal">
			      <input class="main" type="button" value="마이페이지"
			      onclick="location.href='${ pageContext.request.contextPath }/mypage/mypage.do'">
<div id="modal" class="modal">
    <div class="modal-content">
        <h1>정말 회원탈퇴를 하시겠습니까?</h1>
        <p>확인 버튼을 클릭 시 회원탈퇴가 진행됩니다.</p>
        <input type="submit" value="확인">
    </div>
</div>
			    </form>
			 </div>
		</div>
	</div>
</body>
</html>