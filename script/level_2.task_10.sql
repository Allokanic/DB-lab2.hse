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