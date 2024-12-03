package kr.support.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.nio.file.Paths;


import kr.controller.Action;
import kr.support.dao.SupportDAO;
import kr.support.vo.SupportVO;

public class UpdateAction implements Action {

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

        // 🐇 요청 방식(GET/POST)에 따라 처리 분기
        if (request.getMethod().equalsIgnoreCase("GET")) {
            // GET 요청인 경우 작성 폼으로 이동
            return "support/updateForm2.jsp";
        }

        // 🐰 요청 파라미터에서 데이터 가져오기
        String supNumParam = request.getParameter("sup_num"); // 수정 대상 글 번호
        String title = request.getParameter("sup_title");
        String content = request.getParameter("sup_content");
        String type = request.getParameter("sup_pick"); // 문의 유형
        String visi = request.getParameter("sup_visi"); // 공개 여부
        String supPwd = request.getParameter("sup_pwd"); // 비공개 비밀번호
        
        System.out.println(visi + ',' + supPwd);
        
        // 🐥 유효성 검사
        if (title == null || title.trim().isEmpty()) {
            request.setAttribute("error", "문의 제목을 입력해주세요. 🐇");
            return "support/emptyField.jsp";
        }
        if (content == null || content.trim().isEmpty()) {
            request.setAttribute("error", "문의 내용을 입력해주세요. 🐇");
            return "support/emptyField.jsp";
        }
        if (type == null || type.trim().isEmpty()) {
            request.setAttribute("error", "문의 유형을 선택해주세요. 🐇");
            return "support/emptyField.jsp";
        }

        // 🐇 파일 첨부 처리 (파일이 있으면 업로드)
        String filePath = null;
        Part filePart = request.getPart("sup_img");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            filePath = request.getServletContext().getRealPath("/upload/") + fileName; // 파일 경로 수정

            try {
                filePart.write(filePath); // 실제 파일 저장
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "파일 업로드 중 오류가 발생했습니다. 🐇");
                return "support/invalidAccess.jsp";
            }
        }

        // 🐇 DAO 호출 준비
        SupportDAO dao = SupportDAO.getInstance();
        SupportVO support = new SupportVO();

        System.out.println("sup_num : " + supNumParam);
        // 글 수정인지 확인
            // 🐰 수정 로직
            long supNum = Long.parseLong(supNumParam);
            support = dao.getSupportById(supNum); // 기존 글 정보 가져오기

            if (support == null || support.getUs_num() != userNum) {
                // 글이 존재하지 않거나 작성자가 아닌 경우
                request.setAttribute("error", "수정할 권한이 없습니다. 🐇");
                return "support/invalidAccess.jsp";
            }

            // 기존 글 정보 업데이트
            support.setSup_num(supNum);
            support.setSup_title(title.trim());
            support.setSup_content(content.trim());
            support.setSup_pick(type);
            support.setSup_img(filePath != null ? filePath : support.getSup_img()); // 파일이 없으면 기존 경로 유지
            
            if ("1".equals(visi)) { // 비공개
                support.setSup_visi(1);
                if (supPwd != null && !supPwd.trim().isEmpty()) {
                    try {
                        support.setSup_pwd(Long.parseLong(supPwd.trim()));
                    } catch (NumberFormatException e) {
                        request.setAttribute("error", "비밀번호는 숫자 4자리로 입력해주세요. 🐇");
                        return "support/emptyField.jsp";
                    }
                } else {
                    request.setAttribute("error", "비공개 비밀번호를 입력해주세요. 🐇");
                    return "support/emptyField.jsp";
                }
            } else { // 공개
                support.setSup_visi(0);
                support.setSup_pwd(0L); // 공개 상태에서는 비밀번호 초기화
            }

            // 데이터베이스에 업데이트
            try {
            	System.out.println("SupportVO : " + support);
                dao.updateSupport(support);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "데이터베이스 업데이트 중 오류가 발생했습니다. 🐇");
                return "support/invalidAccess.jsp";
            }

        // 성공 시 리스트 페이지로 리다이렉트
        return "redirect:/support/List.do";
    }
}
