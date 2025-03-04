<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>커뮤니티 사용 가이드</title>
  
</head>
<body>
    <div class="container">
        <div class="header">커뮤니티 사용 가이드 🐥✨</div>

        <!-- 커뮤니티 소개 -->
        <div class="section">
            <div class="section-title">커뮤니티란 무엇인가요? 🐇</div>
            <div class="section-content">
                커뮤니티는 다른 사용자들과 소통하며 정보를 공유하고 서로 응원할 수 있는 공간이에요! <br>
                챌린지에 대한 팁과 노하우를 공유하고 다양한 주제에 대해 대화해보세요. 💬
            </div>
        </div>

        <!-- 커뮤니티 참여 방법 -->
        <div class="section">
            <div class="section-title">커뮤니티 참여 방법 🐥</div>
            <div class="section-content">
                커뮤니티에 참여하려면 아래 단계를 따라주세요:
                <ul>
                    <li>1️⃣ <strong>회원 가입:</strong> 회원으로 가입 후 로그인하세요.</li>
                    <li>2️⃣ <strong>게시글 읽기:</strong> 다양한 주제의 게시글을 읽으며 소통을 시작하세요.</li>
                    <li>3️⃣ <strong>댓글 달기:</strong> 마음에 드는 게시글에 댓글을 남겨보세요!</li>
                    <li>4️⃣ <strong>게시글 작성:</strong> 자신의 생각이나 이야기를 새로운 게시글로 작성할 수 있어요.</li>
                    <li>5️⃣ <strong>좋아요 누르기:</strong> 공감 가는 게시글에 좋아요를 눌러보세요. 👍</li>
                </ul>
            </div>
        </div>

        <!-- 커뮤니티 유의 사항 -->
        <div class="section">
            <div class="section-title">커뮤니티 이용 시 유의 사항 🐰</div>
            <div class="section-content">
                <ul>
                    <li>✅ 다른 사용자를 존중해주세요. 비난이나 비방은 금지입니다.</li>
                    <li>✅ 챌린지와 관련된 주제는 지정된 게시판에 작성해주세요.</li>
                    <li>✅ 스팸이나 광고성 게시물은 경고 없이 삭제될 수 있습니다.</li>
                    <li>✅ 개인정보가 노출되지 않도록 주의해주세요.</li>
                </ul>
            </div>
        </div>

        <!-- 도움 요청 -->
        <div class="section">
            <div class="section-title">도움이 필요하신가요? 🐇</div>
            <div class="section-content">
                추가 질문이 있다면 <a href="SupportMain.do">고객센터</a>를 방문하거나 <a href="SupportWrite.do">문의하기</a>를 남겨주세요. <br>
                저희가 도와드릴게요! 🐥✨
            </div>
        </div>

        <!-- 버튼 -->
        <div class="btn-group">
            <button class="btn" onclick="window.history.back();">이전 페이지</button>
            <button class="btn" onclick="location.href='${pageContext.request.contextPath}/post/list.do'">커뮤니티 메인으로 이동</button>
            
        </div>
    </div>
</body>
</html>
