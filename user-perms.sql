/*
-- 1. Grant Schema Usage & Create (AMENDED)
-- USAGE: Allows access to look up objects in the schema.
-- CREATE: Allows creating new objects (tables, views, etc.) in the schema.
*/
GRANT USAGE, CREATE ON SCHEMA public TO matrappuser;

-- Reader still only needs USAGE
GRANT USAGE ON SCHEMA public TO matrreader;

/*
-- 2. Grant Table Permissions for EXISTING tables (if any)
-- App User: Read & Write
*/
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO matrappuser;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO matrappuser;

-- Reader: Read Only
GRANT SELECT ON ALL TABLES IN SCHEMA public TO matrreader;

/*
-- 3. Configure Default Privileges
-- Note: This applies to tables created by the USER RUNNING THIS SCRIPT (usually the admin/superuser).
*/
-- For App User (Read/Write on future tables created by Admin)
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO matrappuser;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT USAGE, SELECT ON SEQUENCES TO matrappuser;

-- For Reader (Read-only on future tables created by Admin)
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT ON TABLES TO matrreader;


/*
-- OPTIONAL: Allow Reader to see tables created by matrappuser
-- You must run this while logged in as a Superuser or a role with permissions over matrappuser
*/
ALTER DEFAULT PRIVILEGES FOR ROLE matrappuser IN SCHEMA public
GRANT SELECT ON TABLES TO matrreader;
