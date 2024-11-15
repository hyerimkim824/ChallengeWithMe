<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>1:1 문의 작성</title>
    <style>
        /* 기본 스타일 */
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
            border-bottom: 2px solid #ffcc00;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        form {
            margin-top: 20px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-label {
            font-size: 16px;
            font-weight: bold;
            color: #555;
            display: block;
            margin-bottom: 5px;
        }
        .form-control {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .form-control:focus {
            border-color: #ff9900;
            outline: none;
        }
        .form-control-textarea {
            height: 150px;
        }
        .form-radio-group {
            display: flex;
            gap: 10px;
            align-items: center;
        }
        .form-radio-label {
            font-size: 14px;
            color: #555;
        }
        .btn-group {
            text-align: right;
        }
        .btn {
            padding: 10px 20px;
            font-size: 14px;
            font-weight: bold;
            color: #fff;
            background-color: #ff9900;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #e68a00;
        }
        .btn-cancel {
            background-color: #ccc;
            margin-right: 10px;
        }
        .btn-cancel:hover {
            background-color: #aaa;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">1:1 문의 작성</div>
        <form action="supportWriteAction.do" method="post" enctype="multipart/form-data">
            <!-- 문의 유형 -->
            <div class="form-group">
                <label for="sup_pick" class="form-label">문의 유형</label>
                <select name="sup_pick" id="sup_pick" class="form-control">
                    <option value="1">로그인 및 계정</option>
                    <option value="2">결제 및 환불</option>
                    <option value="3">기타</option>
                </select>
            </div>

            <!-- 문의 제목 -->
            <div class="form-group">
                <label for="sup_title" class="form-label">문의 제목</label>
                <input type="text" id="sup_title" name="sup_title" class="form-control" placeholder="문의 제목을 입력해주세요" required>
            </div>

            <!-- 문의 내용 -->
            <div class="form-group">
                <label for="sup_content" class="form-label">문의 내용</label>
                <textarea id="sup_content" name="sup_content" class="form-control form-control-textarea" placeholder="문의 내용을 자세히 입력해주세요" required></textarea>
            </div>

            <!-- 파일 첨부 -->
            <div class="form-group">
                <label for="sup_img" class="form-label">파일 첨부 (선택)</label>
                <input type="file" id="sup_img" name="sup_img" class="form-control">
            </div>

            <!-- 공개 여부 -->
            <div class="form-group">
                <label class="form-label">공개 여부</label>
                <div class="form-radio-group">
                    <label>
                        <input type="radio" name="sup_visi" value="true" checked>
                        <span class="form-radio-label">공개</span>
                    </label>
                    <label>
                        <input type="radio" name="sup_visi" value="false">
                        <span class="form-radio-label">비공개</span>
                    </label>
                </div>
            </div>

            <!-- 비공개 비밀번호 -->
            <div class="form-group">
                <label for="sup_pwd" class="form-label">비공개 비밀번호 (숫자 4자리)</label>
                <input type="password" id="sup_pwd" name="sup_pwd" class="form-control" placeholder="비공개 비밀번호를 입력해주세요" maxlength="4" required>
            </div>

            <!-- 버튼 -->
            <div class="btn-group">
                <button type="button" class="btn btn-cancel" onclick="window.history.back();">취소</button>
                <button type="submit" class="btn">문의하기</button>
            </div>
        </form>
    </div>
</body>
</html>
