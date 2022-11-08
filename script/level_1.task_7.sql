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