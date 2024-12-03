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
	    
	    // 'selected' 클래스가 토글되도록
	    $(this).toggleClass('selected');
	    
	    if ($(this).hasClass('selected')) {
	        // 'selected' 클래스가 추가된 경우 배열에 id 추가
	        if (!selectedIds.includes(selectedId)) {
	            selectedIds.push(selectedId);
	        }
	    } else {
	        // 'selected' 클래스가 제거된 경우 배열에서 id 제거
	        var index = selectedIds.indexOf(selectedId);
	        if (index !== -1) {
	            selectedIds.splice(index, 1);  // 배열에서 해당 id 제거
	        }
	    }

	    console.log(selectedIds);  // 선택된 id들 출력 (디버깅용)
	});

	$('#submitBtn').click(function() {
	    // Ajax로 서버에 selectedIds 배열 전송
	    $.ajax({
	        url: '${ pageContext.request.contextPath }/mypage/changePref.do',  // 요청을 보낼 URL
	        method: 'POST',
	        data: {
	            selectedIds: selectedIds.join(',')  // 배열을 쉼표로 구분해서 전송
	        },
	        success: function(response) {
	        	alert('카테고리를 변경했습니다.')
	        	window.location.href = '${ pageContext.request.contextPath }/mypage/mypage.do'
	        },
	        error: function(xhr, status, error) {
	            console.log('전송 실패', error);
	        }
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
					<c:if test="${ pref.cate_num == 1 }">
					<img src="${ pageContext.request.contextPath }/images/cate1.png">
					</c:if>
					<c:if test="${ pref.cate_num == 2 }">
					<img src="${ pageContext.request.contextPath }/images/cate2.png">
					</c:if>
					<c:if test="${ pref.cate_num == 3 }">
					<img src="${ pageContext.request.contextPath }/images/cate3.png">
					</c:if>
					<c:if test="${ pref.cate_num == 4 }">
					<img src="${ pageContext.request.contextPath }/images/cate4.png">
					</c:if>
					<c:if test="${ pref.cate_num == 5 }">
					<img src="${ pageContext.request.contextPath }/images/cate5.png">
					</c:if>
					<c:if test="${ pref.cate_num == 6 }">
					<img src="${ pageContext.request.contextPath }/images/cate6.png">
					</c:if>
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