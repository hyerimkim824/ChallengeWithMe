<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문구 인증 챌린지</title>
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
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/pvchallengetimeWriting.js"></script>	
</head>
 
<script type="text/javascript">
function wiseFunction() {
    $.ajax({
        url: 'pvChallengeWritingGet.do', // 서버 엔드포인트
        type: 'POST',                   // 요청 방식
        dataType: 'json',               // 서버 응답 데이터 형식
        data: {
            wise: $('#wise').val() // 전송할 파라미터 추가
        },
        success: function (param) {
            console.log(param); // 서버 응답 전체를 로그로 출력하여 구조 확인
            if (param && param.ran_wise) {
                const ran_wise = param.ran_wise;
                console.log("받은 명언:", ran_wise);
                let modifyUI = "";
                
                
                modifyUI= ran_wise;
                
                $('.wise').append(modifyUI);
                
                
                // 나머지 처리
            } else {
                console.error("서버 응답에 ran_wise가 없습니다.");
                alert("명언을 가져오는 데 실패했습니다.");
            }
            
        },
        error: function (xhr, status, error) {
            console.error("AJAX 요청 실패:", status, error);
            alert("서버 요청 중 오류가 발생했습니다.");
        }
    });
}

// 페이지 로드 시 명언 가져오기
$(document).ready(function () {
    wiseFunction();
});
</script>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <h1>문구 인증 챌린지</h1>
    <!-- 타이머 관련 -->
            <div class="status" id="status">타이머가 아직 시작되지 않았습니다.</div>
            <div class="timer" id="timerDisplay"></div>
    
    <div class = "wise">인증 명언 : </div>
    
    <form >
        <label for="username">문구 따라쓰기 :</label>
        <input type="text" id="wise" name="wise">
        <button type="submit">작성완료</button>
    </form>
    
    <div class = "wise_success"> 인증 여부 :  </div>
    
    
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
    
</body>
</html>