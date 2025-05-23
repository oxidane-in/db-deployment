-- src/main/resources/db/migration/V1__create_material_table.sql
CREATE TABLE mdm_schema.flyway (
    material_id UUID PRIMARY KEY,
    name TEXT NOT NULL
);