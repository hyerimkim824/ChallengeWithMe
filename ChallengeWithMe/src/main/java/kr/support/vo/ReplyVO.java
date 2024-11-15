package kr.support.vo;

public class ReplyVO {
    private long reply_id; // 댓글 ID
    private long sup_num; // 관련 게시글 번호
    private long us_num; // 작성자 ID
    private String reply_content; // 댓글 내용
    private String reply_date; // 댓글 작성 날짜

    // Getters and Setters
    public long getReply_id() {
        return reply_id;
    }

    public void setReply_id(long reply_id) {
        this.reply_id = reply_id;
    }

    public long getSup_num() {
        return sup_num;
    }

    public void setSup_num(long sup_num) {
        this.sup_num = sup_num;
    }

    public long getUs_num() {
        return us_num;
    }

    public void setUs_num(long us_num) {
        this.us_num = us_num;
    }

    public String getReply_content() {
        return reply_content;
    }

    public void getReply_content(String reply_content) {
        this.reply_content = reply_content;
    }

    public void setReply_content(String reply_content) {
        this.reply_content = reply_content;
    }


    public void setReply_date(String reply_date) {
        this.reply_date = reply_date;
    }
}
