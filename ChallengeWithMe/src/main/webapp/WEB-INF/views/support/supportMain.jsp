<%@page import="kr.support.vo.SupportVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>꼬박꼬박 고객센터</title>


	</header>

	<!-- 메인 -->
	<div class="main">
		<h1>
			 <a href="SupportMain.do" class="main-link">꼬박꼬박 고객센터</a><br> 
		<!-- 병아리 이미지와 말풍선 -->
<span style="display: flex; align-items: center; justify-content: center; gap: 10px;">
    무엇을 도와드릴까요?
    <div style="position: relative;">
        <img src="<%= request.getContextPath() %>/images/Bird3.png" alt="병아리 이미지" class="chick-image">
        <div class="speech-bubble">꼬꼬가 도와줄게!</div>
    </div>
</span>
		</h1>
		
		<form action="Search.do" method="get">
			<input type="text" name="keyword" placeholder="   서비스명과 함께 검색해 보세요."
				style="flex: 1; margin-left: 12px;"> <input type="submit"
				value="">
		</form>
		<div class="keywords">
			<span
				onclick="location.href='${pageContext.request.contextPath}/mypage/modifyPwdForm.do'">비밀번호
				변경</span> <span
				onclick="location.href='${pageContext.request.contextPath}/support/FaqList.do#q11'">이용제한조치</span>
			<span
				onclick="location.href='${pageContext.request.contextPath}/mychallenge/myChallengePart.do'">챌린지
				나가기</span> <span
				onclick="location.href='${pageContext.request.contextPath}/mypage/infoModifyForm.do'">생일
				설정</span> <span
				onclick="location.href='${pageContext.request.contextPath}/support/SupportWrite.do'">1:1
				문의</span>
		</div>
	</div>

	<!-- 공지 -->
	<div class="notice-container">
		<!-- 공지와 텍스트 -->

		<div class="notice-title">
			<button class="notice-button" onclick="openNotice('notice1');">
    공지
</button><script>
    function openNotice(id) {
        // 공지사항 페이지로 이동하며 해시(#id)를 포함
        location.href = `${'<%= request.getContextPath() %>'}/support/NoticeList.do#${id}`;
    }
</script>
			<span
				onclick="location.href='${pageContext.request.contextPath}/support/NoticeList.do#notice1'">[공지]
				꼬박꼬박 챌린지 웹사이트 개설</span>
		</div>
		<!-- 공지 전체보기 -->
		<a href="NoticeList.do" class="notice-link">공지 전체보기 ></a>
	</div>

	<!-- 서비스별 고객센터 -->
	<section class="service-section categories-container">
		<div class="categories-header">
			<h2 class="categories-title">서비스 찾기</h2>
