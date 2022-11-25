create table user(
user_seq integer auto_increment primary key,
id varchar(50) not null default(''),
pwd varchar(50) not null default(''),
name varchar(50) not null default(''),
email varchar(100) not null default(''),
phone_num varchar(20) not null default(''),
join_date varchar(8) not null default(DATE_FORMAT(now(), '%Y%m%d')),
status varchar(20) not null default('Y'),
git_link varchar(200) not null default(''),
insert_time datetime default(now()),
update_time datetime
); 
drop table user;
select * from user;
insert into user(id, pwd, name, email, phone_num) values('admin',1234,'관리자','admin@admin.com','010-0000-0000');


create table team_member(
team_member_seq integer auto_increment primary key,
user_seq integer not null default(0),
team_id varchar(50) not null default(''),
team_leader varchar(1) not null default(''),
create_date varchar(8) not null default(DATE_FORMAT(now(), '%Y%m%d')),
team_category varchar(1) not null default(''),

insert_time datetime default(now()),
update_time datetime
);

create table project(
project_seq integer auto_increment primary key,
team_id varchar(50) not null default(''),
project_name varchar(100) not null default(''),
finish_yn varchar(1) not null default('N'),
percentage integer not null default(0),
create_date varchar(8) not null default(DATE_FORMAT(now(), '%Y%m%d')),

insert_time datetime default(now()),
update_time datetime
);

create table schedule(
schedule_seq integer auto_increment primary key,
project_seq integer not null default(0),
schedule_category varchar(20) not null default(''),
start_date varchar(8) not null default(''),
end_date varchar(8) not null default(''),
content text not null default(''),
finish_yn varchar(1) not null default('N'),

insert_time datetime default(now()),
update_time datetime
);

create table board (
board_seq integer auto_increment primary key,
user_seq integer not null default(0),
project_seq integer not null default(0),
board_category varchar(10) not null default (''),
board_title varchar(100) not null default(''),
board_content text not null default(''),
complete_yn varchar(1) not null default('N'),
create_date varchar(8) not null default(DATE_FORMAT(now(), '%Y%m%d')),
fileName varchar(100) not null default(''),
realFileName varchar(100) not null default(''),

insert_time datetime default(now()),
update_time datetime
);

drop table board;
select * from board;
create table documents(
documents_seq int primary key auto_increment,
project_seq int not null,
page_num int not null default(0),
documents_name varchar(50) not null default(''),
documents_item1 text not null default(''),
documents_item2 text not null default(''),
documents_item3 text not null default(''),
documents_item4 text not null default(''),
documents_item5 text not null default(''),
documents_content1 text not null default(''),
documents_content2 text not null default(''),
documents_content3 text not null default(''),
documents_content4 text not null default(''),
documents_content5 text not null default(''),
create_date varchar(8) not null default(DATE_FORMAT(now(), '%Y%m%d')),

insert_time datetime default(now()),
update_time datetime                	
);

show tables;
desc documents;
drop table documents;

create table process(
	process_seq int auto_increment primary key,
	project_seq int not null,
	project_finish varchar(1) not null default('N'),
	document_finish varchar(1) not null default('N'),
	function_finish varchar(1) not null default('N'),
	wbs_finish varchar(1) not null default('N'),
	implementation_finish varchar(1) not null default('N'),
	test_finish varchar(1) not null default('N'),
	complete varchar(1) not null default('N'),
	
	insert_time datetime default(now()),
	update_time datetime  
);

select * from process;
drop table process;