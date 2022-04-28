create table buy(
    buy_id bigint not null,
    buyer varchar(50) not null,
    book_id varchar(20) not null,
    book_title varchar(100) not null,
    buy_prive int not null,
    buy_count tinyint not null,
    book_image varchar(16) default 'nothing.jpg',
    book_date datetime not null,
    account varchar(50) not null,
    deliveryName varchar(10) not null,
    deliveryTel varchar(20) not null,
    deliveryAddress varchar(100) not null,
    sanction varchar(10) default '상품준비중'
);

desc buy;