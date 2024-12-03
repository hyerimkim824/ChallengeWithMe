<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>로그인 필요</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fffbe6;
        }
        .container {
            width: 80%;
            margin: 50px auto;
            text-align: center;
            background-color: #ffffff;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #ffcc00;
            font-size: 24px;
            margin-bottom: 20px;
        }
        p {
            font-size: 16px;
            color: #555;
            margin-bottom: 30px;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #ffcc00;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
            font-weight: bold;
        }
        .button:hover {
            background-color: #ffbb00;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>로그인이 필요합니다</h1>
        <p>해당 페이지를 이용하려면 로그인이 필요합니다.<br>아래 버튼을 클릭하여 로그인 페이지로 이동해 주세요!</p>
       <a href="<%=request.getContextPath()%>/xuser/login.do" class="button">로그인 페이지로 이동</a>
    </div>
</body>
</html>
