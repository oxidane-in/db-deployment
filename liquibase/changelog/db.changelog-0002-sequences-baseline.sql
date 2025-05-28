--changeset IntkhabShaikh:000-create-sequences
CREATE SEQUENCE IF NOT EXISTS sequences.business_segment_externalid_seq START 1 INCREMENT 1 CACHE 1;
CREATE SEQUENCE IF NOT EXISTS sequences.scope_externalid_seq START 1 INCREMENT 1 CACHE 1;
CREATE SEQUENCE IF NOT EXISTS sequences.status_externalid_seq START 1 INCREMENT 1 CACHE 1;
CREATE SEQUENCE IF NOT EXISTS sequences.unit_of_measurement_externalid_seq START 1 INCREMENT 1 CACHE 1;
CREATE SEQUENCE IF NOT EXISTS sequences.material_manufacturer_externalid_seq START 1 INCREMENT 1 CACHE 1;
CREATE SEQUENCE IF NOT EXISTS sequences.material_vendor_externalid_seq START 1 INCREMENT 1 CACHE 1;
CREATE SEQUENCE IF NOT EXISTS sequences.material_type_externalid_seq START 1 INCREMENT 1 CACHE 1;
CREATE SEQUENCE IF NOT EXISTS sequences.material_externalid_seq START 1 INCREMENT 1 CACHE 1;
CREATE SEQUENCE IF NOT EXISTS sequences.line_item_category_one_externalid_seq START 1 INCREMENT 1 CACHE 1;
CREATE SEQUENCE IF NOT EXISTS sequences.line_item_category_two_externalid_seq START 1 INCREMENT 1 CACHE 1;
CREATE SEQUENCE IF NOT EXISTS sequences.client_externalid_seq START 1 INCREMENT 1 CACHE 1;
CREATE SEQUENCE IF NOT EXISTS sequences.other_cost_item_externalid_seq START 1 INCREMENT 1 CACHE 1;
CREATE SEQUENCE IF NOT EXISTS sequences.worker_type_externalid_seq START 1 INCREMENT 1 CACHE 1;
CREATE SEQUENCE IF NOT EXISTS sequences.worker_externalid_seq START 1 INCREMENT 1 CACHE 1;


-- create sequences for core tables
CREATE SEQUENCE IF NOT EXISTS sequences.employee_externalid_seq START 1 INCREMENT 1 CACHE 1;
CREATE SEQUENCE IF NOT EXISTS sequences.project_externalid_seq START 1 INCREMENT 1 CACHE 1;
CREATE SEQUENCE IF NOT EXISTS sequences.line_item_template_externalid_seq START 1 INCREMENT 1 CACHE 1;
-- CREATE SEQUENCE IF NOT EXISTS sequences.li_material_template_externalid_seq START 1 INCREMENT 1 CACHE 1;
-- CREATE SEQUENCE IF NOT EXISTS sequences.li_worker_template_externalid_seq START 1 INCREMENT 1 CACHE 1;
CREATE SEQUENCE IF NOT EXISTS sequences.work_order_externalid_seq START 1 INCREMENT 1 CACHE 1;
CREATE SEQUENCE IF NOT EXISTS sequences.wo_line_item_details_externalid_seq START 1 INCREMENT 1 CACHE 1;
CREATE SEQUENCE IF NOT EXISTS sequences.wo_material_details_externalid_seq START 1 INCREMENT 1 CACHE 1;
CREATE SEQUENCE IF NOT EXISTS sequences.wo_worker_details_externalid_seq START 1 INCREMENT 1 CACHE 1;
CREATE SEQUENCE IF NOT EXISTS sequences.project_other_cost_planned_externalid_seq START 1 INCREMENT 1 CACHE 1;
CREATE SEQUENCE IF NOT EXISTS sequences.project_other_cost_actual_externalid_seq START 1 INCREMENT 1 CACHE 1;
CREATE SEQUENCE IF NOT EXISTS sequences.wo_other_cost_planned_externalid_seq START 1 INCREMENT 1 CACHE 1;
CREATE SEQUENCE IF NOT EXISTS sequences.wo_other_cost_actual_externalid_seq START 1 INCREMENT 1 CACHE 1;