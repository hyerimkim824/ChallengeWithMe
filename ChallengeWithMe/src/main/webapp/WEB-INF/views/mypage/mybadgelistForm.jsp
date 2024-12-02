<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꼬박꼬박 뱃지 리스트</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/mybadgelist.css" type="text/css">
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-3.7.1.min.js"></script>
<script>
$(document).ready(function() {
    // 뱃지 클릭 이벤트
    $('.badge-img').click(function() {
        // 선택된 뱃지 ID 가져오기
        const bg_num = $(this).siblings('.bg_num').val();

        // 확인 창 표시
        if (confirm("이 뱃지를 대표 뱃지로 설정하시겠습니까?")) {
            // Ajax 요청
            $.ajax({
                url: '${ pageContext.request.contextPath }/mypage/setMainBadge.do',
                type: 'post',
                data: { bg_num: bg_num },
                dataType: 'json',
                success: function(response) {
                    if (response.result === 'success') {
                        alert("대표 뱃지가 설정되었습니다!");
                        location.reload();
                    } else {
                        alert("대표 뱃지 설정에 실패했습니다.");
                    }
                },
                error: function() {
                    alert("네트워크 오류가 발생했습니다.");
                }
            });
        }
    });
});
</script>
</head>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<body>
	<div class="box">
		<div class="box-h1">
		<h1>꼬박꼬박 뱃지 리스트</h1>
		<div class="info-rightbtn">
		<input type="button" value="마이페이지"
		onclick="location.href='${ pageContext.request.contextPath }/mypage/mypage.do'">
		<c:if test="${!empty xuser.us_num && xuser.admin >= 1}">
		<input type="button" value="뱃지등록"
		onclick="location.href='${ pageContext.request.contextPath }/mypage/adminbadgeform.do'">
		<input type="button" value="뱃지수정"
		onclick="location.href='${ pageContext.request.contextPath }/mypage/modifybadgeform.do'">
		</c:if>
		</div>
		</div>
		<div class="badge-box">
			<ul class="flex-wrap-list">
			    <c:forEach var="badge" items="${ list }">
			        <li>
			            <c:choose>
			                <c:when test="${ !badge.owned }">
			                    <img src="${ pageContext.request.contextPath }/images/wing.png" alt="기본 이미지">
			                </c:when>
			                <c:otherwise>
			                	<input type="hidden" value="${ badge.bg_num }" class="bg_num">
			                    <img src="${ pageContext.request.contextPath }/upload/${ badge.bg_img }" alt="${ badge.bg_name }"
			                    class="badge-img" style="cursor: pointer;">
			                </c:otherwise>
			            </c:choose>
			            
			            <span><b>${ badge.bg_name }</b></span>
			            <span>${ badge.bg_desc }</span>
			        </li>
			    </c:forEach>
			</ul>
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>