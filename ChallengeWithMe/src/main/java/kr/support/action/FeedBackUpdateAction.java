package kr.support.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.nio.file.Paths;
import java.sql.SQLException;

import kr.controller.Action;
import kr.support.dao.SupportDAO;
import kr.support.vo.SupportVO;

public class FeedBackUpdateAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 🐇 요청 인코딩 설정
		request.setCharacterEncoding("UTF-8");

		
			// 🐰 세션에서 로그인된 사용자 정보 확인
			HttpSession session = request.getSession();
			Long userNum = (Long) session.getAttribute("us_num");

			if (userNum == null) {
				// 로그인이 되지 않은 경우
				return "common/loginRequired.jsp"; // 로그인 페이지로 리다이렉트
			}
			// 🐇 2. 요청 방식(GET/POST)에 따라 처리 분기
			if (request.getMethod().equalsIgnoreCase("GET")) {
				// GET 요청인 경우 작성 폼으로 이동
				return "support/feedBackupdate.jsp";
			}
			// 🐰  요청 파라미터에서 데이터 가져오기
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String type = request.getParameter("type"); // 문의 유형
			String visi = request.getParameter("visibility"); // 공개 여부 추가
			String supPwd = request.getParameter("sup_pwd"); // 비공개 비밀번호
			String usNUM = request.getParameter("us_num");
			String Visiblility = request.getParameter("visibility");
			String supImg = request.getParameter("sup_img");
	
			// 🐥 4. 유효성 검사
			if (title == null || title.trim().isEmpty()) {
				request.setAttribute("error", "문의 제목을 입력해주세요. 🐇");
				return "support/emptyField.jsp"; // 에러 페이지로 이동
			}
			if (content == null || content.trim().isEmpty()) {
				request.setAttribute("error", "문의 내용을 입력해주세요. 🐇");
				return "support/emptyField.jsp"; // 에러 페이지로 이동
			}
			if (type == null || type.trim().isEmpty()) {
				request.setAttribute("error", "문의 유형을 선택해주세요. 🐇");
				return "support/emptyField.jsp"; // 에러 페이지로 이동
			}
			if (supPwd == null || supPwd.trim().isEmpty()) {
				request.setAttribute("error", "비밀 번호를 입력해주세요. 🐇");
				return "support/emptyField.jsp"; // 에러 페이지로 이동
			}

			 // 🐇 5. **파일 첨부 처리** (파일이 있으면 업로드)
	        String filePath = null;
	        Part filePart = request.getPart("sup_img");
	        if (filePart != null && filePart.getSize() > 0) {
	            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
	            filePath = request.getServletContext().getRealPath("/upload/") + fileName; // 파일 경로 수정

	            // 파일 업로드 예외 처리
	            try {
	                filePart.write(filePath);  // 실제 파일 저장 경로 수정
	            } catch (Exception e) {
	                e.printStackTrace();
	                request.setAttribute("error", "파일 업로드 중 오류가 발생했습니다. 🐇");
	                return "support/invalidAccess.jsp"; // 파일 오류 처리 페이지로 이동
	            }
	        }
		

			 SupportVO support = new SupportVO();
		        support.setSup_title(title.trim());
		        support.setSup_content(content.trim());
		        support.setSup_pick(type); // 문의 유형
		        support.setUs_num(userNum); // 작성자 번호
		        support.setSup_img(filePath); // **첨부된 파일 경로 저장**

		        boolean isPublic = !"1".equals(visi); // 공개 여부를 체크 (1이면 비공개, 아니면 공개)

		        if (isPublic) {
		            support.setSup_visi(0); // 공개
		            support.setSup_pwd(0); // 공개 상태에서는 비밀번호를 0으로 설정
		        } else {
		            support.setSup_visi(1); // 비공개
		            if (supPwd != null && !supPwd.trim().isEmpty()) {
		                try {
		                    long password = Long.parseLong(supPwd); // 비밀번호를 long 타입으로 변환
		                    support.setSup_pwd(password); // 비공개 비밀번호 설정
		                } catch (NumberFormatException e) {
		                    request.setAttribute("error", "비공개 비밀번호는 숫자 4자리로 입력해주세요. 🐇");
		                    return "support/emptyField.jsp"; // 비밀번호가 숫자가 아닐 때 에러 처리
		                }
		            } else {
		                request.setAttribute("error", "비공개 비밀번호를 입력해주세요. 🐇");
		                return "support/emptyField.jsp"; // 비밀번호 미입력 시 에러 처리
		            }
		        }
		        // 🐇 7. **DAO를 통해 데이터베이스에 저장**
		        SupportDAO dao = SupportDAO.getInstance();
		        try {
		            // 데이터베이스에 문의 저장
		            dao.createInquiry(support);
		        } catch (SQLException e) {
		            e.printStackTrace(); // 디버깅용
		            request.setAttribute("error", "데이터베이스 처리 중 오류가 발생했습니다. 🐇");
		            return "support/invalidAccess.jsp"; // 서버 오류 페이지로 이동
		        } 
			        // 문의 목록 페이지로 리다이렉트
			        return "redirect:/support/FeedBackList.do";  // **리다이렉트** 후 더 이상 처리할 필요 없음
}
	
}