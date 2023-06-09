/* staging tables */
CREATE DATABASE "ODS" with owner postgres


/* Once connected to a database: */
CREATE SCHEMA stg AUTHORIZATION postgres;
CREATE SCHEMA sas AUTHORIZATION postgres;
CREATE SCHEMA ods AUTHORIZATION postgres;
---Table: sas.sas_collaborateur

DROP TABLE IF EXISTS sas.sas_collaborateur;
CREATE TABLE IF NOT EXISTS sas.sas_collaborateur
(
    cd_v_ident_collab character varying(50) COLLATE pg_catalog."default",
    lb_v_prenom_collab character varying(250) COLLATE pg_catalog."default",
    lb_v_nom_collab character varying(250) COLLATE pg_catalog."default",
    dt_d_naissance timestamp without time zone,
    cd_v_actif character varying(1) COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS sas.sas_collaborateur
    OWNER to postgres;

-- Table: sas.sas_collaborateur_service
DROP TABLE IF EXISTS sas.sas_collaborateur_service;
CREATE TABLE IF NOT EXISTS sas.sas_collaborateur_service
(
    cd_v_ident_collab character varying(10) COLLATE pg_catalog."default",
    cd_v_service character varying(5) COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS sas.sas_collaborateur_service
    OWNER to postgres;

-- Table: sas.sas_effectif
DROP TABLE IF EXISTS sas.sas_effectif;
CREATE TABLE IF NOT EXISTS sas.sas_effectif
(
    cd_v_ident_collab character(50) COLLATE pg_catalog."default",
    nb_i_collab integer,
    nb_i_age_collab integer,
    cd_v_service character(50) COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS sas.sas_effectif
    OWNER to postgres;

-- Table: sas.sas_service
DROP TABLE IF EXISTS sas.sas_service;
CREATE TABLE IF NOT EXISTS sas.sas_service
(
    cd_v_service character varying(5) COLLATE pg_catalog."default",
    cd_v_societe character varying(10) COLLATE pg_catalog."default",
    lb_v_service character varying(25) COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS sas.sas_service
    OWNER to postgres;

-- Table: sas.sas_societe
DROP TABLE IF EXISTS sas.sas_societe;
CREATE TABLE IF NOT EXISTS sas.sas_societe
(
    cd_v_societe character varying(10) COLLATE pg_catalog."default",
    lb_v_societe character varying(24) COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS sas.sas_societe
    OWNER to postgres;

-- Table: sas.sas_type_collaborateur
DROP TABLE IF EXISTS sas.sas_type_collaborateur;
CREATE TABLE IF NOT EXISTS sas.sas_type_collaborateur
(
    cd_v_type_collab character(1) COLLATE pg_catalog."default",
    lb_v_type_collab character(20) COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS sas.sas_type_collaborateur
    OWNER to postgres;
