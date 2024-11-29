<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선호 카테고리 선택</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/pref.css" type="text/css">
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    var selectedIds = [];  // 선택된 li의 id를 담을 배열
    
    $('.item').click(function() {
        var selectedId = $(this).attr('id');  // 클릭된 li의 id
        if (!selectedIds.includes(selectedId)) {  // 이미 선택된 id가 아닌 경우
            selectedIds.push(selectedId);  // 배열에 추가
        }
        console.log(selectedIds);  // 선택된 id들 출력 (디버깅용)
    });
    
    $('#submitBtn').click(function() {
        // Ajax로 서버에 selectedIds 배열 전송
        $.ajax({
            url: '/submit',  // 요청을 보낼 URL
            method: 'POST',
            data: {
                selectedIds: selectedIds.join(',')  // 배열을 쉼표로 구분해서 전송
            },
            success: function(response) {
                console.log('전송 성공', response);
            },
            error: function(xhr, status, error) {
                console.log('전송 실패', error);
            }
        });
    });

    
    $('.menu-item').click(function() {
        // 이미 선택된 항목이 있다면 제거
        $('.menu-item').removeClass('selected');
        
        // 클릭된 항목에 'selected' 클래스 추가
        $(this).addClass('selected');
    });
});
});    
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="content-wrapper">
		<div class="content-head">
			<h1>선호 카테고리 선택</h1>
			<h3>선호 카테고리를 선택해주세요! (최대 6개)</h3>
		</div>
		<div class="content-result">
			<ul>
				<c:forEach var="pref" items="${ list }">
				<li class="item" id="${ pref.cate_num }">
					<img src="${ pageContext.request.contextPath }/images/face.png">
					<span>${ pref.cate_name }</span>
				</li>
				</c:forEach>
			</ul>
		</div>
		<div class="content-btn">
			<input type="button" value="확인" id="submitBtn">
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>