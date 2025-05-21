CREATE OR REPLACE FUNCTION audit_schema.setup_updated_on_trigger_for_all_tables()
    RETURNS void AS
$$
DECLARE
    r RECORD;
    tblfq TEXT;
    trg_name TEXT;
BEGIN
    FOR r IN
        SELECT table_schema, table_name
        FROM information_schema.columns
        WHERE column_name = 'updated_on'
          AND EXISTS (
            SELECT 1
            FROM information_schema.columns c2
            WHERE c2.table_schema = columns.table_schema
              AND c2.table_name = columns.table_name
              AND c2.column_name = 'created_on'
        )
          AND table_schema NOT IN ('pg_catalog', 'information_schema')
        GROUP BY table_schema, table_name
        LOOP
            tblfq := format('"%s"."%s"', r.table_schema, r.table_name);
            trg_name := format('trg_%s_updated_on', r.table_name);

            -- Drop existing trigger (if any) to avoid conflicts
            EXECUTE format('DROP TRIGGER IF EXISTS %I ON %s;', trg_name, tblfq);

            -- Create the trigger
            EXECUTE format($f$
            CREATE TRIGGER %I
            BEFORE UPDATE ON %s
            FOR EACH ROW
            EXECUTE FUNCTION audit_schema.trg_update_updated_on();
        $f$, trg_name, tblfq);
        END LOOP;
END;
$$ LANGUAGE plpgsql;

------------------------------------------------------------------
CREATE OR REPLACE FUNCTION audit_schema.trg_update_updated_on()
    RETURNS TRIGGER AS
$$
BEGIN
    -- Only update updated_on
    NEW.updated_on := now();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

----------------------------------------------------------------

CREATE OR REPLACE FUNCTION audit_schema.trg_strict_audit_on_update()
    RETURNS TRIGGER AS
$$
BEGIN
    -- Prevent updates to created_on
    IF NEW.created_on IS DISTINCT FROM OLD.created_on THEN
        RAISE EXCEPTION 'Modification of created_on is not allowed.';
    END IF;

    -- Always update updated_on
    NEW.updated_on := now();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
