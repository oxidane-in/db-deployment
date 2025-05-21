
-- This script creates the tables for the Triggers for Audit schema.
-- It includes the triggers on the following tables:

-- project_other_cost_planned_audit
-- project_other_cost_actual_audit

CREATE OR REPLACE FUNCTION audit_schema.log_project_other_cost_planned()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'DELETE') THEN
        INSERT INTO audit_schema.project_other_cost_planned_audit (
            project_other_cost_planned_id, external_id, project_other_cost_planned_amount,
            project_other_cost_planned_remark, other_cost_item_id, project_id,
            is_active, created_by, created_on, updated_by, updated_on,
            audit_type, audit_timestamp
        )
        VALUES (
            OLD.project_other_cost_planned_id, OLD.external_id, OLD.project_other_cost_planned_amount,
            OLD.project_other_cost_planned_remark, OLD.other_cost_item_id, OLD.project_id,
            OLD.is_active, OLD.created_by, OLD.created_on, OLD.updated_by, OLD.updated_on,
            'DELETE', now()
        );
        RETURN OLD;
    
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO audit_schema.project_other_cost_planned_audit (
            project_other_cost_planned_id, external_id, project_other_cost_planned_amount,
            project_other_cost_planned_remark, other_cost_item_id, project_id,
            is_active, created_by, created_on, updated_by, updated_on,
            audit_type, audit_timestamp
        )
        VALUES (
            NEW.project_other_cost_planned_id, NEW.external_id, NEW.project_other_cost_planned_amount,
            NEW.project_other_cost_planned_remark, NEW.other_cost_item_id, NEW.project_id,
            NEW.is_active, NEW.created_by, NEW.created_on, NEW.updated_by, NEW.updated_on,
            'UPDATE', now()
        );
        RETURN NEW;
    
    ELSIF (TG_OP = 'INSERT') THEN
        INSERT INTO audit_schema.project_other_cost_planned_audit (
            project_other_cost_planned_id, external_id, project_other_cost_planned_amount,
            project_other_cost_planned_remark, other_cost_item_id, project_id,
            is_active, created_by, created_on, updated_by, updated_on,
            audit_type, audit_timestamp
        )
        VALUES (
            NEW.project_other_cost_planned_id, NEW.external_id, NEW.project_other_cost_planned_amount,
            NEW.project_other_cost_planned_remark, NEW.other_cost_item_id, NEW.project_id,
            NEW.is_active, NEW.created_by, NEW.created_on, NEW.updated_by, NEW.updated_on,
            'INSERT', now()
        );
        RETURN NEW;
    END IF;

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER trg_project_other_cost_planned_audit
AFTER INSERT OR UPDATE OR DELETE ON core_schema.project_other_cost_planned
FOR EACH ROW
EXECUTE FUNCTION audit_schema.log_project_other_cost_planned();




CREATE OR REPLACE FUNCTION audit_schema.log_project_other_cost_actual()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'DELETE') THEN
        INSERT INTO audit_schema.project_other_cost_actual_audit (
            project_other_cost_actual_id, external_id, project_other_cost_actual_amount,
            project_other_cost_actual_remark, project_other_cost_actual_date, project_other_cost_planned_id, is_active,
            created_by, created_on, updated_by, updated_on,
            audit_type, audit_timestamp
        )
        VALUES (
            OLD.project_other_cost_actual_id, OLD.external_id, OLD.project_other_cost_actual_amount,
            OLD.project_other_cost_actual_remark, OLD.project_other_cost_actual_date, OLD.project_other_cost_planned_id, OLD.is_active,
            OLD.created_by, OLD.created_on, OLD.updated_by, OLD.updated_on,
            'DELETE', now()
        );
        RETURN OLD;

    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO audit_schema.project_other_cost_actual_audit (
            project_other_cost_actual_id, external_id, project_other_cost_actual_amount,
            project_other_cost_actual_remark, project_other_cost_actual_date, project_other_cost_planned_id, is_active,
            created_by, created_on, updated_by, updated_on,
            audit_type, audit_timestamp
        )
        VALUES (
            NEW.project_other_cost_actual_id, NEW.external_id, NEW.project_other_cost_actual_amount,
            NEW.project_other_cost_actual_remark, NEW.project_other_cost_actual_date, NEW.project_other_cost_planned_id, NEW.is_active,
            NEW.created_by, NEW.created_on, NEW.updated_by, NEW.updated_on,
            'UPDATE', now()
        );
        RETURN NEW;

    ELSIF (TG_OP = 'INSERT') THEN
        INSERT INTO audit_schema.project_other_cost_actual_audit (
            project_other_cost_actual_id, external_id, project_other_cost_actual_amount,
            project_other_cost_actual_remark, project_other_cost_actual_date, project_other_cost_planned_id, is_active,
            created_by, created_on, updated_by, updated_on,
            audit_type, audit_timestamp
        )
        VALUES (
            NEW.project_other_cost_actual_id, NEW.external_id, NEW.project_other_cost_actual_amount,
            NEW.project_other_cost_actual_remark, NEW.project_other_cost_actual_date, NEW.project_other_cost_planned_id, NEW.is_active,
            NEW.created_by, NEW.created_on, NEW.updated_by, NEW.updated_on,
            'INSERT', now()
        );
        RETURN NEW;
    END IF;

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE TRIGGER trg_project_other_cost_actual_audit
AFTER INSERT OR UPDATE OR DELETE ON core_schema.project_other_cost_actual
FOR EACH ROW
EXECUTE FUNCTION audit_schema.log_project_other_cost_actual();