<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>환불 방법 및 절차</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .header {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .section {
            margin-bottom: 30px;
        }
        .section-title {
            font-size: 18px;
            font-weight: bold;
            color: #555;
            margin-bottom: 10px;
        }
        .section-content {
            font-size: 14px;
            color: #666;
            line-height: 1.8;
        }
        ul {
            padding-left: 20px;
        }
        ul li {
            margin-bottom: 10px;
            list-style: disc;
            font-size: 14px;
        }
        .btn-group {
            text-align: center;
            margin-top: 20px;
        }
        .btn {
            padding: 10px 20px;
            font-size: 14px;
            font-weight: bold;
            color: #fff;
            background-color: #4CAF50;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 5px;
        }
        .btn:hover {
            background-color: #45a049;
        }
        a {
            color: #4CAF50;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">환불 방법 및 절차 가이드 🐥✨</div>

        <!-- 환불 소개 -->
        <div class="section">
            <div class="section-title">환불은 어떻게 받을 수 있나요? 🐇</div>
            <div class="section-content">
                환불은 결제하신 금액에 대해 정당한 사유가 있을 경우 다시 돌려받는 절차를 말합니다. <br>
                정확한 환불 요청 방법과 정책을 아래에서 확인하세요. 💰
            </div>
        </div>

        <!-- 환불 요청 방법 -->
        <div class="section">
            <div class="section-title">환불 요청 방법 🐥</div>
            <div class="section-content">
                환불을 요청하려면 다음 단계를 따라주세요:
                <ul>
                    <li>1️⃣ <strong>로그인:</strong> 먼저 계정으로 로그인하세요.</li>
                    <li>2️⃣ <strong>고객센터 접속:</strong> <a href="List.do">고객센터</a> 메뉴로 이동하세요.</li>
                    <li>3️⃣ <strong>문의 등록:</strong> <a href="SupportWrite.do">문의하기</a> 버튼을 눌러 요청을 등록하세요.</li>
                    <li>4️⃣ <strong>확인 및 진행:</strong> 고객센터에서 환불 가능 여부를 검토한 후 절차를 안내드립니다.</li>
                </ul>
            </div>
        </div>

        <!-- 환불 정책 -->
        <div class="section">
            <div class="section-title">환불 정책 🐰</div>
            <div class="section-content">
                <ul>
                    <li>✅ 결제 후 7일 이내 요청 시 환불이 가능합니다.</li>
                    <li>✅ 일부 사용한 서비스는 사용량에 따라 환불 금액이 조정될 수 있습니다.</li>
                    <li>✅ 프로모션 상품은 환불이 제한될 수 있습니다.</li>
                    <li>✅ 환불 요청 시, 결제 수단에 따라 처리 시간이 상이할 수 있습니다.</li>
                </ul>
            </div>
        </div>

        <!-- 추가 도움 -->
        <div class="section">
            <div class="section-title">도움이 필요하신가요? 🐇</div>
            <div class="section-content">
                환불과 관련하여 추가로 궁금한 점이 있으시면 <a href="SupportMain.do">고객센터</a>를 방문하거나 <a href="SupportWrite.do">문의하기</a>를 통해 문의해주세요. <br>
                언제든 도와드리겠습니다! 🐥✨
            </div>
        </div>

        <!-- 버튼 -->
        <div class="btn-group">
            <button class="btn" onclick="window.history.back();">이전 페이지</button>
            <button class="btn" onclick="location.href='communityMain.jsp';">메인으로 이동</button>
        </div>
    </div>
</body>
</html>
