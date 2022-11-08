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