/* dwh tables */
CREATE DATABASE st with owner postgres

/* Once connected to a database: */
CREATE SCHEMA dw AUTHORIZATION postgres;

---Table: dw.dim_collaborateur
DROP TABLE IF EXISTS dw.dim_collaborateur;
CREATE TABLE IF NOT EXISTS dw.dim_collaborateur
(
    id_i_collaborateur integer NOT NULL,
    id_i_type_collab integer,
    cd_v_ident_collab character(20) COLLATE pg_catalog."default",
    lb_v_prenom_collab character(250) COLLATE pg_catalog."default",
    lb_v_nom_collab character(250) COLLATE pg_catalog."default",
    dt_d_naissance date,
    cd_v_actif character(20) COLLATE pg_catalog."default",
    CONSTRAINT pk_dim_collaborateur PRIMARY KEY (id_i_collaborateur),
    CONSTRAINT fk_dim_coll_relation__dim_type FOREIGN KEY (id_i_type_collab)
        REFERENCES dw.dim_type_collaborateur (id_i_type_collab) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS dw.dim_collaborateur
    OWNER to postgres;

-- Index: fk_relation_39
-- DROP INDEX IF EXISTS dw.fk_relation_39;
CREATE INDEX IF NOT EXISTS fk_relation_39
    ON dw.dim_collaborateur USING btree
    (id_i_type_collab ASC NULLS LAST)
    TABLESPACE pg_default;

---Table: dw.dim_service
DROP TABLE IF EXISTS dw.dim_service;
CREATE TABLE IF NOT EXISTS dw.dim_service
(
    id_i_service integer NOT NULL,
    id_i_societe integer,
    cd_v_service character(20) COLLATE pg_catalog."default",
    lb_v_service character(250) COLLATE pg_catalog."default",
    CONSTRAINT pk_dim_service PRIMARY KEY (id_i_service),
    CONSTRAINT fk_dim_serv_relation__dim_soci FOREIGN KEY (id_i_societe)
        REFERENCES dw.dim_societe (id_i_societe) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS dw.dim_service
    OWNER to postgres;
-- Index: fk_relation_40

-- DROP INDEX IF EXISTS dw.fk_relation_40;

CREATE INDEX IF NOT EXISTS fk_relation_40
    ON dw.dim_service USING btree
    (id_i_societe ASC NULLS LAST)
    TABLESPACE pg_default;


--- Table: dw.dim_societe
DROP TABLE IF EXISTS dw.dim_societe;
CREATE TABLE IF NOT EXISTS dw.dim_societe
(
    id_i_societe integer NOT NULL,
    cd_v_societe character(20) COLLATE pg_catalog."default",
    lb_v_societe character(250) COLLATE pg_catalog."default",
    CONSTRAINT pk_dim_societe PRIMARY KEY (id_i_societe)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS dw.dim_societe
    OWNER to postgres;

-- Table: dw.dim_type_collaborateur
DROP TABLE IF EXISTS dw.dim_type_collaborateur;
CREATE TABLE IF NOT EXISTS dw.dim_type_collaborateur
(
    id_i_type_collab integer NOT NULL,
    cd_v_type_collab character(20) COLLATE pg_catalog."default",
    lb_v_type_collab character(250) COLLATE pg_catalog."default",
    CONSTRAINT pk_dim_type_collaborateur PRIMARY KEY (id_i_type_collab)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS dw.dim_type_collaborateur
    OWNER to postgres;


--- Table: dw.fait_effectifs
DROP TABLE IF EXISTS dw.fait_effectifs;
CREATE TABLE IF NOT EXISTS dw.fait_effectifs
(
    id_i_collaborateur integer NOT NULL,
    id_i_service integer NOT NULL,
    nb_i_collab integer,
    nb_i_age_collab integer,
    CONSTRAINT pk_fait_effectifs PRIMARY KEY (id_i_collaborateur, id_i_service),
    CONSTRAINT fk_fait_eff_fait_effe_dim_coll FOREIGN KEY (id_i_collaborateur)
        REFERENCES dw.dim_collaborateur (id_i_collaborateur) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_fait_eff_fait_effe_dim_serv FOREIGN KEY (id_i_service)
        REFERENCES dw.dim_service (id_i_service) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS dw.fait_effectifs
    OWNER to postgres;
-- Index: fk_fait_effectifs

-- DROP INDEX IF EXISTS dw.fk_fait_effectifs;

CREATE INDEX IF NOT EXISTS fk_fait_effectifs
    ON dw.fait_effectifs USING btree
    (id_i_collaborateur ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fk_fait_effectifs2

-- DROP INDEX IF EXISTS dw.fk_fait_effectifs2;

CREATE INDEX IF NOT EXISTS fk_fait_effectifs2
    ON dw.fait_effectifs USING btree
    (id_i_service ASC NULLS LAST)
    TABLESPACE pg_default;




ALTER DATABASE m2dmbdm RENAME TO warehouse;

SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'm2dmbdm';