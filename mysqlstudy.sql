use yang;
select * from t_user;
insert into t_user (username,password,account) values ('里','sdfsdf',70000.0);
alter table t_user add (salary double(7,2));
use test;
CREATE TABLE Student(
   ID   INT NOT NULL AUTO_INCREMENT,
   NAME VARCHAR(20) NOT NULL,
   AGE  INT NOT NULL,
   PRIMARY KEY (ID)
);
use yang;
show tables;
CREATE TABLE contacts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL
);
INSERT INTO contacts (first_name,last_name,email) 
VALUES ('Carine ','Schmitt','carine.schmitt@qq.com'),
       ('Jean','King','jean.king@yiibai.com'),
       ('Peter','Ferguson','peter.ferguson@google.com'),
       ('Janine ','Labrune','janine.labrune@aol.com'),
       ('Jonas ','Bergulfsen','jonas.bergulfsen@mac.com'),
       ('Janine ','Labrune','janine.labrune@aol.com'),
       ('Susan','Nelson','susan.nelson@qq.com'),
       ('Zbyszek ','Piestrzeniewicz','zbyszek.piestrzeniewicz@qq.com'),
       ('Roland','Keitel','roland.keitel@yahoo.com'),
       ('Julie','Murphy','julie.murphy@yahoo.com'),
       ('Kwai','Lee','kwai.lee@google.com'),
       ('Jean','King','jean.king@qq.com'),
       ('Susan','Nelson','susan.nelson@qq.comt'),
       ('Roland','Keitel','roland.keitel@yahoo.com');
select * from contacts;
DELIMITER //
use yang //
CREATE procedure GetAllMessage()
begin
select * from contacts;
end //
Delimiter ;
call GetAllMessage();
use yang;
call getbyname("Carine",@result);
select @result;
create table workday (
	id int(11) not null auto_increment,
    workday DATE default null,
    primary key (id)
);
select * from workday;
show databases;
use yiibaidb;
show tables;
select * from employees;
set @email_list = "";
call build_email_list(@email_list);
select @email_list;

-- range分区
create table if not exists user (
	id int(11) not null auto_increment comment '用户ID',
    name varchar(50) not null default '' comment '名称',
    sex int(1) not null default '0' comment '0为男，1为女',
    primary key (id)
)auto_increment=1
partition by range(id)(
	partition p0 values less than (3),
    partition p1 values less than (6),
    partition p2 values less than (9),
    partition p3 values less than (12),
    partition p4 values less than maxvalue
);
desc user;
INSERT INTO `yang`.`user` (`name` ,`sex`)VALUES ('tank', '0')  
 ,('zhang',1),('ying',1),('张',1),('映',0),('test1',1),('tank2',1)  
 ,('tank1',1),('test2',1),('test3',1),('test4',1),('test5',1),('tank3',1)  
 ,('tank4',1),('tank5',1),('tank6',1),('tank7',1),('tank8',1),('tank9',1)  
 ,('tank10',1),('tank11',1),('tank12',1),('tank13',1),('tank21',1),('tank42',1);  
 commit;
 select * from user;
 select count(0) from user;
