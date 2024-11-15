package kr.support.dao;

import kr.support.vo.SupportVO;
import kr.support.vo.FeedBackVO;
import kr.support.vo.ReplyVO;

import java.util.ArrayList;
import java.util.List;

public class SupportDAO {
    // 🌟 문의 데이터와 댓글 데이터를 리스트들! 🌟
    private static final List<SupportVO> supports = new ArrayList<>();
    private static final List<ReplyVO> replies = new ArrayList<>();
    private static final List<FeedBackVO> feedbacks = new ArrayList<>();


    // 🐇 싱글톤 패턴: SupportDAO는 오직 하나만 존재해요! 🐇
    private static final SupportDAO instance = new SupportDAO();

    private SupportDAO() {} // 생성자는 비밀이에요~ 🤫

    public static SupportDAO getInstance() {
        return instance; // 이미 만들어둔 인스턴스를 돌려줍니다~ 🎁
    }

    // 🐰 1. 특정 고객의 문의 내역을 가져오는 메서드!
    public List<SupportVO> getInquiryHistory(long userNum, int page, int pageSize) {
        List<SupportVO> result = new ArrayList<>();
        for (SupportVO support : supports) {
            if (support.getUs_num() == userNum) {
                result.add(support);
            }
        }
        return paginate(result, page, pageSize); // 페이징 처리해서 깔끔하게 전달! 🌟
    }

    // 🐰 2. 1:1 문의 등록하기
    public void createInquiry(SupportVO support) {
        if (support == null) throw new IllegalArgumentException("문의 내용을 적어주세요! 🐇");
        support.setSup_num(supports.size() + 1); // 자동 번호 부여! 🌸
        support.setSup_date(new java.sql.Date(System.currentTimeMillis())); // 작성 날짜는 오늘! 🗓️
        supports.add(support); // 리스트에 추가! 🎉
    }

    // 🐰 3. FAQ 목록을 가져오기
    public List<SupportVO> getFAQList(int page, int pageSize) {
        List<SupportVO> result = new ArrayList<>();
        for (SupportVO support : supports) {
            if (support.getSup_pick() == 2) { // FAQ 타입인 경우만!
                result.add(support);
            }
        }
        return paginate(result, page, pageSize);
    }

    // 🐰 4. 환불 안내 데이터 가져오기
    public List<SupportVO> getRefundGuide(int page, int pageSize) {
        List<SupportVO> result = new ArrayList<>();
        for (SupportVO support : supports) {
            if (support.getSup_pick() == 3) { // 환불 안내 타입인 경우만!
                result.add(support);
            }
        }
        return paginate(result, page, pageSize);
    }

    // 🐰 5. 특정 게시글 상세 보기
    public SupportVO getSupportById(long supNum) {
        for (SupportVO support : supports) {
            if (support.getSup_num() == supNum) {
                return support; // 찾았다! 🎯
            }
        }
        return null; // 못 찾았다  😢
    }

    // 🐰 6. 게시글 삭제
    public boolean deleteSupport(long supNum) {
        return supports.removeIf(support -> support.getSup_num() == supNum); // 삭제 완료! ✂️
    }

    // 🐰 7. 게시글 검색하기 (제목이나 내용에 키워드가 포함된 경우)
    public List<SupportVO> searchSupports(String keyword, int page, int pageSize) {
        List<SupportVO> result = new ArrayList<>();
        for (SupportVO support : supports) {
            if (support.getSup_title().contains(keyword) || support.getSup_content().contains(keyword)) {
                result.add(support);
            }
        }
        return paginate(result, page, pageSize);
    }

    // 🐰 8. 댓글 추가하기
    public void insertReply(ReplyVO reply) {
        if (reply == null || reply.getSup_num() <= 0 || reply.getReply_content().isEmpty()) {
            throw new IllegalArgumentException("댓글이 올바르지 않아요! 😢");
        }
        reply.setReply_id(replies.size() + 1); // 댓글 번호 자동 생성! 🌟
        reply.setReply_date(new java.util.Date().toString()); // 현재 날짜를 저장! 🗓️
        replies.add(reply);
    }

    // 🐰 9. 특정 게시글의 댓글들 가져오기
    public List<ReplyVO> getRepliesBySupNum(long supNum) {
        List<ReplyVO> result = new ArrayList<>();
        for (ReplyVO reply : replies) {
            if (reply.getSup_num() == supNum) {
                result.add(reply);
            }
        }
        return result; // 댓글 리스트를 반환! 🎉
    }

