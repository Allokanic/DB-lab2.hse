alter table "Трудовая_деятельность"
    add column if not exists отчисление_в_бюджет int;

update "Трудовая_деятельность"
set отчисление_в_бюджет = (select отчисление_в_местный_бюджет
                           from "Место_работы"
                           where идентификатор = "Трудовая_деятельность".место_работы) * "Трудовая_деятельность".оплата / 100;