<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피드백 수정</title>

</head>
<body>

	<!-- 🐤 헤더 -->
	<div class="header">
		<h1>고객센터</h1>
		<div class="search-bar">
        <form action="Search.do" method="get" style="display: flex; align-items: center;">
            <!-- 검색어 입력 -->
            <input type="text" name="keyword" placeholder="자주 묻는 질문 검색" style="flex: 1; padding: 5px; border: 1px solid #ccc; border-radius: 5px;" required>
            <!-- 검색 버튼 -->
            <button type="submit" style="padding: 5px 10px; background-color: #fdd835; border: none; cursor: pointer; border-radius: 5px; margin-left: 10px;">검색</button>
        </form>
    </div>
	</div>

	<div class="nav">
		<a href="${pageContext.request.contextPath}/support/List.do">문의 내역</a>
		<a href="${pageContext.request.contextPath}/support/FaqList.do">자주
			묻는 질문</a> <a
			href="${pageContext.request.contextPath}/support/FeedBackList.do">고객의
			소리</a>
	</div>

	<div class="container">
		<div class="sidebar">
			<a href="${pageContext.request.contextPath}/support/FaqList.do">자주
				묻는 질문</a> <a
				href="${pageContext.request.contextPath}/support/LoginaAcount.do">로그인
				및 계정</a> <a
				href="${pageContext.request.contextPath}/support/RefundGuide.do">결제
				및 환불</a> <a
				href="${pageContext.request.contextPath}/support/ChallengeHelp.do">꼬박꼬박
				챌린지</a> <a
				href="${pageContext.request.contextPath}/support/CommunityHelp.do">꼬박꼬박
				커뮤니티</a>
		</div>
		<div class="content">
			<h2>피드백 수정</h2>
			<form action="FeedBackUpdate.do" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="sup_num" value="${feedBack.sup_num}">
				<div class="form-group">
				<div class="form-row2">
					<label for="type">문의 유형</label>
					 <select id="type" name="sup_pick">
						<option value="1">신고/이용제한</option>
						<option value="2">피해 예방</option>
						<option value="3">기타</option>
					</select>
					</div>
				</div>
				
				
				
				<div class="form-group">
		<div class="form-row3">
					<label for="title">문의 제목</label>
					 <input type="text" id="title" name="sup_title" value="${feedBack.sup_title}">
				</div>
			</div>
				<div class="form-group">
				<div class="form-row4">
					<label for="content">문의 내용</label>
				
        <textarea id="content" name="sup_content" rows="5">${feedBack.sup_content}</textarea>
				</div>
				</div>
				<div class="form-group">
				<div class="form-row5">
					<label for="sup_img" class="form-label">파일 첨부 (선택)</label> <input
						type="file" id="sup_img" name="sup_img" class="form-control">
					<c:if test="${!empty support.sup_img}">
							<div>첨부파일 : ${support.sup_img}</div>	
						</c:if>	
				</div>
				</div>
						<div class="form-row">
				<div class="form-group">
				<div class="form-row6">
					<label for="visibility">문의 상태</label> 
					<select class="condition" id="visibility" name="visibility" onchange="togglePasswordField()">
						<option value="1">비공개</option>
						<option value="2">공개</option>
					</select>
					</div>
				</div>
								
				<!-- 비공개 비밀번호 -->
				<div class="form-group" id="sup_pwd">
				<div class="form-row7">
					<label for="sup_pwd_input" class="form-label">비밀번호 <br>
					 (숫자4자리)</label>
					  <input type="password" id="sup_pwd_input" name="sup_pwd"
						class="form-control" placeholder="비밀번호를 입력해주세요" maxlength="4">
				</div>
				</div>
						</div>
				<div class="button" style="text-align: right; margin: 20px 28%">
					<button type="submit">피드 수정</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html> 
