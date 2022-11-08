-- c.)
select учреждение
from "Место_работы"
where отчисление_в_местный_бюджет <= all(select отчисление_в_местный_бюджет
                                         from "Место_работы");

-- d.)
select фамилия
from "Медперсонал"
where идентификатор = any(select мед_персонал
                          from "Трудовая_деятельность"
                          where оплата <= all(select оплата
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
select дата, операция, (select фамилия
                        from "Медперсонал"
                        where идентификатор = "Трудовая_деятельность".мед_персонал)
from "Трудовая_деятельность"
where операция in (select идентификатор
                   from "Типы_операций"
                   where стоимость >= 7000)
  and количество > 1;