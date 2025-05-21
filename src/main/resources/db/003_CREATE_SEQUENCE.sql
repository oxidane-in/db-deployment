-- create dedicated db schema for sequences
CREATE SCHEMA IF NOT EXISTS sequences;

-- create sequences for mdm tables
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



-- permission control on
-- -- Step 1: Revoke access from public
-- REVOKE ALL ON SCHEMA sequences FROM public;
-- REVOKE ALL ON SEQUENCE sequences.business_segment_externalid_seq FROM public;
-- REVOKE ALL ON SEQUENCE sequences.work_order_scope_externalid_seq FROM public;
-- REVOKE ALL ON SEQUENCE sequences.status_externalid_seq FROM public;
-- REVOKE ALL ON SEQUENCE sequences.unit_of_measurement_externalid_seq FROM public;
-- REVOKE ALL ON SEQUENCE sequences.material_manufacturer_externalid_seq FROM public;
-- REVOKE ALL ON SEQUENCE sequences.material_vendor_externalid_seq FROM public;
-- REVOKE ALL ON SEQUENCE sequences.material_type_externalid_seq FROM public;
-- REVOKE ALL ON SEQUENCE sequences.material_externalid_seq FROM public;
-- REVOKE ALL ON SEQUENCE sequences.line_item_category_one_externalid_seq FROM public;
-- REVOKE ALL ON SEQUENCE sequences.line_item_category_two_externalid_seq FROM public;
-- REVOKE ALL ON SEQUENCE sequences.client_externalid_seq FROM public;
-- REVOKE ALL ON SEQUENCE sequences.other_cost_item_externalid_seq FROM public;
-- REVOKE ALL ON SEQUENCE sequences.worker_type_externalid_seq FROM public;
-- REVOKE ALL ON SEQUENCE sequences.worker_externalid_seq FROM public;

-- -- Step 2: Grant specific access to roles

-- -- Example: Grant access to 'app_role'
-- GRANT USAGE, SELECT ON SCHEMA sequences TO app_role;
-- GRANT USAGE, SELECT ON SEQUENCE sequences.business_segment_externalid_seq TO app_role;
-- GRANT USAGE, SELECT ON SEQUENCE sequences.work_order_scope_externalid_seq TO app_role;
-- GRANT USAGE, SELECT ON SEQUENCE sequences.status_externalid_seq TO app_role;
-- GRANT USAGE, SELECT ON SEQUENCE sequences.unit_of_measurement_externalid_seq TO app_role;
-- GRANT USAGE, SELECT ON SEQUENCE sequences.material_manufacturer_externalid_seq TO app_role;
-- GRANT USAGE, SELECT ON SEQUENCE sequences.material_vendor_externalid_seq TO app_role;
-- GRANT USAGE, SELECT ON SEQUENCE sequences.material_type_externalid_seq TO app_role;
-- GRANT USAGE, SELECT ON SEQUENCE sequences.material_externalid_seq TO app_role;
-- GRANT USAGE, SELECT ON SEQUENCE sequences.line_item_category_one_externalid_seq TO app_role;
-- GRANT USAGE, SELECT ON SEQUENCE sequences.line_item_category_two_externalid_seq TO app_role;
-- GRANT USAGE, SELECT ON SEQUENCE sequences.client_externalid_seq TO app_role;
-- GRANT USAGE, SELECT ON SEQUENCE sequences.other_cost_item_externalid_seq TO app_role;
-- GRANT USAGE, SELECT ON SEQUENCE sequences.worker_type_externalid_seq TO app_role;
-- GRANT USAGE, SELECT ON SEQUENCE sequences.worker_externalid_seq TO app_role;

-- -- Example: Grant access to 'admin_role' (optional, if needed)
-- GRANT USAGE, SELECT ON SCHEMA sequences TO admin_role;
-- GRANT USAGE, SELECT ON SEQUENCE sequences.business_segment_externalid_seq TO admin_role;
-- GRANT USAGE, SELECT ON SEQUENCE sequences.work_order_scope_externalid_seq TO admin_role;
-- GRANT USAGE, SELECT ON SEQUENCE sequences.status_externalid_seq TO admin_role;
-- GRANT USAGE, SELECT ON SEQUENCE sequences.unit_of_measurement_externalid_seq TO admin_role;
-- GRANT USAGE, SELECT ON SEQUENCE sequences.material_manufacturer_externalid_seq TO admin_role;
-- GRANT USAGE, SELECT ON SEQUENCE sequences.material_vendor_externalid_seq TO admin_role;
-- GRANT USAGE, SELECT ON SEQUENCE sequences.material_type_externalid_seq TO admin_role;
-- GRANT USAGE, SELECT ON SEQUENCE sequences.material_externalid_seq TO admin_role;
-- GRANT USAGE, SELECT ON SEQUENCE sequences.line_item_category_one_externalid_seq TO admin_role;
-- GRANT USAGE, SELECT ON SEQUENCE sequences.line_item_category_two_externalid_seq TO admin_role;
-- GRANT USAGE, SELECT ON SEQUENCE sequences.client_externalid_seq TO admin_role;
-- GRANT USAGE, SELECT ON SEQUENCE sequences.other_cost_item_externalid_seq TO admin_role;
-- GRANT USAGE, SELECT ON SEQUENCE sequences.worker_type_externalid_seq TO admin_role;
-- GRANT USAGE, SELECT ON SEQUENCE sequences.worker_externalid_seq TO admin_role;
