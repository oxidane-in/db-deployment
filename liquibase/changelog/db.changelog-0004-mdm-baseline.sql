--changeset IntkhabShaikh:000-create-mdm-schema-baseline-tables
-- This script creates the tables for the MDM schema.
-- It includes the following tables:

-- business_segment
-- scope
-- status
-- unit_of_measurement
-- material_manufacturer
-- material_vendor
-- material_type
-- material
-- line_item_category_one
-- line_item_category_two
-- client
-- other_cost_item
-- worker_type
-- worker


--------------------------------------------------------------------------------------------------------
-- mdm_schema.business_segment definition
--------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS mdm_schema.business_segment
(
    business_segment_id     UUID         NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    external_id             VARCHAR(50)  NOT NULL UNIQUE      DEFAULT ('SEG-' || EXTRACT(YEAR FROM CURRENT_TIMESTAMP)::TEXT || '-' || LPAD(nextval('sequences.business_segment_externalid_seq')::TEXT, 4, '0')),
    business_segment_name   VARCHAR(100) NOT NULL UNIQUE,
    business_segment_desc   VARCHAR(255) NULL,
    business_segment_handle VARCHAR(100) NOT NULL UNIQUE,
    is_active               BOOLEAN      NOT NULL             DEFAULT TRUE,
    created_by              UUID         NOT NULL REFERENCES core_schema.employee (employee_id),
    created_on              TIMESTAMP    NOT NULL             DEFAULT now(),
    updated_by              UUID         NULL REFERENCES core_schema.employee (employee_id),
    updated_on              TIMESTAMP    NOT NULL             DEFAULT now()
);


--------------------------------------------------------------------------------------------------------
-- mdm_schema.scope definition
--------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS mdm_schema.scope
(
    scope_id     UUID         NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    external_id  VARCHAR(50)  NOT NULL UNIQUE      DEFAULT ('WOS-' || EXTRACT(YEAR FROM CURRENT_TIMESTAMP)::TEXT || '-' || LPAD(nextval('sequences.scope_externalid_seq')::TEXT, 4, '0')),
    scope_name   VARCHAR(100) NOT NULL UNIQUE,
    scope_desc   VARCHAR(255) NULL,
    scope_handle VARCHAR(100) NOT NULL UNIQUE,
    is_active    BOOLEAN      NOT NULL             DEFAULT TRUE,
    created_by   UUID         NOT NULL REFERENCES core_schema.employee (employee_id),
    created_on   TIMESTAMP    NOT NULL             DEFAULT now(),
    updated_by   UUID         NULL REFERENCES core_schema.employee (employee_id),
    updated_on   TIMESTAMP    NOT NULL             DEFAULT now()
);


--------------------------------------------------------------------------------------------------------
-- mdm_schema.status definition
--------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS mdm_schema.status
(
    status_id     UUID         NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    external_id   VARCHAR(50)  NOT NULL UNIQUE      DEFAULT ('STS-' || EXTRACT(YEAR FROM CURRENT_TIMESTAMP)::TEXT || '-' || LPAD(nextval('sequences.status_externalid_seq')::TEXT, 4, '0')),
    status_name   VARCHAR(100) NOT NULL UNIQUE,
    status_desc   VARCHAR(255) NULL,
    status_handle VARCHAR(100) NOT NULL UNIQUE,
    is_active     BOOLEAN      NOT NULL             DEFAULT TRUE,
    created_by    UUID         NOT NULL REFERENCES core_schema.employee (employee_id),
    created_on    TIMESTAMP    NOT NULL             DEFAULT now(),
    updated_by    UUID         NULL REFERENCES core_schema.employee (employee_id),
    updated_on    TIMESTAMP    NOT NULL             DEFAULT now()
);


--------------------------------------------------------------------------------------------------------
-- mdm_schema.unit_of_measurement definition
--------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS mdm_schema.unit_of_measurement
(
    uom_id      UUID         NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    external_id VARCHAR(50)  NOT NULL UNIQUE      DEFAULT ('UOM-' || EXTRACT(YEAR FROM CURRENT_TIMESTAMP)::TEXT || '-' || LPAD(nextval('sequences.unit_of_measurement_externalid_seq')::TEXT, 4, '0')),
    uom_name    VARCHAR(100) NOT NULL UNIQUE,
    uom_symbol  VARCHAR(20)  NOT NULL UNIQUE,
    uom_desc    VARCHAR(255) NULL,
    uom_handle  VARCHAR(100) NOT NULL UNIQUE,
    is_active   BOOLEAN      NOT NULL             DEFAULT TRUE,
    created_by  UUID         NOT NULL REFERENCES core_schema.employee (employee_id),
    created_on  TIMESTAMP    NOT NULL             DEFAULT now(),
    updated_by  UUID         NULL REFERENCES core_schema.employee (employee_id),
    updated_on  TIMESTAMP    NOT NULL             DEFAULT now()
);


