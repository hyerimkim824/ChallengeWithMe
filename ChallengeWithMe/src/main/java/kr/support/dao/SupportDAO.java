package kr.support.dao;

import kr.support.vo.SupportVO;
import kr.util.DBUtil;
import kr.support.vo.FeedBackVO;
import kr.support.vo.ReplyVO;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SupportDAO {
    // 🌟 문의 데이터와 댓글 데이터를 리스트들! 🌟
    private static final List<SupportVO> supports = new ArrayList<>();
    private static final List<ReplyVO> replies = new ArrayList<>();
    private static final List<FeedBackVO> feedbacks = new ArrayList<>();

    // 🐇 싱글톤 패턴: SupportDAO는 오직 하나만 존재해요! 🐇
    private static final SupportDAO instance = new SupportDAO();

    private SupportDAO() {} // 생성자는 비

    public static SupportDAO getInstance() {
        return instance; // 이미 만들어둔 인스턴스를 돌려줍니다 🎁
    }

    // 🐰 1. 특정 고객의 문의 내역을 가져오는 메서드!
    public List<SupportVO> getInquiryHistory(long userNum, int page, int pageSize) throws Exception {
        List<SupportVO> result = new ArrayList<>();
        String sql = "SELECT * FROM support WHERE us_num = ? ORDER BY sup_date DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        
        try (Connection con = DBUtil.getConnection(); 
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setLong(1, userNum); 
            ps.setInt(2, (page - 1) * pageSize);  // OFFSET
            ps.setInt(3, pageSize);  // FETCH NEXT
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SupportVO support = new SupportVO();
                support.setSup_num(rs.getLong("sup_num"));
                support.setSup_title(rs.getString("sup_title"));
                support.setSup_content(rs.getString("sup_content"));
                support.setSup_pick(rs.getString("sup_pick"));
                support.setSup_date(rs.getDate("sup_date"));
                support.setSup_visi(rs.getInt("sup_visi"));
                support.setSup_pwd(rs.getLong("sup_pwd"));
                support.setUs_num(rs.getLong("us_num"));
                result.add(support);
                
                // 수정된 부분: 작성자 닉네임 설정
                support.setUs_nickname(getWriterNickname(support.getSup_num()));  
                
                // 수정된 부분: 문의 유형을 문자열로 설정
                support.setSup_pick(getSupPickString(support.getSup_pick()));
                
            }
        }
        return result;
    }


 // 🐰 2. 1:1 문의 등록하기 (DB에 저장)
    public void createInquiry(SupportVO support) throws Exception {
        Connection con = null;
        PreparedStatement ps = null;
        String sql = "INSERT INTO support(sup_num, sup_title, sup_content, sup_pick, us_num, sup_date, sup_visi, sup_pwd, sup_img) "
                   + "VALUES (sup_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            con = DBUtil.getConnection(); // DB 연결
            ps = con.prepareStatement(sql);

            // PreparedStatement에 값 세팅
            ps.setString(1, support.getSup_title());  // 제목
            ps.setString(2, support.getSup_content()); // 내용
            ps.setString(3, support.getSup_pick());    // 문의 유형
            ps.setLong(4, support.getUs_num());        // 작성자 번호
            ps.setDate(5, new java.sql.Date(support.getSup_date().getTime())); // 작성 날짜
            ps.setInt(6, support.getSup_visi());    // 공개 여부
            ps.setLong(7, support.getSup_pwd());       // 비밀번호
            ps.setString(8, support.getSup_img());     // 파일 경로 추가 (첨부파일)

            // SQL 쿼리 실행 (데이터 삽입)
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("문의 등록 중 오류가 발생했습니다! 🐇");
        } finally {
            DBUtil.executeClose(null, ps, con); // DB 연결 및 자원 닫기
        }
    }

    // FAQ 목록을 가져오는 메서드
    public List<SupportVO> getFAQList(int page, int pageSize) throws Exception {
        List<SupportVO> result = new ArrayList<>();
        String sql = "SELECT * FROM support ORDER BY sup_date DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";  // FAQ 필터링 조건 제거

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            // 페이징 처리: 시작 행과 가져올 행 수 설정
            ps.setInt(1, (page - 1) * pageSize);  // OFFSET: 시작 행 번호
            ps.setInt(2, pageSize);  // FETCH NEXT: 한 번에 가져올 데이터 수

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SupportVO support = new SupportVO();
                support.setSup_num(rs.getLong("sup_num"));
                support.setSup_title(rs.getString("sup_title"));
                support.setSup_content(rs.getString("sup_content"));
                support.setSup_pick(rs.getString("sup_pick"));
                support.setSup_date(rs.getDate("sup_date"));
                support.setSup_visi(rs.getInt("sup_visi"));
                support.setSup_pwd(rs.getLong("sup_pwd"));
                support.setUs_num(rs.getLong("us_num"));
                result.add(support);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("FAQ 목록을 가져오는 중 오류가 발생했습니다! 🐇");
        }

        return result;
    }




 // 5. 특정 게시글 상세 보기 
    public SupportVO getSupportById(long supNum) throws Exception {
        String sql = "SELECT * FROM support JOIN user_detail USING(us_num) WHERE sup_num = ?";
        SupportVO support = null;
        
        try (Connection con = DBUtil.getConnection(); 
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setLong(1, supNum);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                support = new SupportVO();
                support.setSup_num(rs.getLong("sup_num"));
                support.setSup_title(rs.getString("sup_title"));
                support.setSup_content(rs.getString("sup_content"));
                support.setSup_pick(rs.getString("sup_pick"));
                support.setSup_date(rs.getDate("sup_date"));
                support.setSup_visi(rs.getInt("sup_visi"));
                support.setSup_pwd(rs.getLong("sup_pwd"));
                support.setUs_num(rs.getLong("us_num"));
                support.setSup_img(rs.getString("sup_img"));
                support.setUs_nickname(rs.getString("us_nickname"));  // 닉네임 설정
                
             // 문의 유형을 문자열로 변환하여 설정
                String pickString = getSupPickString(support.getSup_pick());
                support.setSup_pick(pickString);  // 문자열로 설정

                
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("문의 상세 정보를 가져오는 중 오류가 발생했습니다! 🐇");
        }
        return support;
    }

 // 🐰 6. 게시글 검색하기 (제목이나 내용에 키워드가 포함된 경우)
    public List<SupportVO> searchSupports(String keyword, int page, int pageSize) throws Exception {
        List<SupportVO> result = new ArrayList<>();
        // SQL 쿼리: 제목과 내용에서 키워드를 포함한 게시글을 검색
        String sql = "SELECT * FROM support WHERE sup_title LIKE ? OR sup_content LIKE ? ORDER BY sup_date DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        // keyword가 null이나 빈 값일 경우, 검색을 처리할 수 없으므로 예외 처리
        if (keyword == null || keyword.trim().isEmpty()) {
            throw new IllegalArgumentException("검색어를 입력해야 합니다! 🐇");
        }

        try (Connection con = DBUtil.getConnection(); 
             PreparedStatement ps = con.prepareStatement(sql)) {

            // PreparedStatement 설정
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");
            ps.setInt(3, (page - 1) * pageSize);  // OFFSET: 시작 행
            ps.setInt(4, pageSize);  // FETCH NEXT: 페이지 크기 (한 번에 가져올 행 수)
            
            try (ResultSet rs = ps.executeQuery()) {
                // 결과가 있을 경우, 리스트에 추가
                while (rs.next()) {
                    SupportVO support = new SupportVO();
                    support.setSup_num(rs.getLong("sup_num"));
                    support.setSup_title(rs.getString("sup_title"));
                    support.setSup_content(rs.getString("sup_content"));
                    support.setSup_pick(rs.getString("sup_pick")); // 적절한 타입으로 처리
                    support.setSup_date(rs.getDate("sup_date"));  // DATETIME으로 처리 // DATETIME이면 getTimestamp 사용
                    support.setSup_visi(rs.getInt("sup_visi")); // BOOLEAN 처리
                    support.setSup_pwd(rs.getLong("sup_pwd"));
                    support.setUs_num(rs.getLong("us_num"));
                    
                    result.add(support);
                }
            } catch (SQLException e) {
                // SQLException 처리: 디버깅용 메시지 출력 및 예외 던지기
                e.printStackTrace();
                throw new SQLException("게시글 검색 중 오류가 발생했습니다! 🐇", e);
            }
        } catch (SQLException e) {
            // DB 연결 오류 처리
            e.printStackTrace();
            throw new SQLException("DB 연결 오류가 발생했습니다! 🐇", e);  // 예외 전파
        }

        return result;  // 검색된 게시글 리스트 반환
    }

    // 🐰 7. 댓글 추가하기
    public void insertReply(ReplyVO reply) {
        if (reply == null || reply.getSup_num() <= 0 || reply.getReply_content().isEmpty()) {
            throw new IllegalArgumentException("댓글이 올바르지 않아요! 😢");
        }
        reply.setReply_id(replies.size() + 1); // 댓글 번호 자동 생성! 🌟
        reply.setReply_date(new java.util.Date().toString()); // 현재 날짜를 저장! 🗓️
        replies.add(reply);
    }

    // 🐰 8. 특정 게시글의 댓글들 가져오기
    public List<ReplyVO> getRepliesBySupNum(long supNum) {
        List<ReplyVO> result = new ArrayList<>();
        for (ReplyVO reply : replies) {
            if (reply.getSup_num() == supNum) {
                result.add(reply);
            }
        }
        return result; // 댓글 리스트를 반환! 🎉
    }

    // 🐰 9. 페이징 처리를 위한 도우미 메서드
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

    // 🐰 10. 문의 데이터 수정하기
    public void updateSupport(SupportVO support) {
        for (SupportVO storedSupport : supports) {
            if (storedSupport.getSup_num() == support.getSup_num()) {
                storedSupport.setSup_pick(support.getSup_pick());
                storedSupport.setSup_title(support.getSup_title());
                storedSupport.setSup_content(support.getSup_content());
                storedSupport.setSup_visi(support.getSup_visi());
                storedSupport.setSup_img(support.getSup_img());
                storedSupport.setSup_pwd(support.getSup_pwd()); // 비공개 비밀번호 수정
                System.out.println("문의 데이터가 성공적으로 수정되었습니다! 🎉");
                return;
            }
        }
        throw new IllegalArgumentException("해당 ID의 데이터를 찾을 수 없습니다! 😭");
    }

 // 🐰 11. 전체 문의 데이터 페이징 처리해서 가져오기 (DB에서)
    public List<SupportVO> getAllSupports(int start, int end) throws Exception {
        List<SupportVO> result = new ArrayList<>();
        String sql = "SELECT * FROM (SELECT a.*, rownum rnum "
                + "FROM (SELECT * FROM support JOIN user_detail USING(us_num) " 
                + "ORDER BY sup_num DESC) a) "
                + "WHERE rnum >= ? AND rnum <= ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
             ps.setInt(1, start);
             ps.setInt(2, end);
             
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SupportVO support = new SupportVO();
                support.setSup_num(rs.getLong("sup_num"));
                support.setSup_title(rs.getString("sup_title"));
                support.setSup_content(rs.getString("sup_content"));
                support.setSup_pick(rs.getString("sup_pick"));
                support.setSup_date(rs.getDate("sup_date"));
                support.setSup_visi(rs.getInt("sup_visi"));  
                support.setSup_pwd(rs.getLong("sup_pwd"));
                support.setUs_num(rs.getLong("us_num"));
                support.setUs_nickname(rs.getString("us_nickname"));
                result.add(support);
                System.out.println(result);
            }
        } catch (SQLException e) {
            // SQLException 처리: 디버깅용 메시지 출력 및 예외 던지기
            e.printStackTrace();
            throw new SQLException("게시글 검색 중 오류가 발생했습니다! 🐇", e);
        }

        return result;
    }

    // 🐰 12. 전체 문의 개수 가져오기 (DB에서)
    public int getSupportCount() throws Exception {
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
 // 🐰 14. 특정 문의의 작성자 ID 확인하기 (DB에서)
    public long getWriterId(long supNum) throws Exception {
        // 작성자 ID를 찾기 위한 SQL 쿼리
        String sql = "SELECT us_num FROM support WHERE sup_num = ?";

        try (Connection conn = DBUtil.getConnection();  // DB 연결을 DBUtil로 통일
             PreparedStatement ps = conn.prepareStatement(sql)) {

            // 쿼리 파라미터 설정 (sup_num)
            ps.setLong(1, supNum);

            // 쿼리 실행
            ResultSet rs = ps.executeQuery();

            // 결과가 있으면 작성자 ID 반환
            if (rs.next()) {
                long writerId = rs.getLong("us_num"); // 작성자 ID를 가져옴
                System.out.println("게시글 " + supNum + "의 작성자 ID: " + writerId); // 작성자 ID 로그 출력
                return writerId; // 작성자 ID 반환
            } else {
                // 해당 문의가 없을 경우 처리
                System.out.println("게시글 " + supNum + "에 대한 작성자 정보가 없습니다."); // 로그 출력
            }

        } catch (SQLException e) {
            // SQLException 발생 시 에러 로그 출력
            System.out.println("작성자 ID를 가져오는 중 오류 발생, sup_num: " + supNum); // 오류 로그
            e.printStackTrace(); // 예외의 스택 트레이스를 출력
            throw new SQLException("작성자 ID를 가져오는 중 오류가 발생했습니다! 🐇");  // 예외 던지기
        }

        return -1; // 작성자를 찾을 수 없으면 -1 반환
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



 // 🐰 20. FeedBack 저장 메서드
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


 // 🐰 21. 피드백 목록 가져오기
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
 
 // 🐰 22. 피드백 개수 가져오기
   
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
    
    

 // 5. 피드 게시글 상세 보기 
    public FeedBackVO getFeedBackById(long supNum) throws Exception {
        String sql = "SELECT * FROM feedback JOIN user_detail USING(us_num) WHERE sup_num = ?";
        FeedBackVO feedback = null;
        
        try (Connection con = DBUtil.getConnection(); 
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setLong(1, supNum);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                feedback = new FeedBackVO();
                feedback.setSup_num(rs.getLong("sup_num"));
                feedback.setSup_title(rs.getString("sup_title"));
                feedback.setSup_content(rs.getString("sup_content"));
                feedback.setSup_pick(rs.getString("sup_pick"));
                feedback.setSup_date(rs.getDate("sup_date"));
                feedback.setSup_visi(rs.getInt("sup_visi"));
                feedback.setSup_pwd(rs.getLong("sup_pwd"));
                feedback.setUs_num(rs.getLong("us_num"));
                feedback.setSup_img(rs.getString("sup_img"));
                feedback.setUs_nickname(rs.getString("us_nickname"));  // 닉네임 설정
                
             // 문의 유형을 문자열로 변환하여 설정
                String pickString = getSupPickString(feedback.getSup_pick());
                feedback.setSup_pick(pickString);  // 문자열로 설정

                
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("문의 상세 정보를 가져오는 중 오류가 발생했습니다! 🐇");
        }
        return feedback;
    }

 // 🐰 23. 검색된 문의 데이터의 개수를 반환
    public int getSupportSearchCount(String keyword) {
        int count = 0;
        if (keyword == null || keyword.trim().isEmpty()) {
            return supports.size(); // 키워드가 없으면 전체 데이터 개수를 반환
        }
        for (SupportVO support : supports) {
            // 제목 또는 내용에 키워드가 포함된 경우
            if (support.getSup_title().contains(keyword) || support.getSup_content().contains(keyword)) {
                count++;
            }
        }
        return count; // 검색된 데이터 개수 반환
    }


 // 🐰 게시글 삭제 (DB에서)
    public boolean deleteSupport(long supNum) throws Exception {
        String sql = "DELETE FROM support WHERE sup_num = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            // 삭제할 게시글 번호를 쿼리의 파라미터로 설정
            ps.setLong(1, supNum);

            // 쿼리 실행하여 영향을 받은 행 수를 반환
            int rowsAffected = ps.executeUpdate();

            // 삭제된 행이 있으면 true 반환, 그렇지 않으면 false 반환
            if (rowsAffected > 0) {
                System.out.println("게시글 삭제 성공, sup_num: " + supNum); // 로그 추가
                return true; // 삭제 성공
            } else {
                System.out.println("삭제된 행이 없습니다. sup_num: " + supNum); // 로그 추가
                return false; // 삭제 실패 (해당 게시글이 존재하지 않거나 삭제 안 됨)
            }

        } catch (SQLException e) {
            // SQLException 발생 시 에러 로그 출력
            System.out.println("게시글 삭제 중 오류 발생, sup_num: " + supNum); // 오류 로그
            e.printStackTrace(); // 예외의 스택 트레이스를 출력
            throw new SQLException("게시글 삭제 중 오류가 발생했습니다! 🐇");
        }
    }

 // 🐰 25. FAQ 개수 가져오기
    public int getFAQCount() throws Exception {
        String sql = "SELECT COUNT(*) FROM support WHERE sup_pick = 2";  // FAQ 유형만 필터링

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1); // FAQ 개수를 반환
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("FAQ 개수를 가져오는 중 오류가 발생했습니다! 🐇");
        }

        return 0;  // 만약 데이터가 없다면 0을 반환
    }
 // validatePrivatePwd 메서드
    public boolean validatePrivatePwd(long supNum, String supPwd) throws Exception {
        // DB 연결
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // DB 연결 
            con = DBUtil.getConnection();

            // SQL 쿼리 작성
            String sql = "SELECT sup_pwd FROM support WHERE sup_num = ?";
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

 // 🐰 15. 특정 문의의 작성자 닉네임 가져오기
    public String getWriterNickname(long supNum) throws Exception {
        String sql = "SELECT u.nickname FROM support s JOIN user_detail u ON s.us_num = u.us_num WHERE s.sup_num = ?";
        String nickname = null;

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setLong(1, supNum);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                nickname = rs.getString("nickname");
            }
        }

        return nickname;
    }

    // 🐰 17. 문의 유형을 문자열로 변환하는 메서드
    public String getSupPickString(String supPick) {
        switch (supPick) {
            case "1": return "로그인 및 계정";
            case "2": return "결제 및 환불";
            case "3": return "챌린지 방식/인증 규정";
            case "4": return "참가비/환급/상금";
            case "5": return "인증패스/레드카드";
            case "6": return "회원가입 및 탈퇴";
            case "7": return "주제제안";
            case "8": return "챌린";
            case "9": return "기능/오류";
            case "10": return "기타";
            default: return "알 수 없음";
        }
    }
}


