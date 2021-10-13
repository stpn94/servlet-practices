-- scheme
desc user;

-- join(insert)
insert into user(no, name, email, password, gender) values (null, '관리자', 'admin@mysite.com', '1234', 'male',current_date());

-- user list(select)
select * from user;