--------------------------------------------------------------------------------------------------------
-- mdm_schema.material_manufacturer definition
--------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS mdm_schema.material_manufacturer
(
    material_manufacturer_id             UUID         NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    external_id                          VARCHAR(50)  NOT NULL UNIQUE      DEFAULT ('MMF-' || EXTRACT(YEAR FROM CURRENT_TIMESTAMP)::TEXT || '-' || LPAD(nextval('sequences.material_manufacturer_externalid_seq')::TEXT, 4, '0')),
    material_manufacturer_name           VARCHAR(100) NOT NULL UNIQUE,
    material_manufacturer_contact_person VARCHAR(100) NULL,
    material_manufacturer_contact_number VARCHAR(15)  NULL,
    material_manufacturer_email          VARCHAR(100) NULL,
    material_manufacturer_gst            VARCHAR(15)  NULL,
    material_manufacturer_desc           VARCHAR(255) NULL,
    material_manufacturer_handle         VARCHAR(100) NOT NULL UNIQUE,
    is_active                            BOOLEAN      NOT NULL             DEFAULT TRUE,
    created_by                           UUID         NOT NULL REFERENCES core_schema.employee (employee_id),
    created_on                           TIMESTAMP    NOT NULL             DEFAULT now(),
    updated_by                           UUID         NULL REFERENCES core_schema.employee (employee_id),
    updated_on                           TIMESTAMP    NOT NULL             DEFAULT now()
);


--------------------------------------------------------------------------------------------------------
-- mdm_schema.material_vendor definition
--------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS mdm_schema.material_vendor
(
    material_vendor_id             UUID         NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    external_id                    VARCHAR(50)  NOT NULL UNIQUE      DEFAULT ('MVN-' || EXTRACT(YEAR FROM CURRENT_TIMESTAMP)::TEXT || '-' || LPAD(nextval('sequences.material_vendor_externalid_seq')::TEXT, 4, '0')),
    material_vendor_name           VARCHAR(100) NOT NULL UNIQUE,
    material_vendor_contact_person VARCHAR(100) NULL,
    material_vendor_contact_number VARCHAR(15)  NULL,
    material_vendor_email          VARCHAR(100) NULL,
    material_vendor_gst            VARCHAR(15)  NULL,
    material_vendor_desc           VARCHAR(255) NULL,
    material_vendor_handle         VARCHAR(100) NOT NULL UNIQUE,
    is_active                      BOOLEAN      NOT NULL             DEFAULT TRUE,
    created_by                     UUID         NOT NULL REFERENCES core_schema.employee (employee_id),
    created_on                     TIMESTAMP    NOT NULL             DEFAULT now(),
    updated_by                     UUID         NULL REFERENCES core_schema.employee (employee_id),
    updated_on                     TIMESTAMP    NOT NULL             DEFAULT now()
);


--------------------------------------------------------------------------------------------------------
-- mdm_schema.material_type definition
--------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS mdm_schema.material_type
(
    material_type_id     UUID         NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    external_id          VARCHAR(50)  NOT NULL UNIQUE      DEFAULT ('MTY-' || EXTRACT(YEAR FROM CURRENT_TIMESTAMP)::TEXT || '-' || LPAD(nextval('sequences.material_type_externalid_seq')::TEXT, 4, '0')),
    material_type_name   VARCHAR(100) NOT NULL UNIQUE,
    material_type_desc   VARCHAR(255) NULL,
    material_type_handle VARCHAR(100) NOT NULL UNIQUE,
    is_active            BOOLEAN      NOT NULL             DEFAULT TRUE,
    created_by           UUID         NOT NULL REFERENCES core_schema.employee (employee_id),
    created_on           TIMESTAMP    NOT NULL             DEFAULT now(),
    updated_by           UUID         NULL REFERENCES core_schema.employee (employee_id),
    updated_on           TIMESTAMP    NOT NULL             DEFAULT now()
);


