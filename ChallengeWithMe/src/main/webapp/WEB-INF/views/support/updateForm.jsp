<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문의 수정</title>
</head>
<body>
    <h1>문의 수정</h1>
    <form action="${pageContext.request.contextPath}/support/UpdateAction.do" method="post">
        <!-- 문의 번호 (숨겨진 필드) -->
        <input type="hidden" name="sup_num" value="${support.sup_num}">

        <!-- 제목 입력 -->
        <div>
            <label for="sup_title">문의 제목</label>
            <input type="text" id="sup_title" name="sup_title" value="${support.sup_title}" required>
        </div>

        <!-- 내용 입력 -->
        <div>
            <label for="sup_content">문의 내용</label>
            <textarea id="sup_content" name="sup_content" rows="6" required>${support.sup_content}</textarea>
        </div>

        <!-- 공개 여부 -->
        <div>
            <label for="sup_visi">공개 여부</label>
            <select id="sup_visi" name="sup_visi">
                <option value="1" ${support.sup_visi == 1 ? "selected" : ""}>공개</option>
                <option value="0" ${support.sup_visi == 0 ? "selected" : ""}>비공개</option>
            </select>
        </div>

        <!-- 수정 버튼 -->
        <div>
            <button type="submit">수정하기</button>
        </div>
    </form>
</body>
</html>
