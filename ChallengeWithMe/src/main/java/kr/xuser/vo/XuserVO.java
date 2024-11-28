package kr.xuser.vo;

public class XuserVO {
	// 회원 정보
	private long us_num;
	private String id;
	private int rank;
	private int ban;
	private String wallet;
	private int admin;

	// 회원 개인정보
	private String name;
	private String birth;
	private int gen;
	private String tel;
	private String passwd;
	private String nickname;
	private String date;
	private String rdate;
	private String img;
	private String email;
	private String address1;
	private String address2;
	private String zipcode;
	private int alarm;


	// 비밀번호 일치 여부 체크
	public boolean isCheckedPassword(String userPasswd) {
		// 회원상태(us_ban) : "0" ACTIVE "1" BAN "2" IDBAN
		if (ban <= 0 && passwd.equals(userPasswd)) {
			return true;
		}
		return false;
	}
	
	public int getAlarm() {
		return alarm;
	}
	
	public void setAlarm(int alarm) {
		this.alarm = alarm;
	}

	public String getZipcode() {
		return zipcode;
	}
	
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}


	// 회원 get set
	public long getUs_num() {
		return us_num;
	}

	public void setUs_num(long us_num) {
		this.us_num = us_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public int getBan() {
		return ban;
	}

	public void setBan(int ban) {
		this.ban = ban;
	}

	public String getWallet() {
		return wallet;
	}

	public void setWallet(String wallet) {
		this.wallet = wallet;
	}

	public int getAdmin() {
		return admin;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public int getGen() {
		return gen;
	}

	public void setGen(int gen) {
		this.gen = gen;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
