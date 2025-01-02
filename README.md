# **꼬박꼬박**

## **Abstract**

**꼬박꼬박**은 사용자가 사용자가 일상 속 목표를 ‘챌린지’라는 형태로 온라인에서 체계적으로 관리할 수 있도록 지원 할 수 있도록 설계된 웹 애플리케이션입니다.  

<br>
<br>

## **🛠 기술 스택**
<div style="display: flex; flex-direction: column; gap: 10px;">
  <div>
    <h3>🎨 FRONT-END</h3>
    <div style="display: flex; gap: 10px;">
      <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white">
      <img src="https://img.shields.io/badge/CSS-663399?style=for-the-badge&logo=css3&logoColor=white">
      <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black">
      <img src="https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jQuery&logoColor=white">
      <img src="https://img.shields.io/badge/BootStrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white">
    </div>
  </div>
</div>
<div style="display: flex; flex-direction: column; gap: 10px;">
  <div>
    <h3>💻 BACK-END</h3>
    <div style="display: flex; gap: 10px;">
      <img src="https://img.shields.io/badge/Java-3776AB?style=for-the-badge&logo=Java&logoColor=white">
      <img src="https://img.shields.io/badge/Servlet-FF6600?style=for-the-badge&logo=servlet&logoColor=black">
      <img src="https://img.shields.io/badge/JSTL-003D8F?style=for-the-badge&logo=jstl&logoColor=black">
      <img src="https://img.shields.io/badge/Oracle-DA291C?style=for-the-badge&logo=oracle&logoColor=black">
    </div>
  </div>
</div>
<div style="display: flex; flex-direction: column; gap: 10px;">
  <div>
    <h3>🔧 TOOLS</h3>
    <div style="display: flex; gap: 10px;">
      <img src="https://img.shields.io/badge/Eclipse-2C2255?style=for-the-badge&logo=eclipseide&logoColor=white">
       <img src="https://img.shields.io/badge/Apache Tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=black">
    </div>
  </div>
</div>

<br>
<br>
<br>

## **📄 주요 기능**

1. **회원 관리**
   - 회원 가입, 로그인/로그아웃, 프로필 관리 기능 제공.

2. **챌린지 관리**
   - CRUD 기반의 챌린지 생성 및 관리.
   - 챌린지 상태(시작 전, 진행 중, 완료)를 날짜에 따라 자동으로 업데이트.

3. **UI/UX 디자인**
   - **Bootstrap**과 **CSS**를 활용한 반응형 웹 페이지 구현.
   - 직관적인 레이아웃과 카테고리별 탐색 기능 제공.

4. **공용 페이지 구성**
   - 공통 Header와 Footer 설계로 일관된 사용자 경험 제공.
   - 메인 페이지에서 사용자 맞춤형 콘텐츠 표시.

5. **Ajax 및 비동기 처리**
   - **jQuery**를 사용하여 실시간 데이터 갱신 및 사용자 인터랙션 개선.

6. **결제 및 예치금 관리**
   - 사용자 예치금 확인 및 전송 기능.
   - 결제 관련 데이터를 효율적으로 관리.

---

<br>
<br>

## **📂 프로젝트 구조**

📁 src <br> 
 ┣ 📁 java <br>
 &nbsp;&nbsp;&nbsp;&nbsp;┣ 📂 kr.challenge.action # Servlet 및 컨트롤러 관련 파일 <br>
 &nbsp;&nbsp;&nbsp;&nbsp;┣ 📂 kr.challenge.dao # 데이터베이스 연동을 위한 DAO 클래스 <br>
 &nbsp;&nbsp;&nbsp;&nbsp;┣ 📂 kr.challenge.vo # 데이터 객체 (VO) 클래스 <br>
 &nbsp;&nbsp;&nbsp;&nbsp;┗ 📂 kr.challenge.util # 유틸리티 클래스 및 헬퍼 함수 <br>
 ┗ 📁 Webapp <br>
 &nbsp;&nbsp;&nbsp;&nbsp;┣ 📂 css # 커스텀 CSS 파일 <br>
 &nbsp;&nbsp;&nbsp;&nbsp;┣ 📂 js # jQuery 및 JavaScript 파일 <br>
 &nbsp;&nbsp;&nbsp;&nbsp;┣ 📂 images # 이미지 리소스 <br>
 &nbsp;&nbsp;&nbsp;&nbsp;┣ 📂 WEB-INF # WEB 페이지 파일 <br>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┣ 📂views # JSP 페이지 파일 <br>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┗ web.xml <br>
 &nbsp;&nbsp;&nbsp;&nbsp;┗ index.jsp # 메인 페이지 <br>
