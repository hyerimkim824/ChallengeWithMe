<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인설정</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/mysetting.css" type="text/css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-3.7.1.min.js"></script>
<script>
document.addEventListener("DOMContentLoaded", function () {
        const on = document.getElementById("on");
        const off = document.getElementById("off");
        let active = ${ xuser.alarm }

        // ON 버튼 클릭 이벤트
        if(active === 0){
        	on.classList.add("inactive")
        }else{
        	off.classList.add("inactive")
        }
        
        on.addEventListener("click", () => {
            on.classList.add("inactive");
            off.classList.remove("inactive");
            active = 0
            sendAlarmSetting(active);
        });

        // OFF 버튼 클릭 이벤트
        off.addEventListener("click", () => {
            off.classList.add("inactive");
            on.classList.remove("inactive");
           	active = 1
            sendAlarmSetting(active);
        });
        
        function sendAlarmSetting(active) {
            $.ajax({
                url: 'mySettingForm.do',
                type: 'POST',
                data: { alarm: active },  // active 값을 전송
                success: function (response) {
                    console.log('알람 설정 성공');
                },
                error: function () {
                    alert('알람 설정 실패: 네트워크 오류 발생');
                }
            });
        }
});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="ground">
		<div class="box">
			<div class='box-header'>
				<ul>
					<li class="box-h1">
						<h1>개인 설정</h1>
					</li>
					<li>
						<input class="fas fa-arrow-left" type="button" value="&#8592"
						onclick="location.href='${ pageContext.request.contextPath }/mypage/mypage.do'">
					</li>
				</ul>
				<hr>
			</div>
			<div class="box-middle">
				<ul>
					<li class="middle-content">
						<img src="${ pageContext.request.contextPath }/images/alarm.png" width="25px" height="25px">
						<span>알림 설정</span>
						<button id="on" value="0">ON</button>
						<button id="off" value="1">OFF</button>
					</li>
					<li class="middle-content">
						<img src="${ pageContext.request.contextPath }/images/person.svg" width="25px" height="25px">
						<span>친구 초대</span>
						<div class="invite">
						<input id="left" type="image" src="${ pageContext.request.contextPath }/images/kakao.png" width="25px" height="25px">
						<input id="right" type="image" src="${ pageContext.request.contextPath }/images/instar.png" width="25px" height="25px">
						</div>
					</li>
					<li class="middle-content">
						<img src="${ pageContext.request.contextPath }/images/heart.png" width="25px" height="25px">
						<span>좋아요 목록</span>
					</li>
						<hr>
					<c:forEach var="index" items="${ like }" varStatus="status" begin="0" end="7">
					<li class="li-fev">
					<a href="${ pageContext.request.contextPath }/challenge/challengeDetail.do?ch_num=${ ch_num[status.index] }"><span>${ index }</span></a>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>