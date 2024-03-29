--- ######################################################################

-- https://docs.confluent.io/kafka-connect-oracle-cdc/current/overview.html

--- Create the role and grant privileges to the role

ALTER SESSION SET CONTAINER=CDB$ROOT;
CREATE ROLE C##CDC_PRIVS;
CREATE USER C##MYUSER IDENTIFIED BY password CONTAINER=ALL;
ALTER USER C##MYUSER QUOTA UNLIMITED ON USERS;
ALTER USER C##MYUSER SET CONTAINER_DATA = (CDB$ROOT, ORCLPDB1) CONTAINER=CURRENT;
GRANT C##CDC_PRIVS to C##MYUSER CONTAINER=ALL;

GRANT CREATE SESSION TO C##CDC_PRIVS CONTAINER=ALL;
GRANT EXECUTE ON SYS.DBMS_LOGMNR TO C##CDC_PRIVS CONTAINER=ALL;
GRANT LOGMINING TO C##CDC_PRIVS CONTAINER=ALL;
GRANT SELECT ON V_$LOGMNR_CONTENTS TO C##CDC_PRIVS CONTAINER=ALL;
GRANT SELECT ON V_$DATABASE TO C##CDC_PRIVS CONTAINER=ALL;
GRANT SELECT ON V_$THREAD TO C##CDC_PRIVS CONTAINER=ALL;
GRANT SELECT ON V_$PARAMETER TO C##CDC_PRIVS CONTAINER=ALL;
GRANT SELECT ON V_$NLS_PARAMETERS TO C##CDC_PRIVS CONTAINER=ALL;
GRANT SELECT ON V_$TIMEZONE_NAMES TO C##CDC_PRIVS CONTAINER=ALL;
GRANT SELECT ON ALL_INDEXES TO C##CDC_PRIVS CONTAINER=ALL;
GRANT SELECT ON ALL_OBJECTS TO C##CDC_PRIVS CONTAINER=ALL;
GRANT SELECT ON ALL_USERS TO C##CDC_PRIVS CONTAINER=ALL;
GRANT SELECT ON ALL_CATALOG TO C##CDC_PRIVS CONTAINER=ALL;
GRANT SELECT ON ALL_CONSTRAINTS TO C##CDC_PRIVS CONTAINER=ALL;
GRANT SELECT ON ALL_CONS_COLUMNS TO C##CDC_PRIVS CONTAINER=ALL;
GRANT SELECT ON ALL_TAB_COLS TO C##CDC_PRIVS CONTAINER=ALL;
GRANT SELECT ON ALL_IND_COLUMNS TO C##CDC_PRIVS CONTAINER=ALL;
GRANT SELECT ON ALL_ENCRYPTED_COLUMNS TO C##CDC_PRIVS CONTAINER=ALL;
GRANT SELECT ON ALL_LOG_GROUPS TO C##CDC_PRIVS CONTAINER=ALL;
GRANT SELECT ON ALL_TAB_PARTITIONS TO C##CDC_PRIVS CONTAINER=ALL;
GRANT SELECT ON SYS.DBA_REGISTRY TO C##CDC_PRIVS CONTAINER=ALL;
GRANT SELECT ON SYS.OBJ$ TO C##CDC_PRIVS CONTAINER=ALL;
GRANT SELECT ON DBA_TABLESPACES TO C##CDC_PRIVS CONTAINER=ALL;
GRANT SELECT ON DBA_OBJECTS TO C##CDC_PRIVS CONTAINER=ALL;
GRANT SELECT ON SYS.ENC$ TO C##CDC_PRIVS CONTAINER=ALL;
GRANT CONNECT TO C##CDC_PRIVS CONTAINER=ALL;
GRANT SELECT ON DBA_PDBS TO C##CDC_PRIVS CONTAINER=ALL;
GRANT SELECT ON CDB_TABLES TO C##CDC_PRIVS CONTAINER=ALL;

ALTER SESSION SET CONTAINER=ORCLPDB1;
GRANT SELECT ON OE.ORDERS TO C##CDC_PRIVS;
GRANT SELECT ON HR.JOB_HISTORY TO C##CDC_PRIVS;

ALTER SESSION SET CONTAINER=CDB$ROOT;
-- The following privileges are required additionally for 19c compared to 12c.
GRANT SELECT ON V_$ARCHIVED_LOG TO C##CDC_PRIVS CONTAINER=ALL;
GRANT SELECT ON V_$LOG TO C##CDC_PRIVS CONTAINER=ALL;
GRANT SELECT ON V_$LOGFILE TO C##CDC_PRIVS CONTAINER=ALL;
GRANT SELECT ON V_$INSTANCE to C##CDC_PRIVS CONTAINER=ALL;

--- ######################################################################

--- Turn on ARCHIVELOG mode

SELECT LOG_MODE FROM V$DATABASE;

-- ALTER DATABASE ARCHIVELOG;
-- ALTER DATABASE OPEN;
-- SELECT LOG_MODE FROM V$DATABASE;

