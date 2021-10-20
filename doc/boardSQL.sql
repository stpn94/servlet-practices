
-- 게시글 작성
insert into board values(null , ? , ? ,  sysdate(), ? , ? ,? , ? ,? );
insert into board(no, title, contents, reg_date, hit, file, group_no, order_no, depth, user_no) values(null, 'title', 'contents', sysdate(), 0, 'text.txt', 0, 0, 0, 8);


-- 조회
select a.no, a.title, a.contents, a.reg_date, a.hit, a.group_no, a.order_no, a.depth, b.no, b.name from board a, user b where a.user_no = b.no and a.no=1;
select a.no, a.title, a.contents, a.reg_date, a.hit, a.group_no, a.order_no, a.depth, b.no, b.name from board a, user b;
select * from board;
select * from user;
select a.no ,  a.title  , a.contents , a.reg_date, a.depth , a.hit , b.no as user_no , b.name from board a ,user b where a.user_no = b.no and a.title like '%%' order by  a.group_no  desc  , a.order_no asc limit 0 , 10;
-- 
update board set order_no=?+1 where group_no=? and order_no>=?;

-- 
delete from board where no = ?;

-- 
select count(*) from board;

-- 
select a.no ,  a.title  , a.contents , a.reg_date, a.depth , a.hit , b.no as user_no , b.name from board a ,user b where a.user_no = b.no order by a.group_no  desc  , a.order_no asc limit ? , ?;

-- 
select a.no ,  a.title  , a.contents , a.reg_date, a.depth , a.hit , b.no as user_no , b.name from board a ,user b where a.user_no = b.no and a.title like '%" + searchValue + "%' order by  a.group_no  desc  , a.order_no asc limit ? , ?;

-- 
update board set title = ? , contents = ?  where no = ?;

-- 게시글 수 가져오기 (그룹넘버 가장큰거 가져오기) 
select ifnull(max(group_no), 0) from board;

-- 
select max(order_no) from board;

-- 
update board set hit = hit + 1 where no = ?;

-- 
select * from board;