package kr.support.dao;

import java.util.ArrayList;
import java.util.List;

import kr.support.vo.ReplyVO;
//문의글 답변의 댓
public class ReplyDAO {
    // 댓글 리스트 (static, 제네릭 타입 명시)
    private static final List<ReplyVO> replies = new ArrayList<>();

    // 댓글 삽입 메소드
    public void insertReply(ReplyVO reply) {
        // 댓글 유효성 검증
        if (reply == null || reply.getReply_content() == null || reply.getReply_content().trim().isEmpty()) {
            System.err.println("댓글 데이터가 유효하지 않습니다! 🐇");
            return;
        }

        try {
            // 댓글 ID 자동 생성
            reply.setReply_id(replies.size() + 1);

            // 댓글 작성 날짜 설정
            reply.setReply_date(new java.util.Date().toString());

            // 댓글 리스트에 추가
            replies.add(reply);

            // 성공 메시지 출력
            System.out.println("댓글 저장 성공! 🐇 ID: " + reply.getReply_id());
        } catch (Exception e) {
            // 예외 처리
            System.err.println("댓글 저장 중 오류 발생: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // 특정 supNum에 해당하는 댓글 리스트 반환
    public List<ReplyVO> getRepliesBySupNum(long supNum) {
        List<ReplyVO> result = new ArrayList<>(); // 결과 리스트 초기화
        for (ReplyVO reply : replies) {
            if (reply.getSup_num() == supNum) {
                result.add(reply); // 조건에 맞는 댓글 추가
            }
        }
        return result; // 결과 반환
    }
}
