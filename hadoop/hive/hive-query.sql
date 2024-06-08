-- ######################################################################

-- ### list table
-- ./hive -e "show tables;"
-- ./hive -S -e "show tables;"
show tables;

-- ### create table
CREATE TABLE job_history (employee_id INT, start_date DATE, end_date DATE, job_id STRING, department_id INT);
CREATE TABLE pageviews (viewtime DOUBLE, userid STRING, pageid STRING);
