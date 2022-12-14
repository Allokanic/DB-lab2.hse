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