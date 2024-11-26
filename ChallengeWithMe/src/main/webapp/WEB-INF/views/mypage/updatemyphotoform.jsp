<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 사진 수정</title>
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//이미지 미리 보기
	let photo_path = $('.my-photo').attr('src'); //처음 화면에 보여지는 이미지 읽기
	$('#photo').change(function(){
		let my_photo = this.files[0];
		if(!my_photo){
			//선택을 취소하면 원래 처음 화면으로 되돌림
			$('.my-photo').attr('src',photo_path);
			return;
		}

		if(my_photo.size > 1024*1024){
			alert(Math.round(my_photo.size/1024) 
					 + 'kbytes(1024kbytes까지만 업로드 가능)');
			$('.my-photo').attr('src',photo_path);
			$(this).val(''); //선택한 파일 정보 지우기
			return;
		}

		//화면에서 이미지 미리보기
		const reader = new FileReader();
		reader.readAsDataURL(my_photo);
		reader.onload=function(){
			$('.my-photo').attr('src',reader.result);
		};			
	}); //end of change

	//이미지 전송
	$('#photo_submit').click(function(){
		if($('#photo').val()==''){
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
		form_data.append('photo',$('#photo')[0].files[0]);
		
		//서버와 통신
		$.ajax({
			url:'updateMyPhoto.do',
			type:'post',
			data:form_data,
			dataType:'json',
			contentType:false, //데이터 객체를 문자열로 바꿀지에 대한 값. true이면 일반문자
			processData:false, //해당 타입을 true로 하면 일반 text로 구분
			success:function(param){

				if(param.result == 'logout'){
					alert('로그인 후 사용하세요!');
				}else if(param.result == 'success'){
					alert('프로필 사진이 수정되었습니다.');

					//수정된 이미지 정보 저장
					photo_path = $('.my-photo').attr('src');
					$('#photo').val('');
					$('#photo_choice').hide();
					$('#photo_btn').show(); //수정 버튼 표시
				}else{
					alert('파일 전송 오류 발생');
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}				
		});
	}); //end of click
	
	//이미지 미리보기 취소
	$('#photo_reset').click(function(){
		//초기 이미지 표시
		//이미지 미리보기 전 이미지로 되돌리기
		$('.my-photo').attr('src',photo_path);
		$('#photo').val('');
	});
})
</script>
<style type="text/css">
	.overlay{
		display: felx;
		width: 100%;
		height: 100%;
	}
	.container{
		position: absolute;
		align-content: center;
		text-align: center;
		width: 260px;
		height: 360px;
	}
	ul{
		list-style: none;
	}
	img{
		width: 200px;
		height: 200px;
		border-radius: 100px;
		border: 2px solid #666666;
	}
	input{
		font-weight: bold;
		padding: 5px 10px;
		font-size: 10px;
		cursor: pointer;
		border: none;
		border-radius: 50px;
		background-color: #d9d9d9;
	}
	input[type=button]{
		margin-top: 10px;
	}
	input[type=file]{
		margin-top: 10px;
	}
	h3{
		margin-left: 40px;
	}
	
</style>
</head>
<body>
	<div id="overlay">
		<div class="container">
			<h3>프로필 사진 수정</h3>
			<input value="${ xuser.us_num }" type="hidden">
			<ul>
				<li>
					<c:if test="${empty xuser.img}">
					<img src="${pageContext.request.contextPath}/images/face.png" 
						                  width="200" height="200" class="my-photo">
					</c:if>
					<c:if test="${!empty xuser.img}">
					<img src="${pageContext.request.contextPath}/upload/${ xuser.img }" 
						                  width="200" height="200" class="my-photo">
					</c:if>
				</li>
				<li>
					<div id="photo_choice">
						<input type="file" id="photo" 
						accept="image/gif,image/png,image/jpeg"><br>
						<input type="button" value="변경" id="photo_submit">
						<input type="button" value="취소" id="photo_reset">
					</div>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>