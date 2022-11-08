<!-- TOC -->

# Data Bases Lab #2

* ### Task list
    * [task 1(level 1)](#Task-1)
    * [task 2(level 1)](#Task-2)
    * [task 3(level 1)](#Task-3)
    * [task 4(level 1)](#Task-4)
    * [task 5(level 1)](#Task-5)
    * [task 6(level 1)](#Task-6)
    * [task 7(level 1)](#Task-7)
    * [task 8(level 1)](#Task-8)
    * [task 9(level 1)](#Task-9)
    * [task 10(level 2)](#Task-10)
    * [task 11(level 2)](#Task-11)
    * [task 12(level 2)](#Task-12)
    * [task 13(level 2)](#Task-13)
    * [task 14(level 2)](#Task-14)
    * [task 15(level 2)](#Task-15)

<!-- TOC -->

# Task 1

[To task list](#Data-Bases-Lab-#2)

### SQL:

```sql
drop table if exists Трудовая_деятельность;
drop table if exists Медперсонал;
drop table if exists Место_работы;
drop table if exists Типы_операций;

create table Медперсонал
(
    идентификатор int primary key unique not null,
    фамилия       varchar(30)            not null,
    адрес         varchar(50)            not null,
    налог         int                    not null check ( налог between 0 and 100)
);

create table Место_работы
(
    идентификатор               int primary key unique not null,
    учреждение                  varchar(30)            not null,
    адрес                       varchar(50)            not null,
    отчисление_в_местный_бюджет int                    not null check ( отчисление_в_местный_бюджет between 0 and 100)
);

create table Типы_операций
(
    идентификатор int primary key unique not null,
    наименование  varchar(50)            not null,
    опорный_пункт varchar(50)            not null,
    запасы        int                    not null,
    стоимость     int                    not null
);

create table Трудовая_деятельность
(
    договор      int primary key unique not null,
    дата         varchar(15)            not null,
    мед_персонал int                    not null,
    место_работы int                    not null,
    операция     int                    not null,
    количество   int                    not null,
    оплата       int                    not null,
    foreign key (мед_персонал) references Медперсонал (идентификатор),
    foreign key (место_работы) references Место_работы (идентификатор),
    foreign key (операция) references Типы_операций (идентификатор)
);
```

# Task 2

[To task list](#Data-Bases-Lab-#2)

#### SQL:

```sql
insert into "Медперсонал"
    (идентификатор, фамилия, адрес, налог)
VALUES (1, 'Медина', 'Вознесенское', 14),
       (2, 'Севастьянов', 'Навашино', 14),
       (3, 'Бессонов', 'Выкса', 10),
       (4, 'Губанов', 'Выкса', 10),
       (5, 'Боева', 'Починки', 5);

insert into "Место_работы"
    (идентификатор, учреждение, адрес, отчисление_в_местный_бюджет)
VALUES (1, 'Районная больница', 'Вознесенское', 10),
       (2, 'Травм. пункт', 'Выкса', 3),
       (3, 'Больница', 'Навашино', 4),
       (4, 'Род. дом', 'Вознесенское', 12),
       (5, 'Больница', 'Починки', 4),
       (6, 'Травм. пункт', 'Лукояново', 3);

insert into "Типы_операций"
    (идентификатор, наименование, опорный_пункт, запасы, стоимость)
VALUES (1, 'Наложение гипса', 'Выкса', 2000, 18000),
       (2, 'Блокада', 'Навашино', 10000, 14000),
       (3, 'Инъекция поливитаминов', 'Навашино', 20000, 11000),
       (4, 'Инъекция алоэ', 'Навашино', 12000, 11000),
       (5, 'ЭКГ', 'Вознесенское', 115, 10000),
       (6, 'УЗИ', 'Вознесенское', 20, 30000),
       (7, 'Флюорография', 'Выкса', 1000, 5000);

insert into "Трудовая_деятельность"
(договор, дата, мед_персонал, место_работы, операция, количество, оплата)
VALUES (51040, 'Понедельник', 1, 1, 7, 4, 20000),
       (51041, 'Понедельник', 3, 3, 6, 1, 30000),
       (51042, 'Понедельник', 4, 3, 4, 3, 33000),
       (51043, 'Понедельник', 4, 5, 1, 2, 36000),
       (51044, 'Понедельник', 4, 4, 6, 1, 30000),
       (51045, 'Среда', 2, 2, 5, 3, 30000),
       (51046, 'Четверг', 3, 6, 4, 4, 44000),
       (51047, 'Четверг', 4, 6, 2, 1, 28000),
       (51048, 'Четверг', 5, 3, 3, 4, 44000),
       (51049, 'Пятница', 2, 4, 5, 1, 10000),
       (51050, 'Пятница', 3, 6, 4, 2, 22000),
       (51051, 'Пятница', 3, 3, 1, 2, 36000),
       (51052, 'Пятница', 5, 3, 2, 1, 14000),
       (51053, 'Суббота', 3, 2, 7, 2, 10000),
       (51054, 'Суббота', 4, 6, 4, 1, 11000),
       (51055, 'Суббота', 5, 5, 4, 2, 22000),
       (51056, 'Суббота', 3, 6, 3, 2, 22000);
```

# Task 3

[To task list](#Data-Bases-Lab-#2)

#### SQL:

```sql
select *
from "Медперсонал";
select *
from "Типы_операций";
select *
from "Место_работы";
select *
from "Трудовая_деятельность";

update "Трудовая_деятельность"
set оплата = количество * (select стоимость
                           from "Типы_операций"
                           where идентификатор = "Трудовая_деятельность".операция);
```

#### Output:

| идентификатор | фамилия | адрес | налог |
| :--- | :--- | :--- | :--- |
| 1 | Медина | Вознесенское | 14 |
| 3 | Бессонов | Выкса | 10 |
| 4 | Губанов | Выкса | 10 |
| 2 | Севастьянов | Навашино | 14 |
| 5 | Боева | Починки | 5 |

| идентификатор | наименование | опорный\_пункт | запасы | стоимость |
| :--- | :--- | :--- | :--- | :--- |
| 1 | Наложение гипса | Выкса | 2000 | 18000 |
| 2 | Блокада | Навашино | 10000 | 14000 |
| 3 | Инъекция поливитаминов | Навашино | 20000 | 11000 |
| 4 | Инъекция алоэ | Навашино | 12000 | 11000 |
| 5 | ЭКГ | Вознесенское | 115 | 10000 |
| 6 | УЗИ | Вознесенское | 20 | 30000 |
| 7 | Флюорография | Выкса | 1000 | 5000 |

| идентификатор | учреждение | адрес | отчисление\_в\_местный\_бюджет |
| :--- | :--- | :--- | :--- |
| 1 | Районная больница | Вознесенское | 10 |
| 2 | Травм. пункт | Выкса | 3 |
| 3 | Больница | Навашино | 4 |
| 4 | Род. дом | Вознесенское | 12 |
| 5 | Больница | Починки | 4 |
| 6 | Травм. пункт | Лукояново | 3 |

| договор | дата | мед\_персонал | место\_работы | операция | количество | оплата |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 51040 | Понедельник | 1 | 1 | 7 | 4 | 20000 |
| 51041 | Понедельник | 3 | 3 | 6 | 1 | 30000 |
| 51042 | Понедельник | 4 | 3 | 4 | 3 | 33000 |
| 51043 | Понедельник | 4 | 5 | 1 | 2 | 36000 |
| 51044 | Понедельник | 4 | 4 | 6 | 1 | 30000 |
| 51045 | Среда | 2 | 2 | 5 | 3 | 30000 |
| 51046 | Четверг | 3 | 6 | 4 | 4 | 44000 |
| 51047 | Четверг | 4 | 6 | 2 | 1 | 14000 |
| 51048 | Четверг | 5 | 3 | 3 | 4 | 44000 |
| 51049 | Пятница | 2 | 4 | 5 | 1 | 10000 |
| 51050 | Пятница | 3 | 6 | 4 | 2 | 22000 |
| 51051 | Пятница | 3 | 3 | 1 | 2 | 36000 |
| 51052 | Пятница | 5 | 3 | 2 | 1 | 14000 |
| 51053 | Суббота | 3 | 2 | 7 | 2 | 10000 |
| 51054 | Суббота | 4 | 6 | 4 | 1 | 11000 |
| 51055 | Суббота | 5 | 5 | 4 | 2 | 22000 |
| 51056 | Суббота | 3 | 6 | 3 | 2 | 22000 |

> Note: All the next queries will be performed on this table.

# Task 4

[To task list](#Data-Bases-Lab-#2)

#### SQL:

```sql
-- c.)
select distinct адрес
from "Медперсонал";

-- d.)
select distinct учреждение
from "Место_работы";

-- e.)
select distinct дата
from "Трудовая_деятельность";
```

#### Output:

c.)

| адрес |
| :--- |
| Выкса |
| Починки |
| Вознесенское |
| Навашино |

b.)

| учреждение |
| :--- |
| Травм. пункт |
| Больница |
| Род. дом |
| Районная больница |

c.)

| дата |
| :--- |
| Четверг |
| Понедельник |
| Пятница |
| Среда |
| Суббота |

# Task 5

[To task list](#Data-Bases-Lab-#2)

#### SQL:

```sql
-- c.)
select дата, договор
from "Трудовая_деятельность"
where оплата <= 14000;

-- d.)
select distinct налог
from "Медперсонал"
where адрес in
      ('Выкса', 'Навашино');

-- e.)
select наименование, стоимость, опорный_пункт
from "Типы_операций"
where наименование like 'Инъекция%'
  and стоимость > 10000
order by опорный_пункт, стоимость;
```

#### Output:

c.)

| дата | договор |
| :--- | :--- |
| Четверг | 51047 |
| Пятница | 51049 |
| Пятница | 51052 |
| Суббота | 51053 |
| Суббота | 51054 |

d.)

| налог |
| :--- |
| 10 |
| 14 |

e.)

| наименование | стоимость | опорный\_пункт |
| :--- | :--- | :--- |
| Инъекция поливитаминов | 11000 | Навашино |
| Инъекция алоэ | 11000 | Навашино |

# Task 6

[To task list](#Data-Bases-Lab-#2)

#### SQL:

```sql
-- c.)
select дата, фамилия, учреждение, наименование
from "Трудовая_деятельность"
         inner join "Медперсонал" М
                    on М.идентификатор = "Трудовая_деятельность".мед_персонал
         inner join "Место_работы" Мр
                    on Мр.идентификатор = "Трудовая_деятельность".место_работы
         inner join "Типы_операций" То
                    on "Трудовая_деятельность".операция = То.идентификатор;

-- d.)
select договор, учреждение, количество, оплата
from "Трудовая_деятельность"
         inner join "Место_работы" Мр
                    on Мр.идентификатор = "Трудовая_деятельность".место_работы
order by оплата;
```

#### Output:

c.)

| дата | фамилия | учреждение | наименование |
| :--- | :--- | :--- | :--- |
| Понедельник | Медина | Районная больница | Флюорография |
| Понедельник | Бессонов | Больница | УЗИ |
| Понедельник | Губанов | Больница | Инъекция алоэ |
| Понедельник | Губанов | Больница | Наложение гипса |
| Понедельник | Губанов | Род. дом | УЗИ |
| Среда | Севастьянов | Травм. пункт | ЭКГ |
| Четверг | Бессонов | Травм. пункт | Инъекция алоэ |
| Четверг | Губанов | Травм. пункт | Блокада |
| Четверг | Боева | Больница | Инъекция поливитаминов |
| Пятница | Севастьянов | Род. дом | ЭКГ |
| Пятница | Бессонов | Травм. пункт | Инъекция алоэ |
| Пятница | Бессонов | Больница | Наложение гипса |
| Пятница | Боева | Больница | Блокада |
| Суббота | Бессонов | Травм. пункт | Флюорография |
| Суббота | Губанов | Травм. пункт | Инъекция алоэ |
| Суббота | Боева | Больница | Инъекция алоэ |
| Суббота | Бессонов | Травм. пункт | Инъекция поливитаминов |

d.)

| договор | учреждение | количество | оплата |
| :--- | :--- | :--- | :--- |
| 51053 | Травм. пункт | 2 | 10000 |
| 51049 | Род. дом | 1 | 10000 |
| 51054 | Травм. пункт | 1 | 11000 |
| 51047 | Травм. пункт | 1 | 14000 |
| 51052 | Больница | 1 | 14000 |
| 51040 | Районная больница | 4 | 20000 |
| 51056 | Травм. пункт | 2 | 22000 |
| 51050 | Травм. пункт | 2 | 22000 |
| 51055 | Больница | 2 | 22000 |
| 51045 | Травм. пункт | 3 | 30000 |
| 51041 | Больница | 1 | 30000 |
| 51044 | Род. дом | 1 | 30000 |
| 51042 | Больница | 3 | 33000 |
| 51043 | Больница | 2 | 36000 |
| 51051 | Больница | 2 | 36000 |
| 51046 | Травм. пункт | 4 | 44000 |
| 51048 | Больница | 4 | 44000 |

# Task 7

[To task list](#Data-Bases-Lab-#2)

#### SQL:

```sql
-- c.)
select фамилия, адрес
from "Медперсонал"
where идентификатор in
      (select distinct мед_персонал
       from "Трудовая_деятельность"
       where операция in (select идентификатор
                          from "Типы_операций"
                          where наименование = 'Наложение гипса')
       group by мед_персонал
       having sum(количество) > 1);

-- d.)
select distinct наименование
from "Типы_операций"
where идентификатор in (select операция
                        from "Трудовая_деятельность"
                        where место_работы in (select идентификатор
                                               from "Место_работы"
                                               where учреждение = 'Больница')
                          and мед_персонал in (select идентификатор
                                               from "Медперсонал"
                                               where адрес in ('Вознесенское', 'Выкса')));

-- e.)
drop table if exists subtable;
create table subTable as (select место_работы, sum(оплата) as amount
                          from "Трудовая_деятельность"
                          group by место_работы);
update subTable
set amount = amount * (select отчисление_в_местный_бюджет
                       from "Место_работы"
                       where идентификатор = место_работы) / 100;

select фамилия, учреждение, amount
from "Трудовая_деятельность"
         inner join "Типы_операций" То
                    on То.идентификатор = "Трудовая_деятельность".операция
         inner join "Медперсонал" М
                    on М.идентификатор = "Трудовая_деятельность".мед_персонал
         inner join "Место_работы" Мр
                    on Мр.идентификатор = "Трудовая_деятельность".место_работы
         inner join subtable
                    on subtable.место_работы = "Трудовая_деятельность".место_работы
where М.налог between 7 and 16
order by amount, налог;

drop table subTable;

-- a.)
select дата, То.идентификатор, фамилия
from "Трудовая_деятельность"
         inner join "Место_работы" Мр
                    on Мр.идентификатор = "Трудовая_деятельность".место_работы
         inner join "Медперсонал" М
                    on М.идентификатор = "Трудовая_деятельность".мед_персонал
         inner join "Типы_операций" То
                    on То.идентификатор = "Трудовая_деятельность".операция
where То.стоимость >= 7000
  and количество > 1;
```

#### Output:

c.)

| фамилия | адрес |
| :--- | :--- |
| Бессонов | Выкса |
| Губанов | Выкса |

d.)

| наименование |
| :--- |
| Инъекция алоэ |
| Наложение гипса |
| УЗИ |

e.)

| фамилия | учреждение | amount |
| :--- | :--- | :--- |
| Бессонов | Травм. пункт | 1200 |
| Севастьянов | Травм. пункт | 1200 |
| Медина | Районная больница | 2000 |
| Губанов | Больница | 2320 |
| Губанов | Травм. пункт | 3390 |
| Бессонов | Травм. пункт | 3390 |
| Бессонов | Травм. пункт | 3390 |
| Губанов | Травм. пункт | 3390 |
| Бессонов | Травм. пункт | 3390 |
| Губанов | Род. дом | 4800 |
| Севастьянов | Род. дом | 4800 |
| Бессонов | Больница | 6280 |
| Губанов | Больница | 6280 |
| Бессонов | Больница | 6280 |

a.)

| дата | идентификатор | фамилия |
| :--- | :--- | :--- |
| Понедельник | 4 | Губанов |
| Понедельник | 1 | Губанов |
| Среда | 5 | Севастьянов |
| Четверг | 4 | Бессонов |
| Четверг | 3 | Боева |
| Пятница | 4 | Бессонов |
| Пятница | 1 | Бессонов |
| Суббота | 4 | Боева |
| Суббота | 3 | Бессонов |

# Task 8

[To task list](#Data-Bases-Lab-#2)

#### SQL:

```sql
update "Трудовая_деятельность"
set оплата = оплата - (select налог
                       from "Медперсонал"
                       where идентификатор = "Трудовая_деятельность".мед_персонал) * оплата / 100;
```

#### Output:

| договор | дата | мед\_персонал | место\_работы | операция | количество | оплата |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 51040 | Понедельник | 1 | 1 | 7 | 4 | 17200 |
| 51041 | Понедельник | 3 | 3 | 6 | 1 | 27000 |
| 51042 | Понедельник | 4 | 3 | 4 | 3 | 29700 |
| 51043 | Понедельник | 4 | 5 | 1 | 2 | 32400 |
| 51044 | Понедельник | 4 | 4 | 6 | 1 | 27000 |
| 51045 | Среда | 2 | 2 | 5 | 3 | 25800 |
| 51046 | Четверг | 3 | 6 | 4 | 4 | 39600 |
| 51047 | Четверг | 4 | 6 | 2 | 1 | 12600 |
| 51048 | Четверг | 5 | 3 | 3 | 4 | 41800 |
| 51049 | Пятница | 2 | 4 | 5 | 1 | 8600 |
| 51050 | Пятница | 3 | 6 | 4 | 2 | 19800 |
| 51051 | Пятница | 3 | 3 | 1 | 2 | 32400 |
| 51052 | Пятница | 5 | 3 | 2 | 1 | 13300 |
| 51053 | Суббота | 3 | 2 | 7 | 2 | 9000 |
| 51054 | Суббота | 4 | 6 | 4 | 1 | 9900 |
| 51055 | Суббота | 5 | 5 | 4 | 2 | 20900 |
| 51056 | Суббота | 3 | 6 | 3 | 2 | 19800 |

# Task 9

[To task list](#Data-Bases-Lab-#2)

#### SQL:

> Will be performed on the table from previous task

```sql
alter table "Трудовая_деятельность"
    add column if not exists отчисление_в_бюджет int;

update "Трудовая_деятельность"
set отчисление_в_бюджет = (select отчисление_в_местный_бюджет
                           from "Место_работы"
                           where идентификатор = "Трудовая_деятельность".место_работы) *
                          "Трудовая_деятельность".оплата / 100;
```

#### Output:

| договор | дата | мед\_персонал | место\_работы | операция | количество | оплата | отчисление\_в\_бюджет |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 51040 | Понедельник | 1 | 1 | 7 | 4 | 17200 | 1720 |
| 51041 | Понедельник | 3 | 3 | 6 | 1 | 27000 | 1080 |
| 51042 | Понедельник | 4 | 3 | 4 | 3 | 29700 | 1188 |
| 51043 | Понедельник | 4 | 5 | 1 | 2 | 32400 | 1296 |
| 51044 | Понедельник | 4 | 4 | 6 | 1 | 27000 | 3240 |
| 51045 | Среда | 2 | 2 | 5 | 3 | 25800 | 774 |
| 51046 | Четверг | 3 | 6 | 4 | 4 | 39600 | 1188 |
| 51047 | Четверг | 4 | 6 | 2 | 1 | 12600 | 378 |
| 51048 | Четверг | 5 | 3 | 3 | 4 | 41800 | 1672 |
| 51049 | Пятница | 2 | 4 | 5 | 1 | 8600 | 1032 |
| 51050 | Пятница | 3 | 6 | 4 | 2 | 19800 | 594 |
| 51051 | Пятница | 3 | 3 | 1 | 2 | 32400 | 1296 |
| 51052 | Пятница | 5 | 3 | 2 | 1 | 13300 | 532 |
| 51053 | Суббота | 3 | 2 | 7 | 2 | 9000 | 270 |
| 51054 | Суббота | 4 | 6 | 4 | 1 | 9900 | 297 |
| 51055 | Суббота | 5 | 5 | 4 | 2 | 20900 | 836 |
| 51056 | Суббота | 3 | 6 | 3 | 2 | 19800 | 594 |

# Task 10

[To task list](#Data-Bases-Lab-#2)

#### SQL:

```sql
-- c.)
select distinct фамилия
from "Медперсонал"
where идентификатор in (select distinct мед_персонал
                        from "Трудовая_деятельность"
                        where операция in (select distinct идентификатор
                                           from "Типы_операций"
                                           where наименование like '%Инъекция%'));

-- d.)
select distinct наименование
from "Типы_операций"
where идентификатор in (select distinct операция
                        from "Трудовая_деятельность"
                        where дата in ('Понедельник', 'Вторник'));

-- e.)
-- -- 7.c.)
select фамилия, адрес
from "Медперсонал"
where идентификатор in
      (select distinct мед_персонал
       from "Трудовая_деятельность"
       where операция in (select идентификатор
                          from "Типы_операций"
                          where наименование = 'Наложение гипса')
       group by мед_персонал
       having sum(количество) > 1);
-- -- 7.d.)
select distinct наименование
from "Типы_операций"
where идентификатор in (select операция
                        from "Трудовая_деятельность"
                        where место_работы in (select идентификатор
                                               from "Место_работы"
                                               where учреждение = 'Больница')
                          and мед_персонал in (select идентификатор
                                               from "Медперсонал"
                                               where адрес in ('Вознесенское', 'Выкса')));
```

#### Output:

c.)

| фамилия |
| :--- |
| Бессонов |
| Боева |
| Губанов |

d.)

| наименование |
| :--- |
| Инъекция алоэ |
| Наложение гипса |
| УЗИ |
| Флюорография |

e.)

- 7.c)

| фамилия | адрес |
| :--- | :--- |
| Бессонов | Выкса |
| Губанов | Выкса |

- 7.d.)

| наименование |
| :--- |
| Инъекция алоэ |
| Наложение гипса |
| УЗИ |

# Task 11

[To task list](#Data-Bases-Lab-#2)

#### SQL:

```sql
-- c.)
select учреждение
from "Место_работы"
where отчисление_в_местный_бюджет <= all (select отчисление_в_местный_бюджет
                                          from "Место_работы");

-- d.)
select фамилия
from "Медперсонал"
where идентификатор = any (select мед_персонал
                           from "Трудовая_деятельность"
                           where оплата <= all (select оплата
                                                from "Трудовая_деятельность"));

-- e.)
select наименование
from "Типы_операций"
where идентификатор
          = any (select операция
                 from "Трудовая_деятельность"
                 where оплата / количество >= all (select оплата / количество
                                                   from "Трудовая_деятельность"
                                                   where дата in ('Четверг', 'Пятница'))
                   and дата in ('Четверг', 'Пятница'));

-- f.)
select дата,
       операция,
       (select фамилия
        from "Медперсонал"
        where идентификатор = "Трудовая_деятельность".мед_персонал)
from "Трудовая_деятельность"
where операция in (select идентификатор
                   from "Типы_операций"
                   where стоимость >= 7000)
  and количество > 1;
```

#### Output:

a.)

| учреждение |
| :--- |
| Травм. пункт |
| Травм. пункт |

> Note: there are different places.

b.)

| фамилия |
| :--- |
| Севастьянов |
| Бессонов |

c.)

| наименование    |
|:----------------|
| Наложение гипса |

d.)

| дата | операция | фамилия |
| :--- | :--- | :--- |
| Понедельник | 4 | Губанов |
| Понедельник | 1 | Губанов |
| Среда | 5 | Севастьянов |
| Четверг | 4 | Бессонов |
| Четверг | 3 | Боева |
| Пятница | 4 | Бессонов |
| Пятница | 1 | Бессонов |
| Суббота | 4 | Боева |
| Суббота | 3 | Бессонов |

# Task 12

[To task list](#Data-Bases-Lab-#2)

#### SQL:

```sql
select адрес
from "Медперсонал"
union
select адрес
from "Место_работы";
```

#### Вывод:

| адрес |
| :--- |
| Починки |
| Выкса |
| Лукояново |
| Вознесенское |
| Навашино |

# Task 13

[To task list](#Data-Bases-Lab-#2)

#### SQL:

```sql
-- с.)
select exists(select идентификатор
              from "Медперсонал"
              where идентификатор not in (select distinct мед_персонал
                                          from "Трудовая_деятельность"
                                          where дата = 'Суббота'));
--That is true.

-- d.)
select exists(select операция
              from "Трудовая_деятельность"
                       inner join "Типы_операций" То
                                  on То.идентификатор = "Трудовая_деятельность".операция
                       inner join "Медперсонал" М
                                  on М.идентификатор = "Трудовая_деятельность".мед_персонал
                       inner join "Место_работы" Мр
                                  on Мр.идентификатор = "Трудовая_деятельность".место_работы
              where Мр.адрес = 'Выкса'
              group by операция
              having count(мед_персонал) = (select count(*)
                                            from "Медперсонал"));
--It is obvious to be false because we have not enough operations.
insert into "Трудовая_деятельность" (договор, дата, мед_персонал, место_работы, операция, количество, оплата)
VALUES (51057, 'Любая', 1, 2, 5, 1, 100500),
       (51058, 'Любая', 3, 2, 5, 1, 100500),
       (51059, 'Любая', 4, 2, 5, 1, 100500),
       (51060, 'Любая', 5, 2, 5, 1, 100500);
--Now it is true.

-- e.)
select exists(select учреждение
              from "Трудовая_деятельность"
                       inner join "Типы_операций" То
                                  on То.идентификатор = "Трудовая_деятельность".операция
                       inner join "Место_работы" Мр
                                  on Мр.идентификатор = "Трудовая_деятельность".место_работы
              where То.наименование = 'УЗИ'
              group by учреждение
              having count(*) < 2);
--That is true.
-- f.)
select exists(select учреждение, Мр.адрес
              from "Трудовая_деятельность"
                       inner join "Место_работы" Мр
                                  on Мр.идентификатор = "Трудовая_деятельность".место_работы
                       inner join "Медперсонал" М
                                  on М.идентификатор = "Трудовая_деятельность".мед_персонал
              where М.адрес != Мр.адрес
              group by учреждение, Мр.адрес
              having count(distinct мед_персонал) = (select count(distinct идентификатор)
                                                     from "Медперсонал"
                                                     where адрес != Мр.адрес));
--It is false. We should find places where there are no local workers, and fill at least one of them.
--The most appropriate ways for us are places with id 3, 4 and 6.
--3rd place already has almost all people, so we should only add person with id = 1;
insert into "Трудовая_деятельность" (договор, дата, мед_персонал, место_работы, операция, количество, оплата)
VALUES (666666, 'Понедельник', 1, 3, 2, 1, 14000);
--Now it is true.
```

# Task 14

[To task list](#Data-Bases-Lab-#2)

#### SQL:

```sql
-- c.)
select count(distinct Мр.идентификатор)
from "Трудовая_деятельность"
         inner join "Медперсонал" М
                    on М.идентификатор = "Трудовая_деятельность".мед_персонал
         inner join "Место_работы" Мр
                    on Мр.идентификатор = "Трудовая_деятельность".место_работы
where М.идентификатор in (select М.идентификатор
                          from "Трудовая_деятельность"
                                   inner join "Место_работы" Мр
                                              on Мр.идентификатор = "Трудовая_деятельность".место_работы
                                   inner join "Медперсонал" М
                                              on М.идентификатор = "Трудовая_деятельность".мед_персонал
                          where Мр.адрес = 'Выкса');

-- d.)
select round(avg(оплата * М.налог / 100), 2)
from "Трудовая_деятельность"
         inner join "Медперсонал" М
                    on М.идентификатор = "Трудовая_деятельность".мед_персонал
         inner join "Типы_операций" То
                    on То.идентификатор = "Трудовая_деятельность".операция
where наименование like 'Инъекция%';

-- e.)
select distinct фамилия
from "Трудовая_деятельность"
         inner join "Медперсонал" М
                    on М.идентификатор = "Трудовая_деятельность".мед_персонал
where оплата / количество = (select min(стоимость)
                             from "Типы_операций");

-- f.)
select sum(количество)
from "Трудовая_деятельность"
         inner join "Медперсонал" М
                    on М.идентификатор = "Трудовая_деятельность".мед_персонал
where дата = 'Понедельник'
  and фамилия = 'Губанов'
  and оплата / количество <= 15000;
```

#### Output:

c.) 4

d.) 2357.14

e.)

| фамилия |
| :--- |
| Бессонов |
| Медина |

d.) 3

# Task 15

[To task list](#Data-Bases-Lab-#2)

#### SQL:

```sql
-- c.)
select дата, операция, sum(количество) as count
from "Трудовая_деятельность"
group by дата, операция
order by дата, операция;

-- d.)
select мед_персонал, round(avg(оплата / количество), 2) as Average
from "Трудовая_деятельность"
group by мед_персонал
order by мед_персонал;

-- e.)
select учреждение
from "Трудовая_деятельность"
         inner join "Место_работы" Мр
                    on Мр.идентификатор = "Трудовая_деятельность".место_работы
group by учреждение
having sum(оплата) > 30000;

-- f.)
select дата, sum(количество)
from "Трудовая_деятельность"
group by дата
order by sum(количество);
```

#### Output:

a.)

| дата | операция | count |
| :--- | :--- | :--- |
| Понедельник | 1 | 2 |
| Понедельник | 4 | 3 |
| Понедельник | 6 | 2 |
| Понедельник | 7 | 4 |
| Пятница | 1 | 2 |
| Пятница | 2 | 1 |
| Пятница | 4 | 2 |
| Пятница | 5 | 1 |
| Среда | 5 | 3 |
| Суббота | 3 | 2 |
| Суббота | 4 | 3 |
| Суббота | 7 | 2 |
| Четверг | 2 | 1 |
| Четверг | 3 | 4 |
| Четверг | 4 | 4 |

b.)

| мед\_персонал | Average  |
| :--- |:---------|
| 1 | 5000     |
| 2 | 10000    |
| 3 | 14333.33 |
| 4 | 16800    |
| 5 | 12000    |

c.)

| учреждение |
| :--- |
| Травм. пункт |
| Больница |
| Род. дом |

d.)

| дата | sum |
| :--- | :--- |
| Среда | 3 |
| Пятница | 6 |
| Суббота | 7 |
| Четверг | 9 |
| Понедельник | 11 |