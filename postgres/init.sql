-- we don't know how to generate root <with-no-name> (class Root) :(
create table if not exists "user"
(
    id       serial
        constraint user_pk
            primary key,
    username varchar not null,
    password varchar not null
);

alter table "user"
    owner to fiitkar_postgres;

create unique index if not exists user_id_uindex
    on "user" (id);

create unique index if not exists user_username_uindex
    on "user" (username);

create table if not exists refresh_token
(
    id              serial
        constraint refresh_token_pk
            primary key,
    token           varchar                 not null,
    max_age_seconds integer   default 300   not null,
    last_access     timestamp default now() not null
);

alter table refresh_token
    owner to fiitkar_postgres;

create unique index if not exists refresh_token_id_uindex
    on refresh_token (id);

create unique index if not exists refresh_token_token_uindex
    on refresh_token (token);
