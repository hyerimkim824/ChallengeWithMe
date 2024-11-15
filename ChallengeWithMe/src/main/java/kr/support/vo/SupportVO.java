package kr.support.vo;

import java.sql.Date;

public class SupportVO {
    private long sup_num;      // 문의 번호 🐇
    private long sup_pick;     // 문의 유형 🐰 (예: 1=일반, 2=FAQ, 3=환불 안내 등)
    private String sup_title;  // 제목 🐇
    private String sup_content; // 내용 🐰
    private boolean sup_visi;   // 공개 여부 🐇 true=공개, false=비공개
    private Date sup_date;      // 등록 날짜 🐰
    private String sup_img;     // 첨부 파일 경로 🐇
    private String sup_pwd;     // 비밀번호  🐰
    private long us_num;        // 작성자 번호 🐇 
 

    // 기본 생성자 🐰
    public SupportVO() {
        this.sup_visi = true;  // 기본값은 공개 🐇
        this.sup_date = new Date(System.currentTimeMillis()); // 현재 날짜 🐰
    }

    // 모든 필드를 초기화하는 생성자 🐇✨
    public SupportVO(long sup_num, long sup_pick, String sup_title, String sup_content, 
                     boolean sup_visi, Date sup_date, String sup_img, String sup_pwd, long us_num) {
        this.sup_num = sup_num;
        this.sup_pick = sup_pick;
        this.sup_title = sup_title;
        this.sup_content = sup_content;
        this.sup_visi = sup_visi;
        this.sup_date = sup_date;
        this.sup_img = sup_img;
        this.sup_pwd = sup_pwd;
        this.us_num = us_num;
    }

    // Getter와 Setter 🐇✨
    public long getSup_num() {
        return sup_num;
    }

    public void setSup_num(long sup_num) {
        this.sup_num = sup_num;
    }

    public long getSup_pick() {
        return sup_pick;
    }

    public void setSup_pick(long sup_pick) {
        this.sup_pick = sup_pick;
    }

    public String getSup_title() {
        return sup_title;
    }

    public void setSup_title(String sup_title) {
        this.sup_title = sup_title;
    }

    public String getSup_content() {
        return sup_content;
    }

    public void setSup_content(String sup_content) {
        this.sup_content = sup_content;
    }

    public boolean isSup_visi() {
        return sup_visi;
    }

    public void setSup_visi(boolean sup_visi) {
        this.sup_visi = sup_visi;
    }

    public Date getSup_date() {
        return sup_date;
    }

    public void setSup_date(Date sup_date) {
        this.sup_date = sup_date;
    }

    public String getSup_img() {
        return sup_img;
    }

    public void setSup_img(String sup_img) {
        this.sup_img = sup_img;
    }

    public String getSup_pwd() {
        return sup_pwd;
    }

    public void setSup_pwd(String sup_pwd) {
        this.sup_pwd = sup_pwd;
    }

    public long getUs_num() {
        return us_num;
    }

    public void setUs_num(long us_num) {
        this.us_num = us_num;
    }

    // `toString()` 메서드 🐇✨
    @Override
    public String toString() {
        return "SupportVO {" +
                "sup_num=" + sup_num +
                ", sup_pick=" + sup_pick +
                ", sup_title='" + sup_title + '\'' +
                ", sup_content='" + sup_content + '\'' +
                ", sup_visi=" + sup_visi +
                ", sup_date=" + sup_date +
                ", sup_img='" + sup_img + '\'' +
                ", sup_pwd='" + sup_pwd + '\'' +
                ", us_num=" + us_num +
                '}';
    }
}
