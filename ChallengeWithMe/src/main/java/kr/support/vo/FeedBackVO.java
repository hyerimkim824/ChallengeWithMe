package kr.support.vo;

import java.util.Date;

public class FeedBackVO {
    // 피드백의 고유 ID
    private long feedback_id;

    // 피드백 내용
    private String feedback_content;

    // 피드백 작성자 ID (사용자)
    private long user_id;

    // 피드백 작성 날짜
    private Date feedback_date;

    // 기본 생성자
    public FeedBackVO() {
        // 빈 생성자
    }

    // 모든 필드를 포함한 생성자
    public FeedBackVO(long feedback_id, String feedback_content, long user_id, Date feedback_date) {
        this.feedback_id = feedback_id;
        this.feedback_content = feedback_content;
        this.user_id = user_id;
        this.feedback_date = feedback_date;
    }

    // Getter와 Setter
    public long getFeedback_id() {
        return feedback_id;
    }

    public void setFeedback_id(long feedback_id) {
        this.feedback_id = feedback_id;
    }

    public String getFeedback_content() {
        return feedback_content;
    }

    public void setFeedback_content(String feedback_content) {
        this.feedback_content = feedback_content;
    }

    public long getUser_id() {
        return user_id;
    }

    public void setUser_id(long user_id) {
        this.user_id = user_id;
    }

    public Date getFeedback_date() {
        return feedback_date;
    }

    public void setFeedback_date(Date feedback_date) {
        this.feedback_date = feedback_date;
    }

    // toString 메서드 (디버깅 및 출력용)
    @Override
    public String toString() {
        return "FeedBackVO{" +
                "feedback_id=" + feedback_id +
                ", feedback_content='" + feedback_content + '\'' +
                ", user_id=" + user_id +
                ", feedback_date=" + feedback_date +
                '}';
    }
}
