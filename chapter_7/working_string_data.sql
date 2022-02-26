
-- REF: https://www.postgresql.org/docs/10/functions-string.html



-- CHAR, VARCHAR, TEXT types
CREATE TABLE string_tbl(
    char_fld CHAR(30),
    vchar_fld VARCHAR(30),
    text_fld TEXT
);



-- STRING GENERATION
INSERT INTO string_tbl (
    char_fld,
     vchar_fld,
      text_fld)
VALUES (
    'This is char data',
    'This is varchar data',
    'This is text data');



-- attempt to update with too-large of a string 
 UPDATE string_tbl
 SET vchar_fld = 'This is a piece of extremely long varchar data'; 
-- ERROR:  value too long for type character varying(30)
-- be aware, if in ANSI mode the server will truncate and warn rather than an exception if the string is too long for a particular variable type.



-- using single quote to escape a single quote in string
UPDATE string_tbl
SET text_fld = 'This string didn''t work, but it does now';


-- built-in function quote_literal to return the given string suitably quoted to be used as a string literal in an SQL statement string. Embedded single-quotes and backslashes are properly doubled.
SELECT quote_literal(text_fld)
FROM string_tbl;


-- ASCII conversion to handle special characters.
-- the characters displayed will be dependent on the character set locations
SELECT 'abcdefg', chr(97) || chr(98) || chr(99) || chr(100) || chr(101) || chr(102) || chr(103);

-- using concat to concatenate individual strings
SELECT concat('danke sch', chr(148), 'n');
-- alternative method
SELECT 'danke sch' || chr(148) || 'n';



-- reset table...
DELETE FROM string_tbl;
-- insert new data
INSERT INTO string_tbl (char_fld, vchar_fld, text_fld)
VALUES (
    'This string is 28 characters',
    'This string is 28 characters',
    'This string is 28 characters'
)

-- using LENGTH()
SELECT LENGTH(char_fld) char_length,
LENGTH(vchar_fld) varchar_length,
LENGTH(text_fld) text_length
FROM string_tbl;


-- using POSITION(), if substring cannot be found returns 0
SELECT POSITION('characters' IN vchar_fld)
FROM string_tbl;

-- using LIKE for comparison results in t,f for true or false
SELECT name, name LIKE '%y' end_in_y
FROM category;

-- same, but using regular expression to compare strings
SELECT name, name ~ 'y$' end_in_y
FROM category; 



-- reset table...
DELETE FROM string_tbl;

INSERT INTO string_tbl (text_fld)
VALUES ('This string was 29 characters');

-- modify string stored in a column by tacking an additional phrase on the end
UPDATE string_tbl
SET text_fld = CONCAT(text_fld, ', but now it is longer');

SELECT  text_fld FROM string_tbl;



-- additional use for concat 
SELECT concat(first_name, ' ', ,last_name, ' has been a customer since ', create_date::date) cust_narrative
FROM customer;


-- using REPLACE()
SELECT REPLACE('goodbye world', 'goodbye', 'hello');

-- using SUBSTRING()
SELECT SUBSTRING('goodbye cruel world', 9,5);

