
-- This script creates the tables for the AUDIT schema.
-- It includes the following tables:

-- project_other_cost_planned_audit
-- project_other_cost_actual_audit

CREATE SCHEMA IF NOT EXISTS audit_schema;

CREATE TABLE audit_schema.project_other_cost_planned_audit (
    audit_id uuid NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    project_other_cost_planned_id uuid,
    external_id varchar(50),
    project_other_cost_planned_amount numeric(18, 2),
    project_other_cost_planned_remark varchar(255),
    other_cost_item_id uuid,
    project_id uuid,
    is_active bool,
    created_by uuid,
    created_on timestamp,
    updated_by uuid,
    updated_on timestamp,
    
    audit_type varchar(10) NOT NULL, -- 'INSERT', 'UPDATE', 'DELETE'
    audit_timestamp timestamp DEFAULT now() NOT NULL,
    audit_by uuid NULL, -- optional: you can populate this via session context or middleware
    source_app varchar(50) DEFAULT 'system' -- optional: track if needed (e.g., 'admin_ui')
);


CREATE TABLE audit_schema.project_other_cost_actual_audit (
    audit_id uuid NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    project_other_cost_actual_id uuid,
    external_id varchar(50),
    project_other_cost_actual_amount numeric(18, 2),
    project_other_cost_actual_remark varchar(500),
    project_other_cost_actual_date TIMESTAMP NOT NULL,
    project_other_cost_planned_id uuid,
    is_active bool,
    created_by uuid,
    created_on timestamp,
    updated_by uuid,
    updated_on timestamp,

    audit_type varchar(10) NOT NULL, -- 'INSERT', 'UPDATE', 'DELETE'
    audit_timestamp timestamp DEFAULT now() NOT NULL,
    audit_by uuid NULL,
    source_app varchar(50) DEFAULT 'system'
);
