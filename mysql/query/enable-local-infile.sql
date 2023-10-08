-- enable local infile
SET GLOBAL local_infile = 'ON';
-- SHOW GLOBAL VARIABLES LIKE 'local_infile';

-- set timeout to 10 minutes
SET @@local.net_read_timeout=600;
