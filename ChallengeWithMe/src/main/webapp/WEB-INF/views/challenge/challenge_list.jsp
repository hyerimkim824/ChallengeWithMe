<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꼬박꼬박 챌린지 목록</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/sw.css" type="text/css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/challenge.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="page-main">

		<div class="space100-div"></div>
		<div class="ch-top-container">

			<div class="official-status-container">
				<button class="official-status-btn user-ch">사용자 챌린지</button>
				<button class="official-status-btn admin-ch" type="button"
					onclick="location.href='challengeOfficialList.do'">공식 챌린지</button>
			</div>

			<button class="btn ch-create" style="background-color: #FFE066" onclick="location.href='challengeCreateForm.do'" type="button">챌린지 개설</button>
		</div>
		<div class="space50-div"></div>
		<form id="search_form" class="search-container shadow-effect"
			action="challengeList.do" method="get">

			<select class="search-select" name="keyfield">
				<option value="0">전체</option>
				<option value="1">제목</option>
				<option value="2">작성자</option>
			</select> <input type="text" class="search-field" name="keyword"> <input
				type="hidden" name="category" value="${category}">
			<img class="search-submitBtn" src="../images/magnifier.png">
			<input type="submit" id="submit_form" class="submit-form" value="검색">
		</form>
		<div class="space50-div"></div>
		
		<div class="dropdown-container">
			<div class="filter-btn"><img src="../images/filter.svg" ></div>
			<div class="dropdown dd1 hidden">
				<button class="btn dropdown-toggle" type="button" id="list_cat"
					style="background-color: #FFE066" data-bs-toggle="dropdown"
					aria-expanded="true">
					<c:if test="${!empty cat_name}">
					${cat_name}
				</c:if>
					<c:if test="${empty cat_name}">
					카테고리
				</c:if>
				</button>

				<ul class="dropdown-menu" style="background-color: #FFFAE5">
					<li><a class="dropdown-item list-dd" id="cat_all"
						data-category="0" href="challengeList.do?">전체 챌린지</a></li>
					<li><a class="dropdown-item list-dd" id="cat_health"
						data-category="1"
						href="challengeList.do?category=1&visi=${visi_check}&status=${status}">건강</a></li>
					<li><a class="dropdown-item list-dd" id="cat_food"
						data-category="2"
						href="challengeList.do?category=2&visi=${visi_check}&status=${status}">식습관</a></li>
					<li><a class="dropdown-item list-dd" id="cat_develop"
						data-category="3"
						href="challengeList.do?category=3&visi=${visi_check}&status=${status}">자기계발</a></li>
					<li><a class="dropdown-item list-dd" id="cat_develop"
						data-category="4"
						href="challengeList.do?category=4&visi=${visi_check}&status=${status}">기상</a></li>
					<li><a class="dropdown-item list-dd" id="cat_develop"
						data-category="5"
						href="challengeList.do?category=5&visi=${visi_check}&status=${status}">경제</a></li>
					<li><a class="dropdown-item list-dd" id="cat_develop"
						data-category="6"
						href="challengeList.do?category=6&visi=${visi_check}&status=${status}">금연/금주</a></li>
				</ul>
			</div>

			<div class="dropdown dd2 hidden">
				<button class="btn dropdown-toggle" type="button" id="list_visi"
					style="background-color: #FFE066" data-bs-toggle="dropdown"
					aria-expanded="true">
					<c:if test="${visi_checked == 0}">
					공개
				</c:if>
					<c:if test="${visi_checked != 0}">
					비공개
				</c:if>
				</button>

				<ul class="dropdown-menu" style="background-color: #FFFAE5">
					<li><a class="dropdown-item" id="chall_visi"
						href="challengeList.do?visi=0&category=${category}&status=${status}">공개</a></li>
					<li><a class="dropdown-item" id="chall_unvisi"
						href="challengeList.do?visi=1&category=${category}&status=${status}">비공개</a></li>
				</ul>
			</div>
			 
			<div class="dropdown dd3 hidden">
				<button class="btn dropdown-toggle" type="button" id="list_visi"
					style="background-color: #FFE066" data-bs-toggle="dropdown"
					aria-expanded="true">
					<c:if test="${status == 'before'}">
						시작 전
					</c:if>
					<c:if test="${status == 'ongoing'}">
						진행 중
					</c:if>
					<c:if test="${status == 'finished'}">
						완료
					</c:if>
					<c:if test="${status != 'before' && status != 'ongoing' && status != 'finished'}">
						상태
					</c:if>
				</button>

				<ul class="dropdown-menu" style="background-color: #FFFAE5">
					<li><a class="dropdown-item" id="chall_before"
						href="challengeList.do?status=before&category=${category}&visi=${visi}">시작 전</a></li>
					<li><a class="dropdown-item" id="chall_ongoing"
						href="challengeList.do?status=ongoing&category=${category}&visi=${visi}">진행 중</a></li>
					<li><a class="dropdown-item" id="chall_done"
						href="challengeList.do?status=finished&category=${category}&visi=${visi}">완료</a></li>
				</ul>
			</div>
			
		</div>
		<div class="space100-div"></div>
		<div class="ch-container">
			<c:if test="${count > 0 && visi_checked == 0}">
				<c:forEach var="list" items="${chall_list}">
					<div class="ch-item">

						<div class="item-header">
							<div class="ch-category">${list.cate_name}</div>
							<c:if test="${list.heart_status}">
								<div class="item-heart" data-chnum="${list.ch_num}">
									<img
										src="${pageContext.request.contextPath}/images/red-heart.png"
										width="15px" height="15px">
								</div>
							</c:if>
							<c:if test="${!list.heart_status}">
								<div class="item-heart" data-chnum="${list.ch_num}">
									<img src="${pageContext.request.contextPath}/images/heart.png"
										width="15px" height="15px">
								</div>
							</c:if>
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
									<p>${list.ch_person}/${list.ch_max}</p>
								</div>
								<div class="ch-like">
									<img class="like-img"
										src="${pageContext.request.contextPath}/images/chat-square-heart.svg">
									<p>${list.ch_like}</p>
								</div>
								<div class="ch-view">
									<img class="view-img"
										src="${pageContext.request.contextPath}/images/eye.svg">
									<p>${list.ch_view}</p>
								</div>
							</div>
						</a>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${count != 0 && visi_checked == 1}">
				<div class="joinCode-container shadow-effect">
					<div class="joinCode-title">참가코드로 챌린지 찾기</div>
					<div>
						<form id="joinCode_form" action="challengeList.do?visi=1"
							method="post">
							<label>챌린지 코드</label>
							<div class="jc-searchbox shadow-effect">
								<input class="jc-search" name="ch_code"> <input
									class="jc-submit" type="submit" value="검색">
							</div>
						</form>
					</div>
				</div>

				<div class="private-challenge shadow-effect">
					<c:if test="${!empty pv_chall}">
						<div class="joinCode-title">검색된 챌린지</div>
						<div class="pv-box">
							<div class="pv-detail input">
								<div class="pv-inputTitle btn-design align-center">참가 코드</div>
								<div class="pv-inputValue align-center">${join_code}</div>
							</div>
							<div class="hr-vertical"></div>
							<div class="pv-detail chall">
								<div>
									<div class="pv-item">

										<div class="item-header">
											<div class="ch-category">${pv_chall.cate_name}</div>
											<c:if test="${pv_chall.heart_status}">
												<div class="item-heart" data-chnum="${pv_chall.ch_num}">
													<img
														src="${pageContext.request.contextPath}/images/red-heart.png"
														width="15px" height="15px">
												</div>
											</c:if>
											<c:if test="${!pv_chall.heart_status}">
												<div class="item-heart" data-chnum="${pv_chall.ch_num}">
													<img
														src="${pageContext.request.contextPath}/images/heart.png"
														width="15px" height="15px">
												</div>
											</c:if>
										</div>
										<a
											href="${pageContext.request.contextPath}/challenge/challengeDetail.do?ch_num=${pv_chall.ch_num}">
											<div class="ch-background">
												<c:if test="${empty pv_chall.ch_img}">
													<c:choose>
														<c:when test="${pv_chall.cate_num == 1}">
															<img class="ch-bgImg" src="../images/health.jpg"
																style="max-width: 100%; max-height: 100%;" />
														</c:when>
														<c:when test="${pv_chall.cate_num == 2}">
															<img class="ch-bgImg" src="../images/food.jpg"
																style="max-width: 100%; max-height: 100%;" />
														</c:when>
														<c:when test="${pv_chall.cate_num == 3}">
															<img class="ch-bgImg" src="../images/self-develop.jpg"
																style="max-width: 100%; max-height: 100%;" />
														</c:when>
														<c:otherwise>
															<img class="ch-bgImg" src="../images/face.jpg"
																style="max-width: 100%; max-height: 100%;" />
														</c:otherwise>
													</c:choose>
												</c:if>
												<c:if test="${!empty pv_chall.ch_img}">
													<img class="ch-bgImg"
														src="${pageContext.request.contextPath}/upload/${pv_chall.ch_img}"
														style="max-width: 100%; max-height: 100%;">
												</c:if>
												<p class="ch-title">${pv_chall.ch_title}</p>
												<div class="ch-dueDate align-center">
													<c:if test="${pv_chall.dateDifference > 0 && pv_chall.ch_status != 'finished'}">
														<div class="font-before">D-${list.dateDifference}</div>
													</c:if>
													<c:if test="${pv_chall.dateDifference <= 0  && pv_chall.ch_status != 'finished'}">
														D+${list.dateDifference * -1}
													</c:if>
													<c:if test="${pv_chall.ch_status == 'finished'}">
														<div class="font-end">OVER</div>
													</c:if>
												</div>
											</div>
											<div class="ch-info">
												<div class="ch-people">
													<img class="people-img"
														src="${pageContext.request.contextPath}/images/person.svg">
													<p>${pv_chall.ch_person}/${pv_chall.ch_max}</p>
												</div>
												<div class="ch-like">
													<img class="like-img"
														src="${pageContext.request.contextPath}/images/chat-square-heart.svg">
													<p>${pv_chall.ch_like}</p>
												</div>
												<div class="ch-view">
													<img class="view-img"
														src="${pageContext.request.contextPath}/images/eye.svg">
													<p>${pv_chall.ch_view}</p>
												</div>
											</div>
										</a>
									</div>
								</div>
							</div>
						</div>

					</c:if>
					<c:if test="${empty pv_chall}">
						<div class="pv-box align-center">검색된 참가 코드의 챌린지가 없습니다</div>
					</c:if>

				</div>


			</c:if>
		</div>
		<c:if test="${count == 0}">
			<div class="align-center">표시할 챌린지가 없습니다!!!!!!!!!</div>
		</c:if>




		<div class="page-div align-center">${page}</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>