<!-- 팝업창 HTML -->
<div id="popup" class="popup-overlay" style="display: none;">
    <div class="popup-box">
        <div class="popup-header">
            <h2>고객센터 전체 서비스</h2>
            <button class="popup-close" onclick="closePopup()">✕</button>
        </div>
        <div class="popup-search">
            <input type="text" placeholder="서비스명을 검색해 보세요." />
        </div>
        <div class="popup-body">
            <!-- 자주찾는 -->
            <div class="popup-category">
                <h3>자주찾는</h3>
                <div class="popup-category-items">
                    <div class="popup-item">
                        <img src="<%= request.getContextPath() %>/images/Bird2.png" alt="꼬박꼬박">
                        <span>꼬박꼬박</span>
                    </div>
                    <div class="popup-item">
                        <img src="<%= request.getContextPath() %>/images/Account2.png" alt="카카오 계정">
                        <span>꼬박꼬박 계정</span>
                    </div>
                    <div class="popup-item">
                        <img src="<%= request.getContextPath() %>/images/Badge.png" alt="My 구독">
                        <span>My 챌린지</span>
                    </div>
                       <div class="popup-item">
                    <a href="<%= request.getContextPath() %>/support/NoticeList.do">
                        <img src="<%= request.getContextPath() %>/images/FeedBack.png" alt="공지사항">
                        <span>공지사항</span></a>
                    </div>
                </div>
            </div>
            <!-- 커뮤니케이션 -->
            <div class="popup-category">
                <h3>커뮤니케이션</h3>
                <div class="popup-category-items">
                    <div class="popup-item">
                        <img src="<%= request.getContextPath() %>/images/Community.jpg" alt="커뮤니티">
                        <span>커뮤니티</span>
                    </div>
                 
                </div>
            </div>
            <!-- 콘텐츠 -->
            <div class="popup-category">
                <h3>콘텐츠</h3>
                <div class="popup-category-items">
                    <div class="popup-item">
                        <img src="<%= request.getContextPath() %>/images/Benefit.png" alt="꼬박꼬박 배지">
                        <span>꼬박꼬박 배지</span>
                    </div>
                    <div class="popup-item">
                        <img src="<%= request.getContextPath() %>/images/Community.jpg" alt="커뮤니티">
                        <span>커뮤니티</span>
                    </div>
                    <!-- 챌린지 -->
                     <div class="popup-category">
                <h3>챌린지</h3>
                <div class="popup-category-items">
                    <div class="popup-item">
                    	<a
						href="<%= request.getContextPath() %>/challenge/challengeList.do">
                    <img src="${pageContext.request.contextPath}/images/Book.png"alt="챌린지 예약하기">
                    <span>챌린지 예약하기</span></a>
                    </div>
                     <div class="popup-item">
                    	<a
						href="<%= request.getContextPath() %>/mychallenge/myChallengeMain.do">
                    <img src="${pageContext.request.contextPath}/images/Challenge2.png"alt="My 챌린지">
                    <span> My 챌린지</span></a>
                    </div>
                    
                    
                 
				</div>
				<a href="<%= request.getContextPath() %>/mychallenge/myChallengeMain.do"
					class="category-link">My 챌린지</a>
					
			</div>
				
						<div>
					
				
			</div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 서비스 전체보기 버튼 -->
