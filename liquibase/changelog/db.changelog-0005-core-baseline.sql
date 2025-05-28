--changeset IntkhabShaikh:001-create-core-schema-baseline-tables
-- This script creates the tables for the core schema.
-- It includes the following tables:

-- project
-- line_item_template
-- li_material_template
-- li_worker_template
-- work_order
-- wo_line_item_details
-- wo_material_details
-- wo_worker_details
-- project_other_cost_planned
-- project_other_cost_actual
-- wo_other_cost_planned
-- wo_other_cost_actual


--------------------------------------------------------------------------------------------------------
-- core_schema.project definition
--------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS core_schema.project
(
    project_id                     UUID         NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    external_id                    VARCHAR(50)  NOT NULL UNIQUE      DEFAULT ('PRJ-' || EXTRACT(YEAR FROM CURRENT_TIMESTAMP)::TEXT || '-' || LPAD(nextval('sequences.project_externalid_seq')::TEXT, 4, '0')),
    project_code                   VARCHAR(50)  NULL UNIQUE,
    project_name                   VARCHAR(255) NOT NULL UNIQUE,
    project_location               VARCHAR(255) NOT NULL,
    project_city                   VARCHAR(100) NOT NULL,
    project_state                  VARCHAR(100) NOT NULL,
    project_manager_email          VARCHAR(100) NULL,
    project_manager_contact_number VARCHAR(15)  NULL,
    project_manager_contact_person VARCHAR(100) NULL,
    project_handle                 VARCHAR(255) NOT NULL UNIQUE,
    client_id                      UUID         NOT NULL REFERENCES mdm_schema.client (client_id),
    project_status_id              UUID         NOT NULL REFERENCES mdm_schema.status (status_id),
    is_active                      BOOLEAN      NOT NULL             DEFAULT TRUE,
    created_by                     UUID         NOT NULL REFERENCES core_schema.employee (employee_id),
    created_on                     TIMESTAMP    NOT NULL             DEFAULT now(),
    updated_by                     UUID         NULL REFERENCES core_schema.employee (employee_id),
    updated_on                     TIMESTAMP    NOT NULL             DEFAULT now()
);


--------------------------------------------------------------------------------------------------------
-- core_schema.line_item_template definition
--------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS core_schema.line_item_template
(
    line_item_template_id                    UUID           NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    external_id                              VARCHAR(50)    NOT NULL UNIQUE      DEFAULT ('LIT-' || EXTRACT(YEAR FROM CURRENT_TIMESTAMP)::TEXT || '-' || LPAD(nextval('sequences.line_item_template_externalid_seq')::TEXT, 4, '0')),
    line_item_template_name                  VARCHAR(1000)   NOT NULL UNIQUE,
    line_item_template_uom_id                UUID           NOT NULL REFERENCES mdm_schema.unit_of_measurement (uom_id),
    line_item_template_category_one_id       UUID           NOT NULL REFERENCES mdm_schema.line_item_category_one (line_item_category_one_id),
    line_item_template_category_two_id       UUID           NOT NULL REFERENCES mdm_schema.line_item_category_two (line_item_category_two_id),
    line_item_template_material_cost_per_uom NUMERIC(18, 2) NULL,
    line_item_template_worker_cost_per_uom   NUMERIC(18, 2) NULL,
    line_item_template_desc                  VARCHAR(255)   NULL,
    line_item_template_handle                VARCHAR(100)   NOT NULL UNIQUE,
    is_active                                BOOLEAN        NOT NULL             DEFAULT TRUE,
    created_by                               UUID           NOT NULL REFERENCES core_schema.employee (employee_id),
    created_on                               TIMESTAMP      NOT NULL             DEFAULT now(),
    updated_by                               UUID           NULL REFERENCES core_schema.employee (employee_id),
    updated_on                               TIMESTAMP      NOT NULL             DEFAULT now()
);