--------------------------------------------------------------------------------------------------------
-- mdm_schema.material definition
--------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS mdm_schema.material
(
    material_id              UUID           NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    external_id              VARCHAR(50)    NOT NULL UNIQUE      DEFAULT ('MAT-' || EXTRACT(YEAR FROM CURRENT_TIMESTAMP)::TEXT || '-' || LPAD(nextval('sequences.material_externalid_seq')::TEXT, 4, '0')),
    material_name            VARCHAR(100)   NOT NULL UNIQUE,
    material_rate_per_pack   NUMERIC(18, 2) NOT NULL,
    material_pack_size       NUMERIC(18, 2) NOT NULL,
    material_uom_id          UUID           NOT NULL REFERENCES mdm_schema.unit_of_measurement (uom_id),
--     material_rate_per_unit   NUMERIC(18, 2) NOT NULL, should be calculated and sent in the response
    material_type_id         UUID           NULL REFERENCES mdm_schema.material_type (material_type_id),
    material_manufacturer_id UUID           NULL REFERENCES mdm_schema.material_manufacturer (material_manufacturer_id),
    material_vendor_id       UUID           NULL REFERENCES mdm_schema.material_vendor (material_vendor_id),
    material_desc            VARCHAR(255)   NULL,
    material_handle          VARCHAR(100)   NOT NULL UNIQUE,
    is_active                BOOLEAN        NOT NULL             DEFAULT TRUE,
    created_by               UUID           NOT NULL REFERENCES core_schema.employee (employee_id),
    created_on               TIMESTAMP      NOT NULL             DEFAULT now(),
    updated_by               UUID           NULL REFERENCES core_schema.employee (employee_id),
    updated_on               TIMESTAMP      NOT NULL             DEFAULT now()
);


--------------------------------------------------------------------------------------------------------
-- mdm_schema.line_item_category_one definition
--------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS mdm_schema.line_item_category_one
(
    line_item_category_one_id     UUID         NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    external_id                   VARCHAR(50)  NOT NULL UNIQUE      DEFAULT ('LC1-' || EXTRACT(YEAR FROM CURRENT_TIMESTAMP)::TEXT || '-' || LPAD(nextval('sequences.line_item_category_one_externalid_seq')::TEXT, 4, '0')),
    line_item_category_one_name   VARCHAR(100) NOT NULL UNIQUE,
    line_item_category_one_desc   VARCHAR(255) NULL,
    line_item_category_one_handle VARCHAR(100) NOT NULL UNIQUE,
    is_active                     BOOLEAN      NOT NULL             DEFAULT TRUE,
    created_by                    UUID         NOT NULL REFERENCES core_schema.employee (employee_id),
    created_on                    TIMESTAMP    NOT NULL             DEFAULT now(),
    updated_by                    UUID         NULL REFERENCES core_schema.employee (employee_id),
    updated_on                    TIMESTAMP    NOT NULL             DEFAULT now()
);


--------------------------------------------------------------------------------------------------------
-- mdm_schema.line_item_category_two definition
--------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS mdm_schema.line_item_category_two
(
    line_item_category_two_id     UUID         NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    external_id                   VARCHAR(50)  NOT NULL UNIQUE      DEFAULT ('LC2-' || EXTRACT(YEAR FROM CURRENT_TIMESTAMP)::TEXT || '-' || LPAD(nextval('sequences.line_item_category_two_externalid_seq')::TEXT, 4, '0')),
    line_item_category_two_name   VARCHAR(100) NOT NULL UNIQUE,
    line_item_category_two_desc   VARCHAR(255) NULL,
    line_item_category_two_handle VARCHAR(100) NOT NULL UNIQUE,
    is_active                     BOOLEAN      NOT NULL             DEFAULT TRUE,
    created_by                    UUID         NOT NULL REFERENCES core_schema.employee (employee_id),
    created_on                    TIMESTAMP    NOT NULL             DEFAULT now(),
    updated_by                    UUID         NULL REFERENCES core_schema.employee (employee_id),
    updated_on                    TIMESTAMP    NOT NULL             DEFAULT now()
);


--------------------------------------------------------------------------------------------------------
-- mdm_schema.client definition
--------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS mdm_schema.client
(
    client_id             UUID         NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    external_id           VARCHAR(50)  NOT NULL UNIQUE      DEFAULT ('CLI-' || EXTRACT(YEAR FROM CURRENT_TIMESTAMP)::TEXT || '-' || LPAD(nextval('sequences.client_externalid_seq')::TEXT, 4, '0')),
    client_name           VARCHAR(100) NOT NULL UNIQUE,
    client_email          VARCHAR(100) NULL,
    client_contact_number VARCHAR(15)  NULL,
    client_contact_person VARCHAR(100) NULL,
    client_address        TEXT         NULL,
    client_desc           VARCHAR(255) NULL,
    client_handle         VARCHAR(100) NOT NULL UNIQUE,
    is_active             BOOLEAN      NOT NULL             DEFAULT TRUE,
    created_by            UUID         NOT NULL REFERENCES core_schema.employee (employee_id),
    created_on            TIMESTAMP    NOT NULL             DEFAULT now(),
    updated_by            UUID         NULL REFERENCES core_schema.employee (employee_id),
    updated_on            TIMESTAMP    NOT NULL             DEFAULT now()
);


