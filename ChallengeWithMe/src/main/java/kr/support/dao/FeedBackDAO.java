package kr.support.dao;

import kr.support.vo.SupportVO;
import kr.util.DBUtil;
import kr.support.vo.FeedBackVO;
import kr.support.vo.ReplyVO;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FeedBackDAO {
    // 🌟 문의 데이터와 댓글 데이터를 리스트들! 🌟
    private static final List<SupportVO> supports = new ArrayList<>();
    private static final List<ReplyVO> replies = new ArrayList<>();
    private static final List<FeedBackVO> feedbacks = new ArrayList<>();

    // 🐇 싱글톤 패턴: SupportDAO는 오직 하나만 존재해요! 🐇
    private static final FeedBackDAO instance = new FeedBackDAO();

    private FeedBackDAO() {} // 생성자는 비

    public static FeedBackDAO getInstance() {
        return instance; // 이미 만들어둔 인스턴스를 돌려줍니다 🎁
    }
 // 🐰 1. FeedBack 저장 메서드
    public void saveFeedBack(FeedBackVO feedback) throws Exception {
        Connection con = null;
        PreparedStatement ps = null;
        String sql = "INSERT INTO feedback(sup_num, sup_title, sup_content, sup_pick, us_num,sup_visi, sup_pwd, sup_img) "
                   + "VALUES (sup_seq.nextval, ?, ?, ?, ?, ?, ?, ? )";

        try {
            con = DBUtil.getConnection(); // DB 연결
            ps = con.prepareStatement(sql);

            // PreparedStatement에 값 세팅
            ps.setString(1, feedback.getSup_title());  // 제목
            ps.setString(2, feedback.getSup_content()); // 내용
            ps.setString(3, feedback.getSup_pick());    // 문의 유형
            ps.setLong(4, feedback.getUs_num());        // 작성자 번호
            ps.setInt(5, feedback.getSup_visi());    // 공개 여부
            ps.setLong(6, feedback.getSup_pwd());       // 비밀번호
            ps.setString(7, feedback.getSup_img());     // 파일 경로 추가 (첨부파일)

            // SQL 쿼리 실행 (데이터 삽입)
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("문의 등록 중 오류가 발생했습니다! 🐇");
        } finally {
            DBUtil.executeClose(null, ps, con); // DB 연결 및 자원 닫기
        }
    }


 // 🐰 2. 피드백 목록 가져오기
    public List<FeedBackVO> getFeedBackList(int start, int end) throws Exception{
        List<FeedBackVO> result = new ArrayList<>();
        String sql = "SELECT * FROM (SELECT a.*, rownum rnum "
                + "FROM (SELECT * FROM feedback JOIN user_detail USING(us_num) " 
                + "ORDER BY sup_num DESC) a) "
                + "WHERE rnum >= ? AND rnum <= ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
             ps.setInt(1, start);
             ps.setInt(2, end);
             
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
            	FeedBackVO feedback = new FeedBackVO();
            	feedback.setSup_num(rs.getLong("sup_num"));
            	feedback.setSup_title(rs.getString("sup_title"));
            	feedback.setSup_content(rs.getString("sup_content"));
            	feedback.setSup_pick(rs.getString("sup_pick"));
            	feedback.setSup_date(rs.getDate("sup_date"));
            	feedback.setSup_visi(rs.getInt("sup_visi"));  
            	feedback.setSup_pwd(rs.getLong("sup_pwd"));
            	feedback.setUs_num(rs.getLong("us_num"));
            	feedback.setUs_nickname(rs.getString("us_nickname"));
                result.add(feedback);
            }
        } catch (SQLException e) {
            // SQLException 처리: 디버깅용 메시지 출력 및 예외 던지기
            e.printStackTrace();
            throw new SQLException("게시글 검색 중 오류가 발생했습니다! 🐇", e);
        }

        return result;
    }
 
 // 🐰 3. 피드백 개수 가져오기
   
    public int getFeedBackCount() throws Exception {
        String sql = "SELECT COUNT(*) FROM support";
        int count = 0;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("전체 문의 개수를 가져오는 중 오류가 발생했습니다! 🐇");
        }

        return count;
    }
    
    

 // 4. 피드 게시글 상세 보기 
    public FeedBackVO getFeedBackById(long supNum) throws Exception {
        String sql = "SELECT * FROM feedBack JOIN user_detail USING(us_num) WHERE sup_num = ?";
        FeedBackVO feedBack = null;
        
        try (Connection con = DBUtil.getConnection(); 
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setLong(1, supNum);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
            	feedBack = new FeedBackVO();
            	feedBack.setSup_num(rs.getLong("sup_num"));
            	feedBack.setSup_title(rs.getString("sup_title"));
            	feedBack.setSup_content(rs.getString("sup_content"));
            	feedBack.setSup_pick(rs.getString("sup_pick"));
            	feedBack.setSup_date(rs.getDate("sup_date"));
            	feedBack.setSup_visi(rs.getInt("sup_visi"));
            	feedBack.setSup_pwd(rs.getLong("sup_pwd"));
            	feedBack.setUs_num(rs.getLong("us_num"));
            	feedBack.setSup_img(rs.getString("sup_img"));
            	feedBack.setUs_nickname(rs.getString("us_nickname"));  // 닉네임 설정
                
             // 문의 유형을 문자열로 변환하여 설정
                String pickString = getSupPickString(feedBack.getSup_pick());
                feedBack.setSup_pick(pickString);  // 문자열로 설정

                
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("문의 상세 정보를 가져오는 중 오류가 발생했습니다! 🐇");
        }
        return feedBack;
    }

 // 🐰 5. 문의 유형을 문자열로 변환하는 메서드
    public String getSupPickString(String supPick) {
        switch (supPick) {
            case "1": return "로그인 및 계정";
            case "2": return "결제 및 환불";
            case "3": return "기타";
            default: return "알 수 없음";
        }
    }
 // 🐰 6. 특정 문의의 파일 경로 가져오기
    public String getFilePath(long supNum) {
        for (FeedBackVO feedBack : feedbacks) {
            if (feedBack.getSup_num() == supNum) {
                return feedBack.getSup_img();
            }
        }
        return null; // 경로가 없으면 null 반환 😭
    }
 // 7. validatePrivatePwd 메서드
    public boolean validatePrivatePwd(long supNum, String supPwd) throws Exception {
        // DB 연결
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // DB 연결 
            con = DBUtil.getConnection();

            // SQL 쿼리 작성
            String sql = "SELECT sup_pwd FROM feedBack WHERE sup_num = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setLong(1, supNum); // sup_num 파라미터 설정

            rs = pstmt.executeQuery();

            // 비밀번호가 존재하면 비교
            if (rs.next()) {
                String storedPwd = rs.getString("sup_pwd"); // DB에서 가져온 비밀번호를 String으로

                // 비밀번호 일치 여부 반환 (String 비교)
                return storedPwd.equals(supPwd); // String.equals()로 비교
            }

            // 해당 문의가 없으면 false 반환
            return false;

        } finally {
            // 자원 해제
            if (rs != null) try { rs.close(); } catch (SQLException e) {}
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
            if (con != null) try { con.close(); } catch (SQLException e) {}
        }
    }

}