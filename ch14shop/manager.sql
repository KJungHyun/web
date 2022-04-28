create table manager (
    managerId varchar(50) not null primary key,
    managerPasswd varchar(16) not null
);

insert into manager(managerId, managerPasswd) values('bookmaster@shop.com','123456');