--------------------------------------------------------------------------------------------------------
-- mdm_schema.other_cost_item definition
--------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS mdm_schema.other_cost_item
(
    other_cost_item_id     UUID         NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    external_id            VARCHAR(50)  NOT NULL UNIQUE      DEFAULT ('OCI-' || EXTRACT(YEAR FROM CURRENT_TIMESTAMP)::TEXT || '-' || LPAD(nextval('sequences.other_cost_item_externalid_seq')::TEXT, 4, '0')),
    other_cost_item_name   VARCHAR(100) NOT NULL UNIQUE,
    other_cost_item_desc   VARCHAR(500) NULL,
    other_cost_item_handle VARCHAR(100) NOT NULL UNIQUE,
    is_active              BOOLEAN      NOT NULL             DEFAULT TRUE,
    created_by             UUID         NOT NULL REFERENCES core_schema.employee (employee_id),
    created_on             TIMESTAMP    NOT NULL             DEFAULT now(),
    updated_by             UUID         NULL REFERENCES core_schema.employee (employee_id),
    updated_on             TIMESTAMP    NOT NULL             DEFAULT now()
);


--------------------------------------------------------------------------------------------------------
-- mdm_schema.worker_type definition
--------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS mdm_schema.worker_type
(
    worker_type_id     UUID           NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    external_id        VARCHAR(50)    NOT NULL UNIQUE      DEFAULT ('WTY-' || EXTRACT(YEAR FROM CURRENT_TIMESTAMP)::TEXT || '-' || LPAD(nextval('sequences.worker_type_externalid_seq')::TEXT, 4, '0')),
    worker_type_name   VARCHAR(100)   NOT NULL UNIQUE,
    worker_type_rate   NUMERIC(18, 2) NOT NULL,
    worker_type_desc   VARCHAR(255)   NULL,
    worker_type_handle VARCHAR(100)   NOT NULL UNIQUE,
    is_active          BOOLEAN        NOT NULL             DEFAULT TRUE,
    created_by         UUID           NOT NULL REFERENCES core_schema.employee (employee_id),
    created_on         TIMESTAMP      NOT NULL             DEFAULT now(),
    updated_by         UUID           NULL REFERENCES core_schema.employee (employee_id),
    updated_on         TIMESTAMP      NOT NULL             DEFAULT now()
);


--------------------------------------------------------------------------------------------------------
-- mdm_schema.worker definition
--------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS mdm_schema.worker
(
    worker_id            UUID           NOT NULL        DEFAULT gen_random_uuid(),
    external_id          VARCHAR(50)    NOT NULL UNIQUE DEFAULT ('WRK-' || EXTRACT(YEAR FROM CURRENT_TIMESTAMP)::TEXT || '-' || LPAD(nextval('sequences.worker_externalid_seq')::TEXT, 4, '0')),
    worker_code          VARCHAR(20)    NULL UNIQUE,
    worker_name          VARCHAR(100)   NOT NULL UNIQUE,
    worker_rate          NUMERIC(18, 2) NOT NULL,
    worker_type_id       UUID           NOT NULL REFERENCES mdm_schema.worker_type (worker_type_id),
    worker_mobile_number VARCHAR(15)    NOT NULL UNIQUE,
    worker_state         VARCHAR(100)   NULL,
    worker_bank_account  VARCHAR(20)    NULL,
    worker_ifsc          VARCHAR(11)    NULL,
    worker_birth_date    DATE           NULL,
    worker_doj           DATE           NULL,
    worker_foreman       VARCHAR(100)   NULL,
    worker_handle        VARCHAR(100)   NOT NULL UNIQUE,
    is_active            BOOLEAN        NOT NULL        DEFAULT TRUE,
    created_by           UUID           NOT NULL REFERENCES core_schema.employee (employee_id),
    created_on           TIMESTAMP      NOT NULL        DEFAULT now(),
    updated_by           UUID           NULL REFERENCES core_schema.employee (employee_id),
    updated_on           TIMESTAMP      NOT NULL        DEFAULT now()
);