<button onclick="openPopup()" class="service-all-button">서비스 전체보기 &nbsp;𓅰</button>

		</div>
		<!-- 네비게이션바 추가 -->
		<div class="nav-container">
			<div class="nav-wrapper">
				<div class="nav-scroll">
					<div class="nav-item">자주찾는</div>
					<div class="nav-item">커뮤니케이션</div>
					<div class="nav-item">콘텐츠</div>
					<div class="nav-item">챌린지</div>
					<div class="nav-item">광고</div>
					<div class="nav-item">비즈니스</div>
					<div class="nav-item">기타</div>
				</div>
				<div class="nav-arrows">
					<button class="nav-arrow left" onclick="scrollNav('left')">&lt;</button>
					<button class="nav-arrow right" onclick="scrollNav('right')">&gt;</button>
				</div>
			</div>
		</div>

		<div class="categories">
			<div class="category">
				<div class="image-container">
					<a href="<%= request.getContextPath() %>/main/main.do"> <img
						src="${pageContext.request.contextPath}/images/Bird2.png"
						alt="꼬박꼬박">
					</a>
				</div>
				<a href="<%= request.getContextPath() %>/main/main.do"
					class="category-link">꼬박꼬박</a>
			</div>
			<div class="category">
				<div class="image-container">
					<a href="<%= request.getContextPath() %>/mypage/mypage.do">
						<img src="${pageContext.request.contextPath}/images/Account2.png"
						alt="꼬박꼬박계정">
					</a>
				</div>
				<a href="<%= request.getContextPath() %>/mypage/mypage.do"
					class="category-link">꼬박꼬박 계정</a>
			</div>
			<div class="category">
				<div class="image-container">
					<a href="<%= request.getContextPath() %>/mypage/myBadgeListForm.do">
						<img src="${pageContext.request.contextPath}/images/Badge.png"
						alt="꼬박꼬박 배지">
					</a>
				</div>
				<a href="<%= request.getContextPath() %>/mypage/myBadgeListForm.do"
					class="category-link">꼬박꼬박 뱃지</a>
			</div>
			<div class="category">
				<div class="image-container">
					<a href="<%= request.getContextPath() %>/support/Gift.do"> <img
						src="${pageContext.request.contextPath}/images/Gift.png"
						alt="꼬박꼬박 선물하기"></a>
				</div>
				<a href="<%= request.getContextPath() %>/support/Gift.do"
					class="category-link">꼬박꼬박 선물하기</a>
			</div>
			<div class="category">
				<div class="image-container">
					<a href="<%= request.getContextPath() %>/support/Business.do">
						<img src="${pageContext.request.contextPath}/images/Business.png"
						alt="꼬박꼬박 비즈니스">
					</a>
				</div>
				<a href="<%= request.getContextPath() %>/support/Business.do"
					class="category-link">꼬박꼬박 비즈니스</a>
			</div>
			<div class="category">
				<div class="image-container">
					<a href="<%= request.getContextPath() %>/support/ChallengeHelp.do">
						<img src="${pageContext.request.contextPath}/images/Admin.png"
						alt="꼬박꼬박 서비스">
					</a>
				</div>
				<a href="<%= request.getContextPath() %>/support/ChallengeHelp.do"
					class="category-link">꼬박꼬박 서비스</a>
			</div>
			<div class="category">
				<div class="image-container">
					<a href="<%= request.getContextPath() %>/support/wallet.do">
						  <img src="${pageContext.request.contextPath}/images/wallet.png" alt="꼬박꼬박 지갑">
        </a>
				</div>
				<a href="<%= request.getContextPath() %>/pocket/wallet.do"
					class="category-link">꼬박꼬박 지갑</a>
			</div>
			<div class="category">
				<div class="image-container">
					<a href="<%= request.getContextPath() %>/mychallenge/myChallengeMain.do">
						<img
						src="${pageContext.request.contextPath}/images/Challenge2.png"
						alt="My 챌린지"></a>
				</div>
				<a href="<%= request.getContextPath() %>/mychallenge/myChallengeMain.do"
					class="category-link">My 챌린지</a>
					
			</div>
			<div class="category">
				<div class="image-container">
					<a href="<%= request.getContextPath() %>/post/list.do"> <img
						src="${pageContext.request.contextPath}/images/Community.jpg"
						alt="커뮤니티"></a>
				</div>
				<a href="<%= request.getContextPath() %>/post/list.do"
					class="category-link">커뮤니티</a>
			</div>
			<div class="category">
				<div class="image-container">
					<a
						href="<%= request.getContextPath() %>/support/FaqList.do#q1">
						<img src="${pageContext.request.contextPath}/images/Benefit.png"
						alt="꼬박꼬박 혜택쌓기">
					</a>
				</div>
				<a href="<%= request.getContextPath() %>/support/FaqList.do#q1"
					class="category-link">꼬박꼬박 혜택쌓기</a>
			</div>
			<div class="category">
				<div class="image-container">
					<a
						href="<%= request.getContextPath() %>/challenge/challengeList.do">
						<img src="${pageContext.request.contextPath}/images/Book.png"
						alt="챌린지 예약하기">
					</a>
				</div>
				<a
					href="<%= request.getContextPath() %>/challenge/challengeList.do"
					class="category-link">챌린지 예약하기</a>
			</div>
			<div class="category">
				<div class="image-container">
					<a
						href="<%= request.getContextPath() %>/support/FeedBack.do">
						<img src="${pageContext.request.contextPath}/images/FeedBack.png"
						alt="신고하기">
					</a>
				</div>
				<a
					href="<%= request.getContextPath() %>/support/FeedBack.do"
					class="category-link">신고하기</a>
			</div>
		</div>
	</section>

	<!-- FAQ -->
	<section class="faq">
		<h2>자주 묻는 질문</h2>
		<!-- 추가된 네비게이션 바 -->
<div class="nav-container">
    <div class="nav-wrapper">
        <div class="nav-scroll2">
            <div class="nav-item2">기능</div>
            <div class="nav-item2">계정/인증</div>
            <div class="nav-item2">신고/이용제한</div>
            <div class="nav-item2">결제</div>
            <div class="nav-item2">피해 예방</div>
        </div>
        <div class="nav-arrows">
            <button class="nav-arrow left" onclick="scrollNav2('left')">&lt;</button>
            <button class="nav-arrow right" onclick="scrollNav2('right')">&gt;</button>
        </div>
    </div>
