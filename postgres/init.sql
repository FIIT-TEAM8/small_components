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

create table refresh_token
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

create unique index refresh_token_id_uindex
    on refresh_token (id);

create unique index refresh_token_token_uindex
    on refresh_token (token);

create table pdf_report
(
    id          serial
        constraint pdf_report_pk
            primary key,
    status      varchar default 'In Progress'::character varying not null,
    content     json    default '[]'::json                       not null,
    creation    date    default CURRENT_DATE                     not null,
    user_id     integer                                          not null
        constraint pdf_report_user_id_fk
            references "user",
    last_export date
);

alter table pdf_report
    owner to fiitkar_postgres;

create unique index pdf_report_id_uindex
    on pdf_report (id);


