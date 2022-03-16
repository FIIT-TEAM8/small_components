-- we don't know how to generate root <with-no-name> (class Root) :(
create table "user"
(
    id       serial
        constraint user_pk
            primary key,
    username varchar not null,
    password varchar not null
);

alter table "user"
    owner to fiitkar_postgres;

create unique index user_id_uindex
    on "user" (id);

create unique index user_username_uindex
    on "user" (username);

