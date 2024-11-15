package kr.support.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.support.dao.SupportDAO;
import kr.support.vo.SupportVO;
import kr.controller.Action;

public class UpdateAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 🐇 요청 인코딩 설정
        request.setCharacterEncoding("UTF-8");

        try {
            // 🐰 폼 데이터 수집
            String supNumParam = request.getParameter("sup_num");
            String supPickParam = request.getParameter("sup_pick");
            String supTitle = request.getParameter("sup_title");
            String supContent = request.getParameter("sup_content");
            String supVisiParam = request.getParameter("sup_visi");
            String supImg = request.getParameter("sup_img");
            String supPwdParam = request.getParameter("sup_pwd");

            // 🐰 필수 데이터 유효성 검사
            if (isEmpty(supNumParam, supPickParam, supTitle, supContent, supVisiParam, supPwdParam)) {
                request.setAttribute("error", "모든 필드를 입력해야 합니다! 🐇");
                return "support/emptyField.jsp";
            }

            // 🐰 파라미터 변환
            long supNum = Long.parseLong(supNumParam);
            long supPick = Long.parseLong(supPickParam);
            boolean supVisi = Boolean.parseBoolean(supVisiParam);
            long supPwd = Long.parseLong(supPwdParam);

            // 🐰 DAO를 통해 비밀번호 검증
            SupportDAO dao = SupportDAO.getInstance();
            if (!dao.validatePrivatePwd(supNum, supPwd)) {
                request.setAttribute("error", "비공개 비밀번호가 일치하지 않습니다! 🐰");
                return "support/unauthorized.jsp";
            }

            // 🐰 VO 객체 생성 및 데이터 설정
            SupportVO support = new SupportVO();
            support.setSup_num(supNum);
            support.setSup_pick(supPick);
            support.setSup_title(supTitle.trim());
            support.setSup_content(supContent.trim());
            support.setSup_visi(supVisi);
            support.setSup_img((supImg != null && !supImg.trim().isEmpty()) ? supImg.trim() : null);
            support.setSup_pwd(supPwd);

            // 🐰 데이터 업데이트
            dao.updateSupport(support);

            // 🐰 성공 시 성공 페이지로 이동
            return "support/updateSuccess.jsp";

        } catch (NumberFormatException e) {
            // 🐰 숫자 변환 오류 처리
            request.setAttribute("error", "잘못된 데이터 형식입니다! 🐇");
            e.printStackTrace();
            return "support/invalidInput.jsp";

        } catch (IllegalArgumentException e) {
            // 🐰 DAO에서 발생한 오류 처리
            request.setAttribute("error", e.getMessage());
            e.printStackTrace();
            return "support/notFound.jsp";

        } catch (Exception e) {
            // 🐰 일반적인 예외 처리
            request.setAttribute("error", "알 수 없는 오류가 발생했습니다! 🐰");
            e.printStackTrace();
            return "error/500.jsp";
        }
    }

    // 🐰 빈 필드 검증 메서드
    private boolean isEmpty(String... params) {
        for (String param : params) {
            if (param == null || param.trim().isEmpty()) {
                return true;
            }
        }
        return false;
    }
}
