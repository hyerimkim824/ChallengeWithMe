package kr.support.vo;

import java.util.Date;

public class FeedBackVO {
    // 고유 번호
    private long sup_num;

    // 제목
    private String sup_title;

    // 내용
    private String sup_content;

    // 문의 유형
    private String sup_pick;

    // 작성자 번호
    private long us_num;

    // 작성 날짜
    private Date sup_date;

    // 공개 여부 (0: 공개, 1: 비공개)
    private int sup_visi;

    // 비밀번호 (비공개 게시물)
    private long sup_pwd;

    // 첨부 이미지 경로
    private String sup_img;
    
    private String us_nickname;

    // 기본 생성자
    public FeedBackVO() {}

    // 모든 필드를 포함한 생성자
    public FeedBackVO(long sup_num, String sup_title, String sup_content, String sup_pick, long us_num, Date sup_date,
			int sup_visi, long sup_pwd, String sup_img, String us_nickname) {
		super();
		this.sup_num = sup_num;
		this.sup_title = sup_title;
		this.sup_content = sup_content;
		this.sup_pick = sup_pick;
		this.us_num = us_num;
		this.sup_date = sup_date;
		this.sup_visi = sup_visi;
		this.sup_pwd = sup_pwd;
		this.sup_img = sup_img;
		this.us_nickname = us_nickname;
	}
    
    // Getter와 Setter
    public long getSup_num() {
        return sup_num;
    }

	public void setSup_num(long sup_num) {
        this.sup_num = sup_num;
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

    public String getSup_pick() {
        return sup_pick;
    }

    public void setSup_pick(String sup_pick) {
        this.sup_pick = sup_pick;
    }

    public long getUs_num() {
        return us_num;
    }

    public void setUs_num(long us_num) {
        this.us_num = us_num;
    }

    public Date getSup_date() {
        return sup_date;
    }

    public void setSup_date(Date sup_date) {
        this.sup_date = sup_date;
    }

    public int getSup_visi() {
        return sup_visi;
    }

    public void setSup_visi(int sup_visi) {
        this.sup_visi = sup_visi;
    }

    public long getSup_pwd() {
        return sup_pwd;
    }

    public void setSup_pwd(long sup_pwd) {
        this.sup_pwd = sup_pwd;
    }

    public String getSup_img() {
        return sup_img;
    }

    public void setSup_img(String sup_img) {
        this.sup_img = sup_img;
    }

    public String getUs_nickname() {
		return us_nickname;
	}

	public void setUs_nickname(String us_nickname) {
		this.us_nickname = us_nickname;
	}
	
	// 문의 유형을 문자열로 반환
    public String getSupPickString() {
        try {
            switch (Integer.parseInt(sup_pick)) {
                case 1: return "신고/이용제";
                case 2: return "피해예방";
                case 3: return "기타";
                default: return "알 수 없음";
            
            }
        } catch (NumberFormatException e) {
            return "알 수 없음"; // 예외 처리
        }
    }
	
	// toString 메서드 (디버깅 및 출력용)
	@Override
	public String toString() {
		return "FeedBackVO [sup_num=" + sup_num + ", sup_title=" + sup_title + ", sup_content=" + sup_content
				+ ", sup_pick=" + sup_pick + ", us_num=" + us_num + ", sup_date=" + sup_date + ", sup_visi=" + sup_visi
				+ ", sup_pwd=" + sup_pwd + ", sup_img=" + sup_img + ", us_nickname=" + us_nickname + ", supPickString=" + getSupPickString()+ "]";
	}
}
