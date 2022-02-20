-- data inserted into temporary tables will disappear at some point
-- When does temporary table data disappear for PostgreSQL?
-- REF: https://www.postgresql.org/docs/current/sql-createtable.html
-- see below: 
    -- TEMPORARY or TEMP
    --     If specified, the table is created as a temporary table. Temporary tables are automatically dropped at the end of a session, or optionally at the end of the current transaction (see ON COMMIT below). The default search_path includes the temporary schema first and so identically named existing permanent tables are not chosen for new plans while the temporary table exists, unless they are referenced with schema-qualified names. Any indexes created on a temporary table are automatically temporary as well.
    --     The autovacuum daemon cannot access and therefore cannot vacuum or analyze temporary tables. For this reason, appropriate vacuum and analyze operations should be performed via session SQL commands. For example, if a temporary table is going to be used in complex queries, it is wise to run ANALYZE on the temporary table after it is populated.
    --     Optionally, GLOBAL or LOCAL can be written before TEMPORARY or TEMP. This presently makes no difference in PostgreSQL and is deprecated; see Compatibility below.


CREATE TEMPORARY TABLE actors_j(
    actor_id smallint,
    first_name varchar(45),
    last_name varchar(45)
);

INSERT INTO actors_j
(SELECT actor_id, first_name, last_name
FROM actor
WHERE last_name LIKE 'J%');