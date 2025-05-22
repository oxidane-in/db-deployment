--liquibase formatted sql

--changeset yourname:Intkhab
DROP TABLE IF EXISTS core_schema.tbl_liquibase_test;
DROP TABLE IF EXISTS core_schema.tbl_liquibase_test_sql;