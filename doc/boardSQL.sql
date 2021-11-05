
-- 게시글 작성
insert into board values(null , ? , ? ,  sysdate(), ? , ? ,? , ? ,? );
insert into board(no, title, contents, reg_date, hit, group_no, order_no, depth, user_no) values(null, 'title', 'contents', sysdate(), 0, 0, 0, 0, 8);


-- 조회
select a.no, a.title, a.contents, a.reg_date, a.hit, a.group_no, a.order_no, a.depth, b.no, b.name from board a, user b where a.user_no = b.no and a.no=1;
select a.no, a.title, a.contents, a.reg_date, a.hit, a.group_no, a.order_no, a.depth, b.no, b.name from board a, user b;
select * from board;
select * from user;


select a.no ,  a.title  , a.contents , a.reg_date, a.depth , a.hit , b.no as user_no , b.name from board a ,user b where a.user_no = b.no and a.title like '%%' order by  a.group_no  desc  , a.order_no asc limit 0 , 10;

select * from gallery;
select * from site;
select * from emaillist01;
select * from board;
select * from user;


delete from gallery;
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

insert into user values(null, '관리자', 'admin@mysite.com','123','male',now(),'ADMIN');

--

alter table user modify column role enum('USER', 'ADMIN') default 'USER';
UPDATE site SET profile = "null" , title= "MySite", welcome = '안녕하세요. 이종윤의 mysite에 오신 것을 환영합니다.' , description = '이 사이트는  웹 프로그램밍 실습과제 예제 사이트입니다.<br>\r\n    메뉴는  사이트 소개, 방명록, 게시판이 있구요.\r\n\r\n    Java수업 + 데이터베이스 수업 + 웹프로그래밍 수업\r\n    배운 거 있는거 없는 거 다 합쳐서 만들어 놓은 사이트 입니다.';
desc site;

select * from site;


delete from site;

insert into site values(
	null,
    'MySite',
    '안녕하세요. 이종윤의 mysite에 오신 것을 환영합니다.',
    '/gallery/images/luffy.jpg',
    '이 사이트는  웹 프로그램밍 실습과제 예제 사이트입니다.<br>
    메뉴는  사이트 소개, 방명록, 게시판이 있구요.\n
    Java수업 + 데이터베이스 수업 + 웹프로그래밍 수업
    배운 거 있는거 없는 거 다 합쳐서 만들어 놓은 사이트 입니다.');
