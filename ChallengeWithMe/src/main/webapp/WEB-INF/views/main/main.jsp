<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	type="text/css">
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="page-main">
		<div class="space100-div"></div>
		<div class="m-title-container align-center">
			<h1 style="font-weight: bold; font-size: 3.5vw;">작심삼일? 이제는 끝!</h1>
		</div>
		<div class="space150-div"></div>
		<div class="m-header1-container">
			<div class="header1-box box1">
				<div class="header-item item1 align-left">꼬박꼬박은?</div>
				<div class="header-item item2">
					꼬박꼬박은 모두가 함께 참여하는 챌린지 입니다<br> 2주 ~ 6주동안 진행하고, 목표를 완성할 수 있어요
				</div>
				<div class="header-item item3">
					<button class="item3-btn" type="button"
						onclick="location.href='${pageContext.request.contextPath}/challenge/challengeMain.do'">챌린지
						시작하기</button>
				</div>
			</div>
			<div class="header1-box box2">
				<c:if test="${us_num != null && admin == 0}">
					<div class="user-card shadow-effect">
						<div class="card-left">
							<div class="left1">
								<div class="left1Img align-center">
									<c:choose>
										<c:when test="${rank == 1}">
											<img src="../images/Level1.png">
										</c:when>
										<c:when test="${rank == 2}">
											<img src="../images/Level2.png">
										</c:when>
										<c:when test="${rank == 3}">
											<img src="../images/Level3.png">
										</c:when>
										<c:when test="${rank == 4}">
											<img src="../images/Level4.png">
										</c:when>
										<c:when test="${rank == 5}">
											<img src="../images/Level5.png">
										</c:when>
										<c:when test="${rank == 6}">
											<img src="../images/Level6.png">
										</c:when>
										<c:when test="${rank == 7}">
											<img src="../images/Level7.png">
										</c:when>
										<c:when test="${rank == 8}">
											<img src="../images/Level8.png">
										</c:when>
										<c:when test="${rank == 9}">
											<img src="../images/Level9.png">
										</c:when>
										<c:when test="${rank == 10}">
											<img src="../images/Level10.png">
										</c:when>
										<c:otherwise>
											<img src="../images/Level1.png">
										</c:otherwise>
									</c:choose>

								</div>
								<div>
									<p>나의 등급</p>
									<p>Lv${rank}</p>
								</div>
							</div>
							<div class="left2">
								<div class="left2-title">보유 배찌</div>
								<hr>
								<div class="left2-container">
									<div class="left2-box1">
										<img src="../images/face.png" width="50px" height="50px">
									</div>
									<div class="left2-box2">
										<ul>
											<li><label>보유배찌</label>6개</li>
											<li><label>미획득배찌</label>10개</li>
										</ul>
									</div>
								</div>

							</div>
							<div class="left3">
								<div class="info-link">나의배찌 -></div>
							</div>
						</div>
						<hr class="vertical">
						<div class="card-right">
							<div class="right1">
								<div class="right1-box1">
									<img
										src="${pageContext.request.contextPath}/upload/${xuser.img}">
									<div class="right-user">
										<p>환영합니다</p>
										<p>${xuser.nickname}님</p>
									</div>
								</div>
							</div>
							<div class="right2">
								<ul>
									<li><label>참여중인 챌린지</label>${ score_vo.join_num - score_vo.complete_num - score_vo.quit_amount}개</li>
									<li><label>완료한 챌린지</label>${score_vo.complete_num}개</li>
									<li><label>랭크 점수</label>${score_vo.us_score}점</li>
								</ul>
							</div>
							<div class="right3">
								<div class="info-link">마이페이지 -></div>
							</div>
						</div>
					</div>
				</c:if>
			</div>
		</div>
		<div class="space100-div"></div>
		<hr>
		<div class="space50-div"></div>
		<div class="m-content1-container">
			<div class="space50-div"></div>
			<div class="m-content1-title">
				함께 도전하며 성장하는 즐거움,<br> 누구나 느낄 수 있습니다.
			</div>
			<div class="content1-box c1-box1 ">
				<div class="c1b1-item itema1 shadow-effect">
					<div class="c1b1-title shadow-effect">목표 달성 챌린지</div>
					<div class="c1b1-content" style="text-align: center;">
						"당신도 100% 달성의 <br>주인공이 될 수 있습니다!"
					</div>
				</div>
				<div class="c1b1-item itema2 shadow-effect">
					<div class="c1b1-title shadow-effect">건강한 하루 챌린지</div>
					<div class="c1b1-content" style="text-align: center;">
						"매일 더 건강한 습관을 <br>만들어요!"
					</div>
				</div>
				<div class="c1b1-item itema3 shadow-effect">
					<div class="c1b1-title shadow-effect">성공을 향한 첫걸음</div>
					<div class="c1b1-content" style="text-align: center;">
						"변화를 원하는 <br>모든 사람들이 모이는 곳"
					</div>
				</div>
				<div class="c1b1-item itema4 shadow-effect">
					<div class="c1b1-title shadow-effect">함께하는 즐거움</div>
					<div class="c1b1-content" style="text-align: center;">
						"도전의 즐거움, <br>지금 시작하세요."
					</div>
				</div>
			</div>
			<div class="content1-box c1-box2">
				<div class="c1b2-item itemb1">
					<div class="p1">현재 챌린지 수</div>
					<div class="p2">100개</div>
				</div>
				<div class="c1b2-item itemb2">
					<div class="p1">누적 참여 후기</div>
					<div class="p2">1360개</div>
				</div>
				<div class="c1b2-item itemb3">
					<div class="p1">누적 완료 챌린지</div>
					<div class="p2">630개</div>
				</div>
			</div>

		</div>
		<div class="space150-div"></div>
		<hr>
		<div class="m-content2-container">
			<div class="m-content2-main1">
				<div class="m-content2-title">
					함께하는<br>챌린지, 목표는<br>더 가까워집니다.
				</div>
				<p class="m-content2-content1">
					인증으로 성취감을 더하고, 목표에 한 발 더 다가가세요. <br> 책임감 있는 도전이 성공의 시작입니다.
				</p>
				<p class="m-content2-content2">
					<a class="m-content2-content2"
						href="${pageContext.request.contextPath}/challenge/challengeMain.do">챌린지
						바로가기 →</a>
				</p>
			</div>
			<div class="m-content2-main2">
				<div class="m-content2-menu1">
					<a
						href="${pageContext.request.contextPath}/challenge/challengeList.do">
						<img class="ch-img"
						src="${pageContext.request.contextPath}/images/teamwork.jpg">
					</a>
					<p>
						<input type="button" value="챌린지 참여"
							onclick="location.href='${pageContext.request.contextPath}/challenge/challengeList.do'">
					</p>
					<p style="font-size: 15px;">
						함께 도전하며<br> 더 큰 성취감을<br> 느껴보세요!
					</p>
				</div>
				<div class="m-content2-menu1">
					<a
						href="${pageContext.request.contextPath}/challenge/challengeCreateForm.do">
						<img class="ch-img"
						src="${pageContext.request.contextPath}/images/start2.PNG">
					</a>
					<p>
						<input type="button" value="챌린지 개설"
							onclick="location.href='${pageContext.request.contextPath}/challenge/challengeCreateForm.do'">
					</p>
					<p style="font-size: 15px;">
						새로운 목표,<br> 나만의 챌린지를<br> 만들어보세요!
					</p>

				</div>
				<div class="m-content2-menu1">
					<a
						href="${pageContext.request.contextPath}/challenge/challengeOfficialList.do">
						<img class="ch-img"
						src="${pageContext.request.contextPath}/images/success2.jpg">
					</a>
					<p>
						<input type="button" value="공식 챌린지"
							onclick="location.href='${pageContext.request.contextPath}/challenge/challengeOfficialList.do'">
					</p>
					<p style="font-size: 15px;">
						도전하고<br> 특별한 보상을<br> 만나보세요!
					</p>
				</div>

			</div>
		</div>
		<div class="space150-div"></div>
		<hr>

		<div class="m-content3-container">
			
		</div>
		<div class="m-content4-container">
			<div class="c4-header">
				<div class="c4-title">사용자 챌린지</div>
				<div class="linkToChall" onclick="location.href='${pageContext.request.contextPath}/challenge/challengeList.do?'">챌린지 바로가기-></div>
			</div>
			<div class="c4-content">
				<c:forEach var="list" items="${chall_list}">
					<div class="ch-item">

						<div class="item-header">
							<div class="ch-category">${list.cate_name}</div>
						</div>
						<a
							href="${pageContext.request.contextPath}/challenge/challengeDetail.do?ch_num=${list.ch_num}">
							<div class="ch-background">
								<c:if test="${empty list.ch_img}">
									<c:choose>
										<c:when test="${list.cate_num == 1}">
											<img class="ch-bgImg" src="../images/health.jpg"
												style="max-width: 100%; max-height: 100%;" />
										</c:when>
										<c:when test="${list.cate_num == 2}">
											<img class="ch-bgImg" src="../images/food.jpg"
												style="max-width: 100%; max-height: 100%;" />
										</c:when>
										<c:when test="${list.cate_num == 3}">
											<img class="ch-bgImg" src="../images/self-develop.jpg"
												style="max-width: 100%; max-height: 100%;" />
										</c:when>
										<c:when test="${list.cate_num == 4}">
											<img class="ch-bgImg" src="../images/wakeup.jpg"
												style="max-width: 100%; max-height: 100%;" />
										</c:when>
										<c:when test="${list.cate_num == 5}">
											<img class="ch-bgImg" src="../images/economy.jpg"
												style="max-width: 100%; max-height: 100%;" />
										</c:when>
										<c:when test="${list.cate_num == 6}">
											<img class="ch-bgImg" src="../images/stop.jpg"
												style="max-width: 100%; max-height: 100%;" />
										</c:when>
										<c:otherwise>
											<img class="ch-bgImg" src="../images/face.png"
												style="max-width: 100%; max-height: 100%;" />
										</c:otherwise>
									</c:choose>
								</c:if>
								<c:if test="${!empty list.ch_img}">
									<img class="ch-bgImg"
										src="${pageContext.request.contextPath}/upload/${list.ch_img}"
										style="max-width: 100%; max-height: 100%;">
								</c:if>
								<p class="ch-title">${list.ch_title}</p>
								<div class="ch-dueDate align-center">
									<c:if test="${list.dateDifference > 0 && list.ch_status != 'finished'}">
										<div class="font-before">D-${list.dateDifference}</div>
									</c:if>
									<c:if test="${list.dateDifference <= 0  && list.ch_status != 'finished'}">
										D+${list.dateDifference * -1}
									</c:if>
									<c:if test="${list.ch_status == 'finished'}">
										<div class="font-end">OVER</div>
									</c:if>
								</div>
							</div>
							<div class="ch-info">
								<div class="ch-people">
									<img class="people-img"
										src="${pageContext.request.contextPath}/images/person.svg">
									<div class="info-val">${list.ch_person}/${list.ch_max}</div>
								</div>
								<div class="ch-like">
									<img class="like-img"
										src="${pageContext.request.contextPath}/images/chat-square-heart.svg">
									<div class="info-val">${list.ch_like}</div>
								</div>
								<div class="ch-view">
									<img class="view-img"
										src="${pageContext.request.contextPath}/images/eye.svg">
									<div class="info-val">${list.ch_view}</div>
								</div>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>

		<div class="space150-div"></div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>