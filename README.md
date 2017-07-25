# JSP_Shop
 Basic shopping site including admin page
 - Language : JSP, Java
 - WAS : Apache Tomcat 8.0
 - Database : Oracle 11g



 - Database setup information :

    ID : jsp09
    
    PW :  jsp09

    Table
    1. category

    create table category(
	cnum 	number primary key,
	code 	varchar2(20) not null,
	cname 	varchar2(50) not null
);
create sequence cate_seq
start with 1
increment by 1;

    2. product
    
    create table product(
	pnum 		number primary key,
	pname 		varchar2(50) not null,
	pcategory_fk  	varchar2(20) not null,
	pcompany 	varchar2(50),
	pimage   		varchar2(30),
	pqty		number,
	price   		number,
	pspec   		varchar2(12),
	pcontents 	varchar2(300),
	point   		number,
	pinputdate 	varchar2(10)
);
create sequence prod_seq
start with 1
increment by 1;
