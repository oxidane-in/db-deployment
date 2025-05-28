--changeset IntkhabShaikh:000-create-core_employee_table
CREATE TABLE IF NOT EXISTS core_schema.employee
(
    employee_id   UUID PRIMARY KEY    NOT NULL DEFAULT gen_random_uuid(),
    external_id   VARCHAR(50) UNIQUE  NOT NULL DEFAULT ('EMP-' || EXTRACT(YEAR FROM CURRENT_TIMESTAMP)::TEXT || '-' || LPAD(nextval('sequences.employee_externalid_seq')::TEXT, 4, '0')),
    employee_code VARCHAR(20) UNIQUE  NOT NULL,
    employee_name VARCHAR(100) NOT NULL, 
    is_active     BOOLEAN             NOT NULL DEFAULT TRUE,
    created_by    UUID                NOT NULL REFERENCES core_schema.employee (employee_id),
    created_on    TIMESTAMP           NOT NULL DEFAULT now(),
    updated_by    UUID                NULL REFERENCES core_schema.employee (employee_id),
    updated_on    TIMESTAMP           NOT NULL DEFAULT now()
);

INSERT INTO core_schema.employee (employee_id, employee_code, employee_name, is_active, created_by, updated_by)
VALUES 
('00000000-0000-0000-0000-000000000001'::uuid, 'system_admin', 'System Admin', true, '00000000-0000-0000-0000-000000000001'::uuid, NULL),
('11111111-2222-3333-4444-555555555555'::uuid, 'sudo_user', 'sudo user', true, '11111111-2222-3333-4444-555555555555'::uuid, NULL);