--------------------------------------------------------------------------------------------------------
-- core_schema.li_material_template definition
--------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS core_schema.li_material_template
(
    li_material_template_id      UUID           NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    line_item_template_id        UUID           NOT NULL REFERENCES core_schema.line_item_template (line_item_template_id),
    material_id                  UUID           NOT NULL REFERENCES mdm_schema.material (material_id),
    material_consumption_per_uom NUMERIC(18, 2) NULL,
    material_rate_per_uom        NUMERIC(18, 2) NULL,
    is_active                    BOOLEAN        NOT NULL             DEFAULT TRUE,
    created_by                   UUID           NOT NULL REFERENCES core_schema.employee (employee_id),
    created_on                   TIMESTAMP      NOT NULL             DEFAULT now(),
    updated_by                   UUID           NULL REFERENCES core_schema.employee (employee_id),
    updated_on                   TIMESTAMP      NOT NULL             DEFAULT now(),
    CONSTRAINT uq_li_material_template UNIQUE (line_item_template_id, material_id)
);

--------------------------------------------------------------------------------------------------------
-- core_schema.li_worker_template definition
--------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS core_schema.li_worker_template
(
    li_worker_template_id     UUID           NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    line_item_template_id     UUID           NOT NULL REFERENCES core_schema.line_item_template (line_item_template_id),
    worker_type_id            UUID           NOT NULL REFERENCES mdm_schema.worker_type (worker_type_id),
    worker_type_hajri_per_uom NUMERIC(18, 2) NULL,
    worker_type_wage_per_uom  NUMERIC(18, 2) NULL,
    is_active                 BOOLEAN        NOT NULL             DEFAULT TRUE,
    created_by                UUID           NOT NULL REFERENCES core_schema.employee (employee_id),
    created_on                TIMESTAMP      NOT NULL             DEFAULT now(),
    updated_by                UUID           NULL REFERENCES core_schema.employee (employee_id),
    updated_on                TIMESTAMP      NOT NULL             DEFAULT now(),
    CONSTRAINT uq_li_worker_template UNIQUE (line_item_template_id, worker_type_id)
);


--------------------------------------------------------------------------------------------------------
-- core_schema.work_order definition
--------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS core_schema.work_order
(
    work_order_id              UUID         NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    external_id                VARCHAR(50)  NOT NULL UNIQUE      DEFAULT ('WOR-' || EXTRACT(YEAR FROM CURRENT_TIMESTAMP)::TEXT || '-' || LPAD(nextval('sequences.work_order_externalid_seq')::TEXT, 4, '0')),
    work_order_number          VARCHAR(50)  NOT NULL UNIQUE,
    work_order_name            VARCHAR(255) NOT NULL UNIQUE,
    work_order_start_date      DATE         NOT NULL,
    work_order_tenure          VARCHAR(50)  NULL,
    work_order_end_date_actual DATE         NULL,
    work_order_scope_id        UUID         NOT NULL REFERENCES mdm_schema.scope (scope_id),
    work_order_status_id       UUID         NOT NULL REFERENCES mdm_schema.status (status_id),
    work_order_desc            VARCHAR(255) NULL,
    work_order_handle          VARCHAR(255) NOT NULL UNIQUE,
    project_id                 UUID         NOT NULL REFERENCES core_schema.project (project_id),
    is_active                  BOOLEAN      NOT NULL             DEFAULT TRUE,
    created_by                 UUID         NOT NULL REFERENCES core_schema.employee (employee_id),
    created_on                 TIMESTAMP    NOT NULL             DEFAULT now(),
    updated_by                 UUID         NULL REFERENCES core_schema.employee (employee_id),
    updated_on                 TIMESTAMP    NOT NULL             DEFAULT now()
);


--------------------------------------------------------------------------------------------------------
-- core_schema.wo_line_item_details definition
--------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS core_schema.wo_line_item_details
(
    wo_line_item_details_id         UUID           NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    item_no                         VARCHAR(20)    NOT NULL,
    wo_line_item_category_one_id    UUID           NULL REFERENCES mdm_schema.line_item_category_one (line_item_category_one_id),
    wo_line_item_category_two_id    UUID           NULL REFERENCES mdm_schema.line_item_category_two (line_item_category_two_id),
    wo_line_item_header             VARCHAR(1000)   NULL,
    wo_line_item_name               VARCHAR(1000)   NOT NULL,
    wo_line_item_uom_id             UUID           NOT NULL REFERENCES mdm_schema.unit_of_measurement (uom_id),
    wo_line_item_quantity           NUMERIC(18, 2) NULL,
    wo_line_item_rate               NUMERIC(18, 2) NULL,
    line_item_material_cost_per_uom NUMERIC(18, 2) NULL,
    line_item_worker_cost_per_uom   NUMERIC(18, 2) NULL,
    work_order_id                   UUID           NOT NULL REFERENCES core_schema.work_order (work_order_id),
    is_active                       BOOLEAN        NOT NULL             DEFAULT TRUE,
    created_by                      UUID           NOT NULL REFERENCES core_schema.employee (employee_id),
    created_on                      TIMESTAMP      NOT NULL             DEFAULT now(),
    updated_by                      UUID           NULL REFERENCES core_schema.employee (employee_id),
    updated_on                      TIMESTAMP      NOT NULL             DEFAULT now(),
    CONSTRAINT uq_wo_li_details UNIQUE (work_order_id, wo_line_item_name)
);


