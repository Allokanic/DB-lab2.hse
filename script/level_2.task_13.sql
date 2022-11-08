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