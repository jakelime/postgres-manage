-- 1. Create the Users (Roles)
CREATE USER matrdbowner WITH PASSWORD 'owner_password_123';
CREATE USER matrappuser WITH PASSWORD 'app_password_123';
CREATE USER matrreader  WITH PASSWORD 'reader_password_123';

-- 2. Create the Database and assign ownership immediately
-- This ensures 'matrdbowner' has full control from the start.
CREATE DATABASE ppcs_materials OWNER matrdbowner;
