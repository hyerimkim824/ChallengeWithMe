<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>시간 인증</title>
    
    
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/khr.css" type="text/css">
    <script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="${ pageContext.request.contextPath }/js/pvchallengetime2.js"></script>
    <style>
    body {
    font-family: 'Arial', sans-serif;
    background-color: #fff9e6; /* 부드러운 노란색 배경 */
    color: #333;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* 타이머 관련 스타일 */
.status {
    font-size: 18px;
    color: #ff9900; /* 주황색 */
    font-weight: bold;
    text-align: center;
    margin-top: 20px;
}

.timer {
    font-size: 40px;
    color: #ffcc00; /* 밝은 노란색 */
    font-weight: bold;
    text-align: center;
    margin-top: 10px;
}

/* 인증사진 1, 2 관련 스타일 */
.mypage-div1, .mypage-div2 {
    background-color: #fff8e1; /* 밝은 노란색 배경 */
    padding: 20px;
    margin-top: 20px;
    border-radius: 10px;
    border: 1px solid #ffcc00; /* 노란색 테두리 */
}

.mypage-div1 h3, .mypage-div2 h3 {
    font-size: 22px;
    color: #ff6600; /* 중간 주황색 */
    text-align: center;
}

ul {
    list-style: none;
    padding: 0;
}

li {
    margin-bottom: 10px;
    text-align: center;
}

.my-photo_1, .my-photo_2 {
    border-radius: 10px;
    border: 3px solid #ffcc00; /* 사진 테두리 */
}

.align-center {
    text-align: center;
}

/* 버튼 스타일 */
input[type="button"] {
    background-color: #ffcc00; /* 노란색 배경 */
    color: white;
    font-size: 16px;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

input[type="button"]:hover {
    background-color: #ff6600; /* 호버 시 주황색 */
}

/* 사진 선택/수정 옵션 표시 */
#photo_choice_1, #photo_choice_2 {
    margin-top: 10px;
}

input[type="file"] {
    margin: 10px 0;
}

/* 페이지 레이아웃 */
.page-main {
    padding: 20px;
}

.content-main {
    text-align: center;
}

.pv-photo-set {
    display: flex;
    justify-content: center;  /* 수평 중앙 정렬 */
    align-items: center;      /* 수직 중앙 정렬 */
    gap: 100px;                /* 사진 간 간격 설정 */
    margin-top: 40px;         /* 상단 여백 */
} 
    
    </style>
    
    
    <script type="text/javascript">
        $(function() {
            // 첫 번째 사진 수정 버튼 클릭
            $('#photo_btn_1').click(function() {
                $('#photo_choice_1').show();
                $(this).hide(); // 수정 버튼 감추기
            });

            // 첫 번째 사진 미리보기
            let photo_path_1 = $('.my-photo_1').attr('src'); // 처음 화면에 보여지는 이미지 읽기
            $('#photo_1').change(function() {
                let my_photo = this.files[0];
                if (!my_photo) {
                    $('.my-photo_1').attr('src', photo_path_1);
                    return;
                }

                if (my_photo.size > 1024 * 1024) {
                    alert(Math.round(my_photo.size / 1024) + 'kbytes(1024kbytes까지만 업로드 가능)');
                    $('.my-photo_1').attr('src', photo_path_1);
                    $(this).val(''); // 선택한 파일 정보 지우기
                    return;
                }

                // 화면에서 이미지 미리보기
                const reader = new FileReader();
                reader.readAsDataURL(my_photo);

                reader.onload = function() {
                    $('.my-photo_1').attr('src', reader.result);
                };
            });

            // 첫 번째 사진 전송
            $('#photo_submit_1').click(function() {
                if ($('#photo_1').val() == '') {
                    alert('파일을 선택하세요!');
                    $('#photo_1').focus();
                    return;
                }
                // 파일 전송
                const form_data_1 = new FormData();
                form_data_1.append('photo', $('#photo_1')[0].files[0]);

                // 서버와 통신
                $.ajax({
                    url: 'pvChallengePhotoUpdate.do',
                    type: 'post',
                    data: form_data_1,
                    dataType: 'json',
                    contentType: false,
                    processData: false,
                    success: function(param) {
                        if (param.result == 'logout') {
                            alert('로그인 후 사용하세요!');
                        } else if (param.result == 'success') {
                            alert('인증 사진이 수정되었습니다.');
                            photo_path_1 = $('.my-photo_1').attr('src');
                            $('#photo_1').val('');
                            $('#photo_choice_1').hide();
                            $('#photo_btn_1').show(); // 수정 버튼 표시
                        } else {
                            alert('파일 전송 오류 발생');
                        }
                    },
                    error: function() {
                        alert('네트워크 오류 발생');
                    }
                });
            });

            // 첫 번째 사진 미리보기 취소
            $('#photo_reset_1').click(function() {
                $('.my-photo_1').attr('src', photo_path_1);
                $('#photo_1').val('');
                $('#photo_choice_1').hide();
                $('#photo_btn_1').show();
            });

            // 두 번째 사진 수정 버튼 클릭
            $('#photo_btn_2').click(function() {
                $('#photo_choice_2').show();
                $(this).hide(); // 수정 버튼 감추기
            });

            // 두 번째 사진 미리보기
            let photo_path_2 = $('.my-photo_2').attr('src'); // 처음 화면에 보여지는 이미지 읽기
            $('#photo_2').change(function() {
                let my_photo = this.files[0];
                if (!my_photo) {
                    $('.my-photo_2').attr('src', photo_path_2);
                    return;
                }

                if (my_photo.size > 1024 * 1024) {
                    alert(Math.round(my_photo.size / 1024) + 'kbytes(1024kbytes까지만 업로드 가능)');
                    $('.my-photo_2').attr('src', photo_path_2);
                    $(this).val(''); // 선택한 파일 정보 지우기
                    return;
                }

                // 화면에서 이미지 미리보기
                const reader = new FileReader();
                reader.readAsDataURL(my_photo);

                reader.onload = function() {
                    $('.my-photo_2').attr('src', reader.result);
                };
            });

            // 두 번째 사진 전송
            $('#photo_submit_2').click(function() {
                if ($('#photo_2').val() == '') {
                    alert('파일을 선택하세요!');
                    $('#photo_2').focus();
                    return;
                }
                // 파일 전송
                const form_data_2 = new FormData();
                form_data_2.append('photo', $('#photo_2')[0].files[0]);

                // 서버와 통신
                $.ajax({
                    url: 'pvChallengePhotoUpdate.do',
                    type: 'post',
                    data: form_data_2,
                    dataType: 'json',
                    contentType: false,
                    processData: false,
                    success: function(param) {
                        if (param.result == 'logout') {
                            alert('로그인 후 사용하세요!');
                        } else if (param.result == 'success') {
                            alert('인증 사진이 수정되었습니다.');
                            photo_path_2 = $('.my-photo_2').attr('src');
                            $('#photo_2').val('');
                            $('#photo_choice_2').hide();
                            $('#photo_btn_2').show(); // 수정 버튼 표시
                        } else {
                            alert('파일 전송 오류 발생');
                        }
                    },
                    error: function() {
                        alert('네트워크 오류 발생');
                    }
                });
            });

            // 두 번째 사진 미리보기 취소
            $('#photo_reset_2').click(function() {
                $('.my-photo_2').attr('src', photo_path_2);
                $('#photo_2').val('');
                $('#photo_choice_2').hide();
                $('#photo_btn_2').show();
            });
        });
    </script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <h1>시간 인증</h1>
<% 
    String chNum = request.getParameter("ch_num");
    out.println("Received ch_num: " + chNum);
%>
    <div class="page-main">
        <div class="content-main">
            <h2>시간 인증</h2>

            <!-- 타이머 관련 -->
            <div class="status" id="status">타이머가 아직 시작되지 않았습니다.</div>
            <div class="timer" id="timerDisplay"></div>

        </div>
        <div class="pv-photo-set">
            <!-- 첫 번째 인증사진 -->
            <div class="mypage-div1">
                <h3>인증사진 1</h3>
                <ul>
                    <li>
                        <c:if test="${empty xuser.photo}">
                            <img src="${pageContext.request.contextPath}/images/logo.png" width="200" height="200" class="my-photo_1">
                        </c:if>
                        <c:if test="${!empty xuser.photo}">
                            <img src="${pageContext.request.contextPath}/upload/${member.photo}" width="200" height="200" class="my-photo_1">
                        </c:if>
                    </li>
                    <li>
                        <div class="align-center">
                            <input type="button" value="수정" id="photo_btn_1">
                        </div>
                        <div id="photo_choice_1" style="display:none;">
                            <input type="file" id="photo_1" accept="image/gif,image/png,image/jpeg"><br>
                            <input type="button" value="전송" id="photo_submit_1">
                            <input type="button" value="취소" id="photo_reset_1">            
                        </div>
                    </li>
                </ul>
            </div>

             <!-- 두 번째 인증사진 -->
            <div class="mypage-div2">
                <h3>인증사진 2</h3>
                <ul>
                    <li>
                        <c:if test="${empty xuser.photo}">
                            <img src="${pageContext.request.contextPath}/images/logo.png" width="200" height="200" class="my-photo_2">
                        </c:if>
                        <c:if test="${!empty xuser.photo}">
                            <img src="${pageContext.request.contextPath}/upload/${member.photo}" width="200" height="200" class="my-photo_2">
                        </c:if>
                    </li>
                    <li>
                        <div class="align-center">
                            <input type="button" value="수정" id="photo_btn_2">
                        </div>
                        <div id="photo_choice_2" style="display:none;">
                            <input type="file" id="photo_2" accept="image/gif,image/png,image/jpeg"><br>
                            <input type="button" value="전송" id="photo_submit_2">
                            <input type="button" value="취소" id="photo_reset_2">            
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>