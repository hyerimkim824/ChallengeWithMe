<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문구 인증 챌린지</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/style.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/khr.css" type="text/css">
<script type="text/javascript"
	src="${ pageContext.request.contextPath }/js/jquery-3.7.1.min.js"></script>
	
</head>
 

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <h1>QR 인증</h1>
    
<% 
    String chNum = request.getParameter("ch_num");
    out.println("Received ch_num: " + chNum);
%>
    
    <div><br><br><br><br><br><br><br><br><br><br><br><br></div>
    <div><br><br><br><br><br><br><br><br><br><br><br><br></div>
    
    
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
    
</body>
</html>