--- ######################################################################

-- Enable supplemental logging for all columns

ALTER SESSION SET CONTAINER=cdb$root;
ALTER DATABASE ADD SUPPLEMENTAL LOG DATA (ALL) COLUMNS;

--- ######################################################################

-- Grant the User Flashback Query Privileges

ALTER SESSION SET CONTAINER=ORCLPDB1;
GRANT FLASHBACK ANY TABLE TO C##MYUSER;


--- ######################################################################

ALTER SESSION SET CONTAINER=CDB$ROOT;

-- Use the following SQL statement if privileges granted to a role (``C##CDC_PRIVS``) and the role granted to a user (``C##MYUSER``).
SELECT GRANTEE, OWNER, TABLE_NAME
FROM DBA_TAB_PRIVS
WHERE GRANTEE IN (SELECT granted_role
                  FROM DBA_ROLE_PRIVS
                  WHERE GRANTEE = 'C##MYUSER')
AND (TABLE_NAME='DBMS_LOGMNR' OR TABLE_NAME='V_$LOGMNR_CONTENTS');
-- GRANTEE           OWNER          TABLE_NAME
-- -------------------------------------------
-- C##CDC_PRIVS      SYS            DBMS_LOGMNR
-- C##CDC_PRIVS      SYS            V_$LOGMNR_CONTENTS

-- Use the following SQL statement if privileges granted to a role (``C##CDC_PRIVS``) and the role granted to a user (``C##MYUSER``).
SELECT GRANTEE, OWNER, TABLE_NAME
FROM DBA_TAB_PRIVS
WHERE GRANTEE = 'C##MYUSER'
AND (TABLE_NAME='DBMS_LOGMNR' OR TABLE_NAME='V_$LOGMNR_CONTENTS');
-- GRANTEE           OWNER          TABLE_NAME
-- -------------------------------------------
-- C##MYUSER      SYS            DBMS_LOGMNR
-- C##MYUSER      SYS            V_$LOGMNR_CONTENTS

--- ######################################################################

ALTER SESSION SET CONTAINER=CDB$ROOT;
SELECT * FROM SESSION_PRIVS;
SELECT LOG_MODE FROM V$DATABASE;
SELECT COUNT(*) FROM V$DATABASE;
SELECT COUNT(*) FROM V$THREAD;
SELECT COUNT(*) FROM V$PARAMETER;
SELECT COUNT(*) FROM V$NLS_PARAMETERS;
SELECT COUNT(*) FROM V$TIMEZONE_NAMES;
SELECT COUNT(*) FROM ALL_INDEXES;
SELECT COUNT(*) FROM ALL_OBJECTS;
SELECT COUNT(*) FROM ALL_USERS;
SELECT COUNT(*) FROM ALL_CATALOG;
SELECT COUNT(*) FROM ALL_CONSTRAINTS;
SELECT COUNT(*) FROM ALL_CONS_COLUMNS;
SELECT COUNT(*) FROM ALL_TAB_COLS;
SELECT COUNT(*) FROM ALL_IND_COLUMNS;
SELECT COUNT(*) FROM ALL_ENCRYPTED_COLUMNS;
SELECT COUNT(*) FROM ALL_LOG_GROUPS;
SELECT COUNT(*) FROM ALL_TAB_PARTITIONS;
SELECT COUNT(*) FROM SYS.DBA_REGISTRY;
SELECT COUNT(*) FROM SYS.OBJ$;
SELECT COUNT(*) FROM DBA_TABLESPACES;
SELECT COUNT(*) FROM DBA_OBJECTS;
SELECT COUNT(*) FROM SYS.ENC$;
SELECT COUNT(*) FROM DBA_PDBS;
SELECT COUNT(*) FROM CDB_TABLES;

ALTER SESSION SET CONTAINER=ORCLPDB1;
SELECT COUNT(*) FROM C##ANOTHERUSER.CUSTOMERS;

-- Flashback query privilege
SELECT COUNT(*) FROM C##ANOTHERUSER.CUSTOMERS AS OF TIMESTAMP SYSDATE;

-- Added for 19C
SELECT count(*) FROM V$ARCHIVED_LOG;
SELECT count(*) FROM V$LOG;
SELECT count(*) FROM V$LOGFILE;
SELECT count(*) FROM V$INSTANCE;
SELECT SEQUENCE# FROM V$LOG WHERE STATUS = 'CURRENT';

SELECT SUPPLEMENTAL_LOG_DATA_MIN, SUPPLEMENTAL_LOG_DATA_PK, SUPPLEMENTAL_LOG_DATA_ALL FROM V$DATABASE;

ALTER SESSION SET CONTAINER=ORCLPDB1;
SELECT * FROM ALL_LOG_GROUPS WHERE LOG_GROUP_TYPE='ALL COLUMN LOGGING' and OWNER='C##ANOTHERUSER' and TABLE_NAME='CUSTOMERS';
