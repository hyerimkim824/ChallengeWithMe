<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>입력 오류</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .error-container {
            text-align: center;
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .error-container h1 {
            font-size: 24px;
            color: #e74c3c;
        }
        .error-container p {
            font-size: 18px;
            margin: 10px 0;
        }
        .error-container a {
            text-decoration: none;
            color: #3498db;
            font-weight: bold;
        }
        .error-container a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>⚠️ 입력 오류</h1>
        <p><%= request.getAttribute("error") %></p>
        <a href="javascript:history.back()">돌아가기</a>
    </div>
</body>
</html>
