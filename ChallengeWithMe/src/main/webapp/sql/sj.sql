-- 회원 테이블
create table xuser(
    us_num number not null,
    us_id varchar(12) not null UNIQUE,
    us_rank number(1) default 0, --  최초 디폴트 등급 "0" 설정 0 ~ N 사이 숫자로 등급 설정
    us_ban number(1) default 0, -- "0" ACTIVE "1" BAN "2" IDBAN
    us_wallet decimal(15) default 0,
    admin number(1) default 0, -- 관리자 계정 확인 "1" ADMIN (관리자 계정은 직접 등록)
    CONSTRAINT user_pk primary key(us_num)
);

-- 회원 개인정보 테이블
create table user_detail(
    us_num number not null,
    us_name varchar2(5) not null,
    us_birth varchar2(10) not null,
    us_gen number(1) not null, -- 성별(0:남자 1:여자)
    us_tel varchar2(11) not null, -- 전화번호 "-" 제외한 11자리 입력
    us_pw varchar2(16) not null,
    us_nickname varchar2(15) not null,
    us_date date default sysdate not null,
    us_rdate date,
    us_img varchar2(100), -- 이미지 경로만 저장 이미지는 따로 저장
    us_email varchar(50) not null, -- 이메일 "test@test.com 형식으로 입력
    CONSTRAINT ud_pk primary key(us_num),
    CONSTRAINT ud_fk foreign key(us_num)
    REFERENCES xuser(us_num)
);
create sequence xuser_seq;

--------------------------------------------------------------------------------------

-- 관리자 정보 테이블
create table admin_detail(
    ad_num number not null primary key,
    ad_name varchar2(10) not null,
    ad_role varchar2(20) not null, -- 관리자 담당
    us_num number not null,
    foreign key (us_num) references xuser(us_num)
);
create sequence ad_seq;

-- 관리자 계좌 테이블
create table admin_wallet(
    adw_num number not null primary key,
    adw_bal decimal(20) not null
);
create sequence aw_seq;

-----------------------------------------------------
-- 카테고리 테이블
create table cate(
    cate_num number not null primary key,
    cate_img varchar2(100) not null,
    cate_name varchar2(20) not null,
    cate_desc varchar2(100) not null
);
create sequence cate_seq;

-- 챌린지 정보 테이블
create table chall(
    ch_num number not null,
    ch_title varchar2(20) not null,
    ch_desc varchar2(50) not null,
    ch_start varchar2(10) not null,
    ch_end varchar2(10) not null,
    ch_img varchar2(100),
    ch_min number(20) default 1 not null,
    ch_person number not null,
    ch_visi number(1) default 0 not null, -- "0" 공개 "1" 비공개
    trans_bal decimal(10) not null,
    official number(1) default 0 not null, -- "0" 비공식 "1" 공식
    ch_status varchar2(10) not null, -- 챌린지 상태 (시작 전/진행 중/완료/실패)
    us_num number not null,
    cate_num number not null,
    CONSTRAINT chall_pk primary key(ch_num),
    foreign key (us_num) REFERENCES xuser(us_num),
    foreign key (cate_num) references cate(cate_num)
);
create sequence chall_seq;

-- 챌린지 후기 테이블
create table c_comm(
    cc_num number not null primary key,
    uscat_date date default sysdate not null,
    us_num number not null,
    cate_num number not null,
    ch_num number not null,
    constraint cc_fk foreign key (ch_num) references chall(ch_num),
    foreign key (us_num) references xuser(us_num),
    foreign key (cate_num) references cate(cate_num)
);
create sequence c_comm_seq;

-- 유저 선호 카테고리 테이블
create table pref(
    uscat_date date default sysdate not null,
    us_num number not null,
    cate_num number not null,
    foreign key (us_num) references xuser(us_num),
    foreign key (cate_num) references cate(cate_num)
);

-- 인증 게시판 테이블
create table auth(
    ah_num number not null primary key,
    ah_img varchar2(100),
    proved number(1) default 0 not null, -- 인증 적합성 확인 "0" 확인중 "1" 적합 "2" 부적합
    ah_date date default sysdate not null,
    us_num number not null,
    ch_num number not null,
    constraint ah_fk foreign key (ch_num) references chall(ch_num),
    foreign key (us_num) REFERENCES xuser(us_num)
);
create sequence auth_seq;

--------------------------------------------------------------------------

-- 글 작성 테이블
create table post(
    post_num number not null,
    post_img varchar2(100),
    post_title varchar2(20) not null,
    post_content varchar2(100) not null,
    post_date date default sysdate not null,
    us_num number not null,
    constraint post_pk primary key(post_num),
    foreign key (us_num) references xuser(us_num)
);
create sequence post_seq;

-- 댓글 작성 테이블
create table comm(
    com_num number not null primary key,
    com_content varchar2(50) not null,
    com_date date default sysdate not null,
    post_num number not null,
    us_num number not null,
    foreign key (us_num) references xuser(us_num),
    constraint com_fk foreign key (post_num)
    references post(post_num)
);
create sequence com_seq;

----------------------------------------------------------------------------------

-- 뱃지 데이터 테이블
create table badge(
    bg_num number not null primary key,
    bg_img varchar2(100) not null,
    bg_name varchar2(20) not null,
    bg_desc varchar2(50) not null
);
create sequence badge_seq;

-- 유저 뱃지 중간 테이블
create table userbadge(
    bg_date date default sysdate not null,
    us_num number not null,
    bg_num number not null,
    foreign key (us_num) references xuser(us_num),
    foreign key (bg_num) references badge(bg_num)
);

------------------------------------------------------------------------------------

-- 고객센터 테이블
create table support(
    sup_num number not null primary key,
    sup_pick number(1) default 0 not null, -- "0" 문의 "1" 신고
    sup_title varchar2(20) not null,
    sup_content varchar2(100) not null,
    sup_visi number(1) default 0 not null, -- "0" 공개 "1" 비공개
    sup_date date default sysdate not null,
    sup_img varchar2(100),
    sup_pwd number(4),
    us_num number not null,
    constraint sup_fk foreign key (us_num)
    references user_detail(us_num)
);
create sequence sup_seq;

--------------------------------------------------------------------------------------

-- 거래정보 테이블
create table trans(
    trans_num number not null primary key,
    trans_date date default sysdate not null,
    trans_bal decimal(20) not null,
    trans_stat number(1) default 0 not null, -- "0" 거래전 "1" 진행중 "2" 거래완료
    trans_type number(1) default 0 not null, -- "0" 예치금 송금 "1" 환급 "2" 상금지급 등 거래 종류
    ch_num number not null,
    to_num number not null,
    from_num number not null,
    foreign key (ch_num) references chall(ch_num),
    foreign key (to_num) references xuser(us_num),
    foreign key (from_num) references xuser(us_num)
);
create sequence trans_seq;