</div>
		<div class="faq-list">
			<div class="faq-item">
			<a href="<%= request.getContextPath() %>/support/LoginaAcount.do#q11">
				꼬박꼬박 <br><br> <strong>계정을 백업하고 복원하려면 어떻게 해야 하나요?</strong></a>
			</div>
			<div class="faq-item">
			<a href="<%= request.getContextPath() %>/support/FaqList.do#q12">
				꼬박꼬박 <br><br> <strong>챌린지에서 "나가기" 옵션이 안 보여요.</strong></a>
			</div>
			<div class="faq-item">
			<a href="<%= request.getContextPath() %>/support/FaqList.do#q13">
				꼬박꼬박 지갑<br><br> <strong> 꼬박꼬박 지갑은 어떤 기능인가요?</strong></a>
			</div>
			
			<div class="faq-item">
			<a href="<%= request.getContextPath() %>/support/FaqList.do#q16">
				꼬박꼬박 <br><br> <strong> 꼬박꼬박 카카오톡 채널은 어떻게 추가하나요?</strong></a>
			</div>
			
			<div class="faq-item">
				<a href="<%= request.getContextPath() %>/support/FaqList.do#q14">
				꼬박꼬박 <br><br> <strong> 배지는 어떻게 받을 수 있나요?</strong></a>
			</div>
			<div class="faq-item">
					<a href="<%= request.getContextPath() %>/support/FaqList.do#q15">
				꼬박꼬박 <br><br> <strong> 챌린지 참가코드는 무엇인가요? </strong></a>
			</div>
			<div class="faq-item">
							<a href="<%= request.getContextPath() %>/support/LoginaAcount.do#q1">
				꼬박꼬박 <br><br> <strong> 꼬박꼬박 계정의 비밀번호가 기억나지 않아요.</strong></a>
			</div>
			<div class="faq-item">
					<a href="<%= request.getContextPath() %>/support/LoginaAcount.do#q8">
				꼬박꼬박 <br><br> <strong> 꼬박꼬박에 등록된 전화번호를 바꾸고 싶어요.</strong></a>
			</div>
		</div>
	</section>
	<!-- 새로운 두 개의 상자 -->
       <div class="faq-extra-container">
    <!-- 첫 번째 상자 -->
    <div class="faq-extra-item">
        <div class="image-container2">
            <img src="${pageContext.request.contextPath}/images/Pencil.png" alt="연필 이미지">
        </div>
        <div class="text-content">
            <h3>답을 찾지 못하셨나요?</h3>
            <p>1:1 문의로 상담직원에게 문의하세요.<br>
             꼼꼼히 확인하여 답변 드리겠습니다.</p>
            <button onclick="location.href='<%= request.getContextPath() %>/support/SupportWrite.do';">1:1 문의하기</button>
        </div>
    </div>
    <!-- 두 번째 상자 -->
    <div class="faq-extra-item">
        <div class="image-container2">
            <img src="${pageContext.request.contextPath}/images/FeedBack2.png" alt="신고 이미지">
        </div>
        <div class="text-content">
            <h3>신고가 필요하신가요?</h3>
            <p>꼬박꼬박 신고센터를 통해 유해정보, 권리침해,<br>
             불법촬영물 등의 콘텐츠 신고를 하실 수 있습니다.</p>
            <button onclick="location.href='<%= request.getContextPath() %>/support/FeedBack.do';">신고 바로가기</button>
        </div>
    </div>
</div>





    <!-- 푸터 -->
    <div class="footer">
        <a href="ChallengeHelp.do">챌린지 안내</a> |
        <a href="SupportWrite.do">1:1 문의</a> |
        <a href="<%= request.getContextPath() %>/mypage/mypage.do">마이페이지</a> |
        <a href="NoticeList.do">공지사항</a>
    </div>
</body>
</html>
