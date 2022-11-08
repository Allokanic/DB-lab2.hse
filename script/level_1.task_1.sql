drop table if exists Трудовая_деятельность;
drop table if exists Медперсонал;
drop table if exists Место_работы;
drop table if exists Типы_операций;

create table Медперсонал (
    идентификатор int primary key unique not null,
    фамилия varchar(30) not null,
    адрес varchar(50) not null,
    налог int not null check ( налог between 0 and 100)
);

create table Место_работы (
    идентификатор int primary key unique not null,
    учреждение varchar(30) not null,
    адрес varchar(50) not null,
    отчисление_в_местный_бюджет int not null check ( отчисление_в_местный_бюджет between 0 and 100)
);

create table Типы_операций (
    идентификатор int primary key unique not null,
    наименование varchar(50) not null,
    опорный_пункт varchar(50) not null,
    запасы int not null,
    стоимость int not null
);

create table Трудовая_деятельность (
    договор int primary key unique not null ,
    дата varchar (15) not null ,
    мед_персонал int not null ,
    место_работы int not null ,
    операция int not null ,
    количество int not null ,
    оплата int not null,
    foreign key (мед_персонал) references Медперсонал(идентификатор),
    foreign key (место_работы) references Место_работы(идентификатор),
    foreign key (операция) references Типы_операций(идентификатор)
);