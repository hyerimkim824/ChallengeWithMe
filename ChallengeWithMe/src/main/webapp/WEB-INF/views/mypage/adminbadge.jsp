<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뱃지 등록</title>
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    let photo_path = $('.my-photo').attr('src'); // 처음 화면에 보여지는 이미지 읽기

    // 이미지 미리보기
    $('#photo').change(function() {
        let my_photo = this.files[0];
        if (!my_photo) {
            $('.my-photo').attr('src', photo_path);
            return;
        }

        if (my_photo.size > 1024 * 1024) {
            alert(Math.round(my_photo.size / 1024) + 'kbytes (1024kbytes까지만 업로드 가능)');
            $('.my-photo').attr('src', photo_path);
            $(this).val(''); // 선택한 파일 정보 지우기
            return;
        }

        const reader = new FileReader();
        reader.readAsDataURL(my_photo);
        reader.onload = function() {
            $('.my-photo').attr('src', reader.result);
        };
    });

    // 이미지 전송
    $('#photo_submit').click(function() {
        if ($('#photo').val() == '') {
            alert('파일을 선택하세요!');
            $('#photo').focus();
            return;
        }

        // FormData 생성
        const form_data = new FormData();

        // 파일 추가
        form_data.append('photo', $('#photo')[0].files[0]);

        // 텍스트 필드 값 추가
        form_data.append('bg_name', $('#bg_name').val());
        form_data.append('bg_desc', $('#bg_desc').val());

        // 서버와 통신
        $.ajax({
            url: '${ pageContext.request.contextPath }/mypage/adminbadge.do',
            type: 'post',
            data: form_data,
            dataType: 'json',
            contentType: false, // 데이터를 문자열로 변환하지 않음
            processData: false, // 데이터를 쿼리 문자열로 변환하지 않음
            success: function(param) {
               	if (param.result == 'success') {
                    alert('뱃지 등록 완료');
               	}
            },
            error: function() {
                alert('네트워크 오류 발생');
            }
        });
    });

    // 이미지 미리보기 취소
    $('#photo_reset').click(function() {
        $('.my-photo').attr('src', photo_path);
        $('#photo').val('');
        $('#bg_name').val(''); // 이름 초기화
        $('#bg_desc').val(''); // 설명 초기화
    });
});
</script>
</head>
<body>
	<div>
		<input type="file" id="photo" 
		accept="image/gif,image/png,image/jpeg" class="my-photo">
		<input type="text" placeholder="뱃지 이름" id="bg_name">
		<input type="text" placeholder="뱃지 설명" id="bg_desc">
		<input type="button" id="photo_submit" value="등록">
		<input type="button" id="photo_reset" value="취소">
	</div>
</body>
</html>