drop database if exists sales_dwh;
CREATE DATABASE sales_dwh WITH OWNER = postgres ENCODING = 'UTF8' TABLESPACE = pg_default;

\connect sales_dwh;

CREATE SCHEMA sales_dwh AUTHORIZATION postgres;