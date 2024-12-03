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
    <title>캐릭터 레벨업 가이드</title>
    <style>
        /* Global Style Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Noto Sans', sans-serif;
            background-color: #f8f9fa;
            color: #333;
            line-height: 1.6;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        .container {
            max-width: 1200px;
            margin: 40px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        .header {
            text-align: center;
            margin-bottom: 40px;
        }

        .header h1 {
            font-size: 32px;
            font-weight: bold;
            color: #444;
            margin-bottom: 10px;
        }

        .header p {
            font-size: 16px;
            color: #666;
        }

        .introduction {
            background: linear-gradient(to right, #fffde7, #ffecb3);
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 40px;
            text-align: center;
            font-size: 14px;
            color: #444;
            line-height: 1.8;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }

        .level-section {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }

        .level-card {
            background: #ffffff;
            border: 1px solid #ddd;
            border-radius: 12px;
            text-align: center;
            padding: 20px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .level-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        .level-card img {
            width: 100px;
            height: auto;
            margin-bottom: 15px;
            
     
            background-color: 
            padding: 10px;
        }

        .level-title {
            font-size: 18px;
            font-weight: bold;
            color: #222;
            margin-bottom: 10px;
        }

        .level-description {
            font-size: 14px;
            color: #555;
            line-height: 1.5;
        }

        .footer {
            text-align: center;
            padding: 20px;
            margin-top: 40px;
            background: #f7f7f9;
            border-top: 2px solid #ddd;
            border-radius: 8px;
        }

        .footer a {
            font-size: 14px;
            font-weight: bold;
            color: #007BFF;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer a:hover {
            color: #0056b3;
        }

        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 20px;
            font-size: 14px;
            font-weight: bold;
            color: #ffffff;
            background: #007BFF;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            transition: background 0.3s ease, transform 0.2s;
        }

        .btn:hover {
            
            transform: translateY(-3px);
        }

        .btn:active {
            background: #003d80;
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
        .service-section {
    background-color: #F9F9F9; /* 배경색 변경 */
    padding: 40px 20px; /* 섹션 여백 */
    }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header -->
        <div class="header">
            <h1>캐릭터 레벨업 가이드</h1>
            <p>"꼬꼬"와 함께하는 도전과 성장의 여정</p>
        </div>

        <!-- Introduction -->
        <div class="introduction">
            "꼬꼬"는 챌린지 활동을 통해 스스로 성장하고 도전하는 당신의 여정을 상징하는 캐릭터입니다. 점수를 쌓아 레벨을 올리면 "꼬꼬"는 더욱 멋지고 사랑스러운 모습으로 변화합니다. 🐣✨<br><br>
            챌린지를 통해 "꼬꼬"와 함께 성장하고 도전의 재미를 만끽해보세요!
        </div>

        <!-- Level Cards -->
        <div class="level-section">
            <!-- Level Cards -->
            <div class="level-card">
                <img src="${ pageContext.request.contextPath }/images/Level1.png" alt="Level 1 캐릭터">
                <div class="level-title">Lv1: 알</div>
                <div class="level-description">
                    모든 시작은 작지만 소중합니다. "꼬꼬"는 이제 막 세상에 나올 준비를 하는 단계입니다. 점수를 쌓아 알에서 깨어나는 기쁨을 경험하세요! 🐣
                </div>
            </div>
            <div class="level-card">
                <img src="${ pageContext.request.contextPath }/images/Level2.png" alt="Level 2 캐릭터">
                <div class="level-title">Lv2: 아가새</div>
                <div class="level-description">
                    처음으로 세상을 마주한 아가 "꼬꼬"! 이제 조금씩 성장의 즐거움을 배워가고 있습니다. 🐥
                </div>
            </div>
            <div class="level-card">
                <img src="${ pageContext.request.contextPath }/images/Level3.png" alt="Level 3 캐릭터">
                <div class="level-title">Lv3: 성장 아가새</div>
                <div class="level-description">
                    꾸준한 도전으로 자신감을 얻고 있는 성장 병아리입니다. 목표를 향해 더욱 가까워지고 있어요! ✨
                </div>
            </div>
            <div class="level-card">
                <img src="${ pageContext.request.contextPath }/images/Level4.png" alt="Level 4 캐릭터">
                <div class="level-title">Lv4: 독립 아가새</div>
                <div class="level-description">
                    이제는 스스로 모든 도전을 관리할 수 있는 독립 아가새가 된 "꼬꼬"! 더 높은 목표를 향해 도전해보세요! 💪
                </div>
            </div>
             <!-- Level 5 -->
        <div class="level-card">
            <img src="${ pageContext.request.contextPath }/images/Level5.png" alt="Level 5 캐릭터">
            <div class="level-title">Lv5: 탐험 아가새</div>
            <div class="level-description">
                새로운 곳으로의 도전을 즐기는 탐험 아가새 꼬꼬입니다! 
                호기심으로 가득 찬 세상을 모험하며 자신만의 길을 만들어가세요! 🌍
            </div>
        </div>
        <!-- Level 6 -->
        <div class="level-card">
            <img src="${ pageContext.request.contextPath }/images/Level6.png" alt="Level 6 캐릭터">
            <div class="level-title">Lv6: 모험 아가새</div>
            <div class="level-description">
                더 크고 대담한 꿈을 향해 모험하는 아가새 꼬꼬! 자신감 넘치는 모습으로 모두의 기대를 받고 있습니다. 🌟
            </div>
        </div>
    </div>

    <div class="level-section">
        <!-- Level 7 -->
        <div class="level-card">
            <img src="${ pageContext.request.contextPath }/images/Level7.png" alt="Level 7 캐릭터">
            <div class="level-title">Lv7: 리더 아가새</div>
            <div class="level-description">
                이제 꼬꼬는 리더로서 다른 아가새들에게 영감을 주고 있습니다. 
                모든 도전에서 앞장서며 모범을 보이는 멋진 리더가 되어주세요! 🐤✨
            </div>
        </div>
        <!-- Level 8 -->
        <div class="level-card">
            <img src="${ pageContext.request.contextPath }/images/Level8.png" alt="Level 8 캐릭터">
            <div class="level-title">Lv8: 챌린지 마스터</div>
            <div class="level-description">
                모든 도전을 마스터하며 아가새 마스터로 자리 잡았습니다. 
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
            
        </div>

        <!-- Footer -->
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
    </div>
</body>
</html>