    // 🐰 10. 페이징 처리를 위한 귀여운 도우미 메서드
    private <T> List<T> paginate(List<T> list, int page, int pageSize) {
        if (list == null || list.isEmpty()) {
            return new ArrayList<>(); // 빈 리스트를 반환합니다! 🐇
        }

        int fromIndex = Math.min((page - 1) * pageSize, list.size());
        int toIndex = Math.min(fromIndex + pageSize, list.size());

        if (fromIndex > toIndex) {
            return new ArrayList<>(); // 요청 범위가 이상하면 빈 리스트 반환! 😢
        }

        return list.subList(fromIndex, toIndex);
    }

    // 🐰 11. 문의 데이터 수정하기
    public void updateSupport(SupportVO support) {
        for (SupportVO storedSupport : supports) {
            if (storedSupport.getSup_num() == support.getSup_num()) {
                storedSupport.setSup_pick(support.getSup_pick());
                storedSupport.setSup_title(support.getSup_title());
                storedSupport.setSup_content(support.getSup_content());
                storedSupport.setSup_visi(support.isSup_visi());
                storedSupport.setSup_img(support.getSup_img());
                storedSupport.setSup_pwd(support.getSup_pwd()); // 비공개 비밀번호 추가
                System.out.println("문의 데이터가 성공적으로 수정되었습니다! 🎉");
                return;
            }
        }
        throw new IllegalArgumentException("해당 ID의 데이터를 찾을 수 없습니다! 😭");
    }


    // 🐰 12. 전체 문의 데이터 페이징 처리해서 가져오기
    public List<SupportVO> getAllSupports(int page, int pageSize) {
        return paginate(supports, page, pageSize);
    }

    // 🐰 13. 전체 문의 개수 가져오기
    public int getSupportCount() {
        return supports.size(); // 데이터 개수를 반환!
    }

    // 🐰 14. 특정 문의의 작성자 ID 확인하기
    public long getWriterId(long supNum) {
        for (SupportVO support : supports) {
            if (support.getSup_num() == supNum) {
                return support.getUs_num(); // 작성자 ID 반환
            }
        }
        return -1; // 없으면 -1! 😭
    }

    // 🐰 15. 특정 문의의 파일 경로 가져오기
    public String getFilePath(long supNum) {
        for (SupportVO support : supports) {
            if (support.getSup_num() == supNum) {
                return support.getSup_img();
            }
        }
        return null; // 경로가 없으면 null 반환 😭
    }

    // 🐰 16. 특정 문의의 파일 경로 삭제하기
    public void deleteFilePath(long supNum) {
        for (SupportVO support : supports) {
            if (support.getSup_num() == supNum) {
                support.setSup_img(null);
                System.out.println("파일 경로 삭제 성공! ✂️ 문의 번호: " + supNum);
                return;
            }
        }
        System.err.println("파일 경로 삭제 실패... 😭 문의 번호: " + supNum);
    }

 // 🐰  18. FAQ 목록 가져오기
    public List<SupportVO> getFaqList(int page, int pageSize) {
        List<SupportVO> result = new ArrayList<>();
        for (SupportVO support : supports) {
            if (support.getSup_pick() == 2) { // FAQ 유형만 필터링
                result.add(support);
            }
        }
        return paginate(result, page, pageSize);
    }
 // 🐰 19. faq 데이터의 개수 반환
    public int getFAQCount() {
        int count = 0;
        for (SupportVO support : supports) {
            if (support.getSup_pick() == 2) { // FAQ 유형인 경우만 카운트
                count++;
            }
        }
        return count; // FAQ 개수 반환
    }
 // 🐰 20. FeedBack 저장 메서드
    public void saveFeedBack(FeedBackVO feedback) {
        if (feedback == null) {
            throw new IllegalArgumentException("피드백 데이터는 null이 될 수 없습니다! 🐰");
        }
        feedback.setFeedback_id(feedbacks.size() + 1); // ID 자동 생성
        feedbacks.add(feedback); // 피드백 리스트에 추가
        System.out.println("피드백 저장 성공! 🎉 피드백 ID: " + feedback.getFeedback_id());
    
    
    }
 // 🐰 21. 피드백 목록 가져오기
    public List<FeedBackVO> getFeedBackList(int page, int pageSize) {
        List<FeedBackVO> feedbackResult = new ArrayList<>();
        
        // 피드백 데이터 페이징 처리
        int fromIndex = Math.min((page - 1) * pageSize, feedbacks.size());
        int toIndex = Math.min(fromIndex + pageSize, feedbacks.size());

        if (fromIndex > toIndex) {
            return feedbackResult; // 잘못된 페이지 요청 시 빈 리스트 반환 🐇
        }

        feedbackResult = feedbacks.subList(fromIndex, toIndex); // 해당 범위의 데이터 반환
        return feedbackResult;
    }

    // 🐰 22. 피드백 개수 가져오기
    public int getFeedBackCount() {
        return feedbacks.size(); // 피드백 리스트의 크기를 반환
    }

}