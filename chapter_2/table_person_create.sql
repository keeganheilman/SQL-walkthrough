CREATE TABLE person (
    person_id SMALLINT UNSIGNED,
    fname VARCHAR(20),
    lname VARCHAR(20),
    eye_color CHAR(2),
    birth_date DATE,
    street VARCHAR(30),
    city VARCHAR(20),
    state VARCHAR(20),
    country VARCHAR(20),
    postal_code VARCHAR(20),
    CONSTRAINT pk_person PRIMARY KEY (person_id),
    CONSTRAINT check_eye_color CHECK (eye_color IN ('BR','BL','GR'))
);

--- RESULTS
-- sakila=# \d person
--                         Table "public.person"
--    Column    |         Type          | Collation | Nullable | Default 
-- -------------+-----------------------+-----------+----------+---------
--  person_id   | smallint              |           | not null | 
--  fname       | character varying(20) |           |          | 
--  lname       | character varying(20) |           |          | 
--  eye_color   | character(2)          |           |          | 
--  birth_date  | date                  |           |          | 
--  street      | character varying(30) |           |          | 
--  city        | character varying(20) |           |          | 
--  state       | character varying(20) |           |          | 
--  country     | character varying(20) |           |          | 
--  postal_code | character varying(20) |           |          | 
-- Indexes:
--     "pk_person" PRIMARY KEY, btree (person_id)
-- Check constraints:
--     "check_eye_color" CHECK (eye_color = ANY (ARRAY['BR'::bpchar, 'BL'::bpchar, 'GR'::bpchar]))
