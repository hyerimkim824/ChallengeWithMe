--가계부 table------------------------------
create table account(
    us_num number not null,
	ac_num number not null,
	ac_date date default sysdate not null,
	ac_content varchar2(100) not null,
	ac_income decimal(10) not null,
	ac_outcome decimal(10) not null,
	ac_bal decimal(10) not null,
	ac_card number(1) default 0 not null,
	ac_money number(1) default 0 not null,
	ac_memo varchar2(100) not null,
	CONSTRAINT ac_pk primary key(ac_num),
	foreign key (us_num) REFERENCES xuser(us_num)
);

create sequence ac_seq;