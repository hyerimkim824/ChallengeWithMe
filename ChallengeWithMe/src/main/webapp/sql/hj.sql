--커뮤니티 글 좋아요
create table post_like(
 post_num number not null,
 us_num number not null,
 constraint post_fav_fk1 foreign key (post_num) references post (post_num),
 constraint us_num_fk2 foreign key (us_num) references user_detail (us_num)
);