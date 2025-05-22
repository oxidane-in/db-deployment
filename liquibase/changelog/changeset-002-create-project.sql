--liquibase formatted sql

--changeset yourname: Intkhab
CREATE TABLE tbl_liquibase_test_sql (
    id UUID PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    start_date DATE,
    end_date DATE,
    created_on TIMESTAMP DEFAULT NOW()
);