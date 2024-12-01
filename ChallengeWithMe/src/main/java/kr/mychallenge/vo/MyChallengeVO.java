package kr.mychallenge.vo;
  
public class MyChallengeVO {
	
	//기본 챌린지 정보
	private long ch_num; //챌린지 번호(PK)
	private long us_num; //유저 번호(FK)
	private int cat_num; //카테고리 번호(FK)
	private String ch_title; //챌린지 제목
	private String ch_desc; //챌린지 설명
	private String ch_start; //챌린지 시작
	private String ch_end ; //챌린지 종료
	private String ch_img; //챌린지 이미지
	private String ch_visibility;
	private long trance_decimal;
	private String ch_status; //챌린지 상태
	private String auth_desc;
	
	public String getAuth_desc() {
		return auth_desc;
	}
	public void setAuth_desc(String auth_desc) {
		this.auth_desc = auth_desc;
	}
	public int getCate_num() {
		return cate_num;
	}
	public void setCate_num(int cate_num) {
		this.cate_num = cate_num;
	}

	private int cate_num;
	
	
	private String p_stat;//참여 상황
	
	public String getP_stat() {
		return p_stat;
	}
	public void setP_stat(String p_stat) {
		this.p_stat = p_stat;
	}
	public long getAh_num() {
		return ah_num;
	}
	public void setAh_num(long ah_num) {
		this.ah_num = ah_num;
	}
	public int getCh_proved() {
		return ch_proved;
	}
	public void setCh_proved(int ch_proved) {
		this.ch_proved = ch_proved;
	}
	public String getAh_img() {
		return ah_img;
	}
	public void setAh_img(String ah_img) {
		this.ah_img = ah_img;
	}
	public String getAh_date() {
		return ah_date;
	}
	public void setAh_date(String ah_date) {
		this.ah_date = ah_date;
	}

	//가져오는 이미지->user detail table
	private String us_img;
	
	//auth table 정보
	private long ah_num; //인증 글 고유 번호->chall 테이블로 생각하자
	private int ch_proved; //인증 여부
	private String ah_img; //인증 사진
	private String ah_date; //인증 날짜

	
	
	
	public String getUs_img() {
		return us_img;
	}
	public void setUs_img(String us_img) {
		this.us_img = us_img;
	}
	
	/*인증 방식*/
	private long ab_num; //인증글 고유 번호(PK)
	private String ab_img; // 인증 이미지
	private String proved; //인증 여부
	private String ab_date;//인증 날짜
	public long getCh_num() {
		return ch_num;
	}
	public void setCh_num(long ch_num) {
		this.ch_num = ch_num;
	}
	public long getUs_num() {
		return us_num;
	}
	public void setUs_num(long us_num) {
		this.us_num = us_num;
	}
	public int getCat_num() {
		return cat_num;
	}
	public void setCat_num(int cat_num) {
		this.cat_num = cat_num;
	}
	public String getCh_title() {
		return ch_title;
	}
	public void setCh_title(String ch_title) {
		this.ch_title = ch_title;
	}
	public String getCh_desc() {
		return ch_desc;
	}
	public void setCh_desc(String ch_desc) {
		this.ch_desc = ch_desc;
	}
	public String getCh_start() {
		return ch_start;
	}
	public void setCh_start(String ch_start) {
		this.ch_start = ch_start;
	}
	public String getCh_end() {
		return ch_end;
	}
	public void setCh_end(String ch_end) {
		this.ch_end = ch_end;
	}
	public String getCh_img() {
		return ch_img;
	}
	public void setCh_img(String ch_img) {
		this.ch_img = ch_img;
	}
	public String getCh_visibility() {
		return ch_visibility;
	}
	public void setCh_visibility(String ch_visibility) {
		this.ch_visibility = ch_visibility;
	}
	public long getTrance_decimal() {
		return trance_decimal;
	}
	public void setTrance_decimal(long trance_decimal) {
		this.trance_decimal = trance_decimal;
	}
	public String getCh_status() {
		return ch_status;
	}
	public void setCh_status(String ch_status) {
		this.ch_status = ch_status;
	}
	public String getAuth_num() {
		return auth_num;
	}
	public void setAuth_num(String auth_num) {
		this.auth_num = auth_num;
	}
	public long getAb_num() {
		return ab_num;
	}
	public void setAb_num(long ab_num) {
		this.ab_num = ab_num;
	}
	public String getAb_img() {
		return ab_img;
	}
	public void setAb_img(String ab_img) {
		this.ab_img = ab_img;
	}
	public String getProved() {
		return proved;
	}
	public void setProved(String proved) {
		this.proved = proved;
	}
	public String getAb_date() {
		return ab_date;
	}
	public void setAb_date(String ab_date) {
		this.ab_date = ab_date;
	}
	
	
	
	

}
