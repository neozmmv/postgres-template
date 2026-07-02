-- Revoke default PUBLIC access to the maintenance database
REVOKE ALL PRIVILEGES ON DATABASE postgres FROM PUBLIC;

-- admin role: manage database, migrations, schema, etc.

-- CREATE ROLE db_admin WITH LOGIN PASSWORD 'CHANGE_ME';
-- CREATE DATABASE db_name OWNER db_admin;

-- application user: runtime role, restricted privileges

-- CREATE ROLE db_user WITH LOGIN PASSWORD 'CHANGE_ME';
-- GRANT CONNECT ON DATABASE db_name TO db_user;
-- GRANT USAGE ON SCHEMA public TO db_user;
-- GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO db_user;
-- GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO db_user;

-- make sure future tables/sequences (created via migrations) inherit the same grants

-- ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO db_user;
-- ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT USAGE, SELECT ON SEQUENCES TO db_user;