alter table user drop partition p4;
show create table user;
CREATE TABLE
    aweb_user
    (
        USR_ID VARCHAR(50) NOT NULL COMMENT '用户ID',
        USR_USERNAME VARCHAR(50) COMMENT '用户名',
        USR_PASSWORD VARCHAR(300) COMMENT '密码',
        USR_NICKNAME VARCHAR(50) COMMENT '昵称',
        USR_LASTHOSTADDRESS VARCHAR(15) COMMENT '最后登陆IP',
        USR_MAILBOX VARCHAR(30) COMMENT '邮箱',
        USR_TELEPHONE VARCHAR(11) COMMENT '电话号码',
        USR_CREATEUSER VARCHAR(50) COMMENT '创建用户',
        USR_CREATETIME DATETIME COMMENT '创建时间',
        USR_UPDATETIME DATETIME COMMENT '更新时间',
        USR_LASTLOGINTIME DATETIME COMMENT '最后登录成功时间',
        USR_LASTFAILEDLOGINTIME DATETIME COMMENT '最后登录失败时间',
        USR_LOCKTIME DATETIME COMMENT '锁定开始时间',
        USR_FAILEDLOGINCOUNT VARCHAR(1) COMMENT '连续登陆错误次数',
        USR_STATE VARCHAR(1) COMMENT '状态',
        USR_USERTYPE VARCHAR(1) COMMENT '用户类型',
        USR_REMARK VARCHAR(200) COMMENT '备注',
        PRIMARY KEY (USR_ID)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';
CREATE TABLE
    aweb_user_to_role
    (
        UTR_ID VARCHAR(50) NOT NULL COMMENT '关联ID',
        UTR_USR_ID VARCHAR(50) COMMENT '用户ID',
        UTR_ROL_ID VARCHAR(50) COMMENT '角色ID',
        PRIMARY KEY (UTR_ID)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色关联表';
CREATE TABLE
    aweb_url_access
    (
        URL_ID VARCHAR(200) NOT NULL COMMENT 'URLID',
        URL_ACCESS VARCHAR(5) COMMENT 'URL所需权限等级',
        URL_MEN_ID VARCHAR(50) COMMENT 'URL对应菜单',
        URL_DESC VARCHAR(200) COMMENT '描述',
        PRIMARY KEY (URL_ID)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='URL权限级别表';
CREATE TABLE
    aweb_role_to_menu
    (
        RTM_ID VARCHAR(50) NOT NULL COMMENT '关联ID',
        RTM_ROL_ID VARCHAR(50) COMMENT '角色ID',
        RTM_MEN_ID VARCHAR(50) COMMENT '菜单ID',
        RTM_ACCESS VARCHAR(5) COMMENT '角色对应菜单的等级',
        PRIMARY KEY (RTM_ID)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色菜单关联表';
CREATE TABLE
    aweb_role
    (
        ROL_ID VARCHAR(50) NOT NULL COMMENT '角色ID',
        ROL_NAME VARCHAR(100) COMMENT '角色名',
        ROL_CREATEUSER VARCHAR(50) COMMENT '创建用户',
        ROL_CREATETIME VARCHAR(30) COMMENT '创建时间',
        ROL_UPDATETIME VARCHAR(30) COMMENT '更新时间',
        ROL_REMARK VARCHAR(100) COMMENT '备注',
        ROL_TYPE VARCHAR(1) COMMENT '角色类型',
        PRIMARY KEY (ROL_ID)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';
CREATE TABLE
    aweb_menu
    (
        MEN_ID VARCHAR(50) NOT NULL COMMENT '菜单ID',
        MEN_PID VARCHAR(50) COMMENT '菜单父ID',
        MEN_NAME VARCHAR(100) COMMENT '菜单名',
        MEN_VALUE VARCHAR(200) COMMENT '菜单URL',
        MEN_ISPARENT VARCHAR(5) COMMENT '是否为父节点',
        MEN_STATE VARCHAR(1) COMMENT '菜单状态',
        MEN_POSITION VARCHAR(20) COMMENT '菜单位置',
        MEN_TYPE VARCHAR(20) COMMENT '菜单类型',
        MEN_REMARK VARCHAR(200) COMMENT '备注',
        MEN_LEVEL VARCHAR(1) COMMENT '菜单层级',
        MEN_SEQ VARCHAR(5) COMMENT '菜单序号',
        MEN_ICON VARCHAR(100) COMMENT '菜单图标',
        MEN_LANG VARCHAR(10) COMMENT '菜单语言',
        PRIMARY KEY (MEN_ID)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';
CREATE TABLE
    aweb_access
    (
        ACC_CODE VARCHAR(2) COMMENT '权限码',
        ACC_DESC VARCHAR(100) COMMENT '描述'
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';
CREATE TABLE
    aesb_g_dictionary
    (
        DICT_KEY_EN VARCHAR(20) NOT NULL COMMENT '平台字典键英文名',
        DICT_KEY_CN VARCHAR(50) NOT NULL COMMENT '平台字典键名称',
        DICT_VALUE_EN VARCHAR(50) NOT NULL COMMENT '平台字典值英文名',
        DICT_VALUE_CN VARCHAR(50) NOT NULL COMMENT '平台字典值名称',
        DICT_VALUE_DESC VARCHAR(100) COMMENT '平台字典值描述',
        PRIMARY KEY (DICT_KEY_EN, DICT_VALUE_EN)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典表';
desc aweb_user;
select * from aweb_user;
INSERT INTO aweb_user (USR_ID, USR_USERNAME, USR_PASSWORD, USR_NICKNAME, USR_LASTHOSTADDRESS, USR_MAILBOX, USR_TELEPHONE, USR_CREATEUSER, USR_CREATETIME, USR_UPDATETIME, USR_LASTLOGINTIME, USR_LASTFAILEDLOGINTIME, USR_LOCKTIME, USR_FAILEDLOGINCOUNT, USR_STATE, USR_USERTYPE, USR_REMARK) VALUES ('112233445566', 'admin123', 'Mmfm49DajwW8wV/vD3YsCVQnDfJpwLJ8h5IMMPLxCTYRw6KKlKAPnOB+ne3/+XVHKiiAFlusoNfANqSz5D428Q==', '管理员', '0:0:0:0:0:0:0:1', 'admin@agree.com', '15088888888', 'admin', '2015-01-01 00:00:00', '2015-01-01 00:00:00', '2018-09-06 17:18:22', '2018-09-06 14:39:14', '2018-08-07 17:17:33', '0', null, '0', '管理员');
INSERT INTO aweb_user (USR_ID, USR_USERNAME, USR_PASSWORD, USR_NICKNAME, USR_LASTHOSTADDRESS, USR_MAILBOX, USR_TELEPHONE, USR_CREATEUSER, USR_CREATETIME, USR_UPDATETIME, USR_LASTLOGINTIME, USR_LASTFAILEDLOGINTIME, USR_LOCKTIME, USR_FAILEDLOGINCOUNT, USR_STATE, USR_USERTYPE, USR_REMARK) VALUES ('123456789000', 'ide', 'Mmfm49DajwW8wV/vD3YsCVQnDfJpwLJ8h5IMMPLxCTYRw6KKlKAPnOB+ne3/+XVHKiiAFlusoNfANqSz5D428Q==', 'IDE用户', 'localhost', 'admin@agree.com', '15088888888', 'admin', '2015-01-01 00:00:00', '2015-01-01 00:00:00', '2018-08-08 09:26:02', '2018-08-07 17:17:33', '2018-08-07 17:17:33', '0', null, '0', '管理员');
select * from aesb_g_dictionary;

select * from yiibaidb.customers;
create table customers_20190418 as select * from customers;
select * from yiibaidb.customers_20190418;
truncate yiibaidb.customers_20190418;
drop table yiibaidb.customers_20190418;
delete from yiibaidb.customers_20190418 where customerName='Atelier graphique'; 
commit;
create table contacts (
	id int primary key auto_increment,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email varchar(25) not null
);
insert into yiibaidb.contacts (first_name,last_name,email)
values
('Carine','Schmitt','kjkjjk@139.com'),
('Jean','King','jean.king@yiibai.com'),
('Peter','Ferguson','peter.ferguson@google.com'),
('Janine ','Labrune','janine.labrune@aol.com'),
('Jonas ','Bergulfsen','jonas.bergulfsen@mac.com'),
('Janine ','Labrune','janine.labrune@aol.com'),
('Susan','Nelson','susan.nelson@qq.com'),
('Zbyszek ','Piestrzeniewicz','zbyszek.pie@qq.com'),
('Roland','Keitel','roland.keitel@yahoo.com'),
('Julie','Murphy','julie.murphy@yahoo.com'),
('Kwai','Lee','kwai.lee@google.com'),
('Jean','King','jean.king@qq.com'),
('Susan','Nelson','susan.nelson@qq.comt'),
('Roland','Keitel','roland.keitel@yahoo.com');
commit;
select * from yiibaidb.contacts;
-- 如何查询重复的email的所有行
select email,count(email) from yiibaidb.contacts
group by email
having count(email)>1;
select t.first_name,count(t.first_name),
	   t.last_name,count(t.last_name),
       t.email,count(t.email) 
	from yiibaidb.contacts t
    group by t.first_name,t.last_name,t.email
    having count(t.first_name)>1
		and count(t.last_name)>1
        and count(t.email)>1;
SELECT * FROM yiibaidb.products;
select @msrp := MAX(msrp) from yiibaidb.products;
select @msrp from yiibaidb.products;
select msrp,count(msrp) from yiibaidb.products
group by msrp
order by msrp desc; 
select @msrp as max_price;
-- REGEXP 置于 where 条件中用于正则匹配
select * from yiibaidb.products where productName REGEXP '^a';
select * from yiibaidb.products where productName REGEXP 'f$';
select productname from yiibaidb.products where productname REGEXP '^.{10}$';
create table leads (
id int auto_increment primary key,
first_name VARCHAR(50) not null,
last_name varchar(50) not null,
source varchar(255) not null,
email varchar(100),
phone varchar(25)
);
INSERT INTO leads(first_name,last_name,source,email,phone)
VALUE('John','Doe','Web Search','john.doe@yiibai.com',NULL);
INSERT INTO leads(first_name,last_name,source,phone)
VALUES('Lily','Bush','Cold Calling','(408)-555-1234'),
('David','William','Web Search','(408)-888-6789');
INSERT INTO leads(first_name,last_name,source,email,phone)
VALUE('Thierry','Henry','Web Search','thierry.henry@yiibai.com','');
commit;
select * from leads where phone is null;
select ID,first_name,last_name,phone,coalesce(NULLIF(phone,''),email,'N/A') contacts from leads;
select CURDATE() today;
select DATE(now()) today;
DELIMITER $$
create function today()
returns date  
BEGIN
return CURDATE();
END$$
DELIMITER;
select today();
select today() + INTERVAL 1 day tommorrow;
select today() - INTERVAL 1 day yesterday;
----------------------------------------------------
select customername,state,country from customers order by country;
select customername,if(state is null,'N/A',state) state,country from customers order by country;
----------------------------------------------------
-- mysql row_number 为每行添加行号
set @row_number =0;
select (@row_number:=@row_number+1) as num,firstname,lastname from employees limit 5;
set @num = 0;
select (@num:=@num+1) num,firstname from employees limit 10;

call GetAllProducts();
DELIMITER //
create PROCEDURE GetAllProducts()
BEGIN
select * from products;
END //
DELIMITER;
call GetAllProducts();
declare total_products int default 0
select count(*) into total_products from products;
DELIMITER $$
USE `yiibaidb`$$
CREATE PROCEDURE GetOfficeByCountry(IN countryName VARCHAR(255))
 BEGIN
 SELECT * 
 FROM offices
 WHERE country = countryName;
 END$$
DELIMITER ;
call GetOfficeBycountry('USA');
DELIMITER $$
CREATE PROCEDURE CountOrderByStatus(
 IN orderStatus VARCHAR(25),
 OUT total INT)
BEGIN
 SELECT count(orderNumber)
 INTO total
 FROM orders
 WHERE status = orderStatus;
END$$
DELIMITER ;
call CountOrderByStatus('Shipped',@total);
select @total total;
DELIMITER $$
CREATE PROCEDURE set_counter(INOUT count INT(4),IN inc INT(4))
BEGIN
 SET count = count + inc;
END$$
DELIMITER ;
set @counter = 1;
call set_counter(@counter,1);
select @counter counter;

select * from customers;
drop procedure getcustomershipping;
Delimiter //
create procedure getCustomerLevel(in name varchar(255),out level varchar(255))
begin
declare credlimit double;
select creditLimit into credlimit from customers where customerName = name;
if credlimit>50000 then
	set level='platnum';
elseif credlimit<=50000 AND credlimit>10000 then
    set level='gold';
elseif credlimit<=10000 then
	set level='silver';
end if;
end//
Delimiter ;
call getCustomerLevel('Atelier graphique',@level);
select @level level;
-- 通过不同的国家去区分客户送货时间的不同
DELIMITER //
create procedure getcustomershipping(in name varchar(255),
out shippingTime varchar(100))
begin
declare countryname varchar(100);
select country into countryname from customers 
where customername=name;
case countryname
when 'France' then set shippingTime='1-day shipping';
when 'USA' then set shippingTime='2-day shipping';
else set shippingTime='don\'t provide server';
end case;
end//
DELIMITER ;
select * from customers;
call getcustomershipping('Australian Collectors, Co.',@shippingtime);
select @shippingtime;
drop procedure getcustomershipping;

delimiter //
create procedure buildEmailList(inout email_list varchar(4000))
begin
declare v_finished integer default 0;
declare v_email varchar(100) default '';
declare email_cursor cursor for select email from employees;
declare continue handler for not found set v_finished=1;
open email_cursor;
get_email:LOOP
fetch email_cursor into v_email;
if v_finished=1 then
leave get_email;
end if;
set email_list=concat(v_email,";",email_list);
end LOOP get_email;
close email_cursor;
end//
delimiter ; 
set @email_list = '';
call buildemaillist(@email_list);
select @email_list;
show procedure status where db='yiibaidb';
--  mysql创建一个新用户 
create user dbadmin@localhost identified by 'yang1995';
show grants for dbadmin@localhost;
CREATE user super@localhost identified by '123456';
show grants for super@localhost;
-- GRANT USAGE ON *.* TO 'super'@'localhost' IDENTIFIED BY PASSWORD '*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9'
grant all on *.* to 'super'@'localhost' with grant option;
create user middle@localhost identified by 'oradb123';
grant select,insert,update on yiibaidb.* to 'middle'@'localhost';
select * from mysql.user;
drop user 'middle'@'localhost';
show processlist;
describe orders;
show tables;
CREATE TABLE employees_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employeeNumber INT NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);
desc contacts;
select coalesce(nullif()) from yiibaidb.contacts;
use yiibaidb;
select * from contacts;
DELIMITER //
create procedure insert_data(in amount int)
begin
declare i int default 0;
while i<amount do
insert into contacts (first_name,last_name,email) values (concat("first",i),concat("last",i),concat("email",i));
set i = i + 1;
end while;
end //
DELIMITER ;
drop procedure insert_data;
truncate contacts;
set @amount=1000;
call insert_data(@amount);
create table contacts_bak as select * from contacts;
select * from orders;
select date_format(orderdate,'%Y%m%d') from orders;

create table test (
id int primary key auto_increment,
startdate varchar(20) 
);
insert into test (startdate) values ('2018-09-09');
commit;
select * from test; -- date_format(date,'%Y-%m-%d')
select str_to_date(startdate,'%Y-%m-%d') from test;















































































































