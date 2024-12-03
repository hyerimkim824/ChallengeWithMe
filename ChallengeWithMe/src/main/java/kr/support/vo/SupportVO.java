package kr.support.vo;

import java.sql.Date;
import kr.xuser.dao.XuserDAO; // XuserDAO를 사용하여 사용자 정보 조회


public class SupportVO {
    private long sup_num;      // 문의 번호 🐇
    private String sup_pick;     // 문의 유형 🐰 (예: 1=일반, 2=FAQ, 3=환불 안내 등)
    private String sup_title;  // 제목 🐇
    private String sup_content; // 내용 🐰
    private int sup_visi;   // 공개 여부 🐇 0=공개, 1=비공개
    private Date sup_date;      // 등록 날짜 🐰
    private String sup_img;     // 첨부 파일 경로 🐇
 
	private long sup_pwd;     // 비밀번호 🐰
    private long us_num;        // 작성자 번호 🐇
    private String us_nickname; // 작성자 닉네임 🐇

    // 기본 생성자 🐰
    public SupportVO() {
        this.sup_date = new Date(System.currentTimeMillis()); // 현재 날짜 🐰
    }

    // 모든 필드를 초기화하는 생성자 🐇✨
    public SupportVO(long sup_num, String sup_pick, String sup_title, String sup_content,
                     int sup_visi, Date sup_date, String sup_img, long sup_pwd, long us_num) {
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
                ", sup_pwd=" + sup_pwd +
                ", us_num=" + us_num +
                '}';
    }

    // Getter와 Setter 🐇✨
    public long getSup_num() {
        return sup_num;
    }

    public void setSup_num(long sup_num) {
        this.sup_num = sup_num;
    }

    public String getSup_pick() {
        return sup_pick;
    }

    public void setSup_pick(String sup_pick) {
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

    public long getSup_pwd() {
        return sup_pwd;
    }

    public void setSup_pwd(long sup_pwd) {
        this.sup_pwd = sup_pwd;
    }

    public long getUs_num() {
        return us_num;
    }

    public void setUs_num(long us_num) {
        this.us_num = us_num;
    }

    public String getUs_nickname() {
        return us_nickname;
    }

    public void setUs_nickname(String us_nickname) {
        this.us_nickname = us_nickname;
    }
    public int getSup_visi() {
 		return sup_visi;
 	}

 	public void setSup_visi(int sup_visi) {
 		this.sup_visi = sup_visi;
 	}


    // 문의 유형을 문자열로 반환
    public String getSupPickString() {
        try {
            switch (Integer.parseInt(sup_pick)) {
                case 1: return "로그인 및 계정";
                case 2: return "결제 및 환불";
                case 3: return "챌린지 방식/인증 규정";
                case 4: return "참가비/환급/상금";
                case 5: return "인증패스/레드카드";
                case 6: return "회원가입 및 탈퇴";
                case 7: return "주제제안";
                case 8: return "챌린지";
                case 9: return "기능/오류";
                case 10: return "광고";
                case 11: return "기타";
                default: return "알 수 없음";
            }
        } catch (NumberFormatException e) {
            return "알 수 없음"; // 예외 처리
        }
    }
}  