--------------------------------------------------------------------------------------------------------
-- core_schema.wo_material_details definition
--------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS core_schema.wo_material_details
(
    wo_material_detail_id           UUID           NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    wo_material_id                  UUID           NOT NULL REFERENCES mdm_schema.material (material_id),
    wo_material_consumption_per_uom NUMERIC(18, 2) NOT NULL,
    wo_material_rate_per_uom        NUMERIC(18, 2) NOT NULL,
    wo_line_item_details_id         UUID           NOT NULL REFERENCES core_schema.wo_line_item_details (wo_line_item_details_id),
    is_active                       BOOLEAN        NOT NULL             DEFAULT TRUE,
    created_by                      UUID           NOT NULL REFERENCES core_schema.employee (employee_id),
    created_on                      TIMESTAMP      NOT NULL             DEFAULT now(),
    updated_by                      UUID           NULL REFERENCES core_schema.employee (employee_id),
    updated_on                      TIMESTAMP      NOT NULL             DEFAULT now(),
    CONSTRAINT uq_wo_material_details UNIQUE (wo_line_item_details_id, wo_material_id)
);


--------------------------------------------------------------------------------------------------------
-- core_schema.wo_worker_details definition
--------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS core_schema.wo_worker_details
(
    wo_worker_detail_id          UUID           NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    wo_worker_type_id            UUID           NOT NULL REFERENCES mdm_schema.worker_type (worker_type_id),
    wo_worker_type_hajri_per_uom NUMERIC(18, 2) NULL,
    wo_worker_type_wage_per_uom  NUMERIC(18, 2) NULL,
    wo_line_item_details_id      UUID           NOT NULL REFERENCES core_schema.wo_line_item_details (wo_line_item_details_id),
    is_active                    BOOLEAN        NOT NULL             DEFAULT TRUE,
    created_by                   UUID           NOT NULL REFERENCES core_schema.employee (employee_id),
    created_on                   TIMESTAMP      NOT NULL             DEFAULT now(),
    updated_by                   UUID           NULL REFERENCES core_schema.employee (employee_id),
    updated_on                   TIMESTAMP      NOT NULL             DEFAULT now(),
    CONSTRAINT uq_wo_worker_details UNIQUE (wo_line_item_details_id, wo_worker_type_id)
);


--------------------------------------------------------------------------------------------------------
-- core_schema.project_other_cost_planned definition
--------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS core_schema.project_other_cost_planned
(
    project_other_cost_planned_id     UUID           NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    external_id                       VARCHAR(50)    NOT NULL UNIQUE      DEFAULT ('PCP-' || EXTRACT(YEAR FROM CURRENT_TIMESTAMP)::TEXT || '-' || LPAD(nextval('sequences.project_other_cost_planned_externalid_seq')::TEXT, 4, '0')),
    project_other_cost_planned_amount NUMERIC(18, 2) NOT NULL,
    project_other_cost_planned_remark VARCHAR(255)   NULL,
    other_cost_item_id                UUID           NOT NULL REFERENCES mdm_schema.other_cost_item (other_cost_item_id),
    project_id                        UUID           NOT NULL REFERENCES core_schema.project (project_id),
    is_active                         BOOLEAN        NOT NULL             DEFAULT TRUE,
    created_by                        UUID           NOT NULL REFERENCES core_schema.employee (employee_id),
    created_on                        TIMESTAMP      NOT NULL             DEFAULT now(),
    updated_by                        UUID           NULL REFERENCES core_schema.employee (employee_id),
    updated_on                        TIMESTAMP      NOT NULL             DEFAULT now(),
    CONSTRAINT uq_project_oc_planned UNIQUE (project_id, other_cost_item_id)
);


