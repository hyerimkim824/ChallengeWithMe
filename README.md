# **Project Name**

[프로젝트 간략한 설명]  
사용자가 사용자가 일상 속 목표를 ‘챌린지’라는 형태로 온라인에서 체계적으로 관리할 수 있도록 지원 할 수 있도록 설계된 웹 애플리케이션입니다.  
본 프로젝트는 **Java, JSP, JSTL, CSS, HTML5, Servlet, jQuery, Bootstrap** 등을 활용하여 개발되었습니다.

---

## **🛠 기술 스택**

| **기술**        | **설명**                                                                 |
|------------------|---------------------------------------------------------------------------|
| **Java**         | 백엔드 로직 구현 및 비즈니스 로직 처리                                      |
| **JSP**          | 동적 웹 페이지 생성 및 데이터 출력                                        |
| **JSTL**         | 반복문, 조건문 등을 사용해 JSP 코드 간결화                                |
| **Servlet**      | 클라이언트 요청 처리 및 데이터 연동                                      |
| **HTML5**        | 구조화된 웹 콘텐츠 제작                                                 |
| **CSS**          | 사용자 친화적인 UI 디자인 및 스타일링                                     |
| **jQuery**       | 간단한 DOM 조작 및 Ajax를 이용한 비동기 요청                              |
| **Bootstrap**    | 반응형 UI 설계 및 레이아웃 구축                                           |

---

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
   - **jQuery**를 사용하여 데이터 갱신 및 사용자 인터랙션 개선.

6. **결제 및 예치금 관리**
   - 사용자 예치금 확인 및 전송 기능.
   - 결제 관련 데이터를 효율적으로 관리.

---

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
