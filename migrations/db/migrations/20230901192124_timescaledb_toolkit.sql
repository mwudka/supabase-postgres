-- migrate:up

DO $$
DECLARE
  timescaledbtoolkit_exists boolean;
BEGIN
  timescaledbtoolkit_exists = (
    select count(*) = 1
    from pg_available_extensions
    where name = 'timescaledb_toolkit'
  );

  IF timescaledbtoolkit_exists
  THEN
    create extension if not exists timescaledb_toolkit;
  END IF;
END $$;

-- migrate:down