--------------------------------------------------------------------------------------------------------
-- core_schema.project_other_cost_actual definition
--------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS core_schema.project_other_cost_actual
(
    project_other_cost_actual_id     UUID           NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    external_id                      VARCHAR(50)    NOT NULL UNIQUE      DEFAULT ('PCA-' || EXTRACT(YEAR FROM CURRENT_TIMESTAMP)::TEXT || '-' || LPAD(nextval('sequences.project_other_cost_actual_externalid_seq')::TEXT, 4, '0')),
    project_other_cost_actual_amount NUMERIC(18, 2) NOT NULL,
    project_other_cost_actual_remark VARCHAR(500)   NULL,
    project_other_cost_actual_date   TIMESTAMP      NOT NULL,
    project_other_cost_planned_id    UUID           NOT NULL REFERENCES core_schema.project_other_cost_planned (project_other_cost_planned_id),
    is_active                        BOOLEAN        NOT NULL             DEFAULT TRUE,
    created_by                       UUID           NOT NULL REFERENCES core_schema.employee (employee_id),
    created_on                       TIMESTAMP      NOT NULL             DEFAULT now(),
    updated_by                       UUID           NULL REFERENCES core_schema.employee (employee_id),
    updated_on                       TIMESTAMP      NOT NULL             DEFAULT now()
);


--------------------------------------------------------------------------------------------------------
-- core_schema.wo_other_cost_planned definition
--------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS core_schema.wo_other_cost_planned
(
    wo_other_cost_planned_id     UUID           NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    external_id                  VARCHAR(50)    NOT NULL UNIQUE      DEFAULT ('WOP-' || EXTRACT(YEAR FROM CURRENT_TIMESTAMP)::TEXT || '-' || LPAD(nextval('sequences.wo_other_cost_planned_externalid_seq')::TEXT, 4, '0')),
    wo_other_cost_planned_amount NUMERIC(18, 2) NOT NULL,
    wo_other_cost_planned_remark VARCHAR(255)   NULL,
    other_cost_item_id           UUID           NOT NULL REFERENCES mdm_schema.other_cost_item (other_cost_item_id),
    work_order_id                UUID           NOT NULL REFERENCES core_schema.work_order (work_order_id),
    is_active                    BOOLEAN        NOT NULL             DEFAULT TRUE,
    created_by                   UUID           NOT NULL REFERENCES core_schema.employee (employee_id),
    created_on                   TIMESTAMP      NOT NULL             DEFAULT now(),
    updated_by                   UUID           NULL REFERENCES core_schema.employee (employee_id),
    updated_on                   TIMESTAMP      NOT NULL             DEFAULT now(),
    CONSTRAINT uq_wo_oc_planned UNIQUE (work_order_id, other_cost_item_id)
);


--------------------------------------------------------------------------------------------------------
-- core_schema.wo_other_cost_actual definition
--------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS core_schema.wo_other_cost_actual
(
    wo_other_cost_actual_id     UUID           NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    external_id                 VARCHAR(50)    NOT NULL UNIQUE      DEFAULT ('WOA-' || EXTRACT(YEAR FROM CURRENT_TIMESTAMP)::TEXT || '-' || LPAD(nextval('sequences.wo_other_cost_actual_externalid_seq')::TEXT, 4, '0')),
    wo_other_cost_actual_amount NUMERIC(18, 2) NOT NULL,
    wo_other_cost_actual_remark VARCHAR(255)   NULL,
    wo_other_cost_actual_date   TIMESTAMP      NOT NULL,
    wo_other_cost_planned_id    UUID           NOT NULL REFERENCES core_schema.wo_other_cost_planned (wo_other_cost_planned_id),
    is_active                   BOOLEAN        NOT NULL             DEFAULT TRUE,
    created_by                  UUID           NOT NULL REFERENCES core_schema.employee (employee_id),
    created_on                  TIMESTAMP      NOT NULL             DEFAULT now(),
    updated_by                  UUID           NULL REFERENCES core_schema.employee (employee_id),
    updated_on                  TIMESTAMP      NOT NULL             DEFAULT now()
);