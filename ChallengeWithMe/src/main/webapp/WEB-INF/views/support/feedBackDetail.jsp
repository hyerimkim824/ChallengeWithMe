<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 목록</title>
    <style>
        /* 공통 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        h1 {
            margin: 20px;
            text-align: center;
            color: #333;
        }

        .content {
            width: 90%;
            margin: 0 auto;
        }

        .post-list {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .post-list th, .post-list td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        .post-list th {
            background-color: #ffeb3b;
            color: #333;
        }

        .post-list tr:nth-child(even) {
            background-color: #fdfdfd;
        }

        .post-list tr:hover {
            background-color: #fff9c4;
        }

        /* 모달 스타일 */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            background-color: #fff;
            margin: 15% auto;
            padding: 20px;
            border-radius: 10px;
            width: 90%;
            max-width: 400px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .modal-content h3 {
            font-size: 20px;
            color: #333;
            margin-bottom: 15px;
        }

        .modal-content input {
            width: 80%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        .modal-content button {
            padding: 10px 20px;
            background-color: #ffcc00;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .modal-content button:hover {
            background-color: #ff9900;
        }

        .close {
            font-size: 20px;
            font-weight: bold;
            color: #333;
            position: absolute;
            top: 10px;
            right: 15px;
            cursor: pointer;
        }
    </style>
    <script>
        // 모달 열기
        function openPasswordModal(postId) {
            document.getElementById("passwordModal").style.display = "block";
            document.getElementById("hiddenPostId").value = postId;
        }

        // 모달 닫기
        function closePasswordModal() {
            document.getElementById("passwordModal").style.display = "none";
        }

        // 비밀번호 확인 및 전송
        function submitPassword() {
            const password = document.getElementById("passwordInput").value;
            const postId = document.getElementById("hiddenPostId").value;

            if (!password.trim()) {
                alert("비밀번호를 입력해주세요. 🐇");
                return;
            }

            const form = document.createElement("form");
            form.method = "post";
            form.action = `Detail.do?sup_num=${postId}`;

            const passwordField = document.createElement("input");
            passwordField.type = "hidden";
            passwordField.name = "sup_pwd";
            passwordField.value = password;

            form.appendChild(passwordField);
            document.body.appendChild(form);
            form.submit();
        }
    </script>
</head>
<body>
    <h1>게시글 목록</h1>
    <div class="content">
        <table class="post-list">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                </tr>
            </thead>
            <tbody>
                <!-- 게시글 리스트 반복 -->
                <c:forEach var="post" items="${posts}">
                    <tr>
                        <td>${post.sup_num}</td>
                        <td>
                            <c:choose>
                                <c:when test="${post.sup_visi == 1}">
                                    <!-- 비공개 게시글 -->
                                    <a href="javascript:void(0);" onclick="openPasswordModal(${post.sup_num})">
                                        🔒 ${post.sup_title}
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <!-- 공개 게시글 -->
                                    <a href="Detail.do?sup_num=${post.sup_num}">
                                        ${post.sup_title}
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${post.us_nickname}</td>
                        <td><fmt:formatDate value="${post.sup_date}" pattern="yyyy-MM-dd"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- 비밀번호 입력 모달 -->
    <div id="passwordModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closePasswordModal()">&times;</span>
            <h3>비공개 게시글 비밀번호 입력</h3>
            <input type="password" id="passwordInput" placeholder="비밀번호를 입력해주세요 🐇">
            <input type="hidden" id="hiddenPostId">
            <button onclick="submitPassword()">확인</button>
        </div>
    </div>
</body>
</html>
