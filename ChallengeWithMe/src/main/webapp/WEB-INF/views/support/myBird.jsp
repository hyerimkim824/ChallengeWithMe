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
    <title>나만의 새 캐릭터 가이드</title>
    <style>
        /* Global Reset */
        body {
            margin: 0;
            padding: 0;
            font-family: 'Noto Sans', 'Arial', sans-serif;
            background-color: #f7f8fa;
            color: #333;
        }

        /* Container */
        .container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 20px 30px;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
        }

        /* Header */
        .header {
            text-align: center;
            margin-bottom: 40px;
        }

        .header h1 {
            font-size: 36px;
            font-weight: bold;
            color: #444;
            margin-bottom: 10px;
            text-shadow: 2px 2px 5px rgba(255, 200, 0, 0.5);
        }

        .header p {
            font-size: 16px;
            color: #666;
        }

        /* Introduction Section */
        .introduction {
            text-align: center;
            background: linear-gradient(to right, #fffae5, #fff6cc);
            padding: 20px;
            border-radius: 12px;
            margin-bottom: 40px;
            font-size: 16px;
            color: #555;
            line-height: 1.8;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
        }

        /* Level Section */
        .level-section {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 20px;
            margin-bottom: 40px;
        }

        /* Level Card */
        .level-card {
            background: #ffffff;
            border: 1px solid #ffd700;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            padding: 20px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .level-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }

        .level-card img {
            width: 120px;
            height: auto;
            margin-bottom: 15px;
        }

        .level-title {
            font-size: 20px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }

        .level-description {
            font-size: 14px;
            color: #555;
            line-height: 1.6;
        }

        /* Footer */
        .footer {
            text-align: center;
            padding: 20px;
            background: #fff6cc;
            border-top: 3px solid #ffd700;
            border-radius: 12px;
        }

        .footer a {
            font-size: 14px;
            font-weight: bold;
            color: #ff9900;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer a:hover {
            color: #cc7700;
        }

      /* Button */
.btn {
    display: inline-block;
    margin-top: 20px;
    padding: 12px 24px;
    font-size: 16px;
    font-weight: bold;
    color: #ffffff; /* 글씨 색상: 흰색 */
    background: #ff6600; /* 배경 색상: 선명한 주황색 */
    border-radius: 8px; /* 약간 둥근 모서리 */
    text-decoration: none;
    transition: background-color 0.3s, transform 0.2s;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}
      /* Hover 상태 */
.btn:hover {
    background: #cc5200; /* Hover 시 배경 색상: 더 어두운 주황색 */
    transform: translateY(-3px); /* 버튼이 살짝 올라가는 효과 */
    box-shadow: 0 6px 10px rgba(0, 0, 0, 0.2); /* 그림자 강화 */
}
/* Active 상태 */
.btn:active {
    background: #ff3300; /* Active 시 배경 색상: 밝은 빨간색 */
    transform: translateY(0); /* 버튼 원래 위치로 */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 원래 그림자로 돌아감 */
}
 /* 푸터 */
        .footer2 {
            clear: both;
            text-align: center;
            padding: 10px 0;
            background-color: #fdd835;
             margin-top: auto; /* 자동으로 콘텐츠 아래로 푸터를 밀어냄 */
        }

        .footer2 a {
            text-decoration: none;
            color: #333;
            padding: 5px 10px;
        }

        .footer2 a:hover {
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header -->
        <div class="header">
            <h1>🐥 나만의 새 캐릭터 가이드 ✨</h1>
            <p>"꼬꼬"와 함께하는 도전과 성장의 여정!</p>
        </div>

        <!-- Introduction -->
        <div class="introduction">
            "꼬꼬"는 챌린지 활동을 통해 스스로 성장하고 도전하는 당신의 여정을 상징하는 캐릭터입니다. 점수를 쌓아 레벨을 올리면 "꼬꼬"는 더욱 멋지고 사랑스러운 모습으로 변화합니다. 🐣✨<br><br>
            챌린지를 통해 "꼬꼬"와 함께 성장하고 도전의 재미를 만끽해보세요!
        </div>

        <!-- Level Cards -->
        <div class="level-section">
            <!-- Example Level -->
            <div class="level-card">
                <img src="${ pageContext.request.contextPath }/images/Level1.png" alt="Level 1 캐릭터">
                <div class="level-title">Lv1: 알</div>
                <div class="level-description">
                    모든 시작은 작지만 소중합니다. "꼬꼬"는 이제 막 세상에 나올 준비를 하는 단계입니다. 점수를 쌓아 알에서 깨어나는 기쁨을 경험하세요! 🐣
                </div>
            </div>
            <div class="level-card">
                <img src="${ pageContext.request.contextPath }/images/Level2.png" alt="Level 2 캐릭터">
                <div class="level-title">Lv2: 아가 병아리</div>
                <div class="level-description">
                    처음으로 세상을 마주한 아기 병아리 "꼬꼬"! 이제 조금씩 성장의 즐거움을 배워가고 있습니다. 🐥
                </div>
            </div>
                <!-- Level 3 -->
            <div class="level-card">
                <img src="${ pageContext.request.contextPath }/images/Level3.png" alt="Level 3 캐릭터">
                <div class="level-title">Lv3: 성장 병아리</div>
                <div class="level-description">
                    꾸준한 도전으로 자신감을 얻고 있는 성장 병아리입니다. 
                    목표를 향해 더욱 가까워지고 있어요! ✨
                </div>
            </div>
            <div class="level-section">
        <!-- Level 4 -->
        <div class="level-card">
            <img src="${ pageContext.request.contextPath }/images/Level4.png" alt="Level 4 캐릭터">
            <div class="level-title">Lv4: 독립 병아리</div>
            <div class="level-description">
                이제는 스스로 모든 도전을 관리할 수 있는 독립 병아리가 된 꼬꼬입니다! 
                더 높은 목표를 향해 도전해보세요! 💪
            </div>
        </div>
        <!-- Level 5 -->
        <div class="level-card">
            <img src="${ pageContext.request.contextPath }/images/Level5.png" alt="Level 5 캐릭터">
            <div class="level-title">Lv5: 탐험 병아리</div>
            <div class="level-description">
                새로운 곳으로의 도전을 즐기는 탐험 병아리 꼬꼬입니다! 
                호기심으로 가득 찬 세상을 모험하며 자신만의 길을 만들어가세요! 🌍
            </div>
        </div>
        <!-- Level 6 -->
        <div class="level-card">
            <img src="${ pageContext.request.contextPath }/images/Level6.png" alt="Level 6 캐릭터">
            <div class="level-title">Lv6: 모험 병아리</div>
            <div class="level-description">
                더 크고 대담한 꿈을 향해 모험하는 병아리 꼬꼬! 자신감 넘치는 모습으로 모두의 기대를 받고 있습니다. 🌟
            </div>
        </div>
    </div>

    <div class="level-section">
        <!-- Level 7 -->
        <div class="level-card">
            <img src="${ pageContext.request.contextPath }/images/Level7.png" alt="Level 7 캐릭터">
            <div class="level-title">Lv7: 리더 병아리</div>
            <div class="level-description">
                이제 꼬꼬는 리더로서 다른 병아리들에게 영감을 주고 있습니다. 
                모든 도전에서 앞장서며 모범을 보이는 멋진 리더가 되어주세요! 🐤✨
            </div>
        </div>
        <!-- Level 8 -->
        <div class="level-card">
            <img src="${ pageContext.request.contextPath }/images/Level8.png" alt="Level 8 캐릭터">
            <div class="level-title">Lv8: 챌린지 마스터</div>
            <div class="level-description">
                모든 도전을 마스터하며 병아리 마스터로 자리 잡았습니다. 
                챌린지에 참여하는 모두가 당신을 목표로 삼고 있어요! 🏆
            </div>
        </div>
        <!-- Level 9 -->
        <div class="level-card">
            <img src="${ pageContext.request.contextPath }/images/Level9.png" alt="Level 9 캐릭터">
            <div class="level-title">Lv9: 챌린지 챔피언</div>
            <div class="level-description">
                챌린지의 전설이 된 꼬꼬! 챔피언으로서 모두에게 존경받는 당신의 여정은 끝이 아닙니다. 
                계속해서 새로운 도전을 이어나가세요! 👑
            </div>
        </div>
    </div>
        </div>

            <div class="level-card">
                <img src="${ pageContext.request.contextPath }/images/Level10.png" alt="Level 10 캐릭터">
                <div class="level-title">Lv10: 챌린지 레전드</div>
                <div class="level-description">
                    모든 레벨을 정복한 "꼬꼬"는 이제 챌린지의 레전드로 등극했습니다! 끝없는 도전을 이어가며 전설을 만들어보세요! 🌟👑
                </div>
            </div>
        </div>


       <div class="footer">
    더 많은 도전과 재미를 원하신다면 <a href="SupportMain.do">고객센터</a>를 방문해주세요. 🐥✨<br><br>
    <a class="btn" href="${ pageContext.request.contextPath }/challenge/challengeList.do">챌린지 시작하기</a>
</div>
 <!-- 푸터 -->
    <div class="footer2">
        <a href="ChallengeHelp.do">챌린지 안내</a> |
        <a href="SupportWrite.do">1:1 문의</a> |
        <a href="<%= request.getContextPath() %>/mypage/mypage.do">마이페이지</a> |
        <a href="NoticeList.do">공지사항</a>
    </div>
  
</body>
</html>
