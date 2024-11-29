<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이첼린지 메인</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/style.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/khr.css" type="text/css">
<script type="text/javascript"
	src="${ pageContext.request.contextPath }/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/pvchallengetime.js"></script>
<script type="text/javascript">
	$(function() {
		$('#photo_btn').click(function() {
			$('#photo_choice').show();
			$(this).hide();//수정 버튼 감추기
		});

		//이미지 미리 보기
		let photo_path = $('.my-photo').attr('src');//처음 화면에 보여지는 이미지 읽기
		$('#photo').change(
				function() {
					let my_photo = this.files[0];
					if (!my_photo) {
						//선택을 취소하면 원래 처음 화면으로 되돌림
						$('.my-photo').attr('src', photo_path);
						return;
					}

					if (my_photo.size > 1024 * 1024) {
						alert(Math.round(my_photo.size / 1024)
								+ 'kbytes(1024kbytes까지만 업로드 가능)');
						$('.my-photo').attr('src', photo_path);
						$(this).val('');//선택한 파일 정보 지우기
						return;
					}

					//화면에서 이미지 미리보기
					const reader = new FileReader();
					reader.readAsDataURL(my_photo);

					reader.onload = function() {
						$('.my-photo').attr('src', reader.result);
					};
				});//end of change

		//이미지 전송
		$('#photo_submit').click(function() {
			if ($('#photo').val() == '') {
				alert('파일을 선택하세요!');
				$('#photo').focus();
				return;
			}
			//파일 전송
			const form_data = new FormData();
			//업로드할 파일은 $('#photo').files[0]으로 호출할 수
			//없음
			//document.getElementById('photo').files[0] 또는
			//$('#photo')[0].files[0]
			form_data.append('photo', $('#photo')[0].files[0]);

			//서버와 통신
			$.ajax({
				url : 'pvChallengePhotoUpdate.do',
				type : 'post',
				data : form_data,
				dataType : 'json',
				contentType : false,//데이터 객체를 문자열로 바꿀지에 대한 값. true이면 일반문자
				processData : false,//해당 타입을 true로 하면 일반 text로 구분
				success : function(param) {
					if (param.result == 'logout') {
						alert('로그인 후 사용하세요!');
					} else if (param.result == 'success') {
						alert('인증 사진이 수정되었습니다.');
						//수정된 이미지 정보 저장
						photo_path = $('.my-photo').attr('src');
						$('#photo').val('');
						$('#photo_choice').hide();
						$('#photo_btn').show();//수정 버튼 표시
					} else {
						alert('파일 전송 오류 발생');
					}
				},
				error : function() {
					alert('네트워크 오류 발생');
				}
			});
		});//end of click

		//이미지 미리보기 취소
		$('#photo_reset').click(function() {
			//초기 이미지 표시
			//이미지 미리보기 전 이미지로 되돌리기
			$('.my-photo').attr('src', photo_path);
			$('#photo').val('');
			$('#photo_choice').hide();
			$('#photo_btn').show();//수정 버튼 표시
		});

	});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<h1>사진 인증</h1>
	
	<div class="page-main">
	<div class="content-main">
		<h2>사진 인증</h2>
		
		
		<!-- 타이머 관련 -->
		 <!-- 타이머 시작 버튼 -->
    <!-- 타이머 상태 표시 -->
    <div class="status" id="status">타이머가 아직 시작되지 않았습니다.</div>
    
    <!-- 타이머 표시 -->
    <div class="timer" id="timerDisplay"></div>
    
		</div>
		<div class="mypage-div">
			<h3>인증사진</h3>
			<ul>
				<li>
					<c:if test="${empty xuser.photo}">
					<img src="${pageContext.request.contextPath}/images/logo.png" 
					                  width="200" height="200" class="my-photo">
					</c:if>
					<c:if test="${!empty xuser.photo}">
					<img src="${pageContext.request.contextPath}/upload/${member.photo}" 
					                  width="200" height="200" class="my-photo">
					</c:if>
				</li>
				<li>
					<div class="align-center">
						<input type="button" value="수정" id="photo_btn">
					</div>
					<div id="photo_choice" style="display:none;">
						<input type="file" id="photo" 
						            accept="image/gif,image/png,image/jpeg"><br>
						<input type="button" value="전송" id="photo_submit">
						<input type="button" value="취소" id="photo_reset">            
					</div>
				</li>
			</ul>
		</div>
		
		
		<!--  <div class="mypage-div">
			<h3>내가 좋아하는 게시물 목록</h3>
			<table>
				<tr>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
				</tr>
				<c:forEach var="board" items="${boardList}">
				<tr>
					<td><a href="${pageContext.request.contextPath}/board/detail.do?board_num=${board.board_num}" target="_blank">${fn:substring(board.title,0,26)}</a></td>
	 				<td>${board.id}</td>
					<td>${board.reg_date}</td>
				</tr>	
				</c:forEach>
			</table>
		</div>-->
		
	</div>
</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>