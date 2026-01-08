-- 1. Grant Schema Usage (Required for everyone)
GRANT USAGE ON SCHEMA public TO matrappuser;
GRANT USAGE ON SCHEMA public TO matrreader;

-- 2. Grant Table Permissions for EXISTING tables (if any)
-- App User: Read & Write
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO matrappuser;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO matrappuser; -- needed for ID auto-increments

-- Reader: Read Only
GRANT SELECT ON ALL TABLES IN SCHEMA public TO matrreader;

-- 3. Configure Default Privileges (CRITICAL STEP)
-- This ensures these users automatically get permissions on NEW tables you create in the future.

-- For App User (Read/Write on future tables)
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO matrappuser;
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT USAGE, SELECT ON SEQUENCES TO matrappuser;

-- For Reader (Read-only on future tables)
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT ON TABLES TO matrreader;
