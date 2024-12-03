<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/sw.css" type="text/css">
<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/charge.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="page-main">
		<div class="charge-div">
			<form id="charge_form" action="confirmDeposit.do" method="post">
				<div class="charge-titleDiv align-center">잔고 충전</div>
				<div class="charge-mainDiv">
					<div class="charge-nav">
						<div class="nav-item nav-charge align-center">
							<div>충전 내역</div>
						</div>
						<div class="nav-item nav-balance align-center"><div class="currbal-title">사용가능 금액</div> <div id="current_bal"><b>${curr_bal}원</b></div></div>
					</div>
					<hr>
					<table id="charge_table">
								<tr>
									<th>충전 금액</th>
									<th>충전 날짜</th>
								</tr>
								
								<c:forEach var="list" items="${list}">
								<tr>
									<td>${list.charge_bal}</td>
									<td>${list.charge_date }</td>
								</tr>
								</c:forEach>
					</table>
					<hr>
					<div class="charge-body">
						<div class="charge-amount">
							<div class="amount-title">충전 금액</div>
							
							<div class="amount-selection">
								<div class="amount-option align-center" id="a_option1">1000원</div>
								<div class="amount-option align-center" id="a_option2">5000원</div>
								<div class="amount-option align-center" id="a_option3">10000원</div>
								<div class="amount-option align-center" id="a_option4">30000원</div>
							</div>
							<div class="space50-div"></div>
							<div class="amount-input"><label>금액 직접입력</label><input type="number" id="charge_amount" placeholder="금액" min="0" max="100000"></div>
							<div class="amount-result"><label>선택 금액</label><span id="selected_amount">9999원</span></div>
							<input type="hidden" name="money" id="money">
						</div>
						<hr>
						<div class="charge-submit align-center">
							<input type="submit" value="충전하기">
						</div>
						
					</div>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>