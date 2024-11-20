<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="page-main">
		<div class="space50-div"></div>
		<div class="m-title-container align-center">
			<h1>작심삼일? 이제는 '끝'</h1>
		</div>
		<div class="m-header1-container">
			<div class="header1-box box1">
				<div class="header-item item1">꼬박꼬박은?</div>
				<div class="header-item item2">꼬박꼬박은 모두가 함께 참여하는 챌린지 입니다. 2주 ~ 6주동안 진행하고, 목표를 완성할 수 있어요</div>
				<div class="header-item item3"><button value="챌린지 시작하기"></button></div>
			</div>
			<div class="header1-box box2">
				<c:if test="${us_num != null && admin == 0}">
					<div class="user-card">
						<div class="card-left">
							<div class="left1">
								<img>
								<div>
									<p>나의 등급</p>
									<p>Lv3</p>
								</div>
							</div>
							<div class="left2">
								<div>보유 배찌</div>
								<hr>
								<div>
									<div>
										<img>
									</div>
									<div>
										<ul>
											<li><label>보유배찌</label>6개</li>
											<li><label>미획득배찌</label>10개</li>
										</ul>
									</div>
								</div>

							</div>
							<div class="left3">나의배찌 -></div>
						</div>

						<div class="card-right">
							<div>
								<div>
									<img>
									<div>
										<p>환영합니다</p>
										<p>${us_nickname}님</p>
									</div>
								</div>
								<div>
									참여중인 챌린지: 3개 <br> 완료한 챌린지: 6개 <br> 랭크 점수: 897점 <br>
								</div>
								<div>마이페이지 -></div>
							</div>
						</div>
					</div>
				</c:if>
			</div>
		</div>
		<hr>
		<div class="space50-div"></div>
		<div class="m-content1-container">
			<p>누구나 할 수 있습니다!</p>
			<div class="content1-box box1">
				<div class="c1b1-item item1">
					<div>제목</div>
					<div>내용</div>
				</div>
				<div class="c1b1-item item2">
					<div>제목</div>
					<div>내용</div>
				</div>
				<div class="c1b1-item item3">
					<div>제목</div>
					<div>내용</div>
				</div>
				<div class="c1b1-item item4">
					<div>제목</div>
					<div>내용</div>
				</div>
			</div>
			<div class="content1-box box2">
				<div class="c1b2-item item1">
					<p>현재 챌린지 수</p>
					<p>100개</p>
				</div>
				<div class="c1b2-item item2">
					<p>누적 참여 후기</p>
					<p>1360개</p>
				</div>
				<div class="c1b2-item item3">
					<p>누적 완료 챌린지</p>
					<p>630개</p>
				</div>
			</div>

		</div>
		<div class="m-content2-container">
			<div>어떻게 쓰는건가요</div>
			<div>
				<div class="content2-box1">함께하는 챌린지!</div>
				<div class="content2-box2">
					<div>
						<button>챌린지</button>
						<button>일정표</button>
						<button>커뮤니티</button>
						<button>후기</button>
					</div>
					<div>
						content2 내용
					</div>
				</div>
			</div>
		</div>
		<div class="m-content3-container">
		content3
		</div>
		<div class="m-content4-container">
		content4
		</div